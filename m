Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MI4Ox-0005RR-6z
	for openembedded-devel@openembedded.org; Sat, 20 Jun 2009 19:30:51 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1MI4EV-0001cF-GC
	for openembedded-devel@openembedded.org; Sat, 20 Jun 2009 17:20:03 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sat, 20 Jun 2009 17:20:03 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Sat, 20 Jun 2009 17:20:03 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sat, 20 Jun 2009 19:19:52 +0200
Message-ID: <h1j5no$4k3$1@ger.gmane.org>
References: <20090617042909.GA21132@denix.org>	<1245224450.29153.99.camel@lenovo.internal.reciva.com>	<20090617214104.GC21132@denix.org>	<1245396977.29153.192.camel@lenovo.internal.reciva.com>	<1245492507.29153.244.camel@lenovo.internal.reciva.com>
	<4A3CFE82.2050106@mvista.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1pre) Gecko/20090610 Shredder/3.0b3pre
In-Reply-To: <4A3CFE82.2050106@mvista.com>
Sender: news <news@ger.gmane.org>
Subject: Re: update-rc.d: don't add runtime dependency if not doing online package management; only add it to ${PN} in any case.
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
X-List-Received-Date: Sat, 20 Jun 2009 17:30:51 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20-06-09 17:21, Christopher Larson wrote:
> Phil Blundell wrote:
>> On Fri, 2009-06-19 at 08:36 +0100, Phil Blundell wrote:
>>> On Wed, 2009-06-17 at 17:41 -0400, Denys Dmytriyenko wrote:
>>>> Any ideas why RDEPENDS_{PN} in "udev" recipe works, but
>>>> RDEPENDS_udev doesn't? It only happens with inherit
>>>> update-rc.d.bbclass, which also changes RDEPENDS_{PN}... I have the
>>>> same issue with my own recipes, which I need to fix similarly.
>>> It's a side effect of the way that overrides work in bitbake.
>>
>> ... and Chris Larson, being the great guy that he is, has now added a
>> check for this issue to recipe_sanity.bbclass. If you have sanity
>> checking enabled, this situation will now elicit a diagnostic along the
>> lines of:
>>
>> NOTE: glibc-2.9: recipe_sanity: rename of variable 'RPROVIDES_${PN}-dev'
>> to 'RPROVIDES_glibc-dev' overwrote existing value ' libc-dev' with
>> 'libc6-dev virtual-libc-dev'.
>> which should make it easy to identify such issues in the future. Thanks
>> Chris!
>
> Not a problem, happy to help. It's worth noting, for anyone that hasn't
> tried recipe_sanity yet, that because it outputs so many messages, by
> default it's a standalone task, rather than being hooked into the normal
> build process the way sanity (config checks) and insane (packages /
> output checks) are. Using it is explicit, INHERIT += "recipe_sanity",
> then bitbake -c recipe_sanity foo or bitbake -c recipe_sanity_all foo
> (to run against foo and its deps).

Why is it complaining about RDEPENDS? If some app needs external 
datafiles to run it sure as hell needs to set RDEPENDS.

regards,

Koen



