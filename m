Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 67C9C73197
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Mar 2016 11:33:23 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id n186so25788363wmn.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Mar 2016 03:33:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=JIRorqq4iF+urkNirkgFR1MXEy9JmqCIgxSsGhlmaYo=;
	b=VMOrn9oqEwQ8JQP8SuAkArQTt+93VEnY3awv4y1limFO17TBWPAqOvulYoBE/QIbs4
	X2dRtXudJrsVKrQmCPZYzVHtwhEIm3RtRFcMWfpZtVnQZ8qqurfgozeJIoDh/73iEicd
	s6j4BODoIZKvBBnePmmutSuo3i/9eChYtdiRPpFj25baKD6ZeGTmLV7O1XnumhiUCXLN
	MTpvmLcRPFQT8AY9nqkBHJ+HDRXKyh54B7SfldIGPzduZlTeoorZZ8tgXJL95wemFFyL
	Q6f5iIR1soOW64izklRBtwBLfEMMTfRENAcLHg2b+vOOsGdW9E7iqq4DmhUIIfM4r8fr
	TJnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=JIRorqq4iF+urkNirkgFR1MXEy9JmqCIgxSsGhlmaYo=;
	b=e2vISMxKjAPybzt6vmWPOHpuVINAQ+RwOD6/SUbvVI7oi21fls4Iebj3NJWN7RvPLW
	qFt48/Q1u0W0N6Pf2rvvsRLTxxiIUKeyUdmpQE8pb+b+EDhxQA8VjOR8s+zLLQtp7lQz
	cCW9UE93ukPN35fg+CFLvXLSNmSs+pR02ZBDzCw5RhXyqpMAVW9Vt+up6SnLDad8oSsB
	/mj/ZzRVeWSF8zrQbIBs/SgTSQk2b2E7chmg4AjpJqLBelqG2EFLpfNrrVWk85giHCEl
	B+ylpBkhhYescT3ATxeg/5pXvX3Tsm/7v78aBtCvYxmrvsE1JoFDrVOvvTbNHePkVOlF
	r3XQ==
X-Gm-Message-State: AD7BkJLiAF8Fyvi9zq2Vqg4UxS+aWqPcucLJI9vjJrg7sXRNjEDPPoRXpQ1uU+THVhU7BQ==
X-Received: by 10.28.59.87 with SMTP id i84mr3174743wma.61.1457609604024;
	Thu, 10 Mar 2016 03:33:24 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	ka4sm3051229wjc.47.2016.03.10.03.33.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Mar 2016 03:33:23 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 10 Mar 2016 12:36:15 +0100
Message-Id: <1457609775-25093-4-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.7.2
In-Reply-To: <1457609775-25093-1-git-send-email-Martin.Jansa@gmail.com>
References: <1457609775-25093-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH][meta-oe 4/4] synergy: add dependency on unzip-native
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
X-List-Received-Date: Thu, 10 Mar 2016 11:33:23 -0000

* otherwise may fail with:
  ERROR: synergy-1.7.3+1.7.4-rc8+AUTOINC+588fb4b805-r0 do_unpack_extra: Function failed: do_unpack_extra (log file is located at /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/synergy/1.7.3+1.7.4-rc8+AUTOINC+588fb4b805-r0/temp/log.do_unpack_extra.11874)
  ERROR: Logfile of failure stored in: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/synergy/1.7.3+1.7.4-rc8+AUTOINC+588fb4b805-r0/temp/log.do_unpack_extra.11874
  Log data follows:
  | DEBUG: Executing shell function do_unpack_extra
  | /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/synergy/1.7.3+1.7.4-rc8+AUTOINC+588fb4b805-r0/temp/run.do_unpack_extra.11874: 105: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/synergy/1.7.3+1.7.4-rc8+AUTOINC+588fb4b805-r0/temp/run.do_unpack_extra.11874: unzip: not found
  | WARNING: exit code 127 from a shell command.
  | ERROR: Function failed: do_unpack_extra (log file is located at /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/synergy/1.7.3+1.7.4-rc8+AUTOINC+588fb4b805-r0/temp/log.do_unpack_extra.11874)
  NOTE: recipe synergy-1.7.3+1.7.4-rc8+AUTOINC+588fb4b805-r0: task do_unpack_extra: Failed
  ERROR: Task 0 (/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-support/synergy/synergy_git.bb, do_unpack_extra) failed with exit code '1'

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/synergy/synergy_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/synergy/synergy_git.bb b/meta-oe/recipes-support/synergy/synergy_git.bb
index cb842c8..9b4f22b 100644
--- a/meta-oe/recipes-support/synergy/synergy_git.bb
+++ b/meta-oe/recipes-support/synergy/synergy_git.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=0f366945b209c5523e39889f636af00a"
 LICENSE = "GPL-2.0"
 SECTION = "x11/utils"
 
-DEPENDS = "virtual/libx11 libxtst libxinerama"
+DEPENDS = "virtual/libx11 libxtst libxinerama unzip-native"
 
 # depends on virtual/libx11
 REQUIRED_DISTRO_FEATURES = "x11"
-- 
2.7.2


