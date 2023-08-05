Return-Path: <auh@moto-timo.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF5EEC001DE
	for <webhook@archiver.kernel.org>; Sat,  5 Aug 2023 07:39:39 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.2176.1691221175485444069
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Aug 2023 00:39:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@moto-timo.dev header.s=gm1 header.b=m7gJSce/;
 spf=pass (domain: moto-timo.dev, ip: 217.70.183.196, mailfrom: auh@moto-timo.dev)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D34AFE0003
	for <openembedded-devel@lists.openembedded.org>; Sat,  5 Aug 2023 07:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moto-timo.dev;
	s=gm1; t=1691221174;
	h=from:from:reply-to:subject:subject:to:to:cc:mime-version:mime-version:
	 content-type:content-type; bh=pyqWoaem2Xxg3ieJ9KIH3E9HP/6Wo7NFE6VdDbd9shc=;
	b=m7gJSce/qEy6UO273xmyxFixHLH6+hOw3h5xXcifxSmEl6lDNkmFJxlDy0BPLenoIfIOrb
	MDEqb5B23Rbr+/+ozRwWX3xSKcU+K0Q2ug41BOEAtiT3uarW3D47GvfjbwyKnusPHW9mf8
	ZZ0VvqwABEV36nmGj9Qk1+F26PMe+SeauqYIG3GoXCCx99wTsDVs5bM72v+bMHmI4mE94D
	NcbNXH8eSKHzRplH1u0XsZFEC5w5oLyOoEBYCFYLmVI0kEUnkkM1/YBCfOD5VVqAeQIasd
	KNWPzqJ892nS+Ucgwzx/iinxPJuXd0dcx+j0xrs4Fl4GSJB/VdxMED37/H2suw==
Content-Type: multipart/mixed; boundary="===============4480832539324574133=="
MIME-Version: 1.0
From: auh@moto-timo.dev
To: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-rich: upgrading to 13.5.2 SUCCEEDED
X-GND-Sasl: auh@moto-timo.dev
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 05 Aug 2023 07:39:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104270
Message-Id: <20230805073939.AF5EEC001DE@smtp.lore.kernel.org>
Date: Sat,  5 Aug 2023 07:39:39 +0000 (UTC)

--===============4480832539324574133==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-rich* to *13.5.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-rich-upgrade-13.4.2-13.5.2.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

-- >8 --
From 1f7bf7fd6c89ef9f217d4791021f0a0959670391 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Sat, 5 Aug 2023 00:49:58 -0500
Subject: [PATCH] python3-rich: upgrade 13.4.2 -> 13.5.2

---
 .../{python3-rich_13.4.2.bb => python3-rich_13.5.2.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-extended/python-rich/{python3-rich_13.4.2.bb => python3-rich_13.5.2.bb} (85%)

diff --git a/meta-python/recipes-extended/python-rich/python3-rich_13.4.2.bb b/meta-python/recipes-extended/python-rich/python3-rich_13.5.2.bb
similarity index 85%
rename from meta-python/recipes-extended/python-rich/python3-rich_13.4.2.bb
rename to meta-python/recipes-extended/python-rich/python3-rich_13.5.2.bb
index e7ddf7098..2c31a3375 100644
--- a/meta-python/recipes-extended/python-rich/python3-rich_13.4.2.bb
+++ b/meta-python/recipes-extended/python-rich/python3-rich_13.5.2.bb
@@ -8,7 +8,7 @@ LICENSE = "MIT"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b5f0b94fbc94f5ad9ae4efcf8a778303"
 
-SRC_URI[sha256sum] = "d653d6bccede5844304c605d5aac802c7cf9621efd700b46c7ec2b51ea914898"
+SRC_URI[sha256sum] = "fb9d6c0a0f643c99eed3875b5377a184132ba9be4d61516a55273d3554d75a39"
 
 inherit pypi python_poetry_core
 
-- 
2.25.1


--===============4480832539324574133==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-python3-rich-upgrade-13.4.2-13.5.2.patch"

From 1f7bf7fd6c89ef9f217d4791021f0a0959670391 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Sat, 5 Aug 2023 00:49:58 -0500
Subject: [PATCH] python3-rich: upgrade 13.4.2 -> 13.5.2

---
 .../{python3-rich_13.4.2.bb => python3-rich_13.5.2.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-extended/python-rich/{python3-rich_13.4.2.bb => python3-rich_13.5.2.bb} (85%)

diff --git a/meta-python/recipes-extended/python-rich/python3-rich_13.4.2.bb b/meta-python/recipes-extended/python-rich/python3-rich_13.5.2.bb
similarity index 85%
rename from meta-python/recipes-extended/python-rich/python3-rich_13.4.2.bb
rename to meta-python/recipes-extended/python-rich/python3-rich_13.5.2.bb
index e7ddf7098..2c31a3375 100644
--- a/meta-python/recipes-extended/python-rich/python3-rich_13.4.2.bb
+++ b/meta-python/recipes-extended/python-rich/python3-rich_13.5.2.bb
@@ -8,7 +8,7 @@ LICENSE = "MIT"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b5f0b94fbc94f5ad9ae4efcf8a778303"
 
-SRC_URI[sha256sum] = "d653d6bccede5844304c605d5aac802c7cf9621efd700b46c7ec2b51ea914898"
+SRC_URI[sha256sum] = "fb9d6c0a0f643c99eed3875b5377a184132ba9be4d61516a55273d3554d75a39"
 
 inherit pypi python_poetry_core
 
-- 
2.25.1


--===============4480832539324574133==--

