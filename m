Received: from mail-pa0-f41.google.com ([209.85.220.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Tt2T4-0007Ba-E7
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Jan 2013 21:41:48 +0100
Received: by mail-pa0-f41.google.com with SMTP id bj3so1261491pad.28
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Jan 2013 12:26:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=qnLxafv9Q0WkyyccaCIPAlxsxDlo0lGX+zE2sniHwWc=;
	b=KJ2TcwBxgvYyDIC288pmEm77k4nMuKxZQi1RWqS6aN0TCb+pDIlCK3BDP4vXzR6ehT
	d/pLG6UkgQ9II0LiG8qlNoa4AYjswJJCapBXDELUT2w9gWZ3A1VvC1hgekDd/E48pTeF
	K4/UG3RzTkN9D1ApY/koiXv2B3H1nShgI87PBzrVUkbHW46dgzSl4nTQQ9NBJxvoCfti
	exAX43jQ1GpoXj4Rl6W24uwZhG2SD8RX7WYoW+wdGmWKalqKpaSOy/ytzC9BOBsQmsIj
	hbdYtTAxOBT4SAf057Jhga8tNVe1D3RyaOteDU/kQYUseVUnxcRIQKbckL1uqxHbJ8EQ
	2EbQ==
X-Received: by 10.66.73.167 with SMTP id m7mr192672470pav.68.1357763193121;
	Wed, 09 Jan 2013 12:26:33 -0800 (PST)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id us7sm42168708pbc.40.2013.01.09.12.26.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 09 Jan 2013 12:26:32 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  9 Jan 2013 12:26:10 -0800
Message-Id: <1357763170-15330-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-kde][PATCH] qt4-native, qt4-x11-free: Rename bbappends to match current OE-Core recipes
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
X-List-Received-Date: Wed, 09 Jan 2013 20:41:52 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 README                                             |    3 ++-
 ...ve_4.8.3.bbappend => qt4-native_4.8.4.bbappend} |    0
 ..._4.8.3.bbappend => qt4-x11-free_4.8.4.bbappend} |    0
 3 files changed, 2 insertions(+), 1 deletion(-)
 rename recipes-misc-support/{qt4-native_4.8.3.bbappend => qt4-native_4.8.4.bbappend} (100%)
 rename recipes-misc-support/{qt4-x11-free_4.8.3.bbappend => qt4-x11-free_4.8.4.bbappend} (100%)

diff --git a/README b/README
index a6164c9..0635e10 100644
--- a/README
+++ b/README
@@ -9,6 +9,7 @@ Samuel Stirtzel <s.stirtzel@googlemail.com>
 
 Contributors:
 Copyright 2012 - Kai Kang
+Copyright 2013 - Khem Raj
 Copyright 2012 - Koen Kooi
 Copyright 2012 - Robert Yang
 Copyright 2011, 2012 - Samuel Stirtzel
@@ -46,4 +47,4 @@ FAQ / Troubleshooting:
   Q: How to report bugs / request features?
   A: Send your bugreports / feature requests to the openembedded-developer mailing list.
      Include the [meta-kde] tag in the subject for easier readability.
-     You can find the mailing list here: http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
\ No newline at end of file
+     You can find the mailing list here: http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
diff --git a/recipes-misc-support/qt4-native_4.8.3.bbappend b/recipes-misc-support/qt4-native_4.8.4.bbappend
similarity index 100%
rename from recipes-misc-support/qt4-native_4.8.3.bbappend
rename to recipes-misc-support/qt4-native_4.8.4.bbappend
diff --git a/recipes-misc-support/qt4-x11-free_4.8.3.bbappend b/recipes-misc-support/qt4-x11-free_4.8.4.bbappend
similarity index 100%
rename from recipes-misc-support/qt4-x11-free_4.8.3.bbappend
rename to recipes-misc-support/qt4-x11-free_4.8.4.bbappend
-- 
1.7.9.5



