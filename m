Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
	[209.85.208.169])
	by mail.openembedded.org (Postfix) with ESMTP id 696927D2D4
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Apr 2019 11:07:06 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id h21so14404237ljk.13
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Apr 2019 04:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=BMRJ5/wz7LOMY/KwUsjDvpDnFlmdsxgmTQZtKOFzj5Y=;
	b=SJ5I6U7UlOlFgUVN/41T3w/QKwGbZN2fa4V5vF52L/fcTHGAva5pMnR0lL+0WhT0Jc
	dRjEUZ7rHmKbz3Yo6w6hyBacURDUgwTu11Fdgi06fOMn3rkMDQOvITAMN1FOBaP5BZDL
	B7enAp7lB2qmK0VpBDDvbzOfo6bN2MBNdF4UP4FQJZaLiYUkkugZtC5rYKrWmaQUZZYx
	xJhGiRIT9uJor2oxOZm5nyclegUZnbifO9vCwFntj2qOTZvMzLID9Jt+1DzMjBHjICSX
	4uFDpr7wJ5hJZFyTBQxgqh8RcwKKK7mH+7Lh7ObcAn8p6TY1mGypFhpIYr8Z7Y/I8iUX
	GMZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=BMRJ5/wz7LOMY/KwUsjDvpDnFlmdsxgmTQZtKOFzj5Y=;
	b=Egzr0gYMd6EQFpKbcy9eO+g95/mkAyV1ZTgwkcIp3i4c58xJqX9Wk6+E4aFJoIKNgv
	G6ifiM7W9z7diBUrA03OyuCqeg1w82m5we+wVCFf0vQhM00eMx+AyK0ZXNZusMZgIsAp
	MEhGPYJRtlp4AL61AQosC4pF/9yz/e18/zsC/pZfrOX6yvrVZ93zwKAbX7jg5vmCFy4Z
	jPB7tZslP28IRkjNY3yeLhhs9WU7kodaVk9nH+0QfsgRknewREFasRFqdIhzFtWbG0rK
	ltGIT3arY6z6i62wXVax53K3tEwQjnbGk1fnPXfH4zDHl0OFLovgGxaCFyP2bmzBp3Cc
	FG6w==
X-Gm-Message-State: APjAAAWrUN4fDgH8iysmU4bDQes1MUZECbURBvJXSTf8SPtrxPo4l+M8
	dU3JsURI0ZGoQiowDPlp6zDJSeOWk3I=
X-Google-Smtp-Source: APXvYqz+48vY9RwvbxKmCkVXj1dn1ZenIR/gel9E1l0qosrxQuyASTuVZJMYl84YVKFP2d4va2unlg==
X-Received: by 2002:a2e:9b13:: with SMTP id u19mr20006134lji.134.1554289626678;
	Wed, 03 Apr 2019 04:07:06 -0700 (PDT)
Received: from scout.office.pelagicore.net ([83.218.80.243])
	by smtp.gmail.com with ESMTPSA id t7sm3176752ljj.87.2019.04.03.04.07.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Apr 2019 04:07:06 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
X-Google-Original-From: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  3 Apr 2019 13:07:01 +0200
Message-Id: <20190403110701.48992-1-oleksandr.kravchuk@pelagicore.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
Subject: [meta-oe] can-utils: bump to latest stable v2018.02.0
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
X-List-Received-Date: Wed, 03 Apr 2019 11:07:06 -0000

v2018.02.0 is the latest stable release at the moment.

License header was moved due to SPDX-License-Identifier being added to
the file.

Signed-off-by: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
---
 meta-oe/recipes-extended/socketcan/can-utils_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-extended/socketcan/can-utils_git.bb b/meta-oe/recipes-extended/socketcan/can-utils_git.bb
index a2d62c366..66717e9be 100644
--- a/meta-oe/recipes-extended/socketcan/can-utils_git.bb
+++ b/meta-oe/recipes-extended/socketcan/can-utils_git.bb
@@ -1,12 +1,12 @@
 SUMMARY = "Linux CAN network development utilities"
 DESCRIPTION = "Linux CAN network development"
 LICENSE = "GPLv2 & BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://include/linux/can.h;endline=43;md5=390a2c9a3c5e3595a069ac1436553ee7"
+LIC_FILES_CHKSUM = "file://include/linux/can.h;beginline=2;endline=44;md5=390a2c9a3c5e3595a069ac1436553ee7"
 
 DEPENDS = "libsocketcan"
 
 SRC_URI = "git://github.com/linux-can/${BPN}.git;protocol=git;branch=master"
-SRCREV = "4c8fb05cb4d6ddcd67299008db54af423f86fd05"
+SRCREV = "c5fd57df344710cbe7363079504de5d6f6a2e79d"
 
 PV = "0.0+gitr${SRCPV}"
 
-- 
2.17.1


