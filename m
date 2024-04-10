Return-Path: <m.perevozchikov@yadro.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90A83CD128A
	for <webhook@archiver.kernel.org>; Wed, 10 Apr 2024 12:20:08 +0000 (UTC)
Received: from mta-04.yadro.com (mta-04.yadro.com [89.207.88.248])
 by mx.groups.io with SMTP id smtpd.web11.165373.1712751602153808706
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Apr 2024 05:20:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@yadro.com header.s=mta-04 header.b=kagSQwTv;
 dkim=fail reason="dkim: body hash did not verify" header.i=@yadro.com header.s=mta-03 header.b=tW1nzJcn;
 spf=pass (domain: yadro.com, ip: 89.207.88.248, mailfrom: m.perevozchikov@yadro.com)
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-04.yadro.com 2F662C0002
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yadro.com; s=mta-04;
	t=1712751598; bh=v8Ra7LLBeHgZMdhS/SW8nx9qUoxGcLvLT5hnFz5D5d0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=kagSQwTvx5EPEk8lYBHDK5MLeYCwJLgnAXSjI+cmhMN2TIx90FDjTinHMQxLyCSCo
	 CSLE70VxO5E3GvAV7enk2j+SZb19RDLLolJsuG4/DFx4BkmGmeA3B1yERz/mthi4Ul
	 +DdJYFlUsu1bJN7T0BwC67Jn4lVA2LVQMZKIIedK/jPVK99R+/qGlRsfi1Ueyklj5Z
	 BaHH8CZaMEbxoiVAzOpn0JQjShTBqB/1of0d3tWMFVDA9a73mcBgmVmgehxQf6sAcc
	 BPsGzIIq08D86Q7tpAMcjRr/iuAQjJFT9EkkdPdapdlfqXnwCFiRd1sYD8AU4QNyj+
	 vY4u2JhrWGLOw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yadro.com; s=mta-03;
	t=1712751598; bh=v8Ra7LLBeHgZMdhS/SW8nx9qUoxGcLvLT5hnFz5D5d0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=tW1nzJcn0NgrNDUPtvsEVxK+Zc8fd+5ky6OfDI5qShAYlzAfrTiGMBQ53KrYWtOY/
	 +ELj4T+5eW706Wu3/pdJTMIHcUkTP6tPBAf7Wzv+qqC6s8QouBXRl9JobQ+8HUYZKN
	 GD3n98a0jUMtu0KLyOO0mFyegWeTDZlUkXux+UubjSEZuZG1pIjSEP6n06ZL/p3C4o
	 dozxztkY9FwmaJrhd29a7ITqVanfOHzh4eZMGb/GmXjVPVRBPFdlpeCzFpnI0DzPnc
	 rFwpxQJxp7R5k4OonC6M7t/Nr37B2G+sZA4YiRJ6sNwfliLXslnbFEnTofG6L95cZT
	 3LUhSCt9Ro1FQ==
From: Maxim Perevozchikov <m.perevozchikov@yadro.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Maxim Perevozchikov <m.perevozchikov@yadro.com>
Subject: [PATCH v2] nginx: Disable login for www user
Date: Wed, 10 Apr 2024 15:19:38 +0300
Message-ID: <20240410121938.2404344-1-m.perevozchikov@yadro.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: T-EXCH-06.corp.yadro.com (172.17.10.110) To
 T-EXCH-10.corp.yadro.com (172.17.11.60)
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Apr 2024 12:20:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109890

Signed-off-by: Maxim Perevozchikov <m.perevozchikov@yadro.com>
---
 ${NGINX_USER} must be the last paramter of useradd, so --shell
 specification is moved before it

 meta-webserver/recipes-httpd/nginx/nginx.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-webserver/recipes-httpd/nginx/nginx.inc b/meta-webserve=
r/recipes-httpd/nginx/nginx.inc
index f65c20971..83ae90c40 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx.inc
+++ b/meta-webserver/recipes-httpd/nginx/nginx.inc
@@ -186,4 +186,5 @@ USERADD_PARAM:${PN} =3D " \
     --system --no-create-home \
     --home ${NGINX_WWWDIR} \
     --groups www-data \
+    --shell ${base_sbindir}/nologin \
     --user-group ${NGINX_USER}"
--=20
2.30.2


