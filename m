Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 566B56FFC8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Mar 2016 22:13:36 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id l68so205400922wml.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Mar 2016 15:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=+Nh3MrvameobJ8vnThKZX2zgxour8Ke4Y3n5Y1075Gk=;
	b=g3Brl/ylbp4tLgZ51+R0wQAVrgIbNu0bBU7vMGgPdxFbgeFZXB1jK9xTMlmjSFwMQy
	xOL0Dz16oAJ7li+go3sAfrkP8pOnZZCZxNr6f9tWvxnYyb1R5YVxhs6Brhl6I3UEUuzz
	ICacwrm6Ev8SVsUgETHcqb39KUhmDhgWZYZAIoFEd5+rGE7abn9pEzuX3CViS7H9mrpC
	mIOPruEhrC/pLkyiMXErinUtyivKLMQ04T1TWMKmyQwW/4JRJNigwPFvoMT85ks1CqG/
	FwnpY90/LkURa+XVC1f3mc9G5xsu0vuG2i5xs9bPeJ/BB4EwafHXw+OwRAm80q8k21vw
	fWGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=+Nh3MrvameobJ8vnThKZX2zgxour8Ke4Y3n5Y1075Gk=;
	b=dstpEPwNxb2Vk8hJoVW9KgJYf1lzozs7/s2A2nA48mCWE4gN+1mJRmakLj/DgcvYL1
	SQQO9fjrWEf7WBYwEaBAy1gq1TJC6kpBPY8mp+i9hLmzJ+ZyfuNazTlJ3jMpw6fDFwvS
	yJn8OIzJJ8zVC26tGQfezRAIoyR/O3JJ25g4XFATETMxRtiF9ucm5ICoWPwwHJQpTq8l
	I/kTQIxYUPU+bR4JfWlN/Ev8QnVeYrgZV4hazfb+X6SyrE1QK/DsMXczMC4MkJxSfwAN
	iwE0FaZDHdHPysnuVBf2fao5LZL7GeNOKnvG3RIi5S+JsfwYjZoS1oL+JHLqGe0NNbT5
	F36Q==
X-Gm-Message-State: AD7BkJLAe2ij/4ie9arwYZg44pfJaG0/yhbSh01c+9AUlhGt//ZFTVvqlm59EUZ+D8J7og==
X-Received: by 10.194.238.34 with SMTP id vh2mr6976653wjc.157.1458166417363;
	Wed, 16 Mar 2016 15:13:37 -0700 (PDT)
Received: from localhost.localdomain (p4FDF0F57.dip0.t-ipconnect.de.
	[79.223.15.87]) by smtp.googlemail.com with ESMTPSA id
	h7sm27297646wmf.9.2016.03.16.15.13.36
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 16 Mar 2016 15:13:36 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 16 Mar 2016 23:13:22 +0100
Message-Id: <1458166402-10786-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1458166402-10786-1-git-send-email-schnitzeltony@googlemail.com>
References: <1458166402-10786-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] gnome-bluetooth: pack introspection related files
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
X-List-Received-Date: Wed, 16 Mar 2016 22:13:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

fixes:

| WARNING: gnome-bluetooth-3.18.2-r0 do_package: QA Issue: gnome-bluetooth: Files/directories were installed but not shipped in any package:
|  /usr/lib/girepository-1.0
|  /usr/lib/girepository-1.0/GnomeBluetooth-1.0.typelib
|  /usr/share/gir-1.0
|  /usr/share/gir-1.0/GnomeBluetooth-1.0.gir

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_3.18.2.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_3.18.2.bb b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_3.18.2.bb
index d64346e..ab08254 100644
--- a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_3.18.2.bb
+++ b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_3.18.2.bb
@@ -17,6 +17,10 @@ REQUIRED_DISTRO_FEATURES = "systemd"
 SRC_URI[archive.md5sum] = "75d09c924468ec0c687f9ab3acf7f113"
 SRC_URI[archive.sha256sum] = "d8df073c331df0f97261869fb77ffcdbf4e3e4eaf460d3c3ed2b16e03d9c5398"
 
+FILES_${PN} += " \
+    ${datadir}/gir* \
+    ${libdir}/gir* \
+"
 FILES_${PN}-dbg += "${libdir}/gnome-bluetooth/plugins/.debug/"
 
 # required for python binding
-- 
2.5.0


