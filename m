Received: from mail-fx0-f220.google.com ([209.85.220.220])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1NkMrH-0005Op-SQ
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Feb 2010 20:25:22 +0100
Received: by fxm20 with SMTP id 20so5047100fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Feb 2010 11:22:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=taiE5W+qUQVePmzcXnEyQci1HgOyTDmxI+lxSNDxUqs=;
	b=JpGSsz1wDgQl01aBVsUma6fTP6meFlGH+A2G2BMuiMPeiL9UaCCSRugf35DUmgEpjT
	xjdH4ckn8wLTPJyua30uwaxoZnfAQPMZRttLw92g9N6xb0FcsoNjiouXvSgNazMZKDrq
	rfPYPgYrh1pSvlHnUkpNyxqE4pkYBrjfacffo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=Gtkosus2zlwgqjsvVZSDQ1/VjuHozUMymvJ8+av7DiFMtAkLOw8HsqXjbHz/SShcWj
	ihMJ3IIQ/zgf26BKCwIbqB4aQEv/XWXmYbpZ9/CjBSHY2dC1lNtOxCdywPtYUOJARwW0
	S4sEm3SsHwMMTRqRvqM6wKtRceN8AtDbN9UvY=
Received: by 10.223.92.142 with SMTP id r14mr178100fam.93.1267039351311;
	Wed, 24 Feb 2010 11:22:31 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 14sm3662306fxm.1.2010.02.24.11.22.30
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 24 Feb 2010 11:22:30 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 24 Feb 2010 20:22:47 +0100
Message-Id: <1267039367-8677-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.0
X-SA-Exim-Connect-IP: 209.85.220.220
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: Koen Kooi <k.kooi@student.utwente.nl>
Subject: [PATCH] testlab.bbclass: use opkg.conf from staging, always specify tmp_dir in opkg-cl call with -t parameter
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
X-List-Received-Date: Wed, 24 Feb 2010 19:25:23 -0000

* Use opkg.conf from staging in the same way as do_rootfs does
* When option tmp_dir is used in opkg.conf installed on rootfs then it's
  used also in do_rootfs call and points to probably non-existent directory
  on buildhost like /var/lib/opkg/tmp.
* The value of tmp_dir from rootfs is used even with another config file
  specified with -c parameter
* Before this, it was using default value (/tmp) on buildhost, now it will use
  own "${IMAGE_ROOTFS}-tmp" and remove it after do_rootfs finish
  (usually already empty inside, cleaned by opkg itself)

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 classes/testlab.bbclass |   13 +++++++++----
 1 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/classes/testlab.bbclass b/classes/testlab.bbclass
index fc923c5..e6c9c8e 100644
--- a/classes/testlab.bbclass
+++ b/classes/testlab.bbclass
@@ -24,26 +24,31 @@
 do_testlab() {
 if [ -e  ${IMAGE_ROOTFS}/etc/opkg ] && [ "${ONLINE_PACKAGE_MANAGEMENT}" = "full" ] ; then
 
+	IPKG_TMP_DIR="${IMAGE_ROOTFS}-tmp"
+	IPKG_ARGS="-f ${STAGING_ETCDIR_NATIVE}/opkg.conf -o ${IMAGE_ROOTFS} -t ${IPKG_TMP_DIR}"
+
 	TESTLAB_DIR="${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}-testlab"
         mkdir -p ${TESTLAB_DIR}/
+        mkdir -p ${IPKG_TMP_DIR}/
 	ls -laR ${IMAGE_ROOTFS} > ${TESTLAB_DIR}/files-in-image.txt 	
      
 	echo > ${TESTLAB_DIR}/installed-packages.txt
 	echo -e "digraph depends {\n    node [shape=plaintext]" > ${TESTLAB_DIR}/depends.dot
 
-	for pkg in $(opkg-cl -f ${IMAGE_ROOTFS}/etc/opkg -o ${IMAGE_ROOTFS} list_installed | awk '{print $1}') ; do 
-		opkg-cl -f ${IMAGE_ROOTFS}/etc/opkg -o ${IMAGE_ROOTFS} info $pkg | awk '/Package/ {printf $2"_"} /Version/ {printf $2"_"} /Archi/ {print $2".ipk"}'  >> ${TESTLAB_DIR}/installed-packages.txt
+	for pkg in $(opkg-cl ${IPKG_ARGS} list_installed | awk '{print $1}') ; do 
+		opkg-cl ${IPKG_ARGS} info $pkg | awk '/Package/ {printf $2"_"} /Version/ {printf $2"_"} /Archi/ {print $2".ipk"}'  >> ${TESTLAB_DIR}/installed-packages.txt
 
-    		for depends in $(opkg-cl -f ${IMAGE_ROOTFS}/etc/opkg -o  ${IMAGE_ROOTFS} info $pkg | grep Depends) ; do 
+    		for depends in $(opkg-cl ${IPKG_ARGS} info $pkg | grep Depends) ; do 
         		echo "$pkg OPP $depends;" | grep -v "(" | grep -v ")" | grep -v Depends | sed -e 's:,::g' -e 's:-:_:g' -e 's:\.:_:g' -e 's:+::g' |sed 's:OPP:->:g' >> ${TESTLAB_DIR}/depends.dot
     		done
     		
-		for recommends in $(opkg-cl -f ${IMAGE_ROOTFS}/etc/opkg -o ${IMAGE_ROOTFS} info $pkg | grep Recom) ; do
+		for recommends in $(opkg-cl ${IPKG_ARGS} info $pkg | grep Recom) ; do
         		echo "$pkg OPP $recommends [style=dotted];" | grep -v "(" | grep -v ")" | grep -v Recom | sed -e 's:,::g' -e 's:-:_:g' -e 's:\.:_:g' -e 's:+::g' |sed 's:OPP:->:g' >> ${TESTLAB_DIR}/depends.dot
     		done
 	done
 
 	echo "}" >>  ${TESTLAB_DIR}/depends.dot
+	rm -rf ${IPKG_TMP_DIR}
 	
 	grep -v kernel_2 ${TESTLAB_DIR}/depends.dot | grep -v kernel_image > ${TESTLAB_DIR}/depends-nokernel.dot
 	grep -v libc6 ${TESTLAB_DIR}/depends-nokernel.dot | grep -v libgcc > ${TESTLAB_DIR}/depends-nokernel-nolibc.dot
-- 
1.7.0



