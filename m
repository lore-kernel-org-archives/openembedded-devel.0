Received: from [72.14.220.152] (helo=fg-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1Mo2UY-0002JJ-B7
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Sep 2009 23:56:49 +0200
Received: by fg-out-1718.google.com with SMTP id d23so5806fga.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Sep 2009 14:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=K0cRVVq/9KN88THSBs4+Ouck8NdNx+6X13PxgjmlyPI=;
	b=bYLcV6MrX6dF+hDNWsslzBndR6vvQuzAXzpwo7TGkx7Vi9X+liE4cnjcity7A4bbNp
	ndLr+F3L4gXOo7yFcx/mxfLUL9rBF4eCHfFdk8UoFo7zKjM7ZbQmLG9F9taTEuvkAF7e
	zPp04Xjxu0WPmpkdbUWZYhEJdvLUPHFs+jkXE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=NmsBQR6zV0YpeMfQvs6CEORmdILPykf46N2LT8XWp4fPvabq3rw7Vf0AHSJVPwwlk4
	CU/HU+iZSd6M9cLdCLfYxB44LXDqYkcOjdoWYGZcdXvRib3n8q/a7ftZS0u8ea8lKg67
	j0KR0nRZKnx2cmdTH0RYiKyW5QXg75Yj1Fi+w=
MIME-Version: 1.0
Received: by 10.239.182.153 with SMTP id q25mr900658hbg.138.1253138175578; 
	Wed, 16 Sep 2009 14:56:15 -0700 (PDT)
Date: Wed, 16 Sep 2009 23:56:15 +0200
Message-ID: <c384c5ea0909161456r48c25a89n5d3e902e2f98b089@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 72.14.220.152
X-SA-Exim-Mail-From: leon.woestenberg@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [RFC] Fetch machine type list for ARM architectures
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
X-List-Received-Date: Wed, 16 Sep 2009 21:56:49 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello,

two (known) ARM machines currently have kernel support but their
"mach-types" file in arch/arm/tools/ is not up-to-date.

I had this change in my local tree. It works, but is quite intrusive
as it is mixing a well-known version of the kernel sources (as per the
recipe) against an upstream, constantly changing file.
This is unwanted.

I rather think we should fetch the mach-types file only for those
machine that require it.

So please DO NOT APPLY this patch as-is.

Any other ideas on this?


--
Leon.


diff --git a/recipes/linux/linux.inc b/recipes/linux/linux.inc
index 044d413..6db2022 100644
--- a/recipes/linux/linux.inc
+++ b/recipes/linux/linux.inc
@@ -53,6 +53,14 @@ python __anonymous () {
        bb.data.setVar("PACKAGES", "%s kernel-devicetree" % packages, d)
 }

+# update machine types list for ARM architecture
+do_arm_mach_types() {
+  if test ${TARGET_ARCH} == arm; then
+    curl -o mach-types
"http://www.arm.linux.org.uk/developer/machines/download.php" && \
+    cp mach-types arch/arm/tools/mach-types
+  fi
+}
+
 do_configure_prepend() {
         echo "" > ${S}/.config

@@ -170,6 +178,7 @@ do_devicetree_image() {
 }

 addtask devicetree_image after do_deploy before do_package
+addtask arm_mach_types after do_patch before do_configure

 pkg_postinst_kernel-devicetree () {
        cd /${KERNEL_IMAGEDEST}; update-alternatives --install
/${KERNEL_IMAGEDEST}/devicetree devicetree
devicetree-${KERNEL_VERSION} ${KERNEL_PRIORITY} ||


-- 
Leon


