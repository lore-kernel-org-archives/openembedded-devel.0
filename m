Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1HhAAy-0000dm-0T
	for openembedded-devel@openembedded.org; Thu, 26 Apr 2007 22:02:51 +0200
Received: from [172.20.1.5] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l3QJrsLr032355 for <openembedded-devel@openembedded.org>;
	Thu, 26 Apr 2007 21:53:55 +0200
Message-ID: <46310354.9070205@dominion.kabel.utwente.nl>
Date: Thu, 26 Apr 2007 21:53:56 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.10 (Macintosh/20070221)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
References: <c384c5ea0704261001x7756fd58yc637a6b1aec12440@mail.gmail.com>
	<4630FBDF.2060004@dominion.kabel.utwente.nl>
In-Reply-To: <4630FBDF.2060004@dominion.kabel.utwente.nl>
X-Enigmail-Version: 0.94.2.0
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: HEADS UP: insane.bbclass will now detect and stop the build on	wrong RPATHs.
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
X-List-Received-Date: Thu, 26 Apr 2007 20:02:55 -0000
Content-Type: multipart/mixed; boundary="------------060505010605080802020006"

--------------060505010605080802020006
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Koen Kooi schreef:
> Leon Woestenberg schreef:
>> Hello all,
> 
>> for those of you using insane.bbclass, it will now correctly detect
>> wrong RPATH's in shared libraries and fail on them.
> 
>> Unfortunately, as we have not fixed wrong RPATH's yet in our shared
>> library handling, this will cause builds using insane.bbclass to fail.
> 
>> See bug #2140.
> 
>> I hope to be able to fix the .so RPATH stuff as well, but any help is welcomed.
> 
> Attached patch replaces bogus rpaths with '/lib' inside insane.bbclass. There are several
> things wrong with this approach, but it's a start.

For one, bb.message doesn't exist.

updated patch attached.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFGMQNUMkyGM64RGpERAkymAKCjXS5XaosSdHvTEefmhc0PJgIrXwCdGRL/
PaUz8C7MxY/84UNWcBHcT48=
=/STS
-----END PGP SIGNATURE-----

--------------060505010605080802020006
Content-Type: text/x-patch; x-mac-type="0"; x-mac-creator="0";
 name="chrpath.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="chrpath.patch"

# 
# old_revision [4363d4f2067c14e0433c8a93cf6595a62ffd8ea1]
# 
# patch "classes/insane.bbclass"
#  from [3a03bd01885af7a8749b8d7c891e968eadae8bea]
#    to [52bd5e7c8bced0a26f41f5a38b5f46601b40d988]
# 
============================================================
--- classes/insane.bbclass	3a03bd01885af7a8749b8d7c891e968eadae8bea
+++ classes/insane.bbclass	52bd5e7c8bced0a26f41f5a38b5f46601b40d988
@@ -202,10 +202,13 @@ def package_qa_check_rpath(file,name,d):
     """
     import bb, os
     scanelf = os.path.join(bb.data.getVar('STAGING_BINDIR_NATIVE',d,True),'scanelf')
+    chrpath = os.path.join(bb.data.getVar('STAGING_BINDIR_NATIVE',d,True),'chrpath')
     bad_dir = bb.data.getVar('TMPDIR', d, True) + "/work"
     bad_dir_test = bb.data.getVar('TMPDIR', d, True)
     if not os.path.exists(scanelf):
-        bb.fatal("Can not check RPATH scanelf not found")
+        bb.fatal("Can not check RPATH, scanelf (part of pax-utils-native) not found")
+    if not os.path.exists(chrpath):
+        bb.fatal("Can not fix RPATH, chrpath (part of chrpath-native) not found")
     if not bad_dir in bb.data.getVar('WORKDIR', d, True):
         bb.fatal("This class assumed that WORKDIR is ${TMPDIR}/work... Not doing any check")
 
@@ -215,7 +218,9 @@ def package_qa_check_rpath(file,name,d):
         if bad_dir_test in line:
             package_qa_write_error( 1, name, file, d)
             bb.error("QA Issue package %s contains bad RPATH %s in file %s" % (name, line, file))
-            return False
+            bb.note("Fixing RPATH for you in %s" % file)
+            os.popen("%s -r /lib %s" % (chrpath,file))
+            return True
     return True
 
 def package_qa_check_devdbg(path, name,d):

--------------060505010605080802020006--
