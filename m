Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <k.kooi@student.utwente.nl>) id 1Jbvtb-0004wo-EJ
	for openembedded-devel@openembedded.org; Wed, 19 Mar 2008 11:51:49 +0100
Received: from [172.20.1.5] (vpn006013.vpn.utwente.nl [130.89.6.13])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	m2JAp1eE026626 for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Mar 2008 11:51:05 +0100
Message-Id: <3D9ECBB5-7C37-4D62-8D15-F2F0673EB867@student.utwente.nl>
From: Koen Kooi <k.kooi@student.utwente.nl>
To: openembedded-devel@openembedded.org
Mime-Version: 1.0 (Apple Message framework v919.2)
Date: Wed, 19 Mar 2008 11:50:58 +0100
X-Pgp-Agent: GPGMail d51 (Leopard)
X-Mailer: Apple Mail (2.919.2)
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	servicedesk@icts.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-SA-Exim-Connect-IP: 130.89.2.8
X-SA-Exim-Mail-From: k.kooi@student.utwente.nl
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [RFC] error out on .la files pointing to ${WORKDIR}
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
X-List-Received-Date: Wed, 19 Mar 2008 10:51:49 -0000
Content-Type: text/plain; charset=US-ASCII; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi,

Things in stagin (e.g. .la files) point to ${WORKDIR} are broken and  
should die. If we want packaged-staging and rm_work to function we  
need to fix them. Since we are all lazy we need some incentive:

#
# old_revision [85e676eb4b64d66cb74acf6220f10c3942e2bd29]
#
# patch "classes/insane.bbclass"
#  from [0712df99743c442ed311e6b4d4be0d28f29d525f]
#    to [fa6b704f402965c8123dfa90527b5a11a8cd3288]
#
============================================================
- --- classes/insane.bbclass      0712df99743c442ed311e6b4d4be0d28f29d525f
+++ classes/insane.bbclass      fa6b704f402965c8123dfa90527b5a11a8cd3288
@@ -178,7 +178,7 @@ def package_qa_make_fatal_error(error_cl

      TODO: Load a whitelist of known errors
      """
- -    return not error_class in [0, 5, 7, 8]
+    return not error_class in [0, 5, 7]

  def package_qa_write_error(error_class, name, path, d):
      """

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFH4PAUMkyGM64RGpERAvkBAJ94969GpNP8493ezmnmV/wkkKd7mgCgqGNG
OKIsbKTFKRQbNI06cnE/32A=
=0rQM
-----END PGP SIGNATURE-----


