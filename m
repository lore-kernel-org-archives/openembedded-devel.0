Return-Path: <potin.lai.pt@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C62EBECAAD4
	for <webhook@archiver.kernel.org>; Fri, 26 Aug 2022 02:11:42 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web12.32222.1661479896145295430
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Aug 2022 19:11:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nyH6uq6U;
 spf=pass (domain: gmail.com, ip: 209.85.210.180,
 mailfrom: potin.lai.pt@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id g19so295162pfb.0
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Aug 2022 19:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=0d3d6tv7fuYGPPrQFohp5dSzBgrQ/hv1/acL+6ONCuU=;
        b=nyH6uq6UedY85Cm6OdwTYHIWdBXpx+Pw6zsekWLQRfTEiVQKWOSoaEBX7cEZdFsEsp
         YuIxleUaBgKjyAOT6lPxVkqDZnGW/2s28LBgFCKhZ/Kp7trb7kPyh3E1m3rH6S9qhCSg
         KwOHM4skgEcbWc1F6QFTmlJDBgpBdbrS7ONIrrYp4lwSMrSM0yz+z5yBYKnUTtE6Qa/T
         dHhqafAGQCf718DDJLn4L4/VkRYOZ1INHxcmrXKNHkHcKNgLrzMfL8oU2omsWQuRJV6H
         Sbh3f/QKcBmuicax7nV4rZwe5IvWGJRYd1MUkHHF9YwPf9z5NCGfeNEyMp2K7SvHoV4Q
         rEiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=0d3d6tv7fuYGPPrQFohp5dSzBgrQ/hv1/acL+6ONCuU=;
        b=2IsZKP3pGWSxuq0F8/se2lqaHyrfIbPEhIt6LdXeAcDv8CNadl/cymeXYtGh+J0NVI
         fwraHD2HlqV4Tok0Gdoi0vsXRfSmKH1K0npTBRm9z4PpMJ6eQ4ofZGcQVgt6K7CiXYUd
         ppFlciK5oj25I+7mNTDgTPqWljWLtp5PesJovUx9sIioKUB2lBteYEHBq6lEF1aFFcBX
         gU1S8UYFgIM0TfAsdZL0l17Y0+dFGkDEBW7fKHrb9omtFOxCQq/mY3OEFJKF2o4lkrzt
         wU6Kw9GjTyJWAvBF6H1QEuQ/P/qV1n7B08qz0zJkh68cBK+SNT4H3uwV68opngw3/M9C
         N4Zw==
X-Gm-Message-State: ACgBeo0Uzh8mBszaRESDNtHdnr4sZRm/qAFlq4KmnHeAyW9jfU++PzVU
	2dm08/7tseiSvAVx1yVkLvxNdZcLCW4YsQ==
X-Google-Smtp-Source: 
 AA6agR6uvrf3FXRtwtUQFz0Et24HxyindZr6Ra/G67p75rx84UkkKP/OiK55eAQHeA1RdyGxIkuuag==
X-Received: by 2002:a05:6a00:d5f:b0:536:1ec2:60c3 with SMTP id
 n31-20020a056a000d5f00b005361ec260c3mr1726450pfv.3.1661479895103;
        Thu, 25 Aug 2022 19:11:35 -0700 (PDT)
Received: from localhost.localdomain (125-228-123-29.hinet-ip.hinet.net.
 [125.228.123.29])
        by smtp.gmail.com with ESMTPSA id
 z75-20020a63334e000000b0041a67913d5bsm250180pgz.71.2022.08.25.19.11.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Aug 2022 19:11:34 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Patrick Williams <patrick@stwcx.xyz>,
	Potin Lai <potin.lai@quantatw.com>,
	Potin Lai <potin.lai.pt@gmail.com>
Subject: [meta-oe][PATCH 7/7] idevicerestore: SRCREV bump 280575b..7d622d9
Date: Fri, 26 Aug 2022 01:32:27 +0000
Message-Id: <20220826013227.181910-8-potin.lai.pt@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220826013227.181910-1-potin.lai.pt@gmail.com>
References: <20220826013227.181910-1-potin.lai.pt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Aug 2022 02:11:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98448

Changelogs:
==========
7d622d9 restore: Don't print 'Attempting to continue after critical error' warning when no error was detected
6bc672c Make sure to exactly match the passed variant when using --variant
e667b49 Add --variant command line switch to specify build identity to use
fbbd4b6 Ignore 'Research*' variant in build identity selection
20ad978 ipsw: Add workaround for missing RestoreBehavior entries for ipsw info
efd00b4 Don't print an error message when RestoreBehavior is missing
170a17e ipsw: Improve error message when fwrite fails
eff9fab Support iOS 16.0 Beta 2 (#506)
aa25a29 Remove more serial number checks, and get ECID early on in all modes
f6c3d53 Add support for FirmwareUpdaterPreflight message
3525150 Use more elegant way to match file name to component name
5831f78 restore: Fix memory corruption in restore_get_timer_firmware_data
6d3f4cf Add support for iOS 16
f80a876 ipsw: Update to reflect color macro name change in libimobiledevice-glue
ddc0c16 Fix restore for devices that don't have eUICC
51b33f4 Increase recovery mode disconnect and re-connect timeout from 10 to 60 seconds
0b269e6 configure: Only check for pthread if really required
6a16d60 configure: Make sure the plist_from_json works
9052c7f Print version string upon execution
86c53b4 autoconf: Automatically derive version number from latest git tag
8f7afa0 More code improvements using _plist_dict_copy_* helper
71561a4 Use proper detection for macOS restore path (instead of version number comparison)
2eb8865 Fix build identity selection for beta (developer) firmware
190473b restore: Fixed a problem that nobody even knew existed
e833a30 normal: Skip fetching FirmwarePreflightInfo for non-baseband devices
ca44e4d tss: Fix img4 tag for TSS request
03f2bae tss/restore: Improve code readability with plist helpers and removal of unneeded comments
7eaa1fa Add support for Timer,* components and TSS found in iPad Air 5th gen firmware
e28d96d ipsw: Use libplist's new plist_from_json API
d0a61eb Updated README with pkg-config requirement

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
 meta-oe/recipes-support/idevicerestore/idevicerestore_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/idevicerestore/idevicerestore_git.bb b/meta-oe/recipes-support/idevicerestore/idevicerestore_git.bb
index fc07c6e69..d7c76a597 100644
--- a/meta-oe/recipes-support/idevicerestore/idevicerestore_git.bb
+++ b/meta-oe/recipes-support/idevicerestore/idevicerestore_git.bb
@@ -6,11 +6,11 @@ LIC_FILES_CHKSUM = "\
 
 HOMEPAGE = "http://www.libimobiledevice.org/"
 
-DEPENDS = "libirecovery libimobiledevice libzip curl"
+DEPENDS = "libirecovery libimobiledevice libzip curl libimobiledevice-glue openssl"
 
 PV = "1.0.1+git${SRCPV}"
 
-SRCREV = "280575bb95977241e240ed081a2602d68746443e"
+SRCREV = "7d622d916be16f2df5a72bf53a42f3a326bbfaa4"
 SRC_URI = "git://github.com/libimobiledevice/idevicerestore;protocol=https;branch=master"
 
 S = "${WORKDIR}/git"
-- 
2.31.1


