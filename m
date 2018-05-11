Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 981057843C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 May 2018 19:21:56 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id f8-v6so5037368wmc.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 May 2018 12:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=AU05Z4YLfu4oZLNQ5eIECZUYOIV2a927GVLI56sq/qs=;
	b=Niml8dAvKx9fA6LeCS7qi4mAamo9vukAny8fSTAxb6dsqT251jgV7zIrUxkWrQnRBJ
	wi/T7wtwi+9NDpdMKH+NH+kseeof8EO/YblOTlKKPCb8YahybB+LQmSmRxNUpKzbJvse
	JgtwNjpnjx56AOipcLMxXctc/Nf9660EVa/hUyNNZIkDY+LHA4PObSVGIOnxff32HkBe
	kfRE6ELaZEXA2ij7XwJwwZJ2f3YEb/sOP52ixVpXDKeGEeb3bKEUb0OM7Tp80XEi29pe
	SuD37U1uI6zzcxy2D44bQhi4xm/07XdgctLSUGNXJPiV1WIY/Hhb1M75fg+cIQBRDuvR
	jdHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=AU05Z4YLfu4oZLNQ5eIECZUYOIV2a927GVLI56sq/qs=;
	b=JjMPobZ2X4I/Kv2N8bFsHWYGW4ec4/XepJdKq9ri9BZdOhqB/6NEjVjsz2VF96FX55
	73oTA5mRazjByhQr+gpGSXX8SK2x0CVy0Mov+9fY2X2SIDEzJJqSPOHP/XLxsBdpcAQ8
	x5VzR/AucOh5MRHg7D2S46M3BplRNf4UU3xV5/l3by/18uVHuw+tXCcyKg0Ve6TKPi1G
	n9TrTYMshZWTi0bn0hSeop5HZ/MM+rQLUmBv6xoqKWyNNSRsi7itcGRuQInCewnE5GNX
	iOL+8Pn7wQMj1SHkLlJzNAKu2dKdZY1N+lLE8pnGD1uXsLy/GzA6jno4wNfY8ca6zPSZ
	pfIw==
X-Gm-Message-State: ALKqPwensNw1ODPmepBv20BkmYMUCp8ESJ5+YhESTRe2kntfxHglGVxr
	opoSf3eWqtirZAGPVKSxq3lVXg==
X-Google-Smtp-Source: AB8JxZpXGi4aCi/hcH11Jd76IUw9Q621Ieqwi7JC3gpW/OBbFJ5/8PvAo2TTkTjUKVLFbCZw9l1ugA==
X-Received: by 2002:a1c:6952:: with SMTP id
	e79-v6mr2896587wmc.76.1526066516862; 
	Fri, 11 May 2018 12:21:56 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	k30-v6sm5935843wrf.17.2018.05.11.12.21.56
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 11 May 2018 12:21:56 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 11 May 2018 19:21:41 +0000
Message-Id: <20180511192145.7811-5-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180511192145.7811-1-Martin.Jansa@gmail.com>
References: <20180511192145.7811-1-Martin.Jansa@gmail.com>
Subject: [meta-networking][PATCH 5/9] usbredir: add new recipe
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
X-List-Received-Date: Fri, 11 May 2018 19:21:56 -0000

* can be used by qemu to redirect usb devices from virt-manager to qemu

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-support/spice/usbredir_git.bb     | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 meta-networking/recipes-support/spice/usbredir_git.bb

diff --git a/meta-networking/recipes-support/spice/usbredir_git.bb b/meta-networking/recipes-support/spice/usbredir_git.bb
new file mode 100644
index 0000000000..3fea7528e5
--- /dev/null
+++ b/meta-networking/recipes-support/spice/usbredir_git.bb
@@ -0,0 +1,21 @@
+SUMMARY = "usbredir libraries and utilities"
+
+LICENSE = "GPLv2+ & LGPLv2.1+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+    file://COPYING.LIB;md5=4b54a1fd55a448865a0b32d41598759d \
+"
+
+DEPENDS = "libusb1"
+
+SRCREV = "39aa3c69f61bba28856a3eef3fe4ab37a3968e88"
+PV = "0.7.1+git${SRCPV}"
+
+SRC_URI = " \
+    git://anongit.freedesktop.org/spice/usbredir \
+"
+
+S = "${WORKDIR}/git"
+
+inherit autotools pkgconfig
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.0


