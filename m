Received: from mail-ee0-f52.google.com ([74.125.83.52])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1TwtNR-00078b-RO
	for openembedded-devel@lists.openembedded.org;
	Sun, 20 Jan 2013 12:47:55 +0100
Received: by mail-ee0-f52.google.com with SMTP id b15so2374890eek.11
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Jan 2013 03:32:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:x-gm-message-state;
	bh=SntIscoDJANoCUCLs8t+mvIN1JrwXuYEIIsMA2kcOJM=;
	b=c3w8LdjdDaMwk10gRgPK5G9vyA5wwXBMWpiuSWacJyUEOB3x8BgPD+I0Qv1wvZd4LW
	/lMCkbO6Qj+enTWypRYFgPL/Po+J591lh7Iug2mn4EFLQQt/rTAGGA3imc0dE+rTGWNp
	Omb1fh5eKYk7I4wtdBCLwwKhdl0eR5Z6v+sC5nCMVoZXAcQ8OvhOkveWSNtN8eJC/lPx
	hsI8p/rR48nyOIm4/7ZUdxxe2/ainXyCNxHstQvJC8zAJ+hYjWLOWmYDwPuZXsM+VYSK
	CP8dIgVlO6KIXM8s65ofm3Am9BJzjL2KJ9K0xJ9TLAV5MPHVa/7zd3MCxEwuUBQjZQCE
	RcNg==
X-Received: by 10.14.0.133 with SMTP id 5mr47786181eeb.29.1358681546871;
	Sun, 20 Jan 2013 03:32:26 -0800 (PST)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174])
	by mx.google.com with ESMTPS id k4sm16888656eep.15.2013.01.20.03.32.25
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sun, 20 Jan 2013 03:32:26 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 20 Jan 2013 12:32:08 +0100
Message-Id: <1358681528-19761-7-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.8.1
In-Reply-To: <1358681528-19761-1-git-send-email-koen@dominion.thruhere.net>
References: <1358681528-19761-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQk2CH8IV/V7Ffv6AvrMsKznO5EJhjjxxQR0YhOTYwB18OVMPyoqtq7D4aqvvC7yo6voqWSS
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][meta-multimedia][PATCH v2 7/7] znc: add git version
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
X-List-Received-Date: Sun, 20 Jan 2013 11:47:57 -0000
X-List-Received-Date: Sun, 20 Jan 2013 11:47:57 -0000
X-List-Received-Date: Sun, 20 Jan 2013 11:47:57 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-networking/recipes-irc/znc/znc_git.bb | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 meta-networking/recipes-irc/znc/znc_git.bb

diff --git a/meta-networking/recipes-irc/znc/znc_git.bb b/meta-networking/recipes-irc/znc/znc_git.bb
new file mode 100644
index 0000000..aea8ed4
--- /dev/null
+++ b/meta-networking/recipes-irc/znc/znc_git.bb
@@ -0,0 +1,19 @@
+DESCRIPTION = "ZNC, an advanced IRC bouncer"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=751419260aa954499f7abaabaa882bbe"
+
+DEPENDS = "openssl"
+
+PV = "1.0+git"
+
+SRCREV = "ef59c23068547c132cb678092fba9a21317fd5f2"
+SRC_URI = "git://github.com/znc/znc.git"
+
+S = "${WORKDIR}/git"
+
+inherit autotools
+
+# ZNC has a custom autogen.sh that states that this command is needed *and* expected to fail
+do_configure_prepend() {
+	automake --add-missing || true
+}
-- 
1.8.1



