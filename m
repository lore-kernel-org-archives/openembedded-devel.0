Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ajlennon@gmail.com>) id 1SCfJn-00027G-Uk
	for openembedded-devel@lists.openembedded.org;
	Wed, 28 Mar 2012 00:56:48 +0200
Received: by wibhj13 with SMTP id hj13so353470wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Mar 2012 15:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=dEdkOPcSbrIadwOVv74azSHeNS+oMR9FGUDaDNs8j4U=;
	b=ZfxAD/gWWqzzJHqsOIQ3Q8Fbj14LrhdZ1sOyKMTvk8ayd1YWIxtwYY2o6GpC8y9/OI
	rCE+X+z59edTrBJRk4Ng7P2WWkD6z5DXCAzBAmRnqwQqfTfUknFXGjcUoy3qLjm3Vook
	HgsoqQ7P9sTWCmn9sSA4v79buuK1GsfN7GYpXqWbHMuPcFSb2M8I6x/D0XNjHuB8WnDZ
	2XXKM0EPtbiLG4kaASCzGORaKoASQWifEXOJL13yP2JomerO7rnPqDgx5pjcmBuE9+0f
	DGQG6LsN+7kmi3dyStKyl7xlNz/j5p2MgBESluVDa4/jslEywkA/9q8RDGMhEbUweONp
	FkMg==
Received: by 10.180.24.66 with SMTP id s2mr1656474wif.7.1332888466464;
	Tue, 27 Mar 2012 15:47:46 -0700 (PDT)
Received: from localhost.localdomain
	(cpc9-live20-0-0-cust612.know.cable.virginmedia.com. [82.42.142.101])
	by mx.google.com with ESMTPS id gd4sm4940680wib.6.2012.03.27.15.47.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 27 Mar 2012 15:47:45 -0700 (PDT)
Sender: Alex Lennon <ajlennon@gmail.com>
From: ajlennon@dynamicdevices.co.uk
To: openembedded-devel@lists.openembedded.org
Date: Tue, 27 Mar 2012 23:47:38 +0100
Message-Id: <1332888458-15872-1-git-send-email-ajlennon@dynamicdevices.co.uk>
X-Mailer: git-send-email 1.7.5.4
Cc: Alex J Lennon <ajlennon@gmail.com>
Subject: [PATCH] Modified fetch() checksums to be correct for libpng 1.4.28 released 15/3/12 (current) instead of previous 8/3/12 release
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
X-List-Received-Date: Tue, 27 Mar 2012 22:56:48 -0000

From: Alex J Lennon <ajlennon@gmail.com>

Signed-off-by: Alex J Lennon <ajlennon@gmail.com>
---
 recipes/libpng/libpng_1.2.48.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/libpng/libpng_1.2.48.bb b/recipes/libpng/libpng_1.2.48.bb
index 50a3c03..534962d 100644
--- a/recipes/libpng/libpng_1.2.48.bb
+++ b/recipes/libpng/libpng_1.2.48.bb
@@ -2,5 +2,5 @@ require libpng.inc
 
 PR = "${INC_PR}.0"
 
-SRC_URI[libpng.md5sum] = "7612af5660cd4b5e8c433ce53bea01a7"
-SRC_URI[libpng.sha256sum] = "f6db51aff81b6920203678b29e8c68a5e3703cf5b39ae5e9e56370d17f31b1c4"
+SRC_URI[libpng.md5sum] = "74c8c261bdf9a75274e22875183fda07"
+SRC_URI[libpng.sha256sum] = "b4c92df11eadf3e81705a58253dbffc4b95169186899e28abdfc8aada8a20fcc"
-- 
1.7.5.4



