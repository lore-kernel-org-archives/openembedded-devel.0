Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1L750P-0003o5-AO
	for openembedded-devel@openembedded.org; Mon, 01 Dec 2008 10:23:55 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1L74x9-0005a6-Ed
	for openembedded-devel@openembedded.org; Mon, 01 Dec 2008 09:20:27 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Mon, 01 Dec 2008 09:20:27 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Mon, 01 Dec 2008 09:20:27 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 01 Dec 2008 10:20:19 +0100
Message-ID: <gh0a8k$gpc$1@ger.gmane.org>
References: <59e7e6f90812010038u77d22e6m181cb0a02f732220@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b2pre) Gecko/20081125 Shredder/3.0b1pre
In-Reply-To: <59e7e6f90812010038u77d22e6m181cb0a02f732220@mail.gmail.com>
Sender: news <news@ger.gmane.org>
Subject: Re: conditional kernel configuration
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
X-List-Received-Date: Mon, 01 Dec 2008 09:24:06 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01-12-08 09:38, Mike Turquette wrote:
> Hi,
>
> I was recently looking into configuring the kernel dynamically based
> on IMAGE_FEATURES.

First: there's no such thing as IMAGE_FEATURES in OE:

koen@dominion:/OE/org.openembedded.dev$ grep IMAGE_FEATURES . -rn
koen@dominion:/OE/org.openembedded.dev$

Secondly: This looks a lot like USE flags, which we decided not to use 
in OE since it's impossible to do deterministic builds with them and at 
run-time there are a QA nightmare.

To illustrate the second point:

a) clean tmp/
b) unset 'my-conn', build image
c) set 'my-conn', build image

You now have an image in deploy where 'my-conn' is present, but the 
kernel is lacking WLAN support since it didn't get rebuilt after b).

I suspect what you need is a switch whether to include wlan *modules* 
into the image or not.

regards,

Koen



> Here is a snippet from my kernel recipe:
>
> OVERRIDE_WLAN = "${@base_contains("IMAGE_FEATURES", "my-conn",
> ":mywlan", "",d)}"
> OVERRIDES .= "${OVERRIDE_WLAN}"
>
> SRC_URI = "git://some_tree"
> SRC_URI_prepend_mywlan = "git://some_other_tree_with_wlan"
>
> This is a simplified example of what my recipe does (in fact I don't
> fetch from git in this recipe at all).  But the point is clear:
> looking for my-conn in IMAGE_FEATURES (which is set or not set in
> my-cool-image.bb) should determine whether SRC_URI has one tree or
> both trees in it.
>
> The problem is that IMAGE_FEATURES only has the stuff specified in
> local.conf when the kernel recipe gets selected (this obviously
> happens when I bitbake mykernel, but also when I bitbake
> my-cool-image).  All of the features specified in my-cool-image.bb are
> not in it (yet).
>
> Am I going about this the wrong way?  I would really like to
> conditionally set which code to build in my kernel recipe based on
> whether or not the my-conn task is included in IMAGE_FEATURES.
>
> Any other solutions that depart from my IMAGE_FEATURES scrape method
> are very welcome too!
>
> Thanks,
> Mike




