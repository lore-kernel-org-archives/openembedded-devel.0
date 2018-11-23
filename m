Return-Path: <brgl@bgdev.pl>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 487EB6CFEC
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Nov 2018 15:39:53 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id r63-v6so12346011wma.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Nov 2018 07:39:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=/9ICIib1XD8sXtC3Bl14o22Ood6Hdl95KCnOE71Hrro=;
	b=WSSg+vITJ92OC23Xry+K2jqNTjFYavYMhQDaDORZEbQPgaN+sSIT98xPwU7PwKtBYy
	mEF6AW9C7TERjS3fLrMHe7GIiIgfueKEjMyg4c9LGSB8xajM+iSH3Lxwy1E8kaAOyMFX
	CO/wplVswPSIgSQMzmDbF8yCtAwKcI7C+A7eYkagEDC/LHNWtZaOCaPrI65URFR3Vfay
	bR5oLPligwZLLzFJJNKl9nIEJCXVY0YB0LAjsPmgvCsRc0wn3nqSd9S+00Fw7VtufqJW
	Vjb8C9THlCT7bvL3CaeN6PQbGWnUPq0cd5Hl+i7LlVEVhjkEek6ygRwCqa5+z67eoHnC
	yudA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=/9ICIib1XD8sXtC3Bl14o22Ood6Hdl95KCnOE71Hrro=;
	b=B0knmqltSTTZqtKAQPYqJIj48T0M651VA5I4U4uTW4QSOY9+QNkz/9vjoqhJmiOaZQ
	i5/ll+KRJe6I52dBU7k8d39VUihRWIUc4T4jdxrWolb4wo8ng5ARz+8errVdO+665cA/
	fPd6I+66fbZAFJSHhSgRIaVabOSrONbcWUneUSZVCwfC542jX9pSSZkhr1CL3OpYa+es
	TweCaqmgOls4zO8qDAezquHw5R2liaMXiFHZhmOFsuH00pn0F7rQnJIy+nzodHFactQb
	nAJ4zv7HmRLakxAIdV2yLPY21XAZ8NxdT+ZGqWg5bCn+IoCXNi6Yzt4n3/p8Mi6kT9zk
	o1fQ==
X-Gm-Message-State: AA+aEWbtWOBZjdImW7dbqG0MypacaW5lkyjpzTUl7wpE4c56MTwvJQV+
	hMKlmBWIyKHIwggbilElWMXUFvyfh30=
X-Google-Smtp-Source: AFSGD/VCU1XybOghhOINVNiPP1b2mVKrDSk1z4m0NFJQdgZFyvGowG3wPg9MqndGJE+2g7gQYYWxng==
X-Received: by 2002:a1c:d988:: with SMTP id q130mr2530804wmg.41.1542987593961; 
	Fri, 23 Nov 2018 07:39:53 -0800 (PST)
Received: from debian-brgl.home (lfbn-mar-1-609-89.w90-118.abo.wanadoo.fr.
	[90.118.185.89]) by smtp.gmail.com with ESMTPSA id
	u10sm9983953wrr.33.2018.11.23.07.39.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 23 Nov 2018 07:39:53 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: openembedded-devel@lists.openembedded.org,
	Khem Raj <raj.khem@gmail.com>
Date: Fri, 23 Nov 2018 16:39:41 +0100
Message-Id: <20181123153941.10186-7-brgl@bgdev.pl>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181123153941.10186-1-brgl@bgdev.pl>
References: <20181123153941.10186-1-brgl@bgdev.pl>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 6/6] sigrok-cli: new package
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
X-List-Received-Date: Fri, 23 Nov 2018 15:39:53 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 .../sigrok/sigrok-cli_0.7.0.bb                 | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta-oe/recipes-extended/sigrok/sigrok-cli_0.7.0.bb

diff --git a/meta-oe/recipes-extended/sigrok/sigrok-cli_0.7.0.bb b/meta-oe/recipes-extended/sigrok/sigrok-cli_0.7.0.bb
new file mode 100644
index 000000000..d31bcd282
--- /dev/null
+++ b/meta-oe/recipes-extended/sigrok/sigrok-cli_0.7.0.bb
@@ -0,0 +1,18 @@
+DESCRIPTION = "sigrok-cli is a command-line frontend for sigrok."
+HOMEPAGE = "http://sigrok.org/wiki/Main_Page"
+
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+
+DEPENDS = "libsigrok"
+
+PACKAGECONFIG[decode] = "--with-libsigrokdecode,--without-libsigrokdecode,libsigrokdecode"
+
+PACKAGECONFIG ??= "decode"
+
+inherit autotools pkgconfig
+
+SRC_URI = "http://sigrok.org/download/source/sigrok-cli/sigrok-cli-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "77cb745e2fa239c7bd1ea81e2d67ede9"
+SRC_URI[sha256sum] = "5669d968c2de3dfc6adfda76e83789b6ba76368407c832438cef5e7099a65e1c"
-- 
2.19.1


