Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OekrY-0006wx-Uw for openembedded-devel@lists.openembedded.org;
	Fri, 30 Jul 2010 10:22:51 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OekrC-0002Sa-5F for openembedded-devel@lists.openembedded.org;
	Fri, 30 Jul 2010 10:22:18 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jul 2010 10:22:18 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jul 2010 10:22:18 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 30 Jul 2010 10:22:06 +0200
Message-ID: <i2u23e$97d$1@dough.gmane.org>
References: <AANLkTimk_y-ntnLZpXfa_biLEcX_vO_Lk5PQXWPJcuec@mail.gmail.com>	<i2rik7$ds1$1@dough.gmane.org>
	<4C516EF8.3080804@balister.org>
	<AANLkTikZQB39U7kUv9-0v-3gysX=tYFuwUiq3ygXJzAL@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.11) Gecko/20100718 Shredder/3.0.7pre
In-Reply-To: <AANLkTikZQB39U7kUv9-0v-3gysX=tYFuwUiq3ygXJzAL@mail.gmail.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: OE recipe tree quality
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
X-List-Received-Date: Fri, 30 Jul 2010 08:22:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 30-07-10 09:21, Esben Haabendal wrote:
> On Thu, Jul 29, 2010 at 2:07 PM, Philip Balister <philip@balister.org> wrote:
>>
>>
>> On 07/29/2010 05:45 AM, Koen Kooi wrote:
>>>
>>> -----BEGIN PGP SIGNED MESSAGE-----
>>> Hash: SHA1
>>>
>>> On 29-07-10 10:50, Frans Meulenbroeks wrote:
>>>>
>>>> Dear all,
>>>>
>>>> Given the discussions on quality that sometimes pop up (and also
>>>> triggered
>>>> by Robert's message), I decided to kick off a bitbake -k world.
>>>
>>> Could you first explain to me why 'bitbake world' is a good way to
>>> measure quality?
>>>
>>> I would think that building something like console-image and looking at
>>> the following would be a much better metric:
>>>
>>> * does it build?
>>> * are all the rootfs types working?
>>> * does the image do what it is supposed to do?
>>> * Are all the licenses of the output packages correct?
>>> * Do the output packages have any spurious deps?
>>> * Is the content of the output packages correct?
>>> * Are there any known CVEs in the resulting packages?
>>> * Did packaged-staging do its job?
>>> * What kind of QA errors and warnings were raised?
>>> * Did all recipes pass recipe_sanity?
>>> * Did all recipes conform to oe-stylize.py?
>>>
>>> etc
>>>
>>> I would actually advocate removing the 'world' feature from bitbake/OE
>>> to stop people from wasting time on looking at bitbake world and have
>>> them fix actual problems.
>>
>> bitbake world seems to be the source of pointless listserv discussions. Does
>> it serve any purpose?
> 
> Pointless or not really depends on how you look at quality.
> 
> If you look at it as you, Koen and other OE long-timers, yes, it looks
> rather pointless to have bitbake world.
> But for those of us who have a different view on what quality is, then
> bitbake world serves a purpose.

As Thomas points out, as soon as you start blacklisting things (which
actually increases quality), bitbake world doesn't work anymore.
That alone should be enough to kill it.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMUouuMkyGM64RGpERAl42AKCE62tZc4ZGAH5WiLMPFNwn/YY0cACfTmMz
/YBK4XU/u1PuqmzoyXbF1f8=
=TNJJ
-----END PGP SIGNATURE-----



