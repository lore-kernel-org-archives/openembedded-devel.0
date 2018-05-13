Return-Path: <twoerner@gmail.com>
Received: from mail-it0-f65.google.com (mail-it0-f65.google.com
	[209.85.214.65])
	by mail.openembedded.org (Postfix) with ESMTP id 84DC078ADC
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 May 2018 12:45:55 +0000 (UTC)
Received: by mail-it0-f65.google.com with SMTP id c3-v6so7498636itj.4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 May 2018 05:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=ocZyOZ6tav79huJgHfk2nLBSlpNHRzT0oGyfCWVEG78=;
	b=cvrwFFm7ElgXLXpRQ52YGGHtOKpLxMvIY+JsXp9jbNtTnM0aEQhdktK4eTFZRxA+8f
	KCZIOXX5/waDSNGXkb3+kEAJ1DgPTc8OR/OVr+CI71zhUFdacUUMwvsLAfq3vAk1ockq
	5X1xV9n0B8o34B/H+VpchHftzIp/t+xs5joZllpF+W1ByFfQHuuMp6c2ak455QfgS//E
	GjjGeVx1Mn9AacH8fhybKMIAbmec9TwgZbF4PGf5m3XZSHdZ8P84lLLrhPpVvzrt/RAz
	cQVo2gkWsl3WuQFw62tv+07cIwNbm4F59ZNWFsJUt5QWwg8bmmii1UAavwIhpQU0E1T7
	uYDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=ocZyOZ6tav79huJgHfk2nLBSlpNHRzT0oGyfCWVEG78=;
	b=SIwIjiLxFJP9mNPGwo5hK1eV6lyNaeNP8vNIHDUNX8NibFcTSoMuQQOlFBfgkfbOl9
	/8QioCYsaP4j4TMp0jnxCM3aAOpOGWgIC3do6yC0/wbGrjqtGPKat5QbfUDQOwy0xUWU
	DfqAy3H7XnB30tVXFRSD6pFFtaex4cUO+SQktpp6dZvbSBXNgIhHAU9gvzO1HkFO5Cug
	X2e8y0FZLgJxE6W9ZWq2gcDE176iCrRIVIaVCOdRP4FBCOJmXvUiwngSOjOr9Wu2RkN2
	sFMpiQaM2bniE6vSx8Y5YoWCMl9c/qwm9kjPyDcPhzmZ6MxUO8k3EIxTNDsI8d/w0yUx
	vEqw==
X-Gm-Message-State: ALKqPwdajAGXKzLyZc0aUoXEWlPHD2OqFyjjs2ulXsEKQF6EcolEf+TZ
	HLLEJ7AUZb6mviktEomY4El1PCKo
X-Google-Smtp-Source: AB8JxZrG8c6wNlK9je9gI6ouqscc3duDE6B/b07ypBVT0nk92rNcLRyggCgr3kdGqiGT336PwVk19Q==
X-Received: by 2002:a24:af04:: with SMTP id t4-v6mr5447794ite.11.1526215555999;
	Sun, 13 May 2018 05:45:55 -0700 (PDT)
Received: from linux-uys3.suse ([206.248.190.95])
	by smtp.gmail.com with ESMTPSA id
	24-v6sm3521821iol.13.2018.05.13.05.45.54
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 13 May 2018 05:45:54 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 13 May 2018 08:45:52 -0400
Message-Id: <20180513124552.4932-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.17.0.rc2.3.gc2a499e6c
Subject: [meta-oe][PATCH] python-cpuset: switch away from github archive
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
X-List-Received-Date: Sun, 13 May 2018 12:45:55 -0000

Since we know that github archives which are automatically generated have a
tendency to change their checksums[1], switch to using a git clone.

[1] http://lists.openembedded.org/pipermail/openembedded-devel/2017-September/114916.html

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 .../recipes-devtools/python/python-cpuset_1.5.7.bb    | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/meta-oe/recipes-devtools/python/python-cpuset_1.5.7.bb b/meta-oe/recipes-devtools/python/python-cpuset_1.5.7.bb
index 8f6532c531..156e52a3a5 100644
--- a/meta-oe/recipes-devtools/python/python-cpuset_1.5.7.bb
+++ b/meta-oe/recipes-devtools/python/python-cpuset_1.5.7.bb
@@ -3,14 +3,9 @@ SECTION = "devel/python"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
-SRCNAME = "cpuset"
-
-SRC_URI = "https://github.com/lpechacek/${SRCNAME}/archive/v${PV}.tar.gz"
-
-SRC_URI[md5sum] = "6ad79b26ba03f559604d74513cc34392"
-SRC_URI[sha256sum] = "32334e164415ed5aec83c5ffc3dc01c418406eb02d96d881fdfd495587ff0c01"
-
-S = "${WORKDIR}/${SRCNAME}-${PV}"
+S = "${WORKDIR}/git"
+SRCREV = "ae629aa1dc959342745ad97406adddf63bb6dbdd"
+SRC_URI = "git://github.com/lpechacek/cpuset.git;protocol=https;"
 
 inherit distutils
 
-- 
2.17.0.rc2.3.gc2a499e6c


