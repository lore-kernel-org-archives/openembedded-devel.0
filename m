Return-Path: <kergoth@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 3E2AC731F4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 May 2016 16:10:28 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id y7so2352772pfb.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 May 2016 09:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=eWJSoBM050mGpOnEoakVhLQMbX2HKLylh3q3w8DkhME=;
	b=zuC83idFvWjBXeSPXWmCOjptUxFytHZdc908G3Kfot/OPP8mNDmimjU+nuBK2uYj2W
	wYHVW2vBu9wKqpg+Cl1RsYc0iIfsykaxEq5kMVm2uFC/qme/eDV/IijSLcFG5TeRfQPc
	FNnf8d91SvihWgeVkd5MhrimckX5aa7zY45adXw1hw/WCW+fL12SFpJuAtwp0NDfFFs6
	EhfxB/esR6c8fEIwFiN8UklPdsgM4Y5CQ3roIPpxzkzR1O2wyiLBKSzCy9scJuhuJRSQ
	Xy5+yZ5q/l9LmZzLVu67yR3fI/hFkK4WPM3/UwPTY90qoCMHfNxUJCq1c83sDqutGdL/
	XaAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=eWJSoBM050mGpOnEoakVhLQMbX2HKLylh3q3w8DkhME=;
	b=TRwTJKcP9c8Gnn0Ibu9SUXeY9HNFaODPT4/t3zEBPteXQWAZddllGzXi+DYb/yohp2
	ONrv5tDni9kyE8gHFL5T3Mj7oFXd6vuSjgHX944S5E7+ZG67Md9b74SV+4ogurj6et97
	/9aI5+49URqveDMya+S9eapk58Eali+EymocbeO/oy7co2C4Rdwc07ApIlpxwxDTC8UE
	3LXlJSvEPPd5yVVvyXurZGpVewSX+dQzLagbxPdYZievu6IpPRqz9x3ZrOXiZRfqamw7
	fHpG4RSGZT1SQ9IF1jdkjk1GvakcnMWJASVWdGLR02shNOR1xd6OkNUQEJxi02V/vEQb
	D82Q==
X-Gm-Message-State: AOPr4FWe7EI8X5OvZg1Iyz1AOtTe663XKMG4ieXpwjSdF6fYFRNYs9Py9+jccJ1wxZ3DXQ==
X-Received: by 10.98.98.6 with SMTP id w6mr3379539pfb.0.1463501429900;
	Tue, 17 May 2016 09:10:29 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	rw2sm5868665pab.30.2016.05.17.09.10.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 17 May 2016 09:10:28 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 17 May 2016 09:10:17 -0700
Message-Id: <2b43fc728226792827988f347c9c3d4c2fb04f0e.1463501350.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <3ab55100823a114a701c63eaa703d0352bca5513.1463501350.git.chris_larson@mentor.com>
References: <3ab55100823a114a701c63eaa703d0352bca5513.1463501350.git.chris_larson@mentor.com>
In-Reply-To: <cover.1463501350.git.chris_larson@mentor.com>
References: <cover.1463501350.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [meta-oe][PATCH 3/6] openlmi-networking: add missing dep on konkretcmpi-native
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
X-List-Received-Date: Tue, 17 May 2016 16:10:31 -0000

From: Christopher Larson <chris_larson@mentor.com>

Without it, we can hit errors like:

    | CMake Error at .../build/tmp/sysroots/qemux86-64/usr/share/cmake/Modules/OpenLMIMacros.cmake:105 (message):
    |   KonkretCMPI failed: No such file or directory

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta-oe/recipes-extended/openlmi/openlmi-networking_0.3.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/openlmi/openlmi-networking_0.3.1.bb b/meta-oe/recipes-extended/openlmi/openlmi-networking_0.3.1.bb
index 5442910..7cfcbe2 100644
--- a/meta-oe/recipes-extended/openlmi/openlmi-networking_0.3.1.bb
+++ b/meta-oe/recipes-extended/openlmi/openlmi-networking_0.3.1.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "http://www.openlmi.org/"
 LICENSE = "LGPL-2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7c13b3376cea0ce68d2d2da0a1b3a72c"
 SECTION = "System/Management"
-DEPENDS = "openlmi-providers konkretcmpi sblim-cmpi-devel cim-schema-exper networkmanager dbus libcheck glib-2.0"
+DEPENDS = "openlmi-providers konkretcmpi konkretcmpi-native sblim-cmpi-devel cim-schema-exper networkmanager dbus libcheck glib-2.0"
 
 SRC_URI = "http://fedorahosted.org/released/${BPN}/${BP}.tar.gz \
            file://0001-fix-lib64-can-not-be-shiped-in-64bit-target.patch \
-- 
2.8.0


