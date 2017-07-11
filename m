Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 7D1B877E87
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jul 2017 04:54:32 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id j186so15194831pge.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Jul 2017 21:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=and5wzbPl7on5DUeILVeVwYIV4avmuPBWe35lJV/SE8=;
	b=vRmOCOwWyOaYSfslratNWf7o7vUX0uX9nT32t8x37BYIFwFyvNPdxVYtesKhibDWR3
	s0Y4mvKNK5SKt7xdgfJYNRHhLTzmFsfN9Y7Pbxk16O7r41F0ymvRRllWQoTRshCA9E0h
	L3FVzu9kQDL9L8tEQN/tIYqK3dzRPD0TOtUxpbGo/jlu+5g3M6dpQ+7UlAP+nsVAtKbx
	2Jhl01ndEx/FRX+xO8d09R/rqdRs9a1H9D2ye8Hd9MzPA7DqpVaoBacdKdqeCQqG7bsf
	SBXgf9RIQtc2PnnoInfMq2Pq0L7iK0cgSnKssCd/U9N53vg1ilY36oQtJpj67CGdORaD
	POww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=and5wzbPl7on5DUeILVeVwYIV4avmuPBWe35lJV/SE8=;
	b=h5eW2r+SESY5hkuwMVWJtCAQpzY8bIQ1WVZh9tvxz8jTKDxx5ndd1mkiTrJe/uuD6a
	kptavpXETYUqSR1p84YBkwHX57qbiL5X3GwKtXvmOKkkWKLnRq3EmuJUZGTfnXPj1eYL
	OB7O8nLn04RX7bbVsftrnEk0EUBP9IVJoN6D3eGC2L8D7yxsovh+5Orm9vW1Gc9y81NK
	thd5Od3rxDxKv6NPPeS78sBCjeIGqId9ZXm2js9TTv8ZEdOQBR9vhTmQGskxiE+fII9+
	80dfi6VrUyLw5S3eP0bFlTtV/Qd+1eIsQNOdTvhT3NSigAxTDYfe1zQhY6sXXfQyntWF
	4MDw==
X-Gm-Message-State: AIVw112AIzOuRABy0CWEituCDB6dSvFE9IFdJASre3NJzZbaAx8qyUdq
	IIu6vugylriEtPEb
X-Received: by 10.98.109.194 with SMTP id i185mr48802200pfc.138.1499748873128; 
	Mon, 10 Jul 2017 21:54:33 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::7028])
	by smtp.gmail.com with ESMTPSA id
	l85sm24947833pfi.53.2017.07.10.21.54.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 10 Jul 2017 21:54:32 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 10 Jul 2017 21:54:21 -0700
Message-Id: <20170711045423.21332-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
Subject: [meta-oe][PATCH 1/3] libdbus-c++: Add -pthread to linker flags
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
X-List-Received-Date: Tue, 11 Jul 2017 04:54:34 -0000

It uses symbols from libpthread e.g. pthread_mutexattr_init and pthread_mutexattr_settype
but does not link with pthreads, gold is strict about it and calls out with an error

../src/.libs/libdbus-c++-1.so: error: undefined reference to 'pthread_mutexattr_init'
../src/.libs/libdbus-c++-1.so: error: undefined reference to 'pthread_mutexattr_settype'

Therefore correct the linker cmdline

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-core/dbus/libdbus-c++_0.9.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-core/dbus/libdbus-c++_0.9.0.bb b/meta-oe/recipes-core/dbus/libdbus-c++_0.9.0.bb
index 4cc133301..a6d8b86ee 100644
--- a/meta-oe/recipes-core/dbus/libdbus-c++_0.9.0.bb
+++ b/meta-oe/recipes-core/dbus/libdbus-c++_0.9.0.bb
@@ -21,6 +21,7 @@ SRC_URI[sha256sum] = "bc11ac297b3cb010be904c72789695543ee3fdf3d75cdc8225fd371385
 inherit autotools pkgconfig
 
 EXTRA_OECONF = "--disable-ecore --disable-examples --disable-tests"
+LDFLAGS += "-pthread"
 
 PACKAGE_BEFORE_PN = "${PN}-tools"
 
-- 
2.13.2


