Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1GuEsi-0004Pw-3E
	for openembedded-devel@openembedded.org; Tue, 12 Dec 2006 22:09:44 +0100
Received: from [172.20.1.5] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	kBCL7uLr014369 for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Dec 2006 22:07:56 +0100
Message-ID: <457F1A29.4040306@dominion.kabel.utwente.nl>
Date: Tue, 12 Dec 2006 22:07:53 +0100
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.8 (Macintosh/20061025)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <E1GuDwk-0002kI-IJ@linuxtogo.org>	<457F1191.2050208@dominion.kabel.utwente.nl>	<26264111.20061212224755@gmail.com>
	<193365758.20061212220007@vanille-media.de>
In-Reply-To: <193365758.20061212220007@vanille-media.de>
X-Enigmail-Version: 0.94.1.2
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: [oe-commits] org.oe.dev removal.txt: Push bluez*2.*	removal to a month later, as it is known to be used by OPIE.
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
X-List-Received-Date: Tue, 12 Dec 2006 21:09:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Michael 'Mickey' Lauer schreef:
> Paul Sokolovsky wrote:
>>> You're free to re-add the fixed version that doesn't break apps depending on bluez-libs,
>>> but not the broken version.
> 
>>   I'll probably will eat my dogfood of maintainer of a bit bitrotted
>> stuff, and won't put outdated stuff back, but will look into
>> upgrading OPIE to bluez3, when I get to that.
> 
> Not much action in upgrading necessary. The issue was (and still
> remains) 

actually, no

>that bluez3 depends on dbus which in turn brings glib 

No, dbus doesn't bring in glib since dbus >0.71, since the bindings were split out:
http://www.angstrom-distribution.org/repo/?action=details&pnm=dbus-1

> with it
> and this is relatively huge.

See above

> The advantage of Opie fitting into 14.5MB flash like on Sharp SL5500 would
> be void then.

You couldn't have done that anyway with the change to rtti and qte-mt.

So it it seems all the points raised aren't valid anymore.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFFfxopMkyGM64RGpERApgvAKCsfKbx4uhfBJEOT+Lp1JyE6niXDgCfazOi
RzO6LMU5oKmULqsGnj99xcY=
=+HA+
-----END PGP SIGNATURE-----


