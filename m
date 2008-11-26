Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1L5OYe-0005JK-6k
	for openembedded-devel@openembedded.org; Wed, 26 Nov 2008 18:52:12 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1L5OVj-0000Is-Ip
	for openembedded-devel@openembedded.org; Wed, 26 Nov 2008 17:49:11 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 26 Nov 2008 17:49:11 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 26 Nov 2008 17:49:11 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 26 Nov 2008 18:49:02 +0100
Message-ID: <ggk26f$30a$1@ger.gmane.org>
References: <ggjnpc$qhg$1@ger.gmane.org>	<200811261755.53197.mickey@vanille-media.de>
	<1227721214.19934.33.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b2pre) Gecko/20081120 Shredder/3.0b1pre
In-Reply-To: <1227721214.19934.33.camel@mill.internal.reciva.com>
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
X-List-Received-Date: Wed, 26 Nov 2008 17:52:12 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26-11-08 18:40, Phil Blundell wrote:
> On Wed, 2008-11-26 at 17:55 +0100, Michael 'Mickey' Lauer wrote:
>> Sounds good overall, however there is still the problem with things like e.g.
>> gpsd. If you remove fso-gpsd's RPROVIDES=gspd, then anything that rdepends on
>> gpsd will bring us gpsd back into the [fso-]image, hence we have a conflict
>> again.
>
> It sounds like you have a namespacing problem here.  If there are
> packages which need to depend on some abstract gpsd API or ABI, they
> should probably be Depending on "virtual/gpsd" or the like and this
> virtual package should be Provided by both gpsd and fso-gpsd.
>
> Semi-virtual packages (i.e. a given name existing both as a concrete
> package and as a Provides: in some other package) basically do not work:
> this is partly an implementation problem in opkg but there is also a
> fundamentally insoluble problem with versioning.  About the only time
> that adding a Provides: for the same name as an existing concrete
> package is the right thing to do, is when one package completely
> supercedes each other; in this case you would generally also say that
> the new one Replaces: and Conflicts: with the old one.

Conflicts: + Replaces: hits another bug in opkg, it will silently pick 
'fso-foo' over 'foo' when both are in deploy (e.g. build fso-image for 
om-gta02 and x11-image-with-gpsd for om-gta01). We hit this problem when 
the matchbox-*2 was added from poky.
The good news is that opkg is maintained now so this problem can be fixed :)

regards,

Koen



