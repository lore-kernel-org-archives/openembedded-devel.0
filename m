Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1GrB6E-0000Gc-QX
	for openembedded-devel@openembedded.org; Mon, 04 Dec 2006 11:31:02 +0100
Received: from [172.20.1.5] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	kB4AUEox027627 for <openembedded-devel@lists.openembedded.org>;
	Mon, 4 Dec 2006 11:30:14 +0100
Message-ID: <4573F8B3.3070207@dominion.kabel.utwente.nl>
Date: Mon, 04 Dec 2006 11:30:11 +0100
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.8 (Macintosh/20061025)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <c384c5ea0612031500o3ee66a23x89d72a948f418532@mail.gmail.com>
In-Reply-To: <c384c5ea0612031500o3ee66a23x89d72a948f418532@mail.gmail.com>
X-Enigmail-Version: 0.94.1.2
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: Recent OBJDUMP changes
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
X-List-Received-Date: Mon, 04 Dec 2006 10:31:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Leon Woestenberg schreef:
> Hello,
> 
> I seem to hit upon a recent change involving finding shlib
> dependencies using the objdump | grep NEEDED approach by Graeme
> Gregory/XorA:
> 
> http://www.openembedded.org/viewmtn/revision.psp?id=1fb8812d36f505cfabe9ee2335441ada60e32f83
> 
> Shouldn't (BUILD_)OBJDUMP be defined instead with a BUILD_PREFIX?
> 
> OBJDUMP uses HOST_PREFIX, which seems undefined during packaging
> (using package_ipk).

I have something like this:

- --- conf/bitbake.conf   a55e0d456ecb5fa95185e35580c90bcc9513ed8d
+++ conf/bitbake.conf   e3d238d78a95629037ad0f48ce24e3a7382e540e
@@ -454,3 +454,6 @@ COMBINED_FEATURES = "\
     ${@base_both_contain("DISTRO_FEATURES", "MACHINE_FEATURES", "usbgadget", d)} \
     ${@base_both_contain("DISTRO_FEATURES", "MACHINE_FEATURES", "usbhost", d)}"

+
+export OBJDUMP := "${HOST_PREFIX}objdump"
+


That should fix the issues, but isn't the right way.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFFc/izMkyGM64RGpERAjhhAJ0f60RLRLZFi85k9fKplwcNEFDW5QCgiNAp
uIxZ+fPMroGwGqnpXg63Fww=
=C+Oa
-----END PGP SIGNATURE-----


