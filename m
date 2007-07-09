Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1I7zxa-0002lt-QX
	for openembedded-devel@openembedded.org; Mon, 09 Jul 2007 22:35:54 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1I7zsA-00018t-GV
	for openembedded-devel@openembedded.org; Mon, 09 Jul 2007 22:30:18 +0200
Received: from host86-131-236-115.range86-131.btcentralplus.com
	([86.131.236.115]) by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Mon, 09 Jul 2007 22:30:18 +0200
Received: from koen by host86-131-236-115.range86-131.btcentralplus.com with
	local (Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Mon, 09 Jul 2007 22:30:18 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
Date: Mon, 09 Jul 2007 21:30:10 +0100
Message-ID: <f6u5sj$jt6$1@sea.gmane.org>
References: <513012886.20070708041151@gmail.com>	<4310707680.20070709161925@vanille-media.de>	<20070709142544.GF2336@p3n3tr4t0r.internal>
	<200707091715.11794.openembedded@hrw.one.pl>
Mime-Version: 1.0
X-Complaints-To: usenet@sea.gmane.org
X-Gmane-NNTP-Posting-Host: host86-131-236-115.range86-131.btcentralplus.com
User-Agent: Thunderbird 2.0.0.4 (Macintosh/20070604)
In-Reply-To: <200707091715.11794.openembedded@hrw.one.pl>
X-Enigmail-Version: 0.95.2
Sender: news <news@sea.gmane.org>
Subject: Re: [RFC] Adding screen dimensions to machine configs
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
X-List-Received-Date: Mon, 09 Jul 2007 20:35:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Marcin Juszkiewicz schreef:
> Dnia poniedziałek, 9 lipca 2007, Graeme Gregory napisał:
>> On Mon, Jul 09, 2007 at 04:19:25PM +0200, Dr. Michael Lauer wrote:
>>>> Maybe a MACHINE_DEFAULT_ROTATION is also needed.
>>> I don't think so. What applications care about is if portrait or
>>> landscape is the common default and this is already encoded in HEIGHT
>>> and WIDTH.
>> Applications do care, a short snippet of /etc/X11/Xserver
>>
>>         "SHARP Shepherd" | "SHARP Husky" | "SHARP Corgi")
>>                 ARGS="$ARGS -dpi 200 -rgba rgb" ;;
>>         "SHARP Spitz" | "SHARP Akita" | "SHARP Borzoi")
>>                 ARGS="$ARGS -dpi 200 -rgba rgb -screen 480x640@270" ;;
> 
> ===========================================================================
> ARGS="$ARGS -screen ${DISPLAY_WIDTH_PIXELS}x${DISPLAY_HEIGHT_PIXELS}@${DISPLAY_ORIENTATION}x${DISPLAY_BPP}"
> 
> if [ ! -z "$DISPLAY_DPI" ]; then
>         ARGS="$ARGS -dpi $DISPLAY_DPI"
> fi
> ===========================================================================
> 
> This is Poky version of that part XServer script - no machine related code 
> at all. Of course it support only machines with formfactor defines.

So you have the exact same problem, but in a different place. And as a side-effect, the
image can't be shared between machines anymore, since only one config is present in
formfactor.

regards,

Koen


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFGkprSMkyGM64RGpERAhosAJ9SzPUj8HvHNf1jt5sojJJoBFf82gCeMwaV
lMA44jJhi2NkkXTqeH5bPlA=
=yw5b
-----END PGP SIGNATURE-----



