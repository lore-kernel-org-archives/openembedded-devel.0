Return-Path: <paul.betafive@gmail.com>
Received: from mail-ee0-f54.google.com (mail-ee0-f54.google.com [74.125.83.54])
	by mail.openembedded.org (Postfix) with ESMTP id 4D13661AD1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Jun 2013 22:40:00 +0000 (UTC)
Received: by mail-ee0-f54.google.com with SMTP id t10so2806769eei.27
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Jun 2013 15:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=qqL0sSKUBnSpzmZ6dj79IiGGU7LmdBuFyCMgYKrzLAE=;
	b=SYZ2t9LaD6ke1SRqpTThT5mE50XOZipXMmIgRnxGPwVO6UKdLV97AEO+IxZhbxjdEv
	EWWeUifp9kDVKfcq9qktPQH/zECKLIu04K/VnySAt3vFCvjL5u3emZTiwL0RHVAjLdtL
	xPlF8jE1OFslONOH3O7A3DPYSRz+miY0FBR7a1vYFs3o+/W6mnY8uzRZzKBHf7jlndWp
	KiFbBUSfmiqR93r1NQ27oqEr3D53SYSv7DKUgTBHSTzR8aEouA4myuyo6MhY9jsg9JJn
	Uuxb8HTxriEo7oTTnhXtw0IvVdS8KVOb4WHFZpvWRqNOwDfugSyPilXL1fAfajbFwLuY
	0z5Q==
X-Received: by 10.14.99.71 with SMTP id w47mr25152290eef.140.1371595200716;
	Tue, 18 Jun 2013 15:40:00 -0700 (PDT)
Received: from vesta.betafive.co.uk (94-192-12-83.zone6.bethere.co.uk.
	[94.192.12.83])
	by mx.google.com with ESMTPSA id i2sm4434453eeu.4.2013.06.18.15.39.59
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 18 Jun 2013 15:39:59 -0700 (PDT)
Sender: Paul Barker <paul.betafive@gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Jun 2013 23:39:33 +0100
Message-Id: <1371595174-14731-2-git-send-email-paul@paulbarker.me.uk>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1371595174-14731-1-git-send-email-paul@paulbarker.me.uk>
References: <1371595174-14731-1-git-send-email-paul@paulbarker.me.uk>
Subject: [meta-oe][PATCH 1/2] lzip: add mirror for older versions
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 18 Jun 2013 22:40:00 -0000

Older versions are available in .tar.lz format from the official source but that
would cause a circular dependency on lzip-native if the host doesn't already
have lzip. Fortunately the file we need is available from FreeBSD's distfiles.

Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
---
 meta-oe/recipes-support/lzip/lzip_1.13.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-support/lzip/lzip_1.13.bb b/meta-oe/recipes-support/lzip/lzip_1.13.bb
index e04b6dc..f3f480b 100644
--- a/meta-oe/recipes-support/lzip/lzip_1.13.bb
+++ b/meta-oe/recipes-support/lzip/lzip_1.13.bb
@@ -6,6 +6,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949"
 
 SRC_URI = "http://download.savannah.gnu.org/releases/lzip/lzip-${PV}.tar.gz"
 
+# Only the latest version is available in .tar.gz format from savannah.gnu.org,
+# FreeBSD distfiles is known to have version 1.13.
+MIRRORS += "http://download.savannah.gnu.org/releases/lzip/ ftp://ftp.freebsd.org/pub/FreeBSD/ports/distfiles/"
+
 SRC_URI[md5sum] = "2f401e995c36cca05bd1805aa9c28231"
 SRC_URI[sha256sum] = "c73d36c0a926b71d484eacc192262a1d209674e3f903016f2c74a2bcbc5c28ac"
 
-- 
1.8.3.1


