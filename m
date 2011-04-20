Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QCXSt-0005tO-5v
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Apr 2011 15:29:07 +0200
Received: by fxm19 with SMTP id 19so476884fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Apr 2011 06:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=+UrCl2nXOxlIWy8Sx8OwLntxhuXwsxF5hLWBGA8b0o0=;
	b=aV7Y0A0dvU+ggt326haPm2QFTz/R2W5gUBK+bIqjZ+tIj5rGBMjfiRFj+rsRD/eheP
	XYugUe0yxhIMn0YpUO3LZZGaPApxGpITgUbDheblyX6et4xuq4Nbj1q1qRXNLW2whpcq
	Hj4AZ5HRj3vAqL42JF/SdsHN/nNnvuefP4iio=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=IGE0NsK1yozhwaG6D/T2QakInP0gOgqCviJbZnlP8YErdcsNWjHMoKj1nOIiT3ruDA
	4PpQ1XuOZLfwiSn+0U5LBE3APFM2398gzrNDQnHap4E+UiTnqhS5mojPPe0wqdSSzfdh
	IHSh/e+4zGgKN9NDYyfYZvCHbHRylLuU0HVes=
Received: by 10.223.75.133 with SMTP id y5mr2093266faj.136.1303306003293;
	Wed, 20 Apr 2011 06:26:43 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id e17sm292516fak.0.2011.04.20.06.26.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 20 Apr 2011 06:26:42 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 20 Apr 2011 15:26:17 +0200
Message-Id: <1303305977-28224-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.5.rc1
Subject: [PATCH] testlab: drop PE: from package version when looking for package filename
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
X-List-Received-Date: Wed, 20 Apr 2011 13:29:07 -0000

* reported by Otavio Salvador

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 classes/testlab.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/classes/testlab.bbclass b/classes/testlab.bbclass
index 6581ec3..a6033ce 100644
--- a/classes/testlab.bbclass
+++ b/classes/testlab.bbclass
@@ -36,7 +36,7 @@ if [ -e  ${IMAGE_ROOTFS}/etc/opkg ] && [ "${ONLINE_PACKAGE_MANAGEMENT}" = "full"
 	echo -e "digraph depends {\n    node [shape=plaintext]" > ${TESTLAB_DIR}/depends.dot
 
 	for pkg in $(opkg-cl ${IPKG_ARGS} list_installed | awk '{print $1}') ; do 
-		opkg-cl ${IPKG_ARGS} info $pkg | grep -B 7 -A 7 "^Status.* \(\(installed\)\|\(unpacked\)\)" | awk '/^Package/ {printf $2"_"} /^Version/ {printf $2"_"} /^Archi/ {print $2".ipk"}'  >> ${TESTLAB_DIR}/installed-packages.txt
+		opkg-cl ${IPKG_ARGS} info $pkg | grep -B 7 -A 7 "^Status.* \(\(installed\)\|\(unpacked\)\)" | awk '/^Package/ {printf $2"_"} /^Version/ {sub(/.*:/,"", $2); printf $2"_"} /^Archi/ {print $2".ipk"}'  >> ${TESTLAB_DIR}/installed-packages.txt
 
     		for depends in $(opkg-cl ${IPKG_ARGS} info $pkg | grep ^Depends) ; do 
         		echo "$pkg OPP $depends;" | grep -v "(" | grep -v ")" | grep -v "$pkg OPP Depends" | sed -e 's:,::g' -e 's:-:_:g' -e 's:\.:_:g' -e 's:+::g' |sed 's:OPP:->:g' >> ${TESTLAB_DIR}/depends.dot
-- 
1.7.5.rc1



