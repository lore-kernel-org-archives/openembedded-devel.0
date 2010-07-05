Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1OVajP-0001YP-A2
	for openembedded-devel@lists.openembedded.org;
	Mon, 05 Jul 2010 03:44:24 +0200
Received: by pvg13 with SMTP id 13so250079pvg.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 04 Jul 2010 18:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=zBHuXh6cQnBXvEboZ9+HPL8ipVP7v31SakvJqZbxnSY=;
	b=ir9CqndjyPRvxFSKHKWgNs/1IigR+T6DnrB49Ts85dJymzCZjzJGJc5kVlF7ffjvRU
	yZp8B/t62rkSeifJ4oQWEGHKOKvk64YP6du8vC4JCKekxqBlpOzBPjjdali6Tnb7WrQ/
	eGOi5pyCreLyx91Rk5cok4UZatcDbpzk7U6ZE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=J38osKInRnwfH1cGgkwm/utqHWKDaI1wrbwf1nPJF1uWAPO+uddBz7ouAqNpbvEaFa
	9WF2I/RmYu6Z5kk+SJMJaZW4mJxs876GWn4fvxOiFzlfOL0uG9KCt8s3TTM8tzYnCALL
	dY7GcLXHlbcmU9CKdACBK+mX2hUHWupajqSzs=
Received: by 10.115.59.1 with SMTP id m1mr2341243wak.99.1278293973711;
	Sun, 04 Jul 2010 18:39:33 -0700 (PDT)
Received: from [10.0.0.4] (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id
	c10sm55559425wam.13.2010.07.04.18.39.31
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 04 Jul 2010 18:39:33 -0700 (PDT)
Message-ID: <4C3137CF.8090503@gmail.com>
Date: Mon, 05 Jul 2010 11:09:27 +0930
From: Graham Gower <graham.gower@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.9) Gecko/20100401 Thunderbird/3.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] gpsd_2.94.bb: fix CROSS COMPILE badness
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
X-List-Received-Date: Mon, 05 Jul 2010 01:44:24 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

configure.ac shouldn't check the host system for includes/libraries,
disable checking for libusb.

Signed-off-by: Graham Gower <graham.gower@gmail.com>
---
 .../gpsd/files/2.94-remove-libusb-badness.patch    |   32 ++++++++++++++++++++
 recipes/gpsd/gpsd_2.94.bb                          |    5 ++-
 2 files changed, 35 insertions(+), 2 deletions(-)
 create mode 100644 recipes/gpsd/files/2.94-remove-libusb-badness.patch

diff --git a/recipes/gpsd/files/2.94-remove-libusb-badness.patch b/recipes/gpsd/files/2.94-remove-libusb-badness.patch
new file mode 100644
index 0000000..1517ede
--- /dev/null
+++ b/recipes/gpsd/files/2.94-remove-libusb-badness.patch
@@ -0,0 +1,32 @@
+--- gpsd-2.94/configure.ac.orig	2010-07-05 11:01:08.000000000 +0930
++++ gpsd-2.94/configure.ac	2010-07-05 11:01:44.000000000 +0930
+@@ -243,18 +243,18 @@
+ # /usr/include/libusb-*/libusb.h
+ #
+ AC_MSG_CHECKING([for libusb version >= 1.0.0])
+-if test -f /usr/include/libusb-*/libusb.h ;
+-then
+-    usb=$(basename /usr/lib/libusb-*.so | sed -e s/\.so// -e s/^lib//)
+-    AC_DEFINE([HAVE_LIBUSB], [], [will link with -l$usb; ])
+-    LIBUSB=-l${usb}
+-    INCUSB=-I/usr/include/lib${usb}
+-    ac_libusb=yes
+-    AC_MSG_RESULT([found.])
+-else
+-    ac_libusb=yes
++#if test -f /usr/include/libusb-*/libusb.h ;
++#then
++#    usb=$(basename /usr/lib/libusb-*.so | sed -e s/\.so// -e s/^lib//)
++#    AC_DEFINE([HAVE_LIBUSB], [], [will link with -l$usb; ])
++#    LIBUSB=-l${usb}
++#    INCUSB=-I/usr/include/lib${usb}
++#    ac_libusb=yes
++#    AC_MSG_RESULT([found.])
++#else
++    ac_libusb=no
+     AC_MSG_RESULT([not found.])
+-fi
++#fi
+ AC_SUBST(LIBUSB)
+ AC_SUBST(INCUSB)
+ 
diff --git a/recipes/gpsd/gpsd_2.94.bb b/recipes/gpsd/gpsd_2.94.bb
index 5cf8b2e..2d63b32 100644
--- a/recipes/gpsd/gpsd_2.94.bb
+++ b/recipes/gpsd/gpsd_2.94.bb
@@ -1,9 +1,10 @@
 require gpsd.inc
 
-SRC_URI += "file://libtool.patch"
+SRC_URI += "file://libtool.patch \
+	    file://2.94-remove-libusb-badness.patch"
 SRC_URI[gpsd.md5sum] = "ce70bcd707ac1df861d4c72f503c09d1"
 SRC_URI[gpsd.sha256sum] = "1520b87d106d198aa42137db4b230615dbd0d06b04e6fcc84e010172fba2da41"
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 PARALLEL_MAKE = ""
-- 
1.7.1



