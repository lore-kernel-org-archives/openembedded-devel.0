Return-Path: <m.perevozchikov@yadro.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09BA4CD1297
	for <webhook@archiver.kernel.org>; Wed, 10 Apr 2024 10:25:38 +0000 (UTC)
Received: from mta-04.yadro.com (mta-04.yadro.com [89.207.88.248])
 by mx.groups.io with SMTP id smtpd.web10.162428.1712744731117091815
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Apr 2024 03:25:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yadro.com header.s=mta-04 header.b=dIMv1Drd;
 dkim=pass header.i=@yadro.com header.s=mta-03 header.b=FP5NFbYi;
 spf=pass (domain: yadro.com, ip: 89.207.88.248, mailfrom: m.perevozchikov@yadro.com)
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-04.yadro.com 1200FC0002
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yadro.com; s=mta-04;
	t=1712744726; bh=M3bAiC0l0LeceaABtFz5hAyQDNY+/KlWidiE05K111o=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version:From;
	b=dIMv1Drd7PoPfPoqro8g7tQYpG+s1luW0HYD6l90iPlogJBaC8BGKZLIN5tUVNhTI
	 jHaKtBWDGdp4+mXJ3GK+wAwDNkUYIpaAN43p9bkBLu5fG16jaZbHexObII24oemdGo
	 NfCEBl/sVLgKUBRs8Vr2bnqWk3EpJGQZRgKaztdKYE8DieQJoyKx+4Iwxl43a1MHNg
	 UkWA3bnBoRkTiQ2//n00t3Tb2DiU0uYt/bypWuvAhZcvTbKyUdGYX2kuU/FiUaqIdp
	 XpV668Mvfd3/pBEq8+jx3YwY/TWYA8FvsqBD3I8QiCSXP2m7U/R2ioIiapDio1X2vu
	 oAFZl3+YJwt5Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yadro.com; s=mta-03;
	t=1712744726; bh=M3bAiC0l0LeceaABtFz5hAyQDNY+/KlWidiE05K111o=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version:From;
	b=FP5NFbYiye7J+oO/tmZLC5DSzs4LywAAulunsBYQ7wX20XsxSIunwvzOv4EtW9PuQ
	 kmnJHSCEV3HqV0jqoolotoYnoam6DhXFCq/L1CmBoChVmdV+AOKk0v36HDRFn+xOhX
	 xSIO/Zq30OT8xaz6ZWVLeT5GMsg5RuYfj1mPdrEBqG9/xivNTem11oSWpF7/VxMNAj
	 aNSMCvdspD3/ODU/LSw30pdhqquzAYsj0sdb+Z5jL6PJWFpd6zvt1U0FmSJoM20UKO
	 7XmBDwejOg2aPly37LQrOYL8YB+2xlaQZLDt4xIbXXjnASGVYLiwVwGI2OYQ8Z+4up
	 8jiAl/Fi8J3zg==
From: Maksim Perevozchikov <m.perevozchikov@yadro.com>
To: Maksim Perevozchikov <m.perevozchikov@yadro.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [PATCH] nginx: Disable login for www user
Thread-Topic: [oe] [PATCH] nginx: Disable login for www user
Thread-Index: AQHaiYs5AFkKQA4k6Uy1cSB+e5siELFhTyLA
Date: Wed, 10 Apr 2024 10:25:25 +0000
Message-ID: <2fa7a8e0b00040caa6f7ecb4537cbac3@yadro.com>
References: <17C43F56512DABD8.16800@lists.openembedded.org>
In-Reply-To: <17C43F56512DABD8.16800@lists.openembedded.org>
Accept-Language: ru-RU, en-US
Content-Language: ru-RU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Apr 2024 10:25:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109888

Hi Folks,

I've found out that the patch has an issue. Should I issue the new patch or=
 there is a way to fix the original one?

Thanks for reply,
Maxim

-----Original Message-----
From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.o=
penembedded.org> On Behalf Of Maksim Perevozchikov
Sent: Monday, April 8, 2024 11:02 AM
To: openembedded-devel@lists.openembedded.org
Cc: Maksim Perevozchikov <m.perevozchikov@yadro.com>
Subject: [oe] [PATCH] nginx: Disable login for www user

Signed-off-by: Maxim Perevozchikov <m.perevozchikov@yadro.com>
---
 meta-webserver/recipes-httpd/nginx/nginx.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-webserver/recipes-httpd/nginx/nginx.inc b/meta-webserver/=
recipes-httpd/nginx/nginx.inc
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


