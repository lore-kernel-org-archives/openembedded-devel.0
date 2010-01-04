Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NRtdX-00008Q-FY for openembedded-devel@lists.openembedded.org;
	Mon, 04 Jan 2010 21:34:50 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1NRtbZ-00056C-FT
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Jan 2010 21:32:45 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Jan 2010 21:32:45 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Jan 2010 21:32:45 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 04 Jan 2010 21:32:22 +0100
Message-ID: <hhtj8l$acs$1@ger.gmane.org>
References: <ac9c93b11001030833v6236cb2ew11627fb47a6d7fa8@mail.gmail.com>	<1262552980.2553.104.camel@lenovo.internal.reciva.com>	<ac9c93b11001032331g641d1015hb7191696fdf5bb65@mail.gmail.com>	<1262620565.8748.246.camel@dax.rpnet.com>
	<ac9c93b11001041214w71476fedrcfa5a9cfb7137ebc@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.5) Gecko/20091222 Shredder/3.0.1pre
In-Reply-To: <ac9c93b11001041214w71476fedrcfa5a9cfb7137ebc@mail.gmail.com>
X-Enigmail-Version: 1.0
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: qmake issue
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
X-List-Received-Date: Mon, 04 Jan 2010 20:34:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 04-01-10 21:14, Frans Meulenbroeks wrote:
> 2010/1/4 Richard Purdie <rpurdie@rpsys.net>:
>> On Mon, 2010-01-04 at 08:31 +0100, Frans Meulenbroeks wrote:
>>> Yeah figured out after a brief discussion on #oe that they probably
>>> didn't need to be staged.
>>>
>>> Actually the recipe does not contain any staging, so this is a side
>>> effect of the new automated staging.
>>> It could well be that other,  non qmake recipes also suffer from this.
>>>
>>> The fix for mythtv is probably to have an empty do_stage()
>>>
>>> However as a general rule the -L and -I flags to staging should be
>>> last, not first.
>>> And, ideally, when building a recipe the old contents from that
>>> package in staging should be removed first.
>>> By removing that we avoid the problem that if rX adds a file A to
>>> staging and rY does not do so any more, the file A still remains in
>>> staging (although perhaps incompatible with what rY made.
>>
>> If packaged staging is enabled this should happen already...
>>
>> Cheers,
>>
>> Richard
>>
> Ehm, I use angstrom unstable head on the beagleboard.I've been told on
> #oe that angstrom used pacakged staging.
> I've removed my tmp dir and rebuild from scratch on dec 30, 2009,
> including mythtv.
> Yesterday I rebuild the latest version of mythtv, and it linked
> against the myth lib in staging (produced by the same recipe).
> As the lib was changed between those versions it gave a linking error.
> After removing the lib from staging manually and rebuilding mythtv
> builds properly.
> To me this seems there is still a problem.

Packaged-staging only works if you have built opkg-native, otherwise it
won't remove things from staging. The problem is that you can't to
'bitbake opkg-native' twice, so the angstrom buildscripts now do:
http://dominion.thruhere.net/git/cgit.cgi/openembedded/commit/?h=org.openembedded.dev&id=6fb8200b0002fad7ed4b67b7b5a01a54bc3db91c

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLQlBWMkyGM64RGpERAtFbAJ9bzOb4XvpCme4V2E9t8ER9tYcVsACcC7nq
qqFJxVxAQKpndDkZeEANHe0=
=AvU+
-----END PGP SIGNATURE-----



