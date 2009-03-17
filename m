Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Ljadq-0001AM-Eb
	for openembedded-devel@openembedded.org; Tue, 17 Mar 2009 15:51:45 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1Ljad8-0005lB-Na
	for openembedded-devel@openembedded.org; Tue, 17 Mar 2009 14:50:58 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 17 Mar 2009 14:50:58 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 17 Mar 2009 14:50:58 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 17 Mar 2009 15:50:43 +0100
Message-ID: <gpodc3$nos$1@ger.gmane.org>
References: <200903171538.21499.marcin@juszkiewicz.com.pl>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20090225 Shredder/3.0b3pre
In-Reply-To: <200903171538.21499.marcin@juszkiewicz.com.pl>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.2
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_40,RCVD_IN_DNSWL_LOW,
	RDNS_NONE,SPF_HELO_PASS,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: RFC: new stable release
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
X-List-Received-Date: Tue, 17 Mar 2009 14:51:45 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17-03-09 15:38, Marcin Juszkiewicz wrote:

> Which things needs defining? I have few in mind:
>
> 1. Adding new things. This should be possible only by backporting from
>     OE.dev tree and needs to be Acked by at least 2-3 developers which
>     use stable branch. New code has to build for at least one distro and
>     ARM+x86 architectures (unless it is related to one arch or even one
>     machine).

So things must get tested before committing, right?

> 2. Marking recipes as buildable or not. With over 6000 of them it is
>     really hard to check everything for status. We can remove many old
>     versions but sometimes they are useful for some projects. I would
>     rather add things like BUILDABLE_armv4t = "1" into recipe or into
>     conf/distro/include/${DISTRO}-status.inc file. Similar status for
>     recipes which are known to not work for some archs.

Just have a CSV file that includes the test coverage for package + 
machines. We can have one per distro. If needed we can extract the info 
from tinderbox after we've done a few builds.

> 3. Dealing with non buildable stuff. We have 'nonworking' and 'obsolete'
>     dirs in metadata - both should be dropped in stable branch. Other
>     recipes can be marked as not buildable or dropped from branch - I did
>     not thought yet on it.

That does mean you can't easily resurrect recipes, but seeing that only 
happens once every 5 years or so..

> 4. Lifetime of branch. Will we do new stable release after 6 months or
>     after one year? For how long stable branch will be supported by OE
>     itself? I know that there will be companies which will provide
>     support for longer time - thats what I do with Poky 'pinky' now.

The previous branch had a 12 + 3 month lifecycle, 12 months of support 
then 3 months to wind down.

> What do you feel about it? Any opinions or suggestions? Want to join
> effort?

I certainly want to join the effort, but I fear that creating a stable 
branch might make some people more inclined to dump even worse crap in 
.dev, which would not be a good thing. So *if* we go with a stable 
branch we should make sure .dev well be in a good shape as well.

regards,

Koen



