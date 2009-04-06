Received: from [213.91.4.211] (helo=bart.wifirst.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jeremy.laine@bolloretelecom.eu>) id 1LqrpT-0006xm-9n
	for openembedded-devel@lists.openembedded.org;
	Mon, 06 Apr 2009 18:37:49 +0200
Received: from bart.wifirst.net (localhost [127.0.0.1])
	by bart.wifirst.net (Postfix) with ESMTP id 57C6D5FEDE
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Apr 2009 18:34:54 +0200 (CEST)
Received: from bart.wifirst.net (localhost [127.0.0.1])
	by bart.wifirst.net (Postfix) with ESMTP id A6A6A5FF5D
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Apr 2009 18:34:52 +0200 (CEST)
Received: from blini.bolloretelecom.eu (smtp.bolloretelecom.eu
	[62.210.194.121])
	by bart.wifirst.net (Postfix) with ESMTP id 882565FEDE
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Apr 2009 18:34:52 +0200 (CEST)
Received: from [192.168.95.73] (unknown [192.168.95.73])
	by blini.bolloretelecom.eu (Postfix) with ESMTPSA id 4F00523E4A
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Apr 2009 18:34:52 +0200 (CEST)
Message-ID: <49DA2F2C.60008@bolloretelecom.eu>
Date: Mon, 06 Apr 2009 18:34:52 +0200
From: =?ISO-8859-1?Q?Jeremy_Lain=E9?= <jeremy.laine@bolloretelecom.eu>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.8.1.19) Gecko/20090103 Thunderbird/2.0.0.19 Mnenhy/0.7.5.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Enigmail-Version: 0.95.0
X-Virus-Scanned: ClamAV using ClamSMTP
X-SA-Exim-Connect-IP: 213.91.4.211
X-SA-Exim-Mail-From: jeremy.laine@bolloretelecom.eu
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=5.0 tests=AWL,BAYES_00,RDNS_NONE,
	SPF_NEUTRAL autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [RFC] make "LDFLAGS ignored" QA errors fatal
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
X-List-Received-Date: Mon, 06 Apr 2009 16:37:49 -0000
X-Groupsio-MsgNum: 9137
Content-Type: multipart/mixed; boundary="------------090700000604090403000301"

--------------090700000604090403000301
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

I have spent quite some time cleaning up a bunch of recipes which were
triggering "LDFLAGS ignored" QA errors, and I don't really want to
have to do this again in the future. I suggest we stop whitelisting
this kind of QA error, using the attached patch.

To track down the faulty packages I have made use of oestats output
(note that not all QA errors are "LDFLAGS ignored"):

http://tinderbox.openembedded.net/packages/?qalog=3D1

In most cases, the problem is that recipes simply pass
- -L${STAGING_LIBDIR} as LDFLAGS instead of using the full ${LDFLAGS}
variable. The result is that flags such as --hash-style=3Dgnu are
getting ignored.

What are your thoughts?

- --
Jeremy LAINE
Bollor=E9 telecom | 11bis, rue Scribe | F-75009 Paris
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iEYEARECAAYFAknaLysACgkQCL1n3lVB9EZgbQCgoQpUwdae7elUHWag8wqAROY7
D0sAmQGjH0zrO8OxgI5MPfSAshQz9Fuu
=3Dto11
-----END PGP SIGNATURE-----


--------------090700000604090403000301
Content-Type: text/x-diff;
 name="fatal_ldflags.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="fatal_ldflags.patch"

diff --git a/classes/insane.bbclass b/classes/insane.bbclass
index 3e519c3..9fc5f07 100644
--- a/classes/insane.bbclass
+++ b/classes/insane.bbclass
@@ -184,7 +184,7 @@ def package_qa_make_fatal_error(error_class, name, path,d):
 
     TODO: Load a whitelist of known errors
     """
-    return not error_class in [0, 5, 7, 9]
+    return not error_class in [0, 5, 7]
 
 def package_qa_write_error(error_class, name, path, d):
     """

--------------090700000604090403000301
Content-Type: application/octet-stream;
 name="fatal_ldflags.patch.sig"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="fatal_ldflags.patch.sig"

iEYEABECAAYFAknaLysACgkQCL1n3lVB9EYqqACfT+TaGW7/cDCO5kGXatXo1oxQPqgAn1Z7dM8u
cRBg3p5vubIBdGr5qtFN

--------------090700000604090403000301--
