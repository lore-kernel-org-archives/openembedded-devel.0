Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1S9NH0-0000gb-Nk
	for openembedded-devel@lists.openembedded.org;
	Sun, 18 Mar 2012 22:04:18 +0100
Received: by wibhj13 with SMTP id hj13so2604238wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Mar 2012 13:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=EkYExJH9KTP8o6PqDjJwVpxYsswtaU/n27tLU0J7tQg=;
	b=ijAOMAtKL5TvQHtaSI/eTIWUGYN21i5tExFUtIywpH6gWUvB9mIoowGKZvr9kEHkyh
	shgpFVL3a101Tp5SzXWGhCJyIpLHRFsjsJwvi3JHEFPGy5XkAYaG7P/fXaGEe6VtUHuE
	j9XuuDY0JRixhz7rI2kdRjoWd95zxcFOygPMDIFzdpCqRiUyfkLDmEW4fSygWjGFaVnq
	IrRYR2vAS77Rbspl+DyV5d6dB3+WwgPnP9nb3seTtujptZIJcTbGiT6Iny+frJmakTwz
	vU/Psl5mBNO4GEHU79q5hiTryA1Nk40VEbW69eq67TfqaT410yRv5aSB+XpLK/ra+uED
	5uqA==
Received: by 10.216.225.12 with SMTP id y12mr5271189wep.39.1332104128289;
	Sun, 18 Mar 2012 13:55:28 -0700 (PDT)
Received: from localhost.localdomain (p4FDF0D2E.dip.t-dialin.net.
	[79.223.13.46])
	by mx.google.com with ESMTPS id k6sm19902201wie.9.2012.03.18.13.55.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 18 Mar 2012 13:55:27 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 18 Mar 2012 21:59:29 +0100
Message-Id: <1332104369-4485-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1332104369-4485-1-git-send-email-schnitzeltony@googlemail.com>
References: <1332104369-4485-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe 2/2] midori: add librsvg-native to DEPENDS
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
X-List-Received-Date: Sun, 18 Mar 2012 21:04:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

configure found rsvg-convert on host:
...
Checking for program rsvg-convert           : /usr/bin/rsvg-convert
...

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../recipes-connectivity/midori/midori_0.4.4.bb    |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-connectivity/midori/midori_0.4.4.bb b/meta-oe/recipes-connectivity/midori/midori_0.4.4.bb
index 7c51641..3561440 100644
--- a/meta-oe/recipes-connectivity/midori/midori_0.4.4.bb
+++ b/meta-oe/recipes-connectivity/midori/midori_0.4.4.bb
@@ -2,7 +2,9 @@ DESCRIPTION = "Midori is a lightweight web browser."
 HOMEPAGE = "http://www.twotoasts.de/index.php?/pages/midori_summary.html"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
-DEPENDS = "webkit-gtk libsoup-2.4 libsexy openssl vala-native python-native python-docutils-native"
+DEPENDS = "webkit-gtk libsoup-2.4 libsexy openssl vala-native python-native python-docutils-native librsvg-native"
+
+PR = "r1"
 
 SRC_URI = "http://archive.xfce.org/src/apps/midori/0.4/midori-${PV}.tar.bz2;name=midori \
           "
-- 
1.7.4.4



