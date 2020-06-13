Received: from koncepto.io (koncepto.io [195.154.119.111])
 by mx.groups.io with SMTP id smtpd.web12.14744.1592074953391676658
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 13 Jun 2020 12:02:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@koncepto.io header.s=default header.b=ZdsOJGlg;
 spf=pass (domain: koncepto.io, ip: 195.154.119.111, mailfrom: pjtexier@koncepto.io)
Received: from menoah.home (lfbn-bor-1-1500-88.w193-250.abo.wanadoo.fr [193.250.66.88])
	by koncepto.io (Postfix) with ESMTPSA id D52D860250;
	Sat, 13 Jun 2020 21:02:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1592074949;
	bh=wyTnfqLiWIsnBGbMk4r9kF3RRdYKWYPNL+xbiRQjFCE=;
	h=From:To:Cc:Subject:Date:From;
	b=ZdsOJGlgH0TCc5a761+HQPyMm4o6he+FmRwKTELi9rAEjCrlxU9sgO2nXzoqIFecM
	 DnNn6oV2GQq5RKWMzWwFYJ2ar0KCiln4E40fo8Sejm7ULWFNRGWBtfRR2bqj/nKMFa
	 nGAEVFhOAh2qFItZlZVi8WR+TnyXygMxt7Y484pHlfGQj7o4LbZa+kNqTnG5vBBHRp
	 OTc5P/X+tpNM33sH1cJyL7QwZyW1EBoAsBsIAvuZuOE3XzQYbk6d5IG43PE7EjeH79
	 wstFEC2oSz1cXKBk1YmGkMndhxwS32a5KHJAy7sRrLL0chv8ALQQBJFfEsWWPisJIX
	 pQB8ojRx3Hcbg==
From: "Pierre-Jean Texier" <pjtexier@koncepto.io>
To: openembedded-devel@lists.openembedded.org
Cc: Pierre-Jean Texier <pjtexier@koncepto.io>
Subject: [meta-oe][PATCH] rsnapshot: upgrade 1.4.2 -> 1.4.3
Date: Sat, 13 Jun 2020 21:02:24 +0200
Message-Id: <1592074944-18162-1-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4

VERSION 1.4.3
------------------------------------------------------------------------------
- Fixes and minor updates to Pod / man page.
- Adds more tests.
- Restore rsync error code 23 as an important warning.
- Fixes shortargs appending.
- Non-LVM backup source breaks after LVM backup source.
- Update rsnapreport.pl utility script to work with rsync >= 3.1.0 stats and bytes changes.

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 meta-oe/recipes-support/rsnapshot/rsnapshot_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/rsnapshot/rsnapshot_git.bb b/meta-oe/recipes-support/rsnapshot/rsnapshot_git.bb
index efe95b1..dcadede 100644
--- a/meta-oe/recipes-support/rsnapshot/rsnapshot_git.bb
+++ b/meta-oe/recipes-support/rsnapshot/rsnapshot_git.bb
@@ -20,8 +20,8 @@ RDEPENDS_${PN} = "rsync \
                   perl-module-overloading \
                  "
 
-SRCREV = "27209563f924a22f510698ea225f53ea52f07cb4"
-PV = "1.4.2+git${SRCPV}"
+SRCREV = "a9e29850fc33c503c289e245c7bad350eed746d9"
+PV = "1.4.3+git${SRCPV}"
 
 SRC_URI = "git://github.com/DrHyde/${BPN};branch=master;protocol=git \
            file://configure-fix-cmd_rsync.patch \
-- 
2.7.4

