Return-Path: <akuster808@gmail.com>
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
	[209.85.216.52])
	by mail.openembedded.org (Postfix) with ESMTP id 19E0961BE9
	for <openembedded-devel@openembedded.org>;
	Thu, 12 Mar 2020 02:57:38 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id 39so2178315pjo.1
	for <openembedded-devel@openembedded.org>;
	Wed, 11 Mar 2020 19:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=NPLvfms/b56+l2EKUU7xc1byTaDYuKDoXxpWi6/O0Uc=;
	b=WjbIP6s2IxYrOGMVk8fKphvzXh4Gw/+KjDh8POHh86+K6g0nS2D1UAu7iB9MZvRNHu
	WwamVc8otQwn9BGYBy1rFt4A6h6g2uOTPE1XDh9N4lQSjPRqynZP/Sr+ynjJJSxCEcEq
	+HTfnvE49UwUachLbHd+Hr777Aqwa7NalJsP64qC37AzroCeTlfK5+5CfLVV0B67iXmK
	ZEHz3lLkC8pM2gj8IVEetVSil94lWUn5M/h7fAaYYM77cSfeWfHFQeeVtBm0n9sgnEL1
	Utpl9/QpKEk0dpIGXK9ZIi/RbEen48aYtJEQ3BThL4HufXUXUN9jI2dfx8ALjnqqNja/
	V/kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=NPLvfms/b56+l2EKUU7xc1byTaDYuKDoXxpWi6/O0Uc=;
	b=HAAosaD45SwXggbaMvHACJKSLleT/dh7KXz4XsOdsWxSlAyJrC//5mMpMuPKfRgRuq
	DPJWpp0EtTfaTwUktXp5Hot62NQQ7vBMKQ7aYCxQQj8CLn8xAuk7EWK/PWoTglSV5cXz
	dpKL+rB0sXgKbre3aNMOM10XTV8njTXfUoPylaiuWc+/YWKZ80jmUri3jiYxjlSYrX2F
	IZvLnKsUtbcvp6kCPrkyJJruxnEQ2Dwx+CI4uEWkE0MAb9Bc9Xhhi9yO621LHUR3/InZ
	csABcf4cKF/Nb7BrYgv/DHqXi9xUGGG8ATq+cceKCgR6fFK+ajgZ70ZCEbyZt+M3P/v/
	km5w==
X-Gm-Message-State: ANhLgQ06ody6UMsucQyHpHzdseP2ey6Xi3LoiiDWIuDJbZABeSq7a5uf
	i5rQqTVhXKtIRk3+CQ3UUGBdtiuR
X-Google-Smtp-Source: ADFU+vvYR31pB1+S55RKsDNb3YFVjZ/7YdQ3I4TX4PYigoFmxXTGBiqxlXckMFHFg/DON13SR0tK/g==
X-Received: by 2002:a17:90a:8983:: with SMTP id
	v3mr1801507pjn.65.1583981859587; 
	Wed, 11 Mar 2020 19:57:39 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:60a5:8a88:a7f9:d809])
	by smtp.gmail.com with ESMTPSA id
	e2sm18328236pgv.81.2020.03.11.19.57.38
	for <openembedded-devel@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 11 Mar 2020 19:57:39 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@openembedded.org
Date: Wed, 11 Mar 2020 19:57:20 -0700
Message-Id: <7624a4f2d1a86538dbf556e7ad1d82841e7e4e65.1583981708.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1583981708.git.akuster808@gmail.com>
References: <cover.1583981708.git.akuster808@gmail.com>
Subject: [zeus 01/13] mosquitto: Use mosquitto.init for daemon init
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
X-List-Received-Date: Thu, 12 Mar 2020 02:57:39 -0000

From: Mike Krupicka <Mike.Krupicka@panduit.com>

Config file specification is missing in start) case. It is present already in restart) case.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 257ea010b716073acbe6866f4c3968b4962fdc37)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-connectivity/mosquitto/files/mosquitto.init         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/mosquitto/files/mosquitto.init b/meta-networking/recipes-connectivity/mosquitto/files/mosquitto.init
index 6a0c12760e..9d5963c418 100644
--- a/meta-networking/recipes-connectivity/mosquitto/files/mosquitto.init
+++ b/meta-networking/recipes-connectivity/mosquitto/files/mosquitto.init
@@ -38,7 +38,7 @@ export PATH="${PATH:+$PATH:}@SBINDIR@:@BASE_SBINDIR@"
 case "$1" in
     start)
         echo "Starting Mosquitto message broker" "mosquitto"
-        if start-stop-daemon --start --quiet --oknodo --background  --make-pidfile --pidfile ${PIDFILE} --exec ${DAEMON} ; then
+        if start-stop-daemon --start --quiet --oknodo --background --make-pidfile --pidfile ${PIDFILE} --exec ${DAEMON} -- -c @SYSCONFDIR@/mosquitto/mosquitto.conf ; then
             exit 0
         else
             exit 1
-- 
2.17.1


