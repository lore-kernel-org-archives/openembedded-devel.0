Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1L5zt8-0008Hk-7P
	for openembedded-devel@openembedded.org; Fri, 28 Nov 2008 10:43:50 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1L5zq1-0000o1-Ur
	for openembedded-devel@openembedded.org; Fri, 28 Nov 2008 09:40:37 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Fri, 28 Nov 2008 09:40:37 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Fri, 28 Nov 2008 09:40:37 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 28 Nov 2008 10:40:27 +0100
Message-ID: <ggoeab$s2q$1@ger.gmane.org>
References: <ggjnpc$qhg$1@ger.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b2pre) Gecko/20081120 Shredder/3.0b1pre
In-Reply-To: <ggjnpc$qhg$1@ger.gmane.org>
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
X-List-Received-Date: Fri, 28 Nov 2008 09:43:50 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26-11-08 15:51, Koen Kooi wrote:
> Hi,
>
> Recently the FSO developers discovered that they can put
>
> RPROVIDES = "foo"
> RCONFLICTS = "foo"
>
> in their fso-foo recipe to have OE install fso-foo instead of foo in
> their fso-image. Great.
>
> The downside: people can't get 'foo' anymore in their image since
> 'fso-foo' will _always_ get choosen over 'foo'. Not so great.
>
> Normally it would be just a matter of putting PREFERRED_PROVIDER_foo =
> "foo" in the distro.conf, but that is not an option in this case, since
> when building 'fso-image' I actually want 'fso-foo' instead of 'foo'
>
> My proposal is:
>
> * remove the RPROVIDES, leave the RCONFLICTS

http://gitweb.openembedded.net/?p=openembedded.git;a=commitdiff;h=0457511ceb1dab4454a966b344ae1953ad7dfa94

regards,

Koen



> * put 'fso-foo' in IMAGE_INSTALL in fso-images instead of 'foo'
> * educate people using RPROVIDES, RCONFLICTS and RREPLACES in recipes
>
> objections?
>
> regards,
>
> Koen




