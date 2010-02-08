Received: from mail-fx0-f227.google.com ([209.85.220.227])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1NeYyh-0004Ey-8L
	for openembedded-devel@lists.openembedded.org;
	Mon, 08 Feb 2010 20:09:02 +0100
Received: by fxm27 with SMTP id 27so995674fxm.27
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Feb 2010 11:06:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:from:to:cc:subject
	:date:message-id:x-mailer;
	bh=CV9LBoJqIWk4Iibc9+5rDM1PGglYDez9xu/FoenBO5c=;
	b=Tt5fg+p5Nh073Y4dXxvLarlxntfOt3kIoXnA5shaLcfNAmU4v6XMD1ZshV8R6zu5aA
	MAFcGAHzPBNAFPeXfVQuElXswZZ4HQtcJ01zavIAnt2Q5fJYD7/Y258CoXkPEoDhjZSJ
	SwYL17G2WT/ffDvZcNIdxzOyMQYUbEBlZfmvE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=SE5zASR7/9D/GZqa/F3FcLVnJz/nt/A+DTiqqhGjsideqcFdHTvVjxYA3A6BLxUbx4
	3gkyoyUl3G0c//3e9lZXwCjHyGbuujz7RAZRLnf4b8CxiN0qzF4BgDqeIWB/vVDX9wvO
	8mkiNvWCZsnG5E4pRHiWt5LbTLtVD34Ql8tSs=
Received: by 10.223.14.15 with SMTP id e15mr8417419faa.57.1265655985577;
	Mon, 08 Feb 2010 11:06:25 -0800 (PST)
Received: from s42.loc ([84.119.103.202])
	by mx.google.com with ESMTPS id p9sm7028887fkb.44.2010.02.08.11.06.24
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 08 Feb 2010 11:06:24 -0800 (PST)
Received: from cow by s42.loc with local (Exim 4.71)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1NeYxo-0003DO-Cd; Mon, 08 Feb 2010 20:08:04 +0100
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  8 Feb 2010 20:07:57 +0100
Message-Id: <1265656077-12327-1-git-send-email-rep.dot.nop@gmail.com>
X-Mailer: git-send-email 1.6.5
X-SA-Exim-Connect-IP: 209.85.220.227
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] gmp: use GNU_MIRROR
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
X-List-Received-Date: Mon, 08 Feb 2010 19:09:02 -0000

Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
---
 recipes/gmp/gmp.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/gmp/gmp.inc b/recipes/gmp/gmp.inc
index 71ea128..3771e80 100644
--- a/recipes/gmp/gmp.inc
+++ b/recipes/gmp/gmp.inc
@@ -3,7 +3,7 @@ DESCRIPTION = "GNU multiprecision arithmetic library"
 HOMEPAGE = "http://www.swox.com/gmp/"
 LICENSE = "GPL LGPL"
 
-SRC_URI = "ftp://ftp.gnu.org/gnu/gmp/gmp-${PV}.tar.bz2 \
+SRC_URI = "${GNU_MIRROR}/gmp/gmp-${PV}.tar.bz2 \
 	   file://configure.patch;patch=1 \
 	   file://amd64.patch;patch=1"
 
-- 
1.6.5



