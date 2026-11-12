Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8157.1794465928132999917
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Nov 2026 22:45:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=rVhG0AGp;
 spf=pass (domain: gmail.com, ip: 74.125.82.171, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-33fb4680717so4745143eec.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Nov 2026 22:45:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794465927; x=1795070727; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o8wBnxFNCQ9F1WfXKilPNY1PoyMrdLuJUT7tBNXts30=;
        b=rVhG0AGpEG4fgoEPcmcdpjwmAQmalNzgsG8kcGuptpuF0yPFB6VLp4v0KuRN/p8jBt
         FLVhRBcFFB5q87KcF95ZNwhsSUkKGkIC3W9ydR7bZNsqH7rdbWqk/sD6A9Xu3bjgDmqd
         YAK5GJ7iSe6PQGGOuZaFGDX4jEeenpaV3ecrSYu+yF1n9IOqaH5VWq04crwG3qXC+9Pn
         bRXMVLIBonsUdIR5eIN3VTMc+ow/O4A4ZzvRDzE8tJfHwaVCARGHNHt0KuSjQ52OVs4S
         X4nRF5ApPd67oHOV7tyyRtDY9uDUcu4pTXvmGgPM9koA2pJAk8UxrOgX33HBGn9c3gSy
         F6Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794465927; x=1795070727;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=o8wBnxFNCQ9F1WfXKilPNY1PoyMrdLuJUT7tBNXts30=;
        b=XVkAvWvF3M8K8fZ0IHQPCqcTJ2To3kbNIODrLrb8lU1zcqgsmcrUsYzTYaTapHIcww
         QnV09C9OYU0kZBtCa1eXhaA/YLnTXi3LIm5kntBf/grNsMSpFbEvoXYXJfQu58MmOAlN
         8Oaw7l6x5RVyfUgFmgNY6Iu2AKEYKU5NTTqe0aWS0EgwDN+8Gq5GIX6Gati27nA/vI/j
         wlnzIzmDFC6akt+542zsUS4XYegKyYWDLEpff3F385UGLx2bSJEBFW97K4aQ2dacVs1u
         SACLuyzu+XJtP/DV6l+w/4CDsJxco91EpZH4j9XbEtx/+X4mlWPJBiFWOvzKMPovtevP
         7azg==
X-Gm-Message-State: APuU4Z9nGT7SVCidnkMv66VTwwMcFYCPpE6frHa6ui5SsSKM+TGO1D8X
	wgKRY5F+JqUe9ma80qBqlbIDdPUXwdIGZqGHKoUqjnk5kbmc26gLrTfFEavw/XqFcP8=
X-Gm-Gg: AYBFou2gLm78Va3ueZsvlIQFCAj5Z7EuQYQkGpZxl7Dk37bx9dXuyLXTk43qfFDxt4h
	ONIRpZz7Gwe6kozAuRIEI/0YzWjW/+/k/l3PIkhXBSlneaUS7awM23qolOk27HSo2234v8Jd2Tq
	AeZ+vGFwe3XYFtK2H4PILKht1vbQmjzOudPORECZbcA015JJ7r+Lvv74DJOwGyYTnrgfe5wSLls
	d9sqR0aKZ+lZVimWY+q1xX2jgZ1ILwXwVOfYKsy61VNUrmJ+WmNVGVw0Wy8l/6JvJPJ7hsvtNi/
	9XBdPkcZkUq0oyTXGZ0WK9OQVyMHVQdpwVrkv0s2KuxHXkUJaBtr1/GxX2Ac79XBgjEBMp1v4/c
	OkSXYMxjtnYABU72870wLH3nbgdQmkn6sezluViWzTlMtoLuF/sPPIf2iMTtfsjWqxTI7i32B2o
	3/LTozccPqPqZW9tyVTtV4zy+boAUlA1g9/5iS2yV2yiAJIVl1NvRQMIsori/RkDE8Ifa9q86Sz
	mksk5+eXWAjEfKd5irnJtkhjJNPRSHSI2EubKkcfhiX1/b3zKnA5/uWX3a74p9uaNnr3RRoYesw
	EHR/yJPxfNnIXWRGDcvTpIxMnxte+dKFCXRD+a2auq7p18O/ZYcoyIrJm2SnPFinY4iNJCBbV0A
	DnpXkXWZFmZ9VzlqdA/uM4okcm8ZpOdSeAvSaJ1uZ+LYeK1ikBQ9uNR+QFF1jBNvr99KpLJ7kBG
	qZt8NTLFdq3YlLW5UklbrR7utgmk5jdshjSVCaNWoduLqtfPQNsiBJG4JtSGje02fL/Wfvptjpw
	qhfjXf6VF5bgNkleF3J2VdwPQHpjNx9cjrbdcGxCPhaCkWhJA1oflBLSL9Mnc4T5NfhWbc1PjVt
	TZy8
X-Received: by 2002:a05:693c:414d:20b0:36d:dd5a:4528 with SMTP id 5a478bee46e88-376851ce396mr5755157eec.7.1794465927493;
        Wed, 11 Nov 2026 22:45:27 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751dae6377sm21055001eec.3.2026.11.11.22.45.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 22:45:26 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-webserver][PATCH 5/5] webmin: Remove unused patches
