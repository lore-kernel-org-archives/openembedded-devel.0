Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SARw4-0000Pn-9K
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Mar 2012 21:15:08 +0100
Received: by wibhj13 with SMTP id hj13so6130850wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Mar 2012 13:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=4m/fcEf1YQNTa7FBj9fzX4nraU/mpc68Skr6ZSXtogI=;
	b=BcurciKpdpYrJ6AWcxGZFI02rOXIHLExFtSkcHZVbilXVomqS2c2fcc+r1PRif6KZN
	sAZ9VEON0JxMR48HIoxuqL1MoFYQNSy9iq4w9zSSZ8vBImxu93TkwHabur5WmBy7X776
	/duDHytrUpGx9FWX4cf4a0cZHpVH4mwl9Jfq5MpP9KCNbQDUpfuuPnQJDJwhv6MaUbRz
	giOz9WPElNnMijL0IoUSmf1fWtSTuw8xl+1qi4qc2F+IEBpFewa/K3zDw7BfTU0oD/8u
	EIWt6sjtd6b6fZkbOL4vAeD4Db71DU84kagDoKc1HiiWqOhTeWsq16I5Rd3rivwFkB36
	GN9Q==
Received: by 10.180.104.65 with SMTP id gc1mr11918642wib.13.1332360374457;
	Wed, 21 Mar 2012 13:06:14 -0700 (PDT)
Received: from localhost.localdomain (p4FDF1EA7.dip.t-dialin.net.
	[79.223.30.167])
	by mx.google.com with ESMTPS id l5sm7021769wia.11.2012.03.21.13.06.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 21 Mar 2012 13:06:13 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 21 Mar 2012 21:10:19 +0100
Message-Id: <1332360619-3060-3-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1332360619-3060-1-git-send-email-schnitzeltony@googlemail.com>
References: <1332360619-3060-1-git-send-email-schnitzeltony@googlemail.com>
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
X-List-Received-Date: Wed, 21 Mar 2012 20:15:08 -0000
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
index 87855b1..a408d73 100644
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



