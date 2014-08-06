Return-Path: <joe.macdonald@gmail.com>
Received: from mail-ig0-f170.google.com (mail-ig0-f170.google.com
	[209.85.213.170])
	by mail.openembedded.org (Postfix) with ESMTP id 8595C65CF7
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Aug 2014 19:40:17 +0000 (UTC)
Received: by mail-ig0-f170.google.com with SMTP id h3so10918047igd.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Aug 2014 12:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id;
	bh=TegzPZHNAAbe8HLUMU7DGS2g9Cm2AbLFWJsLhjdi16g=;
	b=RGHun6SOMDkpEqSRwsPyHkPSrqbT+HtHEY3HGvcvakVR39K1IopJ5sI6hyO1ww1Msp
	cBPc+txw4/0/Ww/LVA2UaF5JNdVAygklxZhCdGd3uFHBIzzWGJKkYaKndsHkUJkbVMpn
	RzY3tmmft3/dn3UCa/LRCHbfhPhClb6bbC6g6kNL2Nf54PKCZj53xFyEhfR+ej7TdjP3
	rG5pH2ZQIKNKHWhnCuSwoU8ttmnlnLnwF73ECQA/CmLNPkSQmOB0/ILeO61FOe400pGe
	x6AgC72akxCQBsAe6WOFMBFKm8a36NVdXPuqZBm/rVJP4mgfQfQXrqL9Vv9K9l9pJGnE
	htuw==
X-Received: by 10.43.152.211 with SMTP id kx19mr18219818icc.8.1407354018406;
	Wed, 06 Aug 2014 12:40:18 -0700 (PDT)
Received: from skynet.deserted.net (24-246-4-250.cable.teksavvy.com.
	[24.246.4.250])
	by mx.google.com with ESMTPSA id ri8sm11153548igc.0.2014.08.06.12.40.16
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Aug 2014 12:40:17 -0700 (PDT)
Sender: Joe MacDonald <joe.macdonald@gmail.com>
From: Joe MacDonald <joe_macdonald@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  6 Aug 2014 15:40:15 -0400
Message-Id: <1407354015-12183-1-git-send-email-joe_macdonald@mentor.com>
X-Mailer: git-send-email 2.0.0.257.g75cc6c6
Subject: [meta-networking][PATCH] wireshark: update configuration and epoch
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
X-List-Received-Date: Wed, 06 Aug 2014 19:40:27 -0000

Commit 6d781369 warranted a PE bump but didn't include it.  Update it,
correct a typo in EXTRA_OECONF and explicitly disable c-ares resolver at
the same time.

Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
---
 meta-networking/recipes-support/wireshark/wireshark_1.12.0.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_1.12.0.bb b/meta-networking/recipes-support/wireshark/wireshark_1.12.0.bb
index 449ac47..13b1f3f 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_1.12.0.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_1.12.0.bb
@@ -23,13 +23,15 @@ PACKAGECONFIG[ipv6] = "--enable-ipv6, --disable-ipv6,"
 PACKAGECONFIG[gnutls] = "--with-gnutls=yes, --with-gnutls=no, gnutls"
 PACKAGECONFIG[gcrypt] = "--with-gcrypt=yes, --with-gcrypt=no, libgcrypt"
 
-EXTRA_OECONF = "--with-qt=no --enable-usr-local=no -enable-tshark"
+EXTRA_OECONF = "--with-qt=no --enable-usr-local=no --enable-tshark --with-c-ares=no"
 
 LIC_FILES_CHKSUM = "file://README.linux;md5=631e077455b7972172eb149195e065b0"
 SRC_URI = " \
     http://wiresharkdownloads.riverbed.com/wireshark/src/wireshark-1.12.0.tar.bz2 \
 "
 
+PE = "1"
+
 SRC_URI[md5sum] = "8dcfe451d8769901129809d2e19c1fb7"
 SRC_URI[sha256sum]= "0f59fea1c5b35de90af681067e49113fee0dd7a901750a97fa25f4256dbf13c7"
 
-- 
2.0.0.257.g75cc6c6


