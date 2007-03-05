Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1HO780-0007fF-2t
	for openembedded-devel@openembedded.org; Mon, 05 Mar 2007 07:57:00 +0100
Received: from [172.20.1.5] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l256uvLr006931 for <openembedded-devel@openembedded.org>;
	Mon, 5 Mar 2007 07:56:57 +0100
Message-ID: <45EBBF38.4020704@dominion.kabel.utwente.nl>
Date: Mon, 05 Mar 2007 07:56:56 +0100
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.9 (Macintosh/20061207)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <407130732.20070227223500@gmail.com>	<1172609341.28406.169.camel@localhost.localdomain>	<1828813817.20070227233137@gmail.com>	<1172613830.28406.192.camel@localhost.localdomain>	<794972911.20070305013040@gmail.com>
	<1173051658.5832.26.camel@localhost.localdomain>
In-Reply-To: <1173051658.5832.26.camel@localhost.localdomain>
X-Enigmail-Version: 0.94.1.2
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: [RFC] base_less_or_equal() for numerical value testing in OE
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
X-List-Received-Date: Mon, 05 Mar 2007 06:57:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Richard Purdie schreef:
> On Mon, 2007-03-05 at 01:30 +0200, Paul Sokolovsky wrote:

>>>> hx4700: PACKAGE_EXTRA_ARCHS = "armv4 armv4t armv5te iwmmxt bigscreen"
>>>> h4000: PACKAGE_EXTRA_ARCHS = "armv4 armv4t armv5te iwmmxt smallscreen"
>>>>
>>>>   Voila, matching of actual bigsreen/smallscreen package will be done by
>>>> ipkg.
>>> No. Adding architectures for every machine feature is just insane.
>>   Well, I understand that I raise few features at the same time, and
>> it may be a bit confusing to follow thru them, but actual topic of all
>> this - how to improve machine metadata handling in OE.
>>
>>   So, I don't speak about adding virtual arch for every machine
>> feature, but *only* for the screen size. That's the machine feature
>> which seems as possibly calling for that - as it's not uncommon to
>> supply image resources for different resolutions (i.e. these
>> smallscreen/bigscreen arch packages won't be just for app), plus image
>> resources are usually big enough to warrant placement into own
>> package.
> 
> You only ask for screen size but I can guarantee that wouldn't be the
> last request. I'm dead set against this.

Me too, since you will get something like this:

application_1.4.5-r5_bigscreen.ipk
application_1.4.5-r5_ppc603e.ipk
application_1.4.5-r5_armv5te.ipk
application_1.4.5-r5_smallscreen.ipk

Now Marcin wants to install 'application' on his webpad and it doesn't run. Why? Because
'application_1.4.5-r5_bigscreen.ipk' secretly is ARM instead of x86.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFF6783MkyGM64RGpERAupWAJ9vHpWTx5ctFNIY0oyU/vm8TUFylgCaAzgE
17abF4sgH/AJjuCwhhEuCqs=
=D9V6
-----END PGP SIGNATURE-----


