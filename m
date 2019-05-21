Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
	[209.85.214.170])
	by mail.openembedded.org (Postfix) with ESMTP id 7033E7E14E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 May 2019 03:57:04 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id f12so7726800plt.8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 May 2019 20:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=4U06S7dAebfwcKJf70sh/jP5C6fgiglr4Qxv/nDVQlU=;
	b=hCs38q3Y/tMvQOoNJxFBvsBqgzOnLjxdkxEgOxnkMBNxaSGTsLwKeEPISIAoUi/SL/
	k016ugLUnm/L1LlCTSnltLFwVPt4v5K4hc+LTZ8sR8JSEWwFDy178LAfaWXSJ0pyHw/D
	q1EltyDQ7Gw0fqmB8gx2Du6hkj2+IGcNFXkfzdKAvegZUVhxGJ4JpJElvi1YYEnaI1zH
	q3WoWPH+lOn0dujueY790Tz6GElbaFWgvxDsmTZvOBLbhG4Lm66B6dKUd/tKv3hzr2dO
	+BYyjxe2GEKBfiLOyFYysMKyPieisJKpGwqpwiIzGhc0JI4DJINbUNk/N4Q/AN7r9pwm
	SfAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=4U06S7dAebfwcKJf70sh/jP5C6fgiglr4Qxv/nDVQlU=;
	b=o/UQDG6v8vlq5uk9YhRIAArw4OVavgFfzIzWlaLCbMHhu7spOKLU7VIQoVrD4YHPJN
	Q2t8Xlt9dxIVwSnHCOVPRyc9wBRe4wNMrlPYhFzPAE0lYUuzz020CYEOY8hKkYPTDiDk
	ZdKEIuqVwdrRjcFYsLM/ad9MJovz09X3EJIwznhNPXu0RCZtpVz/1EsUylhzUI6IwNY1
	04Q0zsVc6/PCpMAL08MyGmn97ZykKANUnEGuF4XjF3e1qTokKd2T9QT2n9XKzhd6tEd1
	Mg0uocwbhwBp/RXTCTppBbLjFO1FpVyOGWRyuIX7Ou6beB0pDd4ISbi7labTjeYw5wPJ
	6Vdw==
X-Gm-Message-State: APjAAAUFRLO/9DKFr8GZgzVmNhKbtq8XRvE2J3wjUD0dDBNNy86aeT7L
	EP9SBZzY2khzMauNqPPRse2DIweR
X-Google-Smtp-Source: APXvYqznxTw5STFFceRg9YKiJ9pMt20Ssf7ARYaxfRoBrIYGvRywp1MEPSEHNIheCAQa2PkPRe54YA==
X-Received: by 2002:a17:902:8d96:: with SMTP id
	v22mr4461342plo.282.1558411025669; 
	Mon, 20 May 2019 20:57:05 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:199d:e2fe:5a4f:97f4])
	by smtp.gmail.com with ESMTPSA id
	h13sm23045273pfo.98.2019.05.20.20.57.04
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 20 May 2019 20:57:05 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 May 2019 20:56:34 -0700
Message-Id: <21cbe3ec166696b4d67d2ef5486a394d14d29269.1558410874.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1558410874.git.akuster808@gmail.com>
References: <cover.1558410874.git.akuster808@gmail.com>
Subject: [warrior][patch 34/34] aufs-util: prevent native aufs-util depending on target kernel
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
X-List-Received-Date: Tue, 21 May 2019 03:57:04 -0000

From: Martin Jansa <martin.jansa@gmail.com>

* fixes:
  ERROR: aufs-util-native different signature for task do_populate_sysroot.sigdata between qemux86 and qemux86copy
  Hash for dependent task linux/linux-yocto_5.0.bb.do_populate_sysroot changed from de9e49b4f66adddf9a0943db020b4eb677404e0b6ddac60073184a3855d406cb to a912d6ea21336c85c8d8a5e9db4800fccb95197744465b641eda60339bee8901

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-filesystems/recipes-utils/aufs-util/aufs-util_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-filesystems/recipes-utils/aufs-util/aufs-util_git.bb b/meta-filesystems/recipes-utils/aufs-util/aufs-util_git.bb
index 6d71fc0..b4819d8 100644
--- a/meta-filesystems/recipes-utils/aufs-util/aufs-util_git.bb
+++ b/meta-filesystems/recipes-utils/aufs-util/aufs-util_git.bb
@@ -61,6 +61,6 @@ do_install_class-native () {
     done
 }
 
-RRECOMMENDS_${PN} += "kernel-module-aufs"
+RRECOMMENDS_${PN}_class-target += "kernel-module-aufs"
 
 BBCLASSEXTEND = "native"
-- 
2.7.4


