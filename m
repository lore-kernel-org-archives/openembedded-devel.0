Received: from familie-heinold.de
	([85.214.48.103] helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1Q1waF-0003pl-9e
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Mar 2011 09:04:55 +0100
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 896A911000BA
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Mar 2011 09:03:07 +0100 (CET)
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id A497B11000B1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Mar 2011 09:02:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.1
Received: from rhein.familie-heinold.de (g225144151.adsl.alicedsl.de
	[92.225.144.151]) by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Mar 2011 09:02:50 +0100 (CET)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id 1EC6A3C0C9; Tue, 22 Mar 2011 09:02:01 +0100 (CET)
From: heinold@inf.fu-berlin.de
To: openembedded-devel@lists.openembedded.org
Date: Tue, 22 Mar 2011 09:01:50 +0100
Message-Id: <1300780910-28866-4-git-send-email-heinold@inf.fu-berlin.de>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <1300780910-28866-1-git-send-email-heinold@inf.fu-berlin.de>
References: <1300780910-28866-1-git-send-email-heinold@inf.fu-berlin.de>
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: [PATCH 3/3] pulseaudio.inc: let arm, mips and ppc depend on libatomic-ops
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
X-List-Received-Date: Tue, 22 Mar 2011 08:04:55 -0000

From: Henning Heinold <heinold@inf.fu-berlin.de>

* bump INC_PR

Signed-off-by: Henning Heinold <heinold@inf.fu-berlin.de>
---
 recipes/pulseaudio/pulseaudio.inc |   10 ++++++++--
 1 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/recipes/pulseaudio/pulseaudio.inc b/recipes/pulseaudio/pulseaudio.inc
index 85048f2..046a349 100644
--- a/recipes/pulseaudio/pulseaudio.inc
+++ b/recipes/pulseaudio/pulseaudio.inc
@@ -3,10 +3,16 @@ HOMEPAGE = "http://www.pulseaudio.org"
 AUTHOR = "Lennart Poettering"
 SECTION = "libs/multimedia"
 LICENSE = "LGPL"
-DEPENDS = "bluez4 libatomics-ops liboil avahi libsamplerate0 libsndfile1 libtool hal virtual/libx11 tcp-wrappers"
+DEPENDS = "bluez4 liboil avahi libsamplerate0 libsndfile1 libtool hal virtual/libx11 tcp-wrappers"
 # optional
 DEPENDS += "alsa-lib glib-2.0 dbus consolekit hal openssl"
-INC_PR = "r11"
+
+DEPENDS_append_arm = " libatomic-ops"
+DEPENDS_append_mips = " libatomic-ops"
+DEPENDS_append_mipsel = " libatomic-ops"
+DEPENDS_append_ppc = " libatomic-ops"
+
+INC_PR = "r12"
 
 SRC_URI = "http://0pointer.de/lennart/projects/pulseaudio/pulseaudio-${PV}.tar.gz \
            file://gcc4-compile-fix.patch \
-- 
1.7.4.1


