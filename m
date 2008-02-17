Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <k.kooi@student.utwente.nl>) id 1JQgkZ-0002zq-BG
	for openembedded-devel@openembedded.org; Sun, 17 Feb 2008 11:28:01 +0100
Received: from Powerbook-2.local (vpn006013.vpn.utwente.nl [130.89.6.13])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	m1HARMtS002341 for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Feb 2008 11:27:23 +0100
Message-ID: <47B80C0A.9060900@student.utwente.nl>
Date: Sun, 17 Feb 2008 11:27:22 +0100
From: Koen Kooi <k.kooi@student.utwente.nl>
User-Agent: Thunderbird 2.0.0.9 (Macintosh/20071031)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
References: <E1JQfDo-0001p4-TE@linuxtogo.org>
	<20080217114846.0352fd91@widy.localdomain>
In-Reply-To: <20080217114846.0352fd91@widy.localdomain>
X-Enigmail-Version: 0.95.6
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	servicedesk@icts.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-SA-Exim-Connect-IP: 130.89.2.9
X-SA-Exim-Mail-From: k.kooi@student.utwente.nl
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: org.oe.dev h5000: ship all kernel-modules and at76_usb
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
X-List-Received-Date: Sun, 17 Feb 2008 10:28:01 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Paul Sokolovsky schreef:
| Hello,
|
| On Sun, 17 Feb 2008 09:50:04 +0100
| "koen commit"
<openembedded-commits-ZwoEplunGu3dfDuKDZ/zN51Ccm5ICvs9@public.gmane.org>
wrote:
|
|> h5000: ship all kernel-modules and at76_usb
|>
|> Author: koen-EbJVxxdVoWb2StjH6ZfwpA@public.gmane.org
|> Branch: org.openembedded.dev
|> Revision: 6448d171f98047531cbca187171b0d2bdd62a261
|> ViewMTN:
|>
http://monotone.openembedded.org/revision/info/6448d171f98047531cbca187171b0d2bdd62a261
|> Files: 1
|> conf/machine/h5000.conf
|> Diffs:
|>
|> +# Ship complete set of modules ('kernel-modules') for easier debug
|> purposes
|> -MACHINE_EXTRA_RRECOMMENDS = " kernel-module-h5400-lcd \
|> +MACHINE_EXTRA_RRECOMMENDS = " kernel-modules \
| []
|
| I hope that when debug purposes will finish, this will be removed,

It will

| because it's not good at all, as more and more modules are being
| enabled, and there're already quite a few megs of them.

I did this with the 'large' size of the rootfs in mind (32MB / + 16MB
/home), so it's safe for now. Any volunteers to make a complete list of
modules the h5000 series can use (I'm missing h5000-bt and ipaq-sleeve
for certain right now)?

regards,

Koen



- --
koen@dominion.kabel.utwente.nl will go go away in december 2007, please
use k.kooi@student.utwente.nl instead.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFHuAwJMkyGM64RGpERAjfgAJ96GQJPS0TCaFF0T0T7S4ivpvEQzgCfdYTq
duUY4AXZAoo8/o79dhmERls=
=0NMG
-----END PGP SIGNATURE-----


