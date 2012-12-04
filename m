Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tfi1p-0001w5-AG
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Dec 2012 03:14:40 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so1377424eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Dec 2012 18:00:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=vwA+/nAATRNkhfcbX5yIzwW6K3xWjfa8eHunqfGA1L8=;
	b=FRi17qhmm+69RVMHHWA2IlWUCeRyq14UC3kwHAD1rxfrzPMFeetUKSmmWIM+orbeX0
	q6zDN37TkIiLikOwL6wzzgWOiQ6GYxeN8V/bkMwN+C+FhbNPbBTDlFIwvIoUXXf/vwai
	bFX0SBp0oGJo1lHFzhH4M1b2qmgWhTeSClVT3H+omT/Z7z/h06Ro7eHUUzvy9dFJKWWa
	9gozB7IDaasfG87jbJQYVlGaxgR/3w4SNQ2Xfj4sBnYrH9aswTCRkK6PjjejX9jmB4A9
	U1eK90vCwLxsldD5LMwkeWA1B20QrSchkdwY7wEKqGy/jseGkgOzk0/Ur6ZNpCPdi5Dj
	HYXQ==
Received: by 10.14.202.3 with SMTP id c3mr12196472eeo.4.1354586413719;
	Mon, 03 Dec 2012 18:00:13 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id v46sm23864511eep.1.2012.12.03.18.00.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Dec 2012 18:00:13 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  4 Dec 2012 02:58:37 +0100
Message-Id: <cbebddb3e319becb0005bb4afebcc5b6541e4d66.1354586187.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <cover.1354586187.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1354586187.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
Subject: [PATCH 04/58] fluidsynth: import from OE-Classic
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
X-List-Received-Date: Tue, 04 Dec 2012 02:14:40 -0000

* needed for epiano
* added LIC_FILES_CHSKUm
* fixed LICENSE

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-multimedia/fluidsynth/fluidsynth_1.0.8.bb | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.0.8.bb

diff --git a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.0.8.bb b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.0.8.bb
new file mode 100644
index 0000000..f5d6e53
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.0.8.bb
@@ -0,0 +1,19 @@
+DESCRIPTION = "Fluidsynth is a software synthesizer"
+HOMEPAGE = "http://www.fluidsynth.org/"
+SECTION = "libs/multimedia"
+LICENSE = "LGPLv-2.0+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=dda26baa823649da9a68947707650272"
+
+DEPENDS = "alsa-lib ncurses"
+
+SRC_URI = "http://savannah.nongnu.org/download/fluid/${P}.tar.gz"
+SRC_URI[md5sum] = "e2abfd2e69fd8b28d965df968d7d44ee"
+SRC_URI[sha256sum] = "45e7c9967d0fb0344f4da539ab343fb979384b36a429a8594c94cf466dff4320"
+
+inherit autotools pkgconfig lib_package
+
+#Has broken libtool usage
+do_configure() {
+	gnu-configize
+	oe_runconf
+}
-- 
1.8.0



