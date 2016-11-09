Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 3A088719C8
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Nov 2016 15:55:14 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id p190so30148486wmp.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Nov 2016 07:55:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Mq+tEvnRf9EiOSDKC20KdrmXyuWYGypiR/catOBnNFQ=;
	b=a/VTzSJSq7xevPlgPnVxx9oLjxWjvsuiAElfxpDNox4DTygMd6KyLDzzdx5ur2Lw0g
	nM8tS+Y9zC/eVVuvRugF8ip+ffoeJRWKtUbB1s/UUhJ+TD1c4Px/LoyARbH9GFFUiWvD
	Rm6UqceABub1ZT/IiJFj80c/78/AaApGyXDLvJ+lsD2lukkXo73rKhNjNlLX0RMSI+k0
	LYBaderNC/wBJ2dhk9eQRcIRZz3YW7aFv+J0ybPV6k+qQ+jhsuuJgouQvBB18DYmeKQ3
	kYZ7xz9s8OXGE1uXwAv5ckKAtMpeFucinbqvt8fxHMkFqLNHOmgD+c0hhg0/tBGzZ8yA
	br3A==
X-Gm-Message-State: ABUngvf6o2K2K0xmdAlH4CyePI5xxEKHX+IrqNTsUEkaaa/4U/5bOvRPSBWjddNRZEnM/w==
X-Received: by 10.28.137.194 with SMTP id l185mr946522wmd.88.1478706915119;
	Wed, 09 Nov 2016 07:55:15 -0800 (PST)
Received: from tfsielt31850.tycofs.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id 71sm7686944wmo.7.2016.11.09.07.55.13
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 09 Nov 2016 07:55:14 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  9 Nov 2016 15:55:11 +0000
Message-Id: <20161109155512.10972-1-git@andred.net>
X-Mailer: git-send-email 2.10.2
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/2] asio: DEPENDS on openssl
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
X-List-Received-Date: Wed, 09 Nov 2016 15:55:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <adraszik@tycoint.com>

asio may or may not build examples and tests that
depend on OpenSSL, alas, it has no way to explicitly
enable or disable OpenSSL support, which is enabled
unconditionally whenever openssl/ssl.h can be found.

Due to that we get non-deterministic build behaviour,
based on whether or not some other package pulled
OpenSSL into the sysroot before asio's configure is
running.

Additionally, we can get random compilation failures
if openssl/ssl.h exists during configure time, but is
removed from sysroot later, e.g. due to a concurrent
rebuild of OpenSSL at the same time as building asio.

Having an explicit DEPENDS avoids both these problems.
We can not use PACKAGECONFIG, because as mentioned
above there is no way to explicitly disable OpenSSL
support.

Signed-off-by: André Draszik <adraszik@tycoint.com>
Reviewed-by: Sylvain Lemieux <slemieux@tycoint.com>
---
 meta-oe/recipes-support/asio/asio.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/asio/asio.inc b/meta-oe/recipes-support/asio/asio.inc
index 9cea824..54f78e4 100644
--- a/meta-oe/recipes-support/asio/asio.inc
+++ b/meta-oe/recipes-support/asio/asio.inc
@@ -6,7 +6,7 @@ HOMEPAGE = "http://think-async.com/Asio"
 SECTION = "libs"
 LICENSE = "BSL-1.0"
 
-DEPENDS = "boost"
+DEPENDS = "boost openssl"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/asio/${BP}.tar.bz2"
 
-- 
2.10.2


