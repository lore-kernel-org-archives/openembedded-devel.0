Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1L5PME-0003Vs-Ng
	for openembedded-devel@openembedded.org; Wed, 26 Nov 2008 19:43:26 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1L5PJJ-0002Bg-Qz
	for openembedded-devel@openembedded.org; Wed, 26 Nov 2008 18:40:26 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 26 Nov 2008 18:40:25 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 26 Nov 2008 18:40:25 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 26 Nov 2008 19:40:19 +0100
Message-ID: <ggk56j$dtn$1@ger.gmane.org>
References: <ggjnpc$qhg$1@ger.gmane.org>	<200811261755.53197.mickey@vanille-media.de>	<1227721214.19934.33.camel@mill.internal.reciva.com>	<ggk26f$30a$1@ger.gmane.org>
	<1227722637.19934.36.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b2pre) Gecko/20081120 Shredder/3.0b1pre
In-Reply-To: <1227722637.19934.36.camel@mill.internal.reciva.com>
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
X-List-Received-Date: Wed, 26 Nov 2008 18:43:27 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26-11-08 19:03, Phil Blundell wrote:
> On Wed, 2008-11-26 at 18:49 +0100, Koen Kooi wrote:
>> Conflicts: + Replaces: hits another bug in opkg, it will silently pick
>> 'fso-foo' over 'foo' when both are in deploy (e.g. build fso-image for
>> om-gta02 and x11-image-with-gpsd for om-gta01). We hit this problem when
>> the matchbox-*2 was added from poky.
>
> I'm not quite sure what you're saying here.  If fso-foo Conflicts,
> Replaces, and Provides foo, opkg would be basically correct to install
> the former rather than the latter package.  What exactly is the
> behaviour you're observing?

if fso-foo has

Conflicts: foo
Replaces: foo

but not

Provides: foo

opkg will always pick fso-foo when it's present in deploy, while you 
want an image with foo.

The whole problem is that for some images I do *not* want to drag in 
python, frameworkd and other things when I just want /usr/bin/apm or 
/usr/bin/gpsd. But for fso-*-image I *do* want fso-gpsd and fso-apm.

If the fso stuff was API+ABI compatible and about the same size I 
wouldn't care about this, but right now it's a ~5MiB difference, not to 
mention the runtime speed penalty of needing a python interpreter.

regards,

Koen



