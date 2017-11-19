Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f50.google.com (mail-pg0-f50.google.com [74.125.83.50])
	by mail.openembedded.org (Postfix) with ESMTP id B71FD78920
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Nov 2017 23:17:45 +0000 (UTC)
Received: by mail-pg0-f50.google.com with SMTP id u3so5892631pgn.7
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Nov 2017 15:17:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=rK0kdDmo6KcwZs1jy6aBdcSuIdUnuDSM8qEc7uHfH0U=;
	b=fXlaaWcF50TD2qRkDeOxdXtwAsycx8lyrtJaVmsmeOx1P3EiXdSrE3ALjnzYbOPGCQ
	ZTNXlnRJomvMUxO1e5vCMet1CSY2Bz9ZYBMFB/erYcGRk1Ckn230+mUW4OPqnsiH47Kz
	dmKuU9ZkHDsg1R8axYcfL67sEuob7gB2X1KmZNqai3LjbUxPv9zOg6U/PxMCoX221q+q
	scddaqvUyijp8eb7KXbv4xnmXp48qQMZ1S735qGk6jfM0ldJ0AGCdbDqTsTHOZXOrmDB
	uL7R065gz8RJGKlK4nZukoVW5N4JoC78Tif92y2/uIghM99/fxB5alsuLd8zgdCEjzoR
	VtPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=rK0kdDmo6KcwZs1jy6aBdcSuIdUnuDSM8qEc7uHfH0U=;
	b=rknXU7ivgA7OGFrwz8U9pTLMbde0op+ETJ6bNtems2jIzrUV+48d40OiF1Ctm7LOxj
	q5AxDycm5PPRWEw9Ia/stWPbucQ1k12mWWGv6ScmjDgJovt1xh9OD84uiMFPT1oF5zko
	5Y93Jdm0uKgMkSPCzk7bDUBx8gEmzG1XmU+KByOXjQ5vV9GYO0cNDb4hYUyS3tMwMlBV
	n2PX8/ei5CeAmGgrRYZAQ4seKh1NVBiQHDnKgkmQ/pKAySi7XazPr2ijJUFMt4EGAwcJ
	lDuERTwr6dOzKoSYsS6X68Ctzu6y4XOVy9jJGv1MmbJbrm6M6+WZyeGKRM6Q3Th8Ew2t
	j8Rg==
X-Gm-Message-State: AJaThX5dOj7MhlRJ215zwdkD3/4qAhtIG7resfMP8IlASPLV3pfZE4uN
	ux98/2NOy06nxvQaC9azp/Y=
X-Google-Smtp-Source: AGs4zMaMy9nZWJ/Z9Kvhc2Oq5r7rcJKv5BA8+/ecNcyyhENv85ZuhuZ3IHf+NeHo2Ec8ZXaXbMHPzw==
X-Received: by 10.98.95.197 with SMTP id t188mr9142149pfb.230.1511133466649;
	Sun, 19 Nov 2017 15:17:46 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4001:9ea0:a8e3:fe7b:142c:e048])
	by smtp.gmail.com with ESMTPSA id
	r188sm3724531pfr.134.2017.11.19.15.17.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 19 Nov 2017 15:17:46 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-devel@lists.openembedded.org
Date: Sun, 19 Nov 2017 15:17:44 -0800
Message-Id: <1511133464-12045-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][V2][PATCH] debootstrap: change license to MIT
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
X-List-Received-Date: Sun, 19 Nov 2017 23:17:45 -0000

The closest thing to a license is found in the http://metadata.ftp-master.debian.org/changelogs/main/d/debootstrap/debootstrap_1.0.92_copyright

The verbage looks very close to MIT so seems reasonable make to change the license to MIT instead of
creating a custom entry for debootstrap-custom-license. This follows what Redhat, Mandriva and Suse have for this package. (see rpmfind)

the difference between the MIT and the copyright files are:

-This package was debianized by Anthony Towns <ajt@debian.org> on
-Tue, 30 Jan 2001 10:54:45 +1000.
-
-It was written from scratch for Debian by Anthony Towns <ajt@debian.org>
-based loosely on the code for constructing base tarballs as part of the
-boot-floppies package.
-
-Copyright:
-
-Copyright (c) 2001-2005 Anthony Towns
+Copyright <YEAR> <COPYRIGHT HOLDER>

will fix: WARNING: debootstrap-1.0.67-r0 do_populate_lic: debootstrap: No generic license file exists for: debootstrap-custom-license in any provider

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.67.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.67.bb b/meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.67.bb
index 62b2796..8472aca 100644
--- a/meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.67.bb
+++ b/meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.67.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Install a Debian system into a subdirectory"
 HOMEPAGE = "https://wiki.debian.org/Debootstrap"
 SECTION = "devel"
-LICENSE = "debootstrap-custom-license"
+LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://debian/copyright;md5=1e68ced6e1689d4cd9dac75ff5225608"
 
 inherit pkgconfig
-- 
2.7.4


