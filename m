Received: from mail-pb0-f43.google.com ([209.85.160.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TrmXB-00036B-29
	for openembedded-devel@lists.openembedded.org;
	Sun, 06 Jan 2013 10:28:49 +0100
Received: by mail-pb0-f43.google.com with SMTP id um15so9966165pbc.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Jan 2013 01:13:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=xRv9nsQpFhSpHMuQAW9nfp9rTIcvUenpq516MtMPMnQ=;
	b=JB1DG3hmPKVhS1P2TANPAekPRQG5sd9APWQefb0PUAJTxcg4t9EeOF8hWnDEEvE01Q
	gJncm1qiJ44kt3yZRojoQRZJZ05Ovok8owZK/AgIZDZEYXsOSqIbtvkLE/v/GmfzrdoM
	1yYVokbC9YxUlegem4eE2Zt5OWmnVJXK2PWpa6rxn3dOubKp2k/9yTIc8EjHTIoWsHR/
	Kq7Krd2/iRYJpIUZQiqShmpy3VkFuaQRKZjv/2bFCONt1u2C3zRRJ1Y50ncMkrtR+xJx
	Qem45/FcUMY/BEXQsn7KenHm3l+QIjgowpPd25b1EfyXxS7BMFN5ECvo4U+A3nJR9mhh
	YeuA==
X-Received: by 10.68.138.195 with SMTP id qs3mr176220464pbb.62.1357463620825; 
	Sun, 06 Jan 2013 01:13:40 -0800 (PST)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id qw8sm5137145pbc.39.2013.01.06.01.13.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 06 Jan 2013 01:13:40 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  6 Jan 2013 01:12:30 -0800
Message-Id: <1357463568-26241-7-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1357463568-26241-1-git-send-email-raj.khem@gmail.com>
References: <1357463568-26241-1-git-send-email-raj.khem@gmail.com>
Subject: [meta-oe][PATCH V2 07/25] jansson_2.3.1.bb: Fix multilib use BPN in SRC_URI instead of PN
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
X-List-Received-Date: Sun, 06 Jan 2013 09:28:50 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/jansson/jansson_2.3.1.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/jansson/jansson_2.3.1.bb b/meta-oe/recipes-extended/jansson/jansson_2.3.1.bb
index 85aade4..8c7a11e 100644
--- a/meta-oe/recipes-extended/jansson/jansson_2.3.1.bb
+++ b/meta-oe/recipes-extended/jansson/jansson_2.3.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.digip.org/jansson/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=6946b728e700de875e60ebb453cc3a20"
 
-SRC_URI = "http://www.digip.org/jansson/releases/${PN}-${PV}.tar.gz"
+SRC_URI = "http://www.digip.org/jansson/releases/${BPN}-${PV}.tar.gz"
 
 SRC_URI[md5sum] = "28848fbc02d7657d930f97ce74f80d93"
 SRC_URI[sha256sum] = "5f2ebf63580c73cc115634861b5da1c919499dde37d2e73b16e28b0c8ddc3921"
-- 
1.7.9.5



