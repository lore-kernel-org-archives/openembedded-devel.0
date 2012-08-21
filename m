Received: from mail-pz0-f51.google.com ([209.85.210.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1T3ft0-0007BZ-Qd
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Aug 2012 06:16:15 +0200
Received: by dajt11 with SMTP id t11so2243543daj.10
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Aug 2012 21:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=VBuceC91fPi0mf6v6Q+tJFGfsNM5d0k3tYaTUM1+PvU=;
	b=JAHGV2+RYz77jI9akHJBXWM/4dbSVQFvMkceoZjWwgEMPB84CiIXEASenxjG8Qn37j
	NKxVxT14G9ZWdz9JnuDI78JXccqqp1lzP/Ce2FRMlqFRoAvzIBSe91vFdNWgxu4N0hgI
	Ce/0jmdvpzS3HqiKF393WolBmTu2Do7nq9uTZUBGK14qgOq/ajGjuNZNN3p/1raWIXAl
	9fV4oOjoI9iCWvw2p3GQwaLtwdycabnZWvkNHbWLcMRu5aeOh4WcssW+YVJgaNmD1Czj
	sBbfRwr1wxucoReVCcYrtx4R7z07cU7Krfe7pwwJ0/U7W0I7BemO7alVMNBeDnlOj226
	7kFA==
Received: by 10.68.232.37 with SMTP id tl5mr31552198pbc.157.1345521850836;
	Mon, 20 Aug 2012 21:04:10 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id uj3sm526674pbc.39.2012.08.20.21.04.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 20 Aug 2012 21:04:09 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Aug 2012 21:03:31 -0700
Message-Id: <1345521816-2364-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1345521816-2364-1-git-send-email-raj.khem@gmail.com>
References: <1345521816-2364-1-git-send-email-raj.khem@gmail.com>
Subject: [meta-java/openjdk-7.0][PATCH 2/7] xalan-j: remove the directory before copy stuff to it
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
X-List-Received-Date: Tue, 21 Aug 2012 04:16:15 -0000

From: Henning Heinold <heinold@inf.fu-berlin.de>

* when the build process got interrtupted it might
  happen something is already in build-serializer/
  so remove it before creating it again
---
 recipes-core/xalan-j/xalan-j_2.7.1.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-core/xalan-j/xalan-j_2.7.1.bb b/recipes-core/xalan-j/xalan-j_2.7.1.bb
index 4b0911d..85fc0b5 100644
--- a/recipes-core/xalan-j/xalan-j_2.7.1.bb
+++ b/recipes-core/xalan-j/xalan-j_2.7.1.bb
@@ -12,7 +12,6 @@ DEPENDS_virtclass-native = " \
 	xerces-j-native regexp-native jlex-native cup-native jaxp1.3-native bcel-native \
 	"
 
-
 SRC_URI = "\
 	http://archive.apache.org/dist/xml/${BPN}/${BPN}_2_7_1-src.tar.gz;name=archive \
 	http://archive.apache.org/dist/jakarta/bsf/source/bsf-src-2.4.0.tar.gz;name=bsf \
@@ -39,6 +38,7 @@ do_compile() {
   # Remove BSF classes
   rm -rf build-xalan/org/apache/bsf
 
+  rm -rf build-serializer/
   mkdir -p build-serializer/org/apache/xml
   mv build/org/apache/xml/serializer build-serializer/org/apache/xml
 
-- 
1.7.9.5



