Received: from [209.85.218.226] (helo=mail-bw0-f226.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael.lippautz@gmail.com>) id 1Musg6-0007AP-Aq
	for openembedded-devel@lists.openembedded.org;
	Mon, 05 Oct 2009 20:53:01 +0200
Received: by bwz26 with SMTP id 26so2562372bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 Oct 2009 11:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:subject:from:to:content-type
	:date:message-id:mime-version:x-mailer:content-transfer-encoding;
	bh=6dFDae2HP0kf5jMsKYm0Fc8rSjZU2Rng2IRni56Kc1g=;
	b=x4B85bpLCL4KpLvyk67njO57cZP29LdjnxDUEcIKKQW/6AwTy6wEbrSBcc9qsEV8IC
	7P/gdtlyo7nFIGeadwquAvHDsB3KI+TYbggh1dg2lPaSFYZ9lJYDNk5/8Ze5oa52oEw1
	HGM7z5RFcG6WSv+51gd7V8Zs9Yh1X+I0cQQnE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=subject:from:to:content-type:date:message-id:mime-version:x-mailer
	:content-transfer-encoding;
	b=P+ZXY0d0dGmdNAm5OG2IlXJa35kyBVfYDyvf9E2yGB6hn7e8+tQr2Ra2C/lrVD9gWF
	lfjK/HzblVqdVSo+Eoov1UsZDU/S5/G6BXNxvl40ycwzYbeXajhAszaO/e9/US33IVDL
	YFh1tvnZwLR0enM0ywYyeSb0+rCQT8j6EZ8Sk=
Received: by 10.103.125.19 with SMTP id c19mr193246mun.59.1254768730123;
	Mon, 05 Oct 2009 11:52:10 -0700 (PDT)
Received: from ?192.168.1.2? (d86-32-77-106.cust.tele2.at [86.32.77.106])
	by mx.google.com with ESMTPS id u9sm21301644muf.18.2009.10.05.11.52.08
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 05 Oct 2009 11:52:09 -0700 (PDT)
From: Michael Lippautz <michael.lippautz@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 05 Oct 2009 20:52:13 +0200
Message-Id: <1254768733.10712.3.camel@leeloo.somedomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.3 
X-SA-Exim-Connect-IP: 209.85.218.226
X-SA-Exim-Mail-From: michael.lippautz@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: lighttpd 1.4.18 runtime issue
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
X-List-Received-Date: Mon, 05 Oct 2009 18:53:01 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hej,

lighttpd_1.4.18 is installed with a config that should actually load its
module mod-indexfile.so.

Since the config is pretty default, I added the module to the runtime
depends. (also re-formated recipe, uses tabs now).

Regards,
Michael


diff --git a/recipes/lighttpd/lighttpd_1.4.18.bb
b/recipes/lighttpd/lighttpd_1.4.18.bb
index d5870ba..80d22bc 100644
--- a/recipes/lighttpd/lighttpd_1.4.18.bb
+++ b/recipes/lighttpd/lighttpd_1.4.18.bb
@@ -2,26 +2,31 @@ DESCRIPTION = "Web server"
 SECTION = "net"
 LICENSE = "BSD"
 DEPENDS = "libpcre"
-PR = "r3"
-
-SRC_URI = "http://www.lighttpd.net/download/lighttpd-${PV}.tar.gz \
-	   file://configure.in.patch;patch=1 \
-	   file://mod_redirect.c.patch;patch=1 \
-	   file://src-server.c.patch;patch=1 \
-	   file://index.html \
-	   file://lighttpd.conf \
-	   file://lighttpd"
-
-EXTRA_OECONF="--without-bzip2 \
-		--without-ldap \
-		--without-lua \
-		--without-memcache \
-		--with-pcre \
-		--without-webdav-props \
-		--without-webdav-locks \
-		--without-openssl \
-		--disable-nls \
-		--disable-static"
+PR = "r4"
+
+RDEPENDS_${PN} += " \
+	lighttpd-module-indexfile"
+
+SRC_URI = " \
+	http://www.lighttpd.net/download/lighttpd-${PV}.tar.gz \
+	file://configure.in.patch;patch=1 \
+	file://mod_redirect.c.patch;patch=1 \
+	file://src-server.c.patch;patch=1 \
+	file://index.html \
+	file://lighttpd.conf \
+	file://lighttpd"
+
+EXTRA_OECONF=" \
+	--without-bzip2 \
+	--without-ldap \
+	--without-lua \
+	--without-memcache \
+	--with-pcre \
+	--without-webdav-props \
+	--without-webdav-locks \
+	--without-openssl \
+	--disable-nls \
+	--disable-static"
 
 inherit autotools pkgconfig update-rc.d
 
@@ -44,6 +49,6 @@ FILES_${PN} += "${sysconfdir} /www"
 PACKAGES_DYNAMIC = "lighttpd-module-*"
 
 python populate_packages_prepend () {
-        lighttpd_libdir = bb.data.expand('${libdir}', d)
-        do_split_packages(d, lighttpd_libdir, '^mod_(.*)\.so$',
'lighttpd-module-%s', 'Lighttpd module for %s', extra_depends='')
+	lighttpd_libdir = bb.data.expand('${libdir}', d)
+	do_split_packages(d, lighttpd_libdir, '^mod_(.*)\.so$',
'lighttpd-module-%s', 'Lighttpd module for %s', extra_depends='')
 }




