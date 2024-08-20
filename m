Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E77AC3DA4A
	for <webhook@archiver.kernel.org>; Tue, 20 Aug 2024 21:59:39 +0000 (UTC)
Received: from mta-04.yadro.com (mta-04.yadro.com [89.207.88.248])
 by mx.groups.io with SMTP id smtpd.web10.20446.1724163548799289322
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Aug 2024 07:19:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@yadro.com header.s=mta-04 header.b=FTc/rXQL;
 dkim=fail reason="dkim: body hash did not verify" header.i=@yadro.com header.s=mta-03 header.b=lFcLBWTX;
 spf=pass (domain: yadro.com, ip: 89.207.88.248, mailfrom: d.mukhametgaleev@yadro.com)
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-04.yadro.com 89220C0002
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yadro.com; s=mta-04;
	t=1724163543; bh=7S8dHVVjA518zVWspnJ6uBw4LWj9jFskhZ0fch9/a8M=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=FTc/rXQLdbY0qWu/8Xz+B/EP6yYFoDqVx41dM4UXhHkDbM8HF2MXQcxVI1x7b0m7T
	 G/hM/wM7IuUujrE6uKU6d1pmyGJcYduszI64LSGkjmWc2QTd4wA7nA/fhgPkOf9n0S
	 /hlcXpd4Sg6b22t0feKw66/hY6Rg1A5UVeGI6JYx9Lfl6EREnvuoMcmGz7ai2var5W
	 iek32UmgHFQZ3gSYqOac008q+QnMgeTkxcDss8aY/KGoS52sBGouWcONl07RwSVAQf
	 mF+QpoSqJOtmdKrg9dXWSdQoJ45swYdJDuKNv5hvtbfn/uHNXWAKCe3uTYXIe4zFxB
	 4PvFALh4MvuXw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yadro.com; s=mta-03;
	t=1724163543; bh=7S8dHVVjA518zVWspnJ6uBw4LWj9jFskhZ0fch9/a8M=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=lFcLBWTX6AXSppM08H91p9HEhj7J5V1oRJTEnTWnuxn8S5lWAWd8rXSwLmjG3xRz1
	 tuR5K275ysDy4QzZn7K7Ip13rZQ7QwOhAMld0pjVOXpgJA0keAoSl1DqPypH0mYkPE
	 zEUtadD+rhFQ6DGbd6MMaux7eSh9LM2clAhJTdk7qxfSFN+8d85MvGoWMjt0/7ri4J
	 dlk5tEC1UFMSHi0YBulq4yNBPPt9ChdKYgelCEflaQfeaExbuT97G9o90cdJ6J/mWG
	 Dc7l1BSvpYu8sxSrk1N5MBy3orKce0Tf0JNxCcoVrrq7i25Ve/75Gd/VhzVPiiEVL5
	 cvky13v+R4QeA==
From: "Daniil Mukhametgaleev" <d.mukhametgaleev@yadro.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Daniil Mukhametgaleev <d.mukhametgaleev@yadro.com>
Subject: [PATCH] waf-samba.bbclass: Declaring WAF_CROSS_ANSWERS_PATH without the ability to override it will not allow you to create a custom samba recipe
Date: Tue, 20 Aug 2024 17:18:20 +0300
Message-ID: <20240820141820.3660983-1-d.mukhametgaleev@yadro.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-ClientProxiedBy: T-EXCH-10.corp.yadro.com (172.17.11.60) To
 S-exch-04.corp.yadro.com (10.78.5.223)
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Aug 2024 21:59:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111871

Support WAF_CROSS_ANSWERS_PATH overloading to be able to use waf-samba.bb=
class outside of meta-openembedded layer

Signed-off-by: Daniil Mukhametgaleev <d.mukhametgaleev@yadro.com>
---
 meta-networking/classes/waf-samba.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/classes/waf-samba.bbclass b/meta-networking/=
classes/waf-samba.bbclass
index 79acacc98..84c28ded6 100644
--- a/meta-networking/classes/waf-samba.bbclass
+++ b/meta-networking/classes/waf-samba.bbclass
@@ -65,10 +65,10 @@ def get_waf_parallel_make(d):
 # to help generate the cross answer when adding new board support.
 CROSS_METHOD ?=3D "answer"
=20
+WAF_CROSS_ANSWERS_PATH ?=3D "${THISDIR}/../../files/waf-cross-answers"
 do_configure() {
=20
     # Prepare the cross-answers file
-    WAF_CROSS_ANSWERS_PATH=3D"${THISDIR}/../../files/waf-cross-answers"
     CROSS_ANSWERS=3D"${B}/cross-answers-${TARGET_ARCH}.txt"
     if [ -e ${CROSS_ANSWERS} ]; then
         rm -f ${CROSS_ANSWERS}
--=20
2.30.2


