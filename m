Received: from mail-ea0-f173.google.com ([209.85.215.173])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TmlRK-0004cb-Ag
	for openembedded-devel@lists.openembedded.org;
	Sun, 23 Dec 2012 14:18:10 +0100
Received: by mail-ea0-f173.google.com with SMTP id i13so2501048eaa.4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Dec 2012 05:03:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=eWFz35aCSWWBWj4dcGOntXMCxpbOIojmtHRJJGu3VTc=;
	b=Gwk29Yfh2ty5MoiPe9Vu0sDK902l8YxwRuSCsR21fxlY/GYvhxf0poi5sn932Oat2Y
	AoJsrm+H5t9c+WgMQPMOf5BRSCIeh26O8w/oYWIqhQ/VEbaV1Z6yFBllVIPBS5rbqNl7
	8Bcf+wjdeq9YKW9xPeIUW3u6F9Ig+ZsX6mpjcPFWAI0xwxkFyMPxH8sWzod5Cy/EQ2Xx
	QdgAK0DrhCO0kgDpil9MdUjgDR2FkZksD4cFeyxcGPoUUAy5NFTDMqzWtNhh1hNN2Say
	bh2P6/b3giq57028PCsiVJEhNSSaEq+2GY8OG8VzVbeDDnmTSfvk417FOw3gO39IWo1R
	fnbA==
X-Received: by 10.14.0.133 with SMTP id 5mr47579892eeb.29.1356267794026;
	Sun, 23 Dec 2012 05:03:14 -0800 (PST)
Received: from localhost.localdomain (p5B0A1394.dip.t-dialin.net.
	[91.10.19.148])
	by mx.google.com with ESMTPS id f49sm34747114eep.12.2012.12.23.05.03.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 23 Dec 2012 05:03:13 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 23 Dec 2012 14:02:40 +0100
Message-Id: <1356267761-15152-12-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1356267761-15152-1-git-send-email-schnitzeltony@googlemail.com>
References: <1356267761-15152-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-xfce/meta-gnome 11/12] samba: add new package libwbclient to avoid libsmbclient dragging in samba
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
X-List-Received-Date: Sun, 23 Dec 2012 13:18:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

To find which dependency dragged in samba in folder image readelf was
performed:

> readelf -d usr/lib/libsmbclient.so

Dynamic section at offset 0x4bfec0 contains 36 entries:
  Tag        Type                         Name/Value
 0x00000001 (NEEDED)                     Shared library: [libc.so.6]
 0x00000001 (NEEDED)                     Shared library: [libtalloc.so.2]
 0x00000001 (NEEDED)                     Shared library: [libtdb.so.1]
 0x00000001 (NEEDED)                     Shared library: [libwbclient.so.0]
 0x00000001 (NEEDED)                     Shared library: [libresolv.so.2]
 0x00000001 (NEEDED)                     Shared library: [libnsl.so.1]
 0x00000001 (NEEDED)                     Shared library: [libdl.so.2]
 0x00000001 (NEEDED)                     Shared library: [librt.so.1]
 0x00000001 (NEEDED)                     Shared library: [libz.so.1]
 0x00000001 (NEEDED)                     Shared library: [libpthread.so.0]
 0x00000001 (NEEDED)                     Shared library: [libgcc_s.so.1]
 0x0000000e (SONAME)                     Library soname: [libsmbclient.so.0]

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-connectivity/samba/samba-basic.inc |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-connectivity/samba/samba-basic.inc b/meta-oe/recipes-connectivity/samba/samba-basic.inc
index d1b905a..af4e04e 100644
--- a/meta-oe/recipes-connectivity/samba/samba-basic.inc
+++ b/meta-oe/recipes-connectivity/samba/samba-basic.inc
@@ -9,7 +9,7 @@ EXTRA_OECONF += "\
         --without-ldap \
         --without-krb5"
 
-PACKAGES =+ "libwinbind libwinbind-dbg winbind winbind-dbg libnetapi libtdb libsmbsharemodes libsmbclient libsmbclient-dev cifs cifs-doc swat"
+PACKAGES =+ "libwbclient libwinbind libwinbind-dbg winbind winbind-dbg libnetapi libtdb libsmbsharemodes libsmbclient libsmbclient-dev cifs cifs-doc swat"
 
 FILES_winbind-dbg = "${libdir}/idmap/.debug/*.so \
                      ${libdir}/security/.debug/pam_winbind.so \
@@ -28,6 +28,7 @@ FILES_${PN}-dbg += "${libdir}/vfs/.debug/*.so \
                     ${libdir}/security/.debug/pam_smbpass.so \
 "
 
+FILES_libwbclient = "${libdir}/libwbclient.so.*"
 FILES_libnetapi = "${libdir}/libnetapi.so.*"
 FILES_libsmbsharemodes = "${libdir}/libsmbsharemodes.so.*"
 FILES_libtdb = "${libdir}/libtdb.so.*"
-- 
1.7.4.4



