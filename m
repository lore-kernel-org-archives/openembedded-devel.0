Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OWGC6-0001Em-7T for openembedded-devel@lists.openembedded.org;
	Wed, 07 Jul 2010 00:00:47 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OWG7R-0001Pz-5d for openembedded-devel@lists.openembedded.org;
	Tue, 06 Jul 2010 23:55:57 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Jul 2010 23:55:57 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Jul 2010 23:55:57 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 06 Jul 2010 23:55:49 +0200
Message-ID: <i108p5$hd$1@dough.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.10) Gecko/20100611 Shredder/3.0.6pre
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: commit 4d6a63850b4dc7ca2f060aedda26ddf4efa0e5cc
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
X-List-Received-Date: Tue, 06 Jul 2010 22:00:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Things like this:

+LIBC = "glibc"
+ANGSTROMLIBC = "${LIBC}"

+PREFERRED_VERSION_gcc-cross = "4.1.2"
+PREFERRED_VERSION_gcc-cross-initial = "4.1.2"
+PREFERRED_VERSION_gcc-cross-intermediate = "4.1.2"
+PREFERRED_VERSION_binutils = "2.17.50.0.12"
+PREFERRED_VERSION_binutils-cross = "2.17.50.0.12"
+PREFERRED_VERSION_glibc = "2.5"
+PREFERRED_VERSION_glibc-initial = "2.5"

+PREFERRED_VERSION_busybox_nios2 = "1.13.2"

+ASSUME_PROVIDED += "linux-libc-headers-native"

do NOT belong in a machine.conf (or machine include). Those belong in
the distro (or local.conf), not in the machine.

So please, move the offending bits into a distro include (minus the
assume provided) to stop this kind of bad example from spreading further.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMM6ZlMkyGM64RGpERAh0WAKCCFMbPN9oeqRa89Kfn5LBlhCCFmgCglgkF
WOZqYLRBYTgof3G9nIgyYUQ=
=iST9
-----END PGP SIGNATURE-----



