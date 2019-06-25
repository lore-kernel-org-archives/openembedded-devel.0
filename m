Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
	[209.85.208.45])
	by mail.openembedded.org (Postfix) with ESMTP id A90977DD6E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Jun 2019 07:52:40 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id k8so25732354eds.7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Jun 2019 00:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=mXklCBVbSfkUJFWcdxRp0K82RqQtHFaemzNR9ipgg80=;
	b=orbo5KVoeqmsXt61h1OmEnr8IasbpU7jQCMti5k1/Xp9ic9EjG8dnUQLSxYtR2v7oB
	P2YmmCcJl5CYeGv0HamjeWTE20R+NU4+CVYQhblfMYG71tJucThp1n+jjGNQQrfHe4+s
	Vrdl4888+q0TNReISR4SE73GEFZGnfxMk22Y21kvDis9tH1/oPIGyw15nLhJAraYP6Bt
	GYtBBK201RV9Op4T2dcNCOHtauQFrQI04jJ3sZ+4mk9EeEyp4NPt2m4Y0I+XIsU5YZuA
	OU84OUDCrvYqCzF5MIbuXT63KpU1a7VZujfOm7qAX3/S1jUN8S4IbAaw/C71v9qLNGA/
	TnFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=mXklCBVbSfkUJFWcdxRp0K82RqQtHFaemzNR9ipgg80=;
	b=YvxvH78I0tleFBwNb1WDMg3RI4DqysGNsHT64/NX5uApwM9/44D+EN/ASq2yefBade
	rIscBu/vrLnGUd9m3sZPZqzVFZnQm3dDgIDcaO1U0/k8fPNxw/tZzK/8ISnurhLyjiuj
	3Ci/VZZr7dhg5QvekPKuetswRpOhNDhaA3+ZRvf4aHnucIdigavBoiFS3C9c9i8fAz4p
	gAgzlJGMnfiwPdT/J0EGigFtuj2st7GQm4ubwmKFlGJ1adJk1IUDJq1F2tSpHBXB4scq
	TouW2k0Fvm8lEZ6AriaPLXIwrM+Ky01Lp6cnG+d1GTLI7B+yWUXkgv4jrxzyCN0dLowA
	9RiA==
X-Gm-Message-State: APjAAAW6A6uaBnsa5fzN9m6u93zauI2CpQTAog8wr/DkVSKSjMQUGdxL
	VmzsVlV311uNAHt1/WbJXjf/BH9uGls=
X-Google-Smtp-Source: APXvYqzVMixxpANVZXnXohN6ZtlQutkfKI9d3UHBTF7Z9yzy6bJdBoPmRRG3omZtUlrACF1XEXB81w==
X-Received: by 2002:a50:996e:: with SMTP id
	l43mr146504765edb.187.1561449161185; 
	Tue, 25 Jun 2019 00:52:41 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id
	y22sm4308640edw.94.2019.06.25.00.52.39
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 25 Jun 2019 00:52:40 -0700 (PDT)
Sender: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
From: Ricardo Ribalda Delgado <ricardo@ribalda.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 25 Jun 2019 09:52:10 +0200
Message-Id: <20190625075223.13585-11-ricardo@ribalda.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190625075223.13585-1-ricardo@ribalda.com>
References: <20190625075223.13585-1-ricardo@ribalda.com>
MIME-Version: 1.0
Cc: Ricardo Ribalda Delgado <ricardo@ribalda.com>
Subject: [meta-java][PATCH 10/23] jamvm: Fix binary location for ecj-initial
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
X-List-Received-Date: Tue, 25 Jun 2019 07:52:41 -0000
Content-Transfer-Encoding: 8bit

| /bin/bash: /workdir/build/tmp/work/dbfp4-poky-linux/jamvm/2.0.0-devel+gitAUTOINC+6cef41d859-r0/recipe-sysroot-native/usr/bin/ecj-initial: No such file or directory
| Makefile:663: recipe for target 'classes.zip' failed

Signed-off-by: Ricardo Ribalda Delgado <ricardo@ribalda.com>
---
 recipes-core/jamvm/jamvm.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-core/jamvm/jamvm.inc b/recipes-core/jamvm/jamvm.inc
index fc21380..85b7aaa 100644
--- a/recipes-core/jamvm/jamvm.inc
+++ b/recipes-core/jamvm/jamvm.inc
@@ -35,7 +35,7 @@ EXTRA_OECONF = "--with-classpath-install-dir=${prefix} --libdir=${libdir}/jamvm
 CFLAGS_append_class-native = " -DDEFAULT_MAX_HEAP=1024*MB"
 
 # Enforce usage of ecj-initial.
-EXTRA_OEMAKE = "JAVAC=${STAGING_BINDIR_NATIVE}/ecj-initial \
+EXTRA_OEMAKE = "JAVAC=${STAGING_BINDIR_NATIVE}/ecj-bootstrap \
                 GLIBJ_ZIP=${STAGING_DATADIR_NATIVE}/classpath/glibj.zip \
                "
 
-- 
2.20.1


