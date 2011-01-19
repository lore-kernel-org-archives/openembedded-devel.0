Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philip@balister.org>) id 1PfgQx-0001Ry-55
	for openembedded-devel@lists.openembedded.org;
	Wed, 19 Jan 2011 23:23:20 +0100
Received: (qmail 13055 invoked by uid 1003); 19 Jan 2011 22:22:34 -0000
Received: from unknown (HELO ?192.168.1.148?) (philip@opensdr.com@75.37.22.143)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	19 Jan 2011 22:22:34 -0000
Message-ID: <4D376428.2030905@balister.org>
Date: Wed, 19 Jan 2011 14:22:32 -0800
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.13) Gecko/20101209 Fedora/3.1.7-0.35.b3pre.fc14
	Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1295027350.14388.6527.camel@rex>	<AANLkTi=QXykmerKTJJgCNDbqSE18_3Jhqj1utKmf1Ynw@mail.gmail.com>	<4D353F81.50301@xora.org.uk>	<AANLkTi=WOr_395Tya3GOhyLpg1oj9stLxSWdgo--uAhz@mail.gmail.com>	<4D35C5C3.60205@mentor.com>
	<ih4s84$gbj$1@dough.gmane.org>	<4D35FC8B.1090404@mentor.com>	<AANLkTinHP=9S6tAFdiWHfk8zZi0MhvfNTgW71Ugx++9w@mail.gmail.com>	<AANLkTi=aMnnfnaQZNLpZW_8MUWq_jckou9tr_bA8NBY6@mail.gmail.com>	<4D36A64E.9060804@xora.org.uk>	<AANLkTi=8uKvujKLqG2cw3h3gLmmcU=KNfdmSwB5imfsH@mail.gmail.com>	<1295436662.2540.14.camel@scimitar>	<AANLkTik9-k_euvDGZd+CFfQ9LyxD_7mubpVxPqyEsEVU@mail.gmail.com>	<4D36FE98.3070606@mwester.net>	<AANLkTimMHd-eH9tEL1tUtoUKa+zwX4+9kUdT3k_NP9nG@mail.gmail.com>	<AANLkTimyPb-4pLrbF4ZeFwnh+9WyZtcPY1uXeYBnwUqQ@mail.gmail.com>
	<AANLkTi=9HSWqm4tNmh6UNEEjsAyoZB7j_aCFssJjyanB@mail.gmail.com>
In-Reply-To: <AANLkTi=9HSWqm4tNmh6UNEEjsAyoZB7j_aCFssJjyanB@mail.gmail.com>
Subject: Re: Yocto Project and OE - Where now?
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
X-List-Received-Date: Wed, 19 Jan 2011 22:23:20 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/19/2011 02:01 PM, C Michael Sundius wrote:
> in rereading this I don't want to seem ungrateful, since we've certainly
> benefited from the great effort on everyones part (package and distro
> maintainers, yacto and OE... everyone).

Mike, well thought out replies from people using OE are always welcome. 
I think you made some really good points that I completely agree with.

Thanks,

Philip

>
> On Wed, Jan 19, 2011 at 1:55 PM, C Michael Sundius<msundius@sundius.com>wrote:
>
>>
>> It seems to me that this is a bit of a battle between the package
>> maintainers and the distro maintainers.. Looking at this from my managements
>> side of things, we use OE as a tool and its really just a means to the end.
>> our customers demand that we do not change things (versions of software),
>> they demand stability and they view a change in busybox or anything else a
>> threat to stability. our management has also made an edict that we can not
>> use gplv3. For completely non technical reasons we simply cannot move to new
>> package versions without a substantial business justification. I suspect
>> that that there are many (more than you realize) folk out there who are
>> using OE for their own distro. If you simply whack package versions because
>> something newer came out you will have these people maintaining separate
>> recipes and we'll be swamped with the load and this tool will loose one of
>> its best attributes.
>>
>> The comment that disturbed me was that distros should just move ahead
>> "because its making things hard for the package maintainer". That doesn't
>> wash with me because if people are using your package then you should
>> support it or let someone else be the maintainer. In essence the distro's
>> use of that package are your customers and the reason you have a job. OE
>> does not exist as a product, rather a tool that enables customers, you can't
>> create this in a vacuum without understanding who is using it.
>>
>> distro maintainers are not all dumb and if they are they'll be the last
>> single one using an outdated version of the software. When that happens a
>> smart package maintainer will call it out leave out the old package.
>> Further, it would be nice for a warning to take place so that it might have
>> a "depracated" tag associated with the recipe for one release cycle to see
>> if anyone cribs.
>>
>> So I'm standing with the guy w/ asbestos short on. I'd like to see that OE
>> err on the side of "do no harm" to existing users. Its hard enough to rally
>> the troops to move to updated packages much less updated meta without you
>> leaving perfectly reasonable versions of software out of oe-core.
>>
>> mike
>>
>>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


