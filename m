Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Q8uAH-0002RI-GR
	for openembedded-devel@lists.openembedded.org;
	Sun, 10 Apr 2011 14:54:53 +0200
Received: by mail-bw0-f47.google.com with SMTP id 5so4007815bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Apr 2011 05:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=bxoXE7eMRZN+K3zlX/sDklnlALv4DqjT1p5znsWq31w=;
	b=NqM3hSoJOsE9tqT8Xk6KPhFKKuPoG+cx1LrUGSQNLbXYceIOUOvAeaWedw3HtIH/Wn
	I195vj9Ja/olscm7nizc+FHDbtHpNjk0Mouda9Y/I0Kit+koYzItg81zksh+r9qwBv+Y
	GWQqIWvN1w/BDrltEj2+779krZtMk/RRUIrQk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=eGvrdUFhlrfJgi+AfIMxEz8eQbHs4+ySIgeC0SRzJwf2T2KRPG4QLhZNrLtsHEJxfM
	9irq6nt3bEhq3xZ1cWTqwb5fOHjcO8arZ6a3mwNAWn4RAqvNqgTWSjnrqYHGDMIpwCyN
	3c8KAi6IcEdknG7VgI4aILzT+J8LD2edVtNBY=
Received: by 10.204.6.195 with SMTP id a3mr3809346bka.80.1302439964274;
	Sun, 10 Apr 2011 05:52:44 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id z21sm2316674bku.16.2011.04.10.05.52.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 10 Apr 2011 05:52:43 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Apr 2011 14:52:37 +0200
Message-Id: <e66079da37992abd54486488aa06a99bf7a4198c.1302439909.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1302439909.git.Martin.Jansa@gmail.com>
References: <cover.1302439909.git.Martin.Jansa@gmail.com>
Subject: [PATCHv2 1/2] libusb-compat: add native, nativesdk to BBCLASSEXTEND and define native PROVIDES
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 10 Apr 2011 12:54:53 -0000

* virtual/libusb0-native is used in usbpath-native

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../libusb/libusb-compat_0.1.3.bbappend            |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta-oe/recipes-support/libusb/libusb-compat_0.1.3.bbappend b/meta-oe/recipes-support/libusb/libusb-compat_0.1.3.bbappend
index 7de2361..5b50d6b 100644
--- a/meta-oe/recipes-support/libusb/libusb-compat_0.1.3.bbappend
+++ b/meta-oe/recipes-support/libusb/libusb-compat_0.1.3.bbappend
@@ -1,4 +1,6 @@
 PROVIDES += "virtual/libusb0"
+PROVIDES_virtclass-native += "virtual/libusb0-native"
+BBCLASSEXTEND = "native nativesdk"
 
 inherit lib_package
 
-- 
1.7.4.1



