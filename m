Received: from mail-pz0-f51.google.com ([209.85.210.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <graham.gower@gmail.com>) id 1PTlVH-0007vp-SC
	for openembedded-devel@lists.openembedded.org;
	Sat, 18 Dec 2010 02:22:32 +0100
Received: by pzk34 with SMTP id 34so275788pzk.10
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Dec 2010 17:22:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=+y7KQgh62Mn6v5+Pyw+WsitEHceJ6hh4G48jWAWva3o=;
	b=ItHXeMGzWXONQIyvruoG6LyWZVRD09DhbtQrnFHNIxP7s6Qfav0VZ+yzMGzNlq5GIJ
	uY/bY9A/niemFObZQI5r7AyOn0jmAgUcUBiqCnNK7Sz4Y4wFKQ0X844lk2CF0pLM38aO
	JHGFg90vpifqaykJHlsX19u563v5nnS7k+00s=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=OlMOJeSQ9FodIXhEhtaMOyH72LlR3b6d2Fl6cWGaVFZNzoEVmei+yQfKqb8J6AB5U7
	KWcjpNAGCNxk9Ps8uEVupHyfH0XRcstMynHpjtINjKom5tXUYICm7KSZ01+yWSPqskAu
	emMFHUjNXTvnHI7nFQCmBdJlK7YNvWWQPSzyM=
Received: by 10.142.221.13 with SMTP id t13mr395877wfg.56.1292566546926;
	Thu, 16 Dec 2010 22:15:46 -0800 (PST)
Received: from [10.0.0.5] (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id q13sm1194162wfc.5.2010.12.16.22.15.44
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 16 Dec 2010 22:15:45 -0800 (PST)
Message-ID: <4D0B000B.4010903@gmail.com>
Date: Fri, 17 Dec 2010 16:45:39 +1030
From: Graham Gower <graham.gower@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.15) Gecko/20101113 Thunderbird/3.0.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] meta-toolchain.bb: Fix do_populate_sdk for DISTRO=micro.
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
X-List-Received-Date: Sat, 18 Dec 2010 01:22:32 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit


Signed-off-by: Graham Gower <graham.gower@gmail.com>
---
 recipes/meta/meta-toolchain.bb |   16 +++++++++-------
 1 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/recipes/meta/meta-toolchain.bb b/recipes/meta/meta-toolchain.bb
index e949432..cb9e438 100644
--- a/recipes/meta/meta-toolchain.bb
+++ b/recipes/meta/meta-toolchain.bb
@@ -72,9 +72,9 @@ do_populate_sdk() {
 		${IPKG_TARGET} remove -force-depends ${TOOLCHAIN_TARGET_EXCLUDE}
 	fi
 
-	install -d ${SDK_OUTPUT}/${SDKPATH}/usr/lib/opkg
-	mv ${SDK_OUTPUT}/usr/lib/opkg/* ${SDK_OUTPUT}/${SDKPATH}/usr/lib/opkg/
-	rm -Rf ${SDK_OUTPUT}/usr/lib
+	install -d ${SDK_OUTPUT}/${SDKPATH}${libdir}/opkg
+	mv ${SDK_OUTPUT}${libdir}/opkg/* ${SDK_OUTPUT}/${SDKPATH}${libdir}/opkg/
+	rm -Rf ${SDK_OUTPUT}${libdir}
 
 	# Clean up empty directories from excluded packages
 	find ${SDK_OUTPUT} -depth -type d -empty -print0 | xargs -r0 /bin/rmdir
@@ -86,7 +86,7 @@ do_populate_sdk() {
 	install -m 0644 ${IPKGCONF_SDK} ${SDK_OUTPUT}/${SDKPATH}/${sysconfdir}/
 
 	# extract and store ipks, pkgdata and shlibs data
-	target_pkgs=`cat ${SDK_OUTPUT}/${SDKPATH}/${TARGET_SYS}/usr/lib/opkg/status | grep Package: | cut -f 2 -d ' '`
+	target_pkgs=`cat ${SDK_OUTPUT}/${SDKPATH}/${TARGET_SYS}${libdir}/opkg/status | grep Package: | cut -f 2 -d ' '`
 	mkdir -p ${SDK_OUTPUT2}/${SDKPATH}/ipk/
 	mkdir -p ${SDK_OUTPUT2}/${SDKPATH}/pkgdata/runtime/
 	mkdir -p ${SDK_OUTPUT2}/${SDKPATH}/${TARGET_SYS}/shlibs/
@@ -123,9 +123,11 @@ do_populate_sdk() {
 
 	# With sysroot support, gcc expects the default C++ headers to be
 	# in a specific place.
-	install -d ${SDK_OUTPUT}/${SDKPATH}/${TARGET_SYS}/include
-	mv ${SDK_OUTPUT}/${SDKPATH}/${TARGET_SYS}/usr/include/c++ \
-		${SDK_OUTPUT}/${SDKPATH}/${TARGET_SYS}/include/
+	if [ "${base_prefix}" != "${prefix}" ]; then
+		install -d ${SDK_OUTPUT}/${SDKPATH}/${TARGET_SYS}/include
+		mv ${SDK_OUTPUT}/${SDKPATH}/${TARGET_SYS}/usr/include/c++ \
+			${SDK_OUTPUT}/${SDKPATH}/${TARGET_SYS}/include/
+	fi
 
 	# Fix or remove broken .la files
 	for i in `find ${SDK_OUTPUT}/${SDKPATH}/${TARGET_SYS} -name \*.la`; do
-- 
1.7.1



