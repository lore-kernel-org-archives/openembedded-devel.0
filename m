Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1Hh5g8-0003wH-Qe
	for openembedded-devel@openembedded.org; Thu, 26 Apr 2007 17:14:40 +0200
Received: from [172.20.1.5] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l3QF5lLr025497 for <openembedded-devel@openembedded.org>;
	Thu, 26 Apr 2007 17:05:47 +0200
Message-ID: <4630BFCC.3070807@dominion.kabel.utwente.nl>
Date: Thu, 26 Apr 2007 17:05:48 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.10 (Macintosh/20070221)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
References: <c384c5ea0704260513h1e7e2283hfd439a2ff1421ff4@mail.gmail.com>
In-Reply-To: <c384c5ea0704260513h1e7e2283hfd439a2ff1421ff4@mail.gmail.com>
X-Enigmail-Version: 0.94.2.0
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: shared libraries RPATH causes overhead
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 26 Apr 2007 15:14:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Leon Woestenberg schreef:
> [resent, seems to be queued or lost earlier]
> 
> Hello,
> 
> During an strace run on my target, I noticed a considerable amount of
> attempts to load shared libraries from their RPATH location (which is
> the preferred location over what the linker thinks).
> 
> objdump -x libfontconfig.so.1  | grep RPATH
> /home/leon/sandbox/e520/openembedded/build/tmp/staging/i686-angstrom-linux/lib
> 
> This results in considerable overhead during loading of shared libraries.
> 
> Koen secretly told me that there had been a masterplan amongst those
> who may call themselves core developer to fix these paths.
> 
> I'm curious about what the fix would incur.

I don't have a fix, but insane.bbclass can be extended to notice rpath pointing to staging
instead of workdir*:

#
# old_revision [ba162bf6372784bad9177dc8a7fa8a66c9e665c4]
#
# patch "classes/insane.bbclass"
#  from [f04e47e34a23d6b9c9ada6d369e9432d5f400054]
#    to [9eaa617c34be8ac56b997f6c9e464adaad5b9187]
#
============================================================
- --- classes/insane.bbclass      f04e47e34a23d6b9c9ada6d369e9432d5f400054
+++ classes/insane.bbclass      9eaa617c34be8ac56b997f6c9e464adaad5b9187
@@ -202,10 +202,11 @@ def package_qa_check_rpath(file,name,d):
     """
     import bb, os
     scanelf = os.path.join(bb.data.getVar('STAGING_BINDIR_NATIVE',d,True),'scanelf')
- -    bad_dir = bb.data.getVar('TMPDIR', d, True) + "/work"
+    bad_dir_test = bb.data.getVar('TMPDIR', d, True) + "/work"
+    bad_dir = bb.data.getVar('TMPDIR', d, True)
     if not os.path.exists(scanelf):
         bb.fatal("Can not check RPATH scanelf not found")
- -    if not bad_dir in bb.data.getVar('WORKDIR', d, True):
+    if not bad_dir_test in bb.data.getVar('WORKDIR', d, True):
         bb.fatal("This class assumed that WORKDIR is ${TMPDIR}/work... Not doing any check")

     output = os.popen("%s -Byr %s" % (scanelf,file))


regards,

Koen


* assuming staging in inside TMPDIR


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFGML/MMkyGM64RGpERAjY6AJ4qOBp8Rbh2b4O7qqXdvC8AKTMWjgCfVsz8
nQesWgdduLHGFvu6P0I9pOI=
=/Amo
-----END PGP SIGNATURE-----


