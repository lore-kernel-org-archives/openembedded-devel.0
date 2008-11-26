Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1L5Qkn-0002EF-6I
	for openembedded-devel@openembedded.org; Wed, 26 Nov 2008 21:12:53 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1L5Qhs-0005Ww-3e
	for openembedded-devel@openembedded.org; Wed, 26 Nov 2008 20:09:52 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 26 Nov 2008 20:09:52 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 26 Nov 2008 20:09:52 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 26 Nov 2008 21:09:45 +0100
Message-ID: <ggkae9$170$1@ger.gmane.org>
References: <ggjnpc$qhg$1@ger.gmane.org>	<200811261755.53197.mickey@vanille-media.de>	<1227721214.19934.33.camel@mill.internal.reciva.com>	<ggk26f$30a$1@ger.gmane.org>	<1227722637.19934.36.camel@mill.internal.reciva.com>	<ggk56j$dtn$1@ger.gmane.org>
	<1227726026.23391.245.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b2pre) Gecko/20081120 Shredder/3.0b1pre
In-Reply-To: <1227726026.23391.245.camel@lenovo.internal.reciva.com>
Sender: news <news@ger.gmane.org>
Subject: Re: preferred-provider at the image level a.k.a why is all this fso stuff in my non-fso image
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
X-List-Received-Date: Wed, 26 Nov 2008 20:12:53 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26-11-08 20:00, Phil Blundell wrote:
> On Wed, 2008-11-26 at 19:40 +0100, Koen Kooi wrote:
>> if fso-foo has
>>
>> Conflicts: foo
>> Replaces: foo
>>
>> but not
>>
>> Provides: foo
>>
>> opkg will always pick fso-foo when it's present in deploy, while you
>> want an image with foo.
>
> Are you sure that your package fso-foo really wants to Conflict: with
> and Replace: foo without also Providing: it?

I'd rather have it only Conflict:, but that places extra burden on the 
fso people.

> Although I don't think
> there is any reason why this is inherently illegitimate, it is certainly
> something of a fringe case and my first suspicion would be that this is
> a packaging bug which is just happening to tickle an opkg bug and/or
> misfeature.  I suspect opkg is taking a slightly harder line on this,
> deciding that lack of Provides: in this case must certainly be a
> packaging error, and proceeding as if that Provides: was present.  It's
> debatable whether this is a desirable thing for it to be doing but,
> irrespective of that, at least a part of the right answer is probably to
> fix the offending packages.

I have literally no clue about opkg internals, sorry.

regards,

Koen




