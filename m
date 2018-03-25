Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id B666678690
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Mar 2018 12:35:39 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id a20so12948368wmd.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Mar 2018 05:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=84yPRhBnceHUZEz2xuFKz6cziWI0cn40vHEjNKNSgtU=;
	b=CA1B9zcCxdzd48s0IGxavASf3H4Rx+AKRJHpK6bOO/isA3TB2YCNhTMcNZkx36pCYh
	VCtJkeoim1gGeXBGB5ldKiuoFl0fmeZbZMTjq9hyl5fZzVVxcRvWU8+xm7W2ydVijMEg
	KUaL81MjMg/rUKrC8oN+PhbRCr773snLp0wizWzo+chtIUpMvasxgBF96sj7vX0aHaEA
	+vwwF0OYOA88yuNU7unrWzAqctnHcyOH+19l6Fa6hpV8T8Z18go6zZiZEpQppSRZo53a
	eLLVR0rMQDQklClLoQRNilimGdWPfjgn93f4eJJ6WMaind993BAAIf7ZZIn9k8HNP3WP
	fwUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=84yPRhBnceHUZEz2xuFKz6cziWI0cn40vHEjNKNSgtU=;
	b=EENusWUGfEcT3Da5PTDMr2T36U82/c0oMAhRmc0K/KYy87qBSPcQLeTPhk99BsfhFS
	9rT6pYLHCOZr18RE4ZXMa/igWnOp0adVcBgB+LE8tIIm1dCvFJibG8tqq3j+LcEwdIgK
	IyAs7kXRa/OzAftjMwUDA2e5zqzdbWUezBB67NW1yB5/aoF18xk/FEVuTx3kRkGldMQ+
	XGSODwbnu7oB4vzdiHOrBbWACIxdgotttex7BPsFNDLSC7sgtFRcrZzqckk5c5Ohfgg3
	XQWrvmSMssivuN6rcmuETPdFke5Nvi8KNeUcgH6VZiEFap+sB+hTHdt3Q6VU4AVB4JYz
	a1Xw==
X-Gm-Message-State: AElRT7HmSkWtEsJQiWE8a5+JOlXJnTlpag24SKI01hvbBfoB+9voDdPg
	DQ1U0ueGOcahEom0WQ18zWBhjQ==
X-Google-Smtp-Source: AG47ELtFHmvH5m5Gsg0vWYxQ0wBATo087ppGh1zwTPEUH12FadODO77obRbyw7ntFDd5d2aQWfLddg==
X-Received: by 10.28.16.18 with SMTP id 18mr12587443wmq.81.1521981340568;
	Sun, 25 Mar 2018 05:35:40 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p200300F07BCB3D681E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bcb:3d68:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	v23sm11174719wmh.30.2018.03.25.05.35.39
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 25 Mar 2018 05:35:39 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 25 Mar 2018 14:35:09 +0200
Message-Id: <20180325123520.16452-10-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180325123520.16452-1-schnitzeltony@gmail.com>
References: <20180325123520.16452-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 09/20] upower: update 0.99.5 -> 0.99.7
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
X-List-Received-Date: Sun, 25 Mar 2018 12:35:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../upower/{upower_0.99.5.bb => upower_0.99.7.bb}                | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)
 rename meta-oe/recipes-support/upower/{upower_0.99.5.bb => upower_0.99.7.bb} (86%)

diff --git a/meta-oe/recipes-support/upower/upower_0.99.5.bb b/meta-oe/recipes-support/upower/upower_0.99.7.bb
similarity index 86%
rename from meta-oe/recipes-support/upower/upower_0.99.5.bb
rename to meta-oe/recipes-support/upower/upower_0.99.7.bb
index 9314534d7..973fbe771 100644
--- a/meta-oe/recipes-support/upower/upower_0.99.5.bb
+++ b/meta-oe/recipes-support/upower/upower_0.99.7.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0de8fbf1d97a140d1d93b9f14dcfbf08"
 DEPENDS = "intltool-native libusb1 libgudev glib-2.0 dbus-glib polkit"
 
 SRC_URI = "http://upower.freedesktop.org/releases/${BPN}-${PV}.tar.xz"
-SRC_URI[md5sum] = "ec57b4b7bf0af568f9a7a5603c921d97"
-SRC_URI[sha256sum] = "78605664d027c788f6ab63c50950be6e86c6ba5d030c4cf35a6664337d87f3b2"
+SRC_URI[md5sum] = "236bb439d9ff1151450b3d8582399532"
+SRC_URI[sha256sum] = "24bcc2f6ab25a2533bac70b587bcb019e591293076920f5b5e04bdedc140a401"
 
 inherit autotools pkgconfig gettext gobject-introspection systemd
 
@@ -32,8 +32,3 @@ FILES_${PN} += "${datadir}/dbus-1/ \
                 ${datadir}/polkit-1/ \
                 ${base_libdir}/udev/* \
 "
-
-FILES_${PN}-dbg += "${base_libdir}/udev/.debug"
-
-
-
-- 
2.14.3


