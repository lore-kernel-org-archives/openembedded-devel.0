Received: from mail-wi0-f169.google.com ([209.85.212.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SNOJ7-0005i3-49
	for openembedded-devel@lists.openembedded.org;
	Thu, 26 Apr 2012 15:00:25 +0200
Received: by wibhm17 with SMTP id hm17so5193815wib.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Apr 2012 05:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=MxJJ/6ANiJzC+cH+Ysd9a6zaB7tdiq4h8M/TEzfZ4NE=;
	b=rAGuJIWIbVCEgaUB3V88+c0kUSibHGQeTqQg9g6IZ7LJbRp1eP5v3KM6toCt5qCqJA
	fiDf86PdnCniSbTjxOLYYOofuIiXBJ0s1j7xi7bu5jRVuQ7gRNm3Gf4dcDlyorOds2/S
	bcfGFfKnLk45u3M28e+ukCBRCwSUsiC/JGDs3228A7rIyPkDZ26fL2HG/cKrfkIP/VlW
	cxxmS3behUn8v2MNKMp2uEV+FgSIHifq16n2WdHLTJ3Vrm3Isc0FbYk6dK4CPAmogSw0
	28lPx/Kdz4oU+iCRS86+sro4scQ+g1oMXaunNgS3AFm13lsNb0gdu71/kPOFKyo6waOo
	D+SA==
Received: by 10.180.89.9 with SMTP id bk9mr16327813wib.11.1335444648292;
	Thu, 26 Apr 2012 05:50:48 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id w10sm10796283wiy.3.2012.04.26.05.50.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 26 Apr 2012 05:50:47 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 26 Apr 2012 14:50:08 +0200
Message-Id: <21d048aecfe72b6f15965906db988e9300fad68a.1335444528.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.5
In-Reply-To: <cover.1335444528.git.Martin.Jansa@gmail.com>
References: <cover.1335444528.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1335444528.git.Martin.Jansa@gmail.com>
References: <cover.1335444528.git.Martin.Jansa@gmail.com>
Subject: [[meta-oe][meta-efl] 03/15] kernel: Fix packaging issue
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
X-List-Received-Date: Thu, 26 Apr 2012 13:00:25 -0000

From: Saul Wold <sgw@linux.intel.com>

Remove /etc since it is empty, when creating a machine that does not
deliver any module config files, the /etc is empty and is then warned
about not being shipped, so we remove it.

This occurs in the routerstationpro with the following warning:
WARNING: For recipe linux-yocto, the following files/directories were installed but not shipped in any package:
WARNING:   /etc

Signed-off-by: Saul Wold <sgw@linux.intel.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/classes/kernel.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-oe/classes/kernel.bbclass b/meta-oe/classes/kernel.bbclass
index 4b61c0c..b7e9f54 100644
--- a/meta-oe/classes/kernel.bbclass
+++ b/meta-oe/classes/kernel.bbclass
@@ -467,7 +467,7 @@ python populate_packages_prepend () {
 	# avoid warnings. removedirs only raises an OSError if an empty
 	# directory cannot be removed.
 	dvar = d.getVar('PKGD', True)
-	for dir in ["%s/etc/modprobe.d" % (dvar), "%s/etc/modules-load.d" % (dvar)]:
+	for dir in ["%s/etc/modprobe.d" % (dvar), "%s/etc/modules-load.d" % (dvar), "%s/etc" % (dvar)]:
 		if len(os.listdir(dir)) == 0:
 			os.rmdir(dir)
 
-- 
1.7.8.5



