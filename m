Received: from [213.36.80.91] (helo=mail.libertysurf.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jeremy.laine@bolloretelecom.eu>) id 1Jc2So-0006Cs-5s
	for openembedded-devel@lists.openembedded.org;
	Wed, 19 Mar 2008 18:52:36 +0100
Received: from blini.bolloretelecom.eu (62.210.194.121) by
	mail.libertysurf.net (7.3.118.8)
	id 479F72DE014CB236 for openembedded-devel@lists.openembedded.org;
	Wed, 19 Mar 2008 19:54:41 +0100
Received: from [192.168.95.65] (unknown [192.168.95.65])
	by blini.bolloretelecom.eu (Postfix) with ESMTP id DC68123E54
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Mar 2008 18:52:27 +0100 (CET)
Message-ID: <47E152DB.4050208@bolloretelecom.eu>
Date: Wed, 19 Mar 2008 18:52:27 +0100
From: =?ISO-8859-1?Q?Jeremy_Lain=E9?= <jeremy.laine@bolloretelecom.eu>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.8.0.13pre) Gecko/20080208 Thunderbird/1.5.0.14pre
	Mnenhy/0.7.5.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <BDAD3E9D-ACB9-433B-81C7-F727545ACCFE@student.utwente.nl>
In-Reply-To: <BDAD3E9D-ACB9-433B-81C7-F727545ACCFE@student.utwente.nl>
X-Enigmail-Version: 0.94.2.0
X-SA-Exim-Connect-IP: 213.36.80.91
X-SA-Exim-Mail-From: jeremy.laine@bolloretelecom.eu
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] move to opkg / md5 error on big-endian machine
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 19 Mar 2008 17:52:36 -0000
X-Groupsio-MsgNum: 4705
Content-Type: multipart/mixed; boundary="------------010307050208040809020201"

--------------010307050208040809020201
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: Quoted-Printable

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

opkg systematically fails to check the MD5 checksums on big-endian
targets. The reason for this is that md5.c was taken from glibc, and
it only sets the endianness correctly if _LIBC is defined:

#ifdef _LIBC
# include <endian.h>
# if __BYTE_ORDER =3D=3D __BIG_ENDIAN
#  define WORDS_BIGENDIAN 1
# endif
[snip]
#endif

Attached is a patch thats sets WORDS_BIGENDIAN on big-endian machines
without touching the code, and fixes the MD5 errors I was getting.

Rather than putting this patch into OE, maybe we should push this
upstream?

Cheers,

- --
Jeremy LAINE
Bollor=E9 telecom | 11bis, rue Scribe | F-75009 Paris
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFH4VLbCL1n3lVB9EYRArVFAJ9M22nqlh2jqV+OKg7HqNsgIC/hBgCfa2R8
VdUuk6OIo5W72sXs/8tQ8G8=3D
=3DDyiG
-----END PGP SIGNATURE-----


--------------010307050208040809020201
Content-Type: text/x-diff;
 name="check_endianness.patch"
Content-Disposition: inline;
 filename="check_endianness.patch"
Content-Transfer-Encoding: 7Bit

diff -urN opkg.orig/configure.ac opkg/configure.ac
--- opkg.orig/configure.ac	2008-03-19 10:43:40.000000000 +0100
+++ opkg/configure.ac	2008-03-19 18:37:08.000000000 +0100
@@ -93,6 +93,10 @@
 AC_TYPE_SIZE_T
 AC_CHECK_MEMBERS([struct stat.st_rdev])
 
+# Checks endianness
+AC_C_BIGENDIAN(ENDIAN_CFLAGS="-DWORDS_BIGENDIAN=1",)
+AC_SUBST(BIGENDIAN_CFLAGS)
+
 # Don't do annoying tests that don't work when cross-compiling, just trust them.
 # The AC_FUNC_MEMCMP test doesn't work during a cross-compile, disable.
 # AC_FUNC_MEMCMP
diff -urN opkg.orig/libopkg/Makefile.am opkg/libopkg/Makefile.am
--- opkg.orig/libopkg/Makefile.am	2008-03-19 10:43:40.000000000 +0100
+++ opkg/libopkg/Makefile.am	2008-03-19 18:36:19.000000000 +0100
@@ -59,7 +59,7 @@
 	$(opkg_cmd_sources) $(opkg_db_sources) \
 	$(opkg_util_sources) $(opkg_list_sources)
 
-libopkg_la_CFLAGS = $(ALL_CFLAGS)  $(CURL_CFLAGS) $(GPGME_CFLAGS)
+libopkg_la_CFLAGS = $(ALL_CFLAGS) $(BIGENDIAN_CFLAGS) $(CURL_CFLAGS) $(GPGME_CFLAGS)
 lib_LTLIBRARIES = libopkg.la
 
 

--------------010307050208040809020201
Content-Type: application/octet-stream;
 name="check_endianness.patch.sig"
Content-Disposition: attachment;
 filename="check_endianness.patch.sig"
Content-Transfer-Encoding: Base64

iD8DBQBH4VLbCL1n3lVB9EYRAryDAJ9ztwu+ycKIkuo7GY8d8ffNo/p6IQCcCDspkO2FD4Cm3p2l
eaYN+r29or4=

--------------010307050208040809020201--
