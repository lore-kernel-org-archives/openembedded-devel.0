Return-Path: <kergoth@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 279DD73285
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 May 2016 16:10:34 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id 145so2351468pfz.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 May 2016 09:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=TvGpMyGD+6G3pbkPnXL5K/GDsB5OEAX/NS905VZmKig=;
	b=cvaIM/f3v8tyaDTt3Fe6ly15Sb6S6SQT6T22Dzj8wD5tWxECvlt9zSqrDgjmXHntVs
	sy73PWG8qNbaV8E2HkCuyCmQbpKZnb6jHJPabh9C1KXRvC/b1BeHRMNtoqBPsLGGghd/
	1fZi76908Smvq6kHzlMMmM+nS8DgeS0RtK/WemAmm27e4Icd2nEEyubIdmcFCGfQX8n2
	J8CUmekvh5OX1AHr5bptYoJDo+fua0K6gdVgW9/DrKsOq7bjyEvGT+D3ylwTE5N5Fe8f
	KvzJ37sSOSzxQYxY1jyxf0qYbuASsMHJEkZJ68DYMESo505vvW7xqb6f54AyZ8cR6G+q
	3eTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=TvGpMyGD+6G3pbkPnXL5K/GDsB5OEAX/NS905VZmKig=;
	b=HbscjJrGQjVdXnK30ghpyGD+A/fs0Da7aZ7NfLY4cRiVmfJ1sJdmmsRvmhe7hlnpax
	2zw674vmNkrXD5CkkoaRoz8jrYFYZl7JvoAdTdGttGlgG1eDehFsjdXO6thwc2WK4QAZ
	TkIeqXo+ygMp0ApFAQ/YHgeDKvmonQ7kWKWRcWm/MtIUuT8bxDVpu0OLFaB6ogScl3/W
	LTHSvQBm6KpUKrUqtIQWiHWio4dvCeMl8Ov/V8m8jJjoGSPzOoYIVL9v8xwef480morj
	qlrrfLo9P4KqG8kH0fjXGCIEAFUd4rb8+hqTFvd0KLanMjzz/O7ohq3zBr0/tmY/HgQG
	nX5A==
X-Gm-Message-State: AOPr4FVQvN46LfhRPg84TmP1+Mpe3TDBG2jXH0BSNB++aB7xMZnXUxUkCkhvjUAlY2OBlA==
X-Received: by 10.98.30.132 with SMTP id e126mr3290505pfe.109.1463501435751;
	Tue, 17 May 2016 09:10:35 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	rw2sm5868665pab.30.2016.05.17.09.10.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 17 May 2016 09:10:34 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 17 May 2016 09:10:20 -0700
Message-Id: <3c3c8becbfcb3ff4440a8453b595d1c4ce132f32.1463501350.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <3ab55100823a114a701c63eaa703d0352bca5513.1463501350.git.chris_larson@mentor.com>
References: <3ab55100823a114a701c63eaa703d0352bca5513.1463501350.git.chris_larson@mentor.com>
In-Reply-To: <cover.1463501350.git.chris_larson@mentor.com>
References: <cover.1463501350.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [meta-oe][PATCH 6/6] x11vnc: remove old libtool macros from acinclude.m4
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
X-List-Received-Date: Tue, 17 May 2016 16:10:35 -0000

From: Christopher Larson <chris_larson@mentor.com>

These can cause build problems. We only want macros in acinclude.m4 which
aren't available for aclocal to get elsewhere.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta-oe/recipes-graphics/x11vnc/x11vnc_0.9.13.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-oe/recipes-graphics/x11vnc/x11vnc_0.9.13.bb b/meta-oe/recipes-graphics/x11vnc/x11vnc_0.9.13.bb
index 7e92965..64c8a5d 100644
--- a/meta-oe/recipes-graphics/x11vnc/x11vnc_0.9.13.bb
+++ b/meta-oe/recipes-graphics/x11vnc/x11vnc_0.9.13.bb
@@ -24,3 +24,9 @@ PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'zeroconf', 'avahi',
 PACKAGECONFIG[avahi] = "--with-avahi,--without-avahi,avahi"
 PACKAGECONFIG[xinerama] = "--with-xinerama,--without-xinerama,libxinerama"
 PACKAGECONFIG[libvncserver] = "--with-system-libvncserver,--without-system-libvncserver,libvncserver"
+
+do_prepare_sources () {
+    # Remove old libtool macros from acinclude.m4
+    sed -i -e '/^# libtool.m4/q' acinclude.m4
+}
+do_patch[postfuncs] += "do_prepare_sources"
-- 
2.8.0


