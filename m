Return-Path: <raj.khem@gmail.com>
Received: from mail-it0-f66.google.com (mail-it0-f66.google.com
	[209.85.214.66])
	by mail.openembedded.org (Postfix) with ESMTP id 5399F71E12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Apr 2017 05:21:21 +0000 (UTC)
Received: by mail-it0-f66.google.com with SMTP id z67so13855861itb.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Apr 2017 22:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=IIoivft4i2weChF+0P7O7BmpAUnkk3yM5xjMN+ySdAE=;
	b=o/H3yuEEmjcIVBOvdzjWEk3EosHwJvg2iL3HKpmqn9ZQUzKZ437mYSU0B0bv8nTBhH
	E6JVv2wKtPQD5momVWrR/7pNxUi6TsGi61PsrqThNVEwOUNXLiu8AwgFEX6O01ffPXVR
	tU5tR4bZthQK6U+3x6nxjsZ61yARC6b9uuha2mKAX3UZHpxXKAtmiwIgUM7bCG9ARmXw
	4yreB0WGfJlcerpnPV1hlm0gP2usLARz6gDI6Y7w7wgSOXPDsEu+UG8U/qtcFCxDOjIR
	scSeumEMF1sahg4+ugZkDItwL54HpCM1/lu5XJWCiuCRlGsIrDUqm85vOg/yC16CUb7Q
	h+wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=IIoivft4i2weChF+0P7O7BmpAUnkk3yM5xjMN+ySdAE=;
	b=hG2T9RpZMYEf0vJUXBirneDY4G0voFluCSD1PTBdqRnBQAR8RPlAsYebKbHhOYfMeo
	SYEyNUuOUg8TxDyfhipQn1+KvSBNfSIKuAK9ZB9tzxVtfb0rIFQ53HURhnZCvUZehmKt
	BS6hvbL0KI3d8+LlMVL3abRKdzcDhxo8dICC1WUlq/wNCUq/mHei+u8eZ6g6QOonyDV0
	MLUgsbEextfPN10vftlmSrJ/GDBBVmMTZ/BvOhUz26ftZWL6Jmz9EUQwqtL2ZWAawCCp
	LtYUky8RFho3yivZHpqwiv5S0nDuopxVCxkZJlX0R0mFKU5OjKkVWradhUQNKS8h1TXU
	wcbQ==
X-Gm-Message-State: AN3rC/7fG6hfLd7AY8cgoM9Tl6QhRT8XKjr87oBy2C9LxuDs46vFugX9
	1hehtpuZvTZdnw==
X-Received: by 10.99.100.194 with SMTP id y185mr23201666pgb.140.1493011283396; 
	Sun, 23 Apr 2017 22:21:23 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	v13sm24001176pgo.44.2017.04.23.22.21.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 23 Apr 2017 22:21:22 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 23 Apr 2017 22:20:48 -0700
Message-Id: <20170424052058.4952-7-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20170424052058.4952-1-raj.khem@gmail.com>
References: <20170424052058.4952-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 07/17] libsigc++: Disable PIE in SECURITY_FLAGS
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
X-List-Received-Date: Mon, 24 Apr 2017 05:21:22 -0000

doesnt compile yet

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-core/libsigc++-2.0/libsigc++-2.0_2.10.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-core/libsigc++-2.0/libsigc++-2.0_2.10.0.bb b/meta-oe/recipes-core/libsigc++-2.0/libsigc++-2.0_2.10.0.bb
index 00d465c15..53bd5de10 100644
--- a/meta-oe/recipes-core/libsigc++-2.0/libsigc++-2.0_2.10.0.bb
+++ b/meta-oe/recipes-core/libsigc++-2.0/libsigc++-2.0_2.10.0.bb
@@ -19,3 +19,4 @@ FILES_${PN}-dev += "${libdir}/sigc++-*/"
 FILES_${PN}-doc += "${datadir}/devhelp"
 
 BBCLASSEXTEND = "native"
+SECURITY_CFLAGS = "${SECURITY_NO_PIE_CFLAGS}"
-- 
2.12.2


