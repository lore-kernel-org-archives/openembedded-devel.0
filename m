Received: from [212.27.42.30] (helo=smtp4-g19.free.fr)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jeremy.laine@bolloretelecom.eu>) id 1JdAS2-00005h-KN
	for openembedded-devel@lists.openembedded.org;
	Sat, 22 Mar 2008 21:36:27 +0100
Received: from smtp4-g19.free.fr (localhost.localdomain [127.0.0.1])
	by smtp4-g19.free.fr (Postfix) with ESMTP id 7865F3EA0CC
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Mar 2008 21:36:26 +0100 (CET)
Received: from sharky.jerryweb.org (vau75-7-82-234-248-119.fbx.proxad.net
	[82.234.248.119])
	by smtp4-g19.free.fr (Postfix) with ESMTP id 5BC6E3EA0BA
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Mar 2008 21:36:26 +0100 (CET)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by sharky.jerryweb.org (Postfix) with ESMTP id 347451840DA
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Mar 2008 21:38:00 +0100 (CET)
Message-ID: <47E56E28.2070800@bolloretelecom.eu>
Date: Sat, 22 Mar 2008 21:38:00 +0100
From: =?ISO-8859-1?Q?Jeremy_Lain=E9?= <jeremy.laine@bolloretelecom.eu>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.8.1.9) Gecko/20080109 Thunderbird/2.0.0.9 Mnenhy/0.7.5.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <BDAD3E9D-ACB9-433B-81C7-F727545ACCFE@student.utwente.nl>
	<47E152DB.4050208@bolloretelecom.eu>
In-Reply-To: <47E152DB.4050208@bolloretelecom.eu>
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
X-List-Received-Date: Sat, 22 Mar 2008 20:36:28 -0000
Content-Type: multipart/mixed; boundary="------------060406090503020101030604"

--------------060406090503020101030604
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Thanks for applying the patch to SVN! Unfortunately a typo crept into my
previous patch, attached is a diff against SVN which fixes it.

Cheers,
Jeremy

--------------060406090503020101030604
Content-Type: text/x-diff;
 name="fix-endianness.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="fix-endianness.patch"

Index: configure.ac
===================================================================
--- configure.ac	(revision 4241)
+++ configure.ac	(working copy)
@@ -94,7 +94,7 @@
 AC_CHECK_MEMBERS([struct stat.st_rdev])
 
 # Checks endianness
-AC_C_BIGENDIAN(ENDIAN_CFLAGS="-DWORDS_BIGENDIAN=1",)
+AC_C_BIGENDIAN(BIGENDIAN_CFLAGS="-DWORDS_BIGENDIAN=1",)
 AC_SUBST(BIGENDIAN_CFLAGS)
 
 # Don't do annoying tests that don't work when cross-compiling, just trust them.

--------------060406090503020101030604--
