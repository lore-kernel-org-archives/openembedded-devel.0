Return-Path: <m.perevozchikov@yadro.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2C89C67861
	for <webhook@archiver.kernel.org>; Mon,  8 Apr 2024 08:03:20 +0000 (UTC)
Received: from mta-04.yadro.com (mta-04.yadro.com [89.207.88.248])
 by mx.groups.io with SMTP id smtpd.web11.101382.1712563397849741548
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Apr 2024 01:03:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@yadro.com header.s=mta-04 header.b=P/hJFtfR;
 dkim=fail reason="dkim: body hash did not verify" header.i=@yadro.com header.s=mta-03 header.b=dtsrV1Sa;
 spf=pass (domain: yadro.com, ip: 89.207.88.248, mailfrom: m.perevozchikov@yadro.com)
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-04.yadro.com 42689C0002
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yadro.com; s=mta-04;
	t=1712563396; bh=bedkk/YmnhwLmvoBEsV+dF4D50vblbNktiCetzPWr24=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=P/hJFtfRrFnFzRrgZyypMomvnKxW0SWQFuUkhIQ7XKPkW3LjxcB+G8eRspwcy2HUR
	 CvnrKT8kyiL3VVu8MPG9Z4cDKHaJvSmJiN407Nt6d9snG837542UmpR4CMB/YYJ2Xj
	 gPLk4KjuOyyEyHHeP5E8DjcKOLR3J4QO1vKBt/vosVGXnYaWX9blSR4sCXu24JRTeh
	 TIohd5bZyator0MJLf4Cro7Gny6uGxB7BHMXBdyzAOtOt3NXLpT7/Uteqo7JVzmVOs
	 ZMJgzQFjz9g+ebnljAJpVxLX/Kn7SeXYLa30YPhB4bbfABoZAmM/j0LinyO5BcMb+C
	 KaTe8q3mYKiWw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yadro.com; s=mta-03;
	t=1712563396; bh=bedkk/YmnhwLmvoBEsV+dF4D50vblbNktiCetzPWr24=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=dtsrV1SaThuiljldAb+4yp7dXC4MBmupeqcqYjh5fi9xmHNzYi2Ct7l84e0bYg4Hj
	 e9C8WW3Ph3MFRLNaVGnA97rQapj7pgdfmnpL1yvA+yj3X99kZwl/yY8BcnUetZUfFo
	 nKPh6ANgctmO+Ij2cIguMAa0sGy6rz2ZCWAqyJjW/NQzx++blRZD9lWM+Ze/hDSj0F
	 Ct4Gdc9rygt4Mm4eyZMPTqdgd61vKwUqB8nsnmqKhXzNo/svO7hNgpy/Kdb4tFX0Ss
	 l0Ee+Izcwe9w+T6R21Ff7wvc3iOvn8SyEDxLGvwffDxjwYDfMvyECa35Y8xUcIZ5aJ
	 QYRKKRBJYLRcw==
From: Maxim Perevozchikov <m.perevozchikov@yadro.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Maxim Perevozchikov <m.perevozchikov@yadro.com>
Subject: [PATCH] nginx: Disable login for www user
Date: Mon, 8 Apr 2024 11:01:52 +0300
Message-ID: <20240408080152.3028549-1-m.perevozchikov@yadro.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: T-EXCH-06.corp.yadro.com (172.17.10.110) To
 T-EXCH-10.corp.yadro.com (172.17.11.60)
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Apr 2024 08:03:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109860

Signed-off-by: Maxim Perevozchikov <m.perevozchikov@yadro.com>
---
 meta-webserver/recipes-httpd/nginx/nginx.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-webserver/recipes-httpd/nginx/nginx.inc b/meta-webserve=
r/recipes-httpd/nginx/nginx.inc
index f65c20971..439e28a8f 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx.inc
+++ b/meta-webserver/recipes-httpd/nginx/nginx.inc
@@ -186,4 +186,5 @@ USERADD_PARAM:${PN} =3D " \
     --system --no-create-home \
     --home ${NGINX_WWWDIR} \
     --groups www-data \
-    --user-group ${NGINX_USER}"
+    --user-group ${NGINX_USER} \
+    --shell ${base_sbindir}/nologin"
--=20
2.30.2


