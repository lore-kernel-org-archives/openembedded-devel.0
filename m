Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 5CB076AC37
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Mar 2018 23:07:26 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id q83so15208597wme.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Mar 2018 15:07:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=aTSgE9F8TwpwPqo1TDgd/nOWWhVQ3Aa0afPIDSqKl80=;
	b=U58JW9WZ6GaSyiP0ZeY2C9R03C/pan8T1xt6BzBjAccMsq1L4W9UPhtsSen34GQB6Y
	7Qw3XzdfVpDIRxOv5DTFpTMPfkulQ81VJmosaWGIZvCaiSYLA3/Y9UNeDkNpJViaMOcf
	vv55RCrPkiNbOARKWsG7v96e9hADILJVxcycF+CnmL3KIWCm8s1QZBQWo4+Je+aVw0Xs
	UzUZ8Irzi6CEYk5niSxXrLoTMr/hyVdkHevDkQia2rDlYH0+6LWm0UZpHTPx9klBm49J
	tr4BWVuwSiPrACH2KM1uFcuyWmbmL1LMBKfmENqcQa+f/tVujOtusfcbHjjF5uk2KfcW
	vIfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=aTSgE9F8TwpwPqo1TDgd/nOWWhVQ3Aa0afPIDSqKl80=;
	b=FfP5R1XDnL3MnSf++G/PD27wKXjsEUXvv74CSTHRavbExPs14rl9lcTgk4tjGUmFjN
	eYfnd3GQNKnpg9tR8UsQrkWBUmf3KhUZFmjPMkJlQMMUO0J3utpSOSFldTRwDJxDJUae
	FUCzsyZLfaT1LnHSapTlAPNJklaoJSmxZKju6g611zeorfRovP/rAD764Y8ctZExOYN5
	mFP9yfI974kyD1ZbzF6oi2bscYjH6P8/BwjVLnrKugBfE16kBabY3UeV8fovMAadMaGX
	82CBYk3Zv3ZmYtcFuoevxjpHrjrj5tmhNFPTNvSLN81ihTK4Qg0oellC6pnmOFmh8jCs
	ZBvg==
X-Gm-Message-State: AElRT7HKUjFfLQ/x6L1q1thcUVx47796otPvZ4uT5+sON4RfbkCV26xw
	3Vh2jPsH0BZTlFILYdsJXo5YVQ==
X-Google-Smtp-Source: AG47ELtS/+c4rgTTtGC6L1rEV+emH+3hx1xBHqiW+RH5V5PZoop2ctGPKM1X9hY7DNwQbVj5WlAQPw==
X-Received: by 10.28.122.11 with SMTP id v11mr2848008wmc.38.1519945333447;
	Thu, 01 Mar 2018 15:02:13 -0800 (PST)
Received: from PC192-168-2-116.speedport.ip
	(p200300F07BC063001E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc0:6300:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id 8sm5490wmf.13.2018.03.01.15.02.12
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 01 Mar 2018 15:02:13 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  2 Mar 2018 00:01:48 +0100
Message-Id: <20180301230148.2284-13-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180301230148.2284-1-schnitzeltony@gmail.com>
References: <20180301230148.2284-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 12/12] fltk: rework packaging
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
X-List-Received-Date: Thu, 01 Mar 2018 23:07:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-oe/recipes-support/fltk/fltk.bb | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/fltk/fltk.bb b/meta-oe/recipes-support/fltk/fltk.bb
index 6a3d1c9f9..4f80735b3 100644
--- a/meta-oe/recipes-support/fltk/fltk.bb
+++ b/meta-oe/recipes-support/fltk/fltk.bb
@@ -34,4 +34,12 @@ python populate_packages_prepend () {
 
 LEAD_SONAME = "libfltk.so"
 
-FILES_${PN} += "${datadir}/mime"
+# .desktop / icons / mime only necessary for fluid app
+FILES_${PN}-bin += " \
+    ${datadir}/applications \
+    ${datadir}/icons \
+    ${datadir}/mime \
+"
+
+# cmake files
+FILES_${PN}-dev += "${datadir}/fltk"
-- 
2.14.3


