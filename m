Return-Path: <brgl@bgdev.pl>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 92FFE7F734
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Sep 2019 14:46:04 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id r3so7053989wrj.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Sep 2019 07:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=qGXrxbiyanrJBCkcAUc/Cnr2Nm5n+rn7hL0FsVsLups=;
	b=uIIvBjIt+1eEcXtEit3ezSZNhVEM3iZYms7uaRPGiGn8FIPVqLMyx5wMNCvL3qnm68
	jcdCyoFT6jVJLIptwOsWybZ/QmPfLiQh11afXfCRm5LZaXq1kXTEXayp8QM6+d4p1bbW
	3gFlLNJo1yQhv/wgckiQJFoUpOiXdHjWMKaaFz0+4AuzaBsVh0FnGOj+fbLpn9+wDZjD
	CVP6DpgBu6spjwr5+yOiiAyipwZzC2anxN0MSMKh4tnDrIUMJqJ12mSgptSkW1kHSX3A
	H6s/AdTpuBLznaBYMvCCgkN62AXwgADqIXfqyxjU9fISxUJWWedONWZRbmiIVKgTnJtI
	UYWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=qGXrxbiyanrJBCkcAUc/Cnr2Nm5n+rn7hL0FsVsLups=;
	b=V0YEJuf5wA3Kp5opEtDGanyKXdN026QrJ/V4R8EY3SS51QKI+ohHi7oLBcQfSshb/8
	zAkDGC61yy+FUWYjhsX5ZCcOwJX7wICEYS3PayYcIM2AHZTw+t6llFWJBkzQG//gKFQz
	pg3vdNUoq/lQiLrGb6+BsK0C34jHghsqzKGtoMOlch5rnUnkye3z731X3rzx+yneaN8/
	+yeYY7/jrhg6Xao+jX2i9q1sO1th9QhZUN2wfsYsw+zH+tB9JjBaz9SxoMKK6gTTgIgx
	++asPQIn/VyAaGeiqMxc0BFgAvmoWWXhX0cRlu8ilcIzI/nuw3SL9m1N4mFKWNNKjKC6
	Y+Cw==
X-Gm-Message-State: APjAAAXwFcb2te/WqGcmXQK7g69cZhYXEvW3QPAjcyLz2GbcQgLIqtXP
	qUBCZhYIlGOifiGwYmNkJ1JfwA==
X-Google-Smtp-Source: APXvYqz/MyZEFOs+SSexs2ggphvhdlQ+Qhx3VBGrombvl3uoA5GLGN+VAQivdusYUHbnYTjPbt/D6Q==
X-Received: by 2002:adf:f150:: with SMTP id y16mr11612320wro.71.1568990765149; 
	Fri, 20 Sep 2019 07:46:05 -0700 (PDT)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
	by smtp.gmail.com with ESMTPSA id
	n12sm1784382wmk.41.2019.09.20.07.46.03
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 20 Sep 2019 07:46:04 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>, Tim Orling <TicoTimo@gmail.com>,
	Derek Straka <derek@asterius.io>
Date: Fri, 20 Sep 2019 16:45:58 +0200
Message-Id: <20190920144558.16380-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>,
	openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH] python-jsonschema: add python-setuptools-scm to RDEPENDS
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
X-List-Received-Date: Fri, 20 Sep 2019 14:46:04 -0000
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

The python-jsonschema package imports pkg_resources. Add setuptools-scm
to RDEPENDS to satisfy this dependency.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 meta-python/recipes-devtools/python/python-jsonschema.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python-jsonschema.inc b/meta-python/recipes-devtools/python/python-jsonschema.inc
index 069a57f26..c772e9eb5 100644
--- a/meta-python/recipes-devtools/python/python-jsonschema.inc
+++ b/meta-python/recipes-devtools/python/python-jsonschema.inc
@@ -21,6 +21,7 @@ RDEPENDS_${PN} += " \
     ${PYTHON_PN}-shell \
     ${PYTHON_PN}-strict-rfc3339 \
     ${PYTHON_PN}-unittest \
+    ${PYTHON_PN}-setuptools-scm \
 "
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.23.0


