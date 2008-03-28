Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1JfB7G-0000EI-0r
	for openembedded-devel@openembedded.org; Fri, 28 Mar 2008 10:43:18 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1JfB7D-00022q-Lw
	for openembedded-devel@openembedded.org; Fri, 28 Mar 2008 09:43:15 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Fri, 28 Mar 2008 09:43:15 +0000
Received: from koen by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Fri, 28 Mar 2008 09:43:15 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
Date: Fri, 28 Mar 2008 10:43:08 +0100
Message-ID: <fsiejd$340$1@ger.gmane.org>
References: <1206638249.4514.57.camel@dax.rpnet.com>	<fsgsaq$nqf$1@ger.gmane.org>
	<47EC2661.90702@bolloretelecom.eu>	<20080327230928.GD11881@smtp.west.cox.net>	<c384c5ea0803271730j4c7b4c64uc7584fbaa9895fb5@mail.gmail.com>
	<1206696033.5029.9.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Thunderbird 2.0.0.12 (Macintosh/20080213)
In-Reply-To: <1206696033.5029.9.camel@dax.rpnet.com>
X-Enigmail-Version: 0.95.6
Sender: news <news@ger.gmane.org>
Subject: Re: ipkg/opkg offical response
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
X-List-Received-Date: Fri, 28 Mar 2008 09:43:18 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Richard Purdie schreef:
| On Fri, 2008-03-28 at 01:30 +0100, Leon Woestenberg wrote:
|> On Fri, Mar 28, 2008 at 12:09 AM, Tom Rini
<trini@kernel.crashing.org> wrote:
|>>  I'll ask the silly qustion.  Given that mkimage hasn't changed in I
|>>  don't know how long, why are both providing it?  Just to save on
sources
|>>  downloaded?  Did OM really change mkimage?
|>>
|> Good question, thanks for asking!
|>
|> In fact, I have seen some of the kernel recipes seen switching between
|> openmoko's and non-openmoko u-boot-tools, with and without breakage in
|> the past.
|>
|> Could the openmoko guys please describe what grants their version to
exist? :-)
|
| As far as I know, the mkimage tool hasn't changed in a long time so we
| should be able to share one common version.

The only difference is the number of archs it supports, IIRC bfin and
avr32 may require $vendor mkimage since upstream doesn't support those
yet (again, IIRC).

| Using a simpler recipe kind
| of makes sense but I'll let the openmoko people answer.

The openmoko people have very little to do with openmoko-mkimage, they
try to remove it every now and then and I yell at them for that :) I
created that since _all_ existing uboot recipes were either machine
specific or plain broken. So I created a frozen openmoko-mkimage (all
patches are in OE, SRC_URI fixed to certain rev, etc) that is known to
work and doesn't break.

So if the (new) mkimage-native recipe is generic and non-broken, we
should switch to that.

| One way forward might be to DEPEND on virtual/mkimage-native. The
| various uboot providers can then PROVIDE this and it becomes distro
| policy which one is selected?

If someone spends some time to teach mkimage about avr32 (might already
be upstream) there shouldn't be a need for virtual/mkimage-native IMO.

regards,

Koen

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFH7L2sMkyGM64RGpERAptVAJ9UPo2nH5k61Wgq7SZcz0cENJ3lFQCeNZLa
EqAOJ0uyuvpWqadGjYRTCaI=
=AkT1
-----END PGP SIGNATURE-----



