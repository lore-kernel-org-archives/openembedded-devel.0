Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1Gl841-0002oj-4o
	for openembedded-devel@openembedded.org; Fri, 17 Nov 2006 19:03:45 +0100
Received: from [172.20.0.22] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	kAHI1Fox020607 for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Nov 2006 19:01:15 +0100
Message-ID: <455DF8E8.4060801@dominion.kabel.utwente.nl>
Date: Fri, 17 Nov 2006 19:01:12 +0100
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.8 (Macintosh/20061025)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <d46153c40611170647m2be6b5f6jd7cbe86ccdfc5dc@mail.gmail.com>	<41e5b4c20611170737p4b1138c0m8798ea67e67d449@mail.gmail.com>	<d46153c40611170917k1dd90d89ob384306caeada009@mail.gmail.com>	<74d0deb30611170944j7b93a8ecm3b2b036111a0b6dd@mail.gmail.com>
	<d46153c40611170953g28ddc98dp91bcd1944f171ede@mail.gmail.com>
In-Reply-To: <d46153c40611170953g28ddc98dp91bcd1944f171ede@mail.gmail.com>
X-Enigmail-Version: 0.94.1.2
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: Problem building dbus-glib-0.72
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
X-List-Received-Date: Fri, 17 Nov 2006 18:03:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Andrew Paulsen schreef:
>> I think dbus-glib 0.72 needs dbus >= 0.94.
>> The dbus-1.0 in the include path only denotes the protocol version.
>>
>> regards
>> Philipp
>
> Ok, I'll rephrase my question then.  How do I change the package
> versions that are being built?
>
> Again, my local.conf contains:
> MACHINE = "compulab-pxa270"
> DISTRO = "familiar-unstable"
>
> and I'm trying to "bitbake gpe-image"

Familiar is unmaintained in OE, so your error messages don't surprise us.

You could try

DISTRO=angstrom-2007.1
DISTRO=celinux-test
DISTRO=generic
DISTRO=openzaurus-unstable

To get a distro that regularly checked for problems.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFFXfjoMkyGM64RGpERAtaiAKCMvS1ZIhFUXepS/WmcVx+JUHbhaQCfbvj6
ZBxWeLlFiSK/YTc45Ulezpo=
=xN40
-----END PGP SIGNATURE-----


