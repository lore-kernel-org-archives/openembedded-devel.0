Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f171.google.com (mail-ea0-f171.google.com
	[209.85.215.171])
	by mail.openembedded.org (Postfix) with ESMTP id 154CA6B7E2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 07:19:52 +0000 (UTC)
Received: by mail-ea0-f171.google.com with SMTP id n15so181567ead.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 00:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=1iMAhjRTQCTBfNaIeGQCSyLd2vK4fqFJ7D/zUXlC2Pg=;
	b=xUg/NxlvF+eWYVZf5mB/zdfmWAWXpeRZArw2Q98t2+cHdjmlMJM4pdxQFVi7Snev+l
	Uc54WbhkCTgEI1DqysNDLdDuaWXQAwj6A5biAE4ouSiwcsGdJG9+N7jVDA5jiBEg8pWf
	8UgQJVpfAPWaD7FiojsckB93PAgArNQcRSjfchTSUFhSDWussDJMVdwWoVjxJ7wUA7RM
	i05SWifB87vueslyaGd8SfTJKdUNFhvJeAHHWmKHjCVKlEtdsAsKhz2Bljxp6VCoV2tj
	VZr/duzJbLO/+KxPLnp6YhkyJYlp53deV3pl4SNHhw8uSwdRXcfrygWUcPDJN2AIMzOg
	rNCA==
X-Received: by 10.14.246.11 with SMTP id p11mr20952957eer.9.1376551193530;
	Thu, 15 Aug 2013 00:19:53 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	h52sm4980039eez.3.2013.08.15.00.19.52
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 15 Aug 2013 00:19:53 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Aug 2013 09:19:25 +0200
Message-Id: <e14859526a1a7e12e2d9434bc0b8cf2bab0074b8.1376551135.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1376551134.git.Martin.Jansa@gmail.com>
References: <cover.1376551134.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1376551134.git.Martin.Jansa@gmail.com>
References: <cover.1376551134.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][dylan][PATCH 45/60] sox: add PACKAGECONFIG for magic and wavpack
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 15 Aug 2013 07:19:53 -0000

* it's autodetected from sysroot
* add PACKAGECONFIG to make it deterministic

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-multimedia/recipes-multimedia/sox/sox_14.4.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-multimedia/recipes-multimedia/sox/sox_14.4.0.bb b/meta-multimedia/recipes-multimedia/sox/sox_14.4.0.bb
index 715860b..25b3d5f 100644
--- a/meta-multimedia/recipes-multimedia/sox/sox_14.4.0.bb
+++ b/meta-multimedia/recipes-multimedia/sox/sox_14.4.0.bb
@@ -10,9 +10,12 @@ PR = "r1"
 
 PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudio', '', d)} \
                    ${@base_contains('DISTRO_FEATURES', 'alsa', 'alsa', '', d)} \
+                   magic \
 "
 PACKAGECONFIG[pulseaudio] = "--with-pulseaudio=dyn,--with-pulseaudio=no,pulseaudio,"
 PACKAGECONFIG[alsa] = "--with-alsa=dyn,--with-alsa=no,alsa-lib,"
+PACKAGECONFIG[wavpack] = "--with-wavpack=dyn,--with-wavpack=no,wavpack,"
+PACKAGECONFIG[magic] = "--with-magic,--without-magic,file,"
 
 LICENSE = "GPLv2 & LGPLv2.1"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL;md5=751419260aa954499f7abaabaa882bbe \
-- 
1.8.3.2


