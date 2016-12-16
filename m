Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id BDEA377357
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Dec 2016 03:59:57 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id p66so8240186pga.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Dec 2016 19:59:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=u1ACy/XiyoZJWRxnJnW3d+roRW76QlfGg6CLzGP8asI=;
	b=qg+P26TYO2fDQczmBlDoJXQDt4NQTJOMPtEhQUimLU7u24SB5o5JTqn9Bzk7r8+HP6
	jIo6idoB0818wl5df7liyG+e6RktS7Wphml/gNOLLAMz1m1m/u6Snb/kqLiGV7CWYDLb
	8BKXUEKFG/6Kk2h1gGiMnhMbrW8pv26lBvuUFRtczOsRSEInWdBc2HKAyPu4t9hEsWiO
	paa9cSoEEMdf6I68d0i/QlEj1VzYW62o88dnIgW6BHcZZJywWx8aIdUtt/Qx19UNM0ol
	5Wvo75ZC4alUXnfswoDnV6BaJcWm6Ruh3Xt7vM/txjO6BxioRo0dqbZrYGFxZ2Xs0lGW
	EM6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=u1ACy/XiyoZJWRxnJnW3d+roRW76QlfGg6CLzGP8asI=;
	b=J0Dur4D0CydvbFHRruWDSLRdW/F1mvAPzMthjssSeAdm0mlTaZWhCNptWizfQVhHsj
	6/1azSjksZpKhTVpmK/r3ghlBRbFcuvdz6KkMpurOH93d2inZYlBODgCosjyPRj5Ls5I
	K2VFBwbyPOnNTEYgF514lYzBiCQ6XIgUSsw6M/EpXx/3owaNl17qyIU2N6Mtbyg2iOie
	vlVS7v3hGMObJjYWoJaxAatOnGe27mDl8qOrH06QFzvcpmmZ294LtbP5M7WrL1Hx8Fzi
	q2Q8I+8ONOGWWRRGODR+y3GYg4L6vj0LFLfaPKk4AdQOhejSJst96/L3qEVEp3XeAzbJ
	VrHA==
X-Gm-Message-State: AKaTC00NtQZpOke8gF876Y2se8jkXYSvvoyYaZYM3SV3I/Oopp8bcq0v492WQCOzqgeePA==
X-Received: by 10.98.211.67 with SMTP id q64mr984844pfg.173.1481860798847;
	Thu, 15 Dec 2016 19:59:58 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192])
	by smtp.gmail.com with ESMTPSA id z9sm7629146pfd.29.2016.12.15.19.59.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 15 Dec 2016 19:59:58 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Dec 2016 19:59:47 -0800
Message-Id: <20161216035947.18909-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20161216035947.18909-1-raj.khem@gmail.com>
References: <20161216035947.18909-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 3/3] popplet: Disable PIE, it does not compile
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
X-List-Received-Date: Fri, 16 Dec 2016 03:59:58 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/poppler/poppler_0.49.0.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-oe/recipes-support/poppler/poppler_0.49.0.bb b/meta-oe/recipes-support/poppler/poppler_0.49.0.bb
index ebb16d6..e8f8e65 100644
--- a/meta-oe/recipes-support/poppler/poppler_0.49.0.bb
+++ b/meta-oe/recipes-support/poppler/poppler_0.49.0.bb
@@ -27,6 +27,12 @@ PACKAGECONFIG[nss] = "--enable-libnss,--disable-libnss,nss"
 # Needed for qt5
 CXXFLAGS += "--std=c++11"
 
+#| /usr/src/debug/glibc/2.25-r0/git/csu/elf-init.c:87: undefined reference to `__init_array_end'
+#| /usr/src/debug/glibc/2.25-r0/git/csu/elf-init.c:87: undefined reference to `__init_array_start'
+#| /mnt/a/build/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/6.2.0/ld: .libs/libpoppler.so.65.0.0: hidden symbol `__init_array_end' isn't defined 
+
+SECURITY_CFLAGS = "${SECURITY_NO_PIE_CFLAGS}"
+
 EXTRA_OECONF = "\
     --enable-xpdf-headers \
     --disable-gtk-test \
-- 
2.10.2