Date: Wed, 11 Nov 2026 22:45:15 -0800
Message-ID: <20261112064515.2411568-5-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261112064515.2411568-1-khem.raj@oss.qualcomm.com>
References: <20261112064515.2411568-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 12 Nov 2026 06:45:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132198
Content-Type: text/plain; charset="utf-8"

These were dropped from SRC_URI in eb4d6ede5d (webmin: upgrade 2.641 -> 2.653) but the files were left behind:

  init-exclude.patch

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../webmin/files/init-exclude.patch           | 75 -------------------
 1 file changed, 75 deletions(-)
 delete mode 100644 meta-webserver/recipes-webadmin/webmin/files/init-exclude.patch

diff --git a/meta-webserver/recipes-webadmin/webmin/files/init-exclude.patch b/meta-webserver/recipes-webadmin/webmin/files/init-exclude.patch
deleted file mode 100644
index 489318b4bd..0000000000
--- a/meta-webserver/recipes-webadmin/webmin/files/init-exclude.patch
+++ /dev/null
@@ -1,75 +0,0 @@
-Hack in support for an "exclude" config option for the init module, so
-we can hide certain system services that shouldn't really be configurable
-via the web interface
-
-Upstream-Status: Pending
-
-Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
-Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
----
- init/index.cgi   | 27 ++++++++++++++-------------
- init/init-lib.pl |  5 +++--
- 2 files changed, 17 insertions(+), 15 deletions(-)
-
-Index: webmin-1.850/init/index.cgi
-===================================================================
---- webmin-1.850.orig/init/index.cgi
-+++ webmin-1.850/init/index.cgi
-@@ -45,19 +45,20 @@ elsif ($init_mode eq "init" && $access{'
- 					     : "$config{'init_dir'}/$ac[0]");
- 		}
- 	@runlevels = &list_runlevels();
--	foreach $r (@runlevels) {
--		foreach $w ("S", "K") {
--			foreach $a (&runlevel_actions($r, $w)) {
--				@ac = split(/\s+/, $a);
--				if (!$nodemap{$ac[2]}) {
--					push(@acts, $ac[1]);
--					push(@actsl,
--					     "1+$r+$ac[0]+$ac[1]+$ac[2]+$w");
--					push(@actsf, "$config{'init_base'}/rc$r.d/$w$ac[0]$ac[1]");
--					}
--				}
--			}
--		}
-+	# Assume there won't be any of these broken actions
-+	#foreach $r (@runlevels) {
-+	#	foreach $w ("S", "K") {
-+	#		foreach $a (&runlevel_actions($r, $w)) {
-+	#			@ac = split(/\s+/, $a);
-+	#			if (!$nodemap{$ac[2]}) {
-+	#				push(@acts, $ac[1]);
-+	#				push(@actsl,
-+	#				     "1+$r+$ac[0]+$ac[1]+$ac[2]+$w");
-+	#				push(@actsf, "$config{'init_base'}/rc$r.d/$w$ac[0]$ac[1]");
-+	#				}
-+	#			}
-+	#		}
-+	#	}
-
- 	# For each action, look at /etc/rc*.d/* files to see if it is
- 	# started at boot
-Index: webmin-1.850/init/init-lib.pl
-===================================================================
---- webmin-1.850.orig/init/init-lib.pl
-+++ webmin-1.850/init/init-lib.pl
-@@ -124,8 +124,9 @@ List boot time action names from init.d,
- =cut
- sub list_actions
- {
--local($dir, $f, @stbuf, @rv);
-+local($dir, $f, @stbuf, @rv, @exclude);
- $dir = $config{init_dir};
-+@exclude = split(/,/, $config{exclude});
- opendir(DIR, $dir);
- foreach $f (sort { lc($a) cmp lc($b) } readdir(DIR)) {
- 	if ($f eq "." || $f eq ".." || $f =~ /\.bak$/ || $f eq "functions" ||
-@@ -133,7 +134,7 @@ foreach $f (sort { lc($a) cmp lc($b) } r
- 	    -d "$dir/$f" || $f =~ /\.swp$/ || $f eq "skeleton" ||
- 	    $f =~ /\.lock$/ || $f =~ /\.dpkg-(old|dist)$/ ||
- 	    $f =~ /^\.depend\./ || $f eq '.legacy-bootordering' ||
--	    $f =~ /^mandrake/) { next; }
-+	    $f =~ /^mandrake/ || grep {$_ eq $f} @exclude ) { next; }
- 	if (@stbuf = stat("$dir/$f")) {
- 		push(@rv, "$f $stbuf[1]");
- 		}
