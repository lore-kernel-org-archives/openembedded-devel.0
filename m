Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1OfZBY-0005Kp-Hj
	for openembedded-devel@lists.openembedded.org;
	Sun, 01 Aug 2010 16:06:41 +0200
Received: (qmail 16115 invoked by uid 1003); 1 Aug 2010 14:06:00 -0000
Received: from localhost (HELO ?192.168.1.167?) (philip@opensdr.com@127.0.0.1)
	by mail.geekisp.com with SMTP; 1 Aug 2010 14:06:00 -0000
Message-ID: <4C557F47.2080901@balister.org>
Date: Sun, 01 Aug 2010 10:05:59 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.10) Gecko/20100621 Fedora/3.0.5-1.fc13 Thunderbird/3.0.5
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTimk_y-ntnLZpXfa_biLEcX_vO_Lk5PQXWPJcuec@mail.gmail.com>	<i2rik7$ds1$1@dough.gmane.org>
	<4C516EF8.3080804@balister.org>	<AANLkTikZQB39U7kUv9-0v-3gysX=tYFuwUiq3ygXJzAL@mail.gmail.com>	<i2u23e$97d$1@dough.gmane.org>	<AANLkTimUYuJBUa5Hz=N_dM-DOe6qPoCDbqCEs2LHTpab@mail.gmail.com>
	<1280617976.1297.85.camel@rex>
In-Reply-To: <1280617976.1297.85.camel@rex>
X-SA-Exim-Connect-IP: 216.168.135.169
X-SA-Exim-Mail-From: philip@balister.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
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
X-List-Received-Date: Sun, 01 Aug 2010 14:06:41 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/31/2010 07:12 PM, Richard Purdie wrote:
> On Fri, 2010-07-30 at 10:34 +0200, Frans Meulenbroeks wrote:
>> 2010/7/30 Koen Kooi<k.kooi@student.utwente.nl>
>>> On 30-07-10 09:21, Esben Haabendal wrote:
>>>> On Thu, Jul 29, 2010 at 2:07 PM, Philip Balister<philip@balister.org>
>>> wrote:
>>>>> On 07/29/2010 05:45 AM, Koen Kooi wrote:
>
>>>>>> I would actually advocate removing the 'world' feature from bitbake/OE
>>>>>> to stop people from wasting time on looking at bitbake world and have
>>>>>> them fix actual problems.
>>>>>
>>>>> bitbake world seems to be the source of pointless listserv discussions.
>>> Does
>>>>> it serve any purpose?
>>>>
>>>> Pointless or not really depends on how you look at quality.
>>>>
>>>> If you look at it as you, Koen and other OE long-timers, yes, it looks
>>>> rather pointless to have bitbake world.
>>>> But for those of us who have a different view on what quality is, then
>>>> bitbake world serves a purpose.
>>>
>>> As Thomas points out, as soon as you start blacklisting things (which
>>> actually increases quality), bitbake world doesn't work anymore.
>>
>> Blacklisting does *NOT* increase quality. It just hides the problem and as
>> such it is ostrich behaviour.
>>
>> Instead of masking the problem, better fix things. That is what improves
>> quality!
>>
>> For me a non building recipe is a sign of poor quality.
>>
>> BTW: to avoid the blacklisting issue, I've restarted my test with minimal
>> distro.
>> Results will probably be available after the weekend.
>
> "world" is used by Poky quite successfully. In Poky we expect everything
> to build with a known list of things that don't. Our aim is to have that
> list consisting of zero items and I intend to see that happens :).

But Poky operates under different conditions than the main OE meta-data. 
Since you more focus on what Poky builds, you do not need to support the 
variety of recipes in the OE meta-data.

Philip


>
> I don't think many people have been watching Poky recently but we've
> been quietly having a massive quality control effort on the metadata in
> there. This has included:
>
> a) Removal of legacy staging
> b) Using BBCLASSEXTEND = native where it makes sense
> c) Using nativesdk (no sdk class)
> d) Upgrading everything to modern versions of the package concerned
> e) Only allowing sane pkgconfig files
> f) Enhancing the metadata with licence and other information
>
> Its possible to contemplate this due to Poky's version policy and size
> and its still taking significant effort. OE has always been pulled in
> many directions and this is both a good and a bad thing. The only ways I
> can think of to make a dramatic improvement to OE in this area would be
> disliked by some of its users so I don't know what the solution is.
>
> There are other good things happening in Poky as well as the above too
> btw :)
>
> Cheers,
>
> Richard
>
>
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


