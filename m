Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 09F5077A11
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Mar 2017 06:32:38 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id 79so14930185pgf.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Mar 2017 23:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=dWqr6c5uWqWUzXs7Z04w0YTP/pY5j8M/Z1RHUk888P4=;
	b=rqTVcoVYNp1P3e/lMVO0mmOkCAmS0heLQBXO5I+1joS0qO/loTPR5/3oNMiNYrmcZg
	3iAZXxfCnNrGltzix32ghD8XqgI8k29zfxL5RHxDLO1nEguPXc92gqjxuih0Ph1kb+v6
	39s1xRuV496n9V/mCvhnBNjUt0soEurXfD3N+7b3FcwGyRju8wSHKNfCl/17lMQVRLUO
	PRQu8gJCmo3h5/NEQDyuwpulNCzBP3y4/QxvMOJgzkQ8d/2HOIJWbLT9ppcHchRlThfO
	QcaYkpvbzpE7FDJ+yxDTsTyg4MAHlWowAtUmzdvYHmQc1LZO98QONIwy2fn/yqFUScI1
	UxOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=dWqr6c5uWqWUzXs7Z04w0YTP/pY5j8M/Z1RHUk888P4=;
	b=lzJFRR+umg5w+7L5Bw/4LXPfVuS43MgQiZHH8uNl7BxQKRmcItr2zo1H9TxdyDaDGH
	uLVUYRX9hy+XS7zkInU9LBuGTm2gSw60j0UhBxGiTO0LXQz4bWJC+VK6zUw5FPisUGpp
	a0yHFhZmhLm+hb0RNOu8CrIjF/ItdRkqAQq4/QLK3j1yUSh/3PTWlOkFdHFWIWZ29kOM
	ZIGatKuEL0Kd+oxHEP0f0iSj0LCnoO4djPUyGWTE6S0OAuML54M6dBNLQiBXMKM8XxqV
	AI3yP/QEvSHHpBgwAjawZ3lb+RUH2A2eeXqeFvXj77c1GynJhh4pvDLaM0eRmvARre9l
	H9tw==
X-Gm-Message-State: AFeK/H2uwZwycTR8mEuLeVvE5RfE2TiBPV36MUTgRWAZUMyJA/oKgAxY5ogKieeSu1JfJQ==
X-Received: by 10.99.163.72 with SMTP id v8mr24828678pgn.115.1490077960146;
	Mon, 20 Mar 2017 23:32:40 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	23sm36902528pfz.127.2017.03.20.23.32.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Mar 2017 23:32:38 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Mar 2017 23:32:22 -0700
Message-Id: <20170321063227.11565-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <20170321063227.11565-1-raj.khem@gmail.com>
References: <20170321063227.11565-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 3/8] usrsctp: Enabled shared lib
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
X-List-Received-Date: Tue, 21 Mar 2017 06:32:39 -0000

webrtc gstreamer plugin fails to build otherwise since
libusrsctp.a is missing link on libss and so on

convert inet support into packageconfigs while here

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-protocols/usrsctp/usrsctp_git.bb | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/meta-networking/recipes-protocols/usrsctp/usrsctp_git.bb b/meta-networking/recipes-protocols/usrsctp/usrsctp_git.bb
index 99a261ec7..3ec746684 100644
--- a/meta-networking/recipes-protocols/usrsctp/usrsctp_git.bb
+++ b/meta-networking/recipes-protocols/usrsctp/usrsctp_git.bb
@@ -16,11 +16,9 @@ DEPENDS += "openssl"
 CFLAGS  += "-DSCTP_USE_OPENSSL_SHA1 -fPIC"
 LDFLAGS += "-lssl -lcrypto"
 
-PACKAGECONFIG ?= "disablewarnings"
+PACKAGECONFIG ?= "disablewarnings inet inet6"
 PACKAGECONFIG[disablewarnings] = "--disable-warnings-as-errors,,"
+PACKAGECONFIG[inet] = "--enable-inet,--disable-inet,"
+PACKAGECONFIG[inet6] = "--enable-inet6,--disable-inet6,"
 
-EXTRA_OECONF += "--disable-inet \
-                 --disable-inet6 \
-                 --disable-shared \
-                 --disable-debug \
-               "
+EXTRA_OECONF += "--disable-debug"
-- 
2.12.0


