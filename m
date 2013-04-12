Received: from mail-ea0-f180.google.com ([209.85.215.180])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1UQb7e-0002TH-Kj
	for openembedded-devel@lists.openembedded.org;
	Fri, 12 Apr 2013 12:22:27 +0200
Received: by mail-ea0-f180.google.com with SMTP id d10so1137630eaj.39
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Apr 2013 03:04:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=9HcjL50YxtUCfbxWY6JoUiKW/Oi2mldJN5HvQiS4Abc=;
	b=ZT5cW8+zCyylFbTrV7piXS1Hp81+rRVbIVU3vuF3w68tFft8tFsmyBeFiyPGHvZdmh
	LNXr1Arv7n7ycaEdx2/6lhcyzeXFj15On4e0qQauY7QhM7sNwZqHtutQnmZkaRgIfOEg
	AERypqnp0lT29VdhgPOG/RKvutjddZAinl6Ay/lh98kznErv4tGlbv4oTRxNtvnyD1ai
	Fg9mc1OG9q8IBdl91zTIxgTgVWXEq4siZHEcoswFtnRJnj83uGZXOJbomqx0qOWyOh6l
	pZ8NZ9JI8JO3/YNNhrA5gILT6SYwsGYUxoPZtAPD28a2xvsf3quZ8DmVATVHzlin9hSF
	eGDA==
X-Received: by 10.15.111.202 with SMTP id cj50mr26331475eeb.6.1365761098414;
	Fri, 12 Apr 2013 03:04:58 -0700 (PDT)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174])
	by mx.google.com with ESMTPS id ca4sm10203666eeb.15.2013.04.12.03.04.56
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 12 Apr 2013 03:04:57 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 12 Apr 2013 12:04:43 +0200
Message-Id: <1365761087-1229-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.8.1.4
X-Gm-Message-State: ALoCoQlle/dunwcC3pLdH5mwyIolMOMivQqz4WCVr537HiYFzVSZo/9Lo0WjzlWaZB8TrQdOHe8C
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCHv3 1/5] python-tornado: update to top of 2.2 branch
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
X-List-Received-Date: Fri, 12 Apr 2013 10:23:31 -0000

Drags in a few bugfixes needed for gateone

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-oe/recipes-devtools/python/python-tornado_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-devtools/python/python-tornado_git.bb b/meta-oe/recipes-devtools/python/python-tornado_git.bb
index 00d0bbb..f158923 100644
--- a/meta-oe/recipes-devtools/python/python-tornado_git.bb
+++ b/meta-oe/recipes-devtools/python/python-tornado_git.bb
@@ -2,9 +2,9 @@ DESCRIPTION = "Tornado is an open source version of the scalable, non-blocking w
 LICENSE = "Apache"
 LIC_FILES_CHKSUM = "file://README;md5=e7fb9954003d7cd93322ccf282210d1c"
 
-PV = "2.2"
-SRCREV = "02bc76155de5bf4dca243e4d0c019c0ac4c8b3be"
-PR = "r1"
+PV = "2.2.1+git${SRCPV}"
+
+SRCREV = "c501917eba46dec30b1f2ef12497dffc4beec505"
 SRC_URI = "git://github.com/facebook/tornado.git;branch=branch2.2 \
            file://0001-disable-AI_ADDRCONFIG-flag.patch \
           "
-- 
1.8.1.4



