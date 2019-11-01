Return-Path: <alex.kiernan@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 45A957FC40
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Nov 2019 05:57:37 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id a15so8603455wrf.9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Oct 2019 22:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=s9rFwl8CkgVCadolL0WTPiFScc4391F3cJTwC7Ms3DU=;
	b=p56i7w35SBYfx3eWJPRdag3OXENbMJSB65QxQLcRJ9kJNOzu39JxBprDffdUOp67GU
	IpsnOgrnw8/HpnTPmAFZoXkKdk4oT4rynsNQ4QRAz9LpM7vW4eub8YPxbpqNaTmioTB4
	UCTDc1NKT7uq9IHtdiYuFX88LfxpH/RfCTGA2Gd+drscHJUIQyIpZrpZb2BeIiMfQuGG
	KVyIoc2RvhxAAnEH3Z4yEobu2ePvQOBJDrSR+q8TBiL7MAy0hukq+Get5MkuewiWnjD7
	2++svgVWSqyPaTAtS1vADPHh+a7Ve4aHP1JzVE7XinBeBCQIjeNp29ciBI8pBVk8h0uC
	ihzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=s9rFwl8CkgVCadolL0WTPiFScc4391F3cJTwC7Ms3DU=;
	b=arerbaNFLy4TO9t64zyZNC0+tmh5j+TDqjawrjEcvpeO/m5sg0T/VM0uwpR6h8WhNt
	tnKkSGfHt2I6y2rEj5mgwYhLm42NhnsQA+LF+PYelvl9xUAGO+D68O+zp4LsWS1tMzqy
	4h4c47OCpvYsJGtp9Dr88+ejgqgtkRqKR4AhPVPAU1XmUE/AYQhtmy7Z3xfI0hVijUuO
	RqrfVXxloxbC8kCZiEaDTnr43lScFTHCvMZx/7HqXHr/S3q7b4e3Rb/xFuVc/LMY1ukV
	yCSyVgicRtKyWEIjGfjDurwCMHMR6hPpf2so1KcXp2E3fFwDOqsajukFBxh4pTKZB0sa
	1NXw==
X-Gm-Message-State: APjAAAVg3uhcqJgTNxQLjEGhEZlqUpInDoY0xvj62C3jJDLo1SB6oClG
	ukm0d5BM0nT8vKUfxe0UBLwpRc7MOgQ=
X-Google-Smtp-Source: APXvYqy77o8LVwyiWb0+pGJ/V3ypc1jz3rbxKtlBS0ArFFwEhjguVfobCIKunvmYVsNl8nCdAjUYug==
X-Received: by 2002:adf:c448:: with SMTP id a8mr9427405wrg.233.1572587857659; 
	Thu, 31 Oct 2019 22:57:37 -0700 (PDT)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net.
	[91.135.6.246]) by smtp.gmail.com with ESMTPSA id
	r3sm12963415wre.29.2019.10.31.22.57.36
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 31 Oct 2019 22:57:37 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  1 Nov 2019 05:57:33 +0000
Message-Id: <20191101055734.2056-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] ostree: Upgrade 2019.4 -> 2019.5
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 01 Nov 2019 05:57:37 -0000

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 .../ostree/{ostree_2019.4.bb => ostree_2019.5.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/ostree/{ostree_2019.4.bb => ostree_2019.5.bb} (99%)

diff --git a/meta-oe/recipes-extended/ostree/ostree_2019.4.bb b/meta-oe/recipes-extended/ostree/ostree_2019.5.bb
similarity index 99%
rename from meta-oe/recipes-extended/ostree/ostree_2019.4.bb
rename to meta-oe/recipes-extended/ostree/ostree_2019.5.bb
index 505c9fcccc59..efe1b3616f23 100644
--- a/meta-oe/recipes-extended/ostree/ostree_2019.4.bb
+++ b/meta-oe/recipes-extended/ostree/ostree_2019.5.bb
@@ -28,7 +28,7 @@ SRC_URI = " \
     file://0001-Always-enable-trivial-httpd-for-tests.patch \
     file://0002-Gate-ostree-trivial-httpd-on-BUILDOPT_TRIVIAL_HTTPD.patch \
 "
-SRCREV = "9d39e7d91e8497987cad69a3fbed5c5fc91eebdc"
+SRCREV = "980ca07b03b3aa7e0012729dd6c84b0878775d93"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+\.\d+)"
 
-- 
2.17.1


