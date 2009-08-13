Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Mbi3G-0000CP-Iv for openembedded-devel@lists.openembedded.org;
	Thu, 13 Aug 2009 23:41:38 +0200
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1MbhnC-00086o-K1 for openembedded-devel@lists.openembedded.org;
	Thu, 13 Aug 2009 21:25:02 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Aug 2009 21:25:02 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Aug 2009 21:25:02 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 13 Aug 2009 23:23:18 +0200
Message-ID: <h62087$ns5$1@ger.gmane.org>
References: <4A847C46.7090306@atmel.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1.3pre) Gecko/20090730 Shredder/3.0b4pre
In-Reply-To: <4A847C46.7090306@atmel.com>
Sender: news <news@ger.gmane.org>
Subject: Re: Common patch directory for a set of boards.
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
X-List-Received-Date: Thu, 13 Aug 2009 21:41:38 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13-08-09 22:49, Ulf Samuelsson wrote:
> Is there a way to store a patch which is applied to a list of boards,
> but not every board, in a common directory?
>
> SRC_URI_append_at91sam9263ek += "file://atmel.patch;patch=1"
> SRC_URI_append_at32stk1000 += "file://atmel.patch;patch=1"
> SRC_URI_append_at572d940hf += "file://atmel.patch;patch=1"
> SRC_URI_append_beta1 += "file://beta.patch;patch=1"
> SRC_URI_append_beta2 += "file://beta.patch;patch=1"
> SRC_URI_append_beta3 += "file://beta.patch;patch=1"
> SRC_URI_append_caesar1 += "file://caesar.patch;patch=1"
> SRC_URI_append_caesar2 += "file://caesar.patch;patch=1"
>
> with a file system like:
>
> <recipe>
> 	recipe-1.0/atmel/atmel.patch
> 	recipe-1.0/beta/beta.patch
> 	recipe-1.0/caesar/caesar.patch
> 	recipe-1.0.bb

Sort of, for the above you would do:

SRC_URI_append_at91sam9263ek = " file://atmel/atmel.patch;patch=1"
SRC_URI_append_at32stk1000 = " file://atmel/atmel.patch;patch=1"
SRC_URI_append_at572d940hf = " file://atmel/atmel.patch;patch=1"
SRC_URI_append_beta1 = " file://beta/beta.patch;patch=1"
SRC_URI_append_beta2 = " file://beta/beta.patch;patch=1"
SRC_URI_append_beta3 = " file://beta/beta.patch;patch=1"
SRC_URI_append_caesar1 = " file://caesar/caesar.patch;patch=1"
SRC_URI_append_caesar2 = " file://caesar/caesar.patch;patch=1"

The linux-omap_2.6.29.bb recipe has something like that since I had to 
find a way to retain my sanity with that amount of patches.

regards,

Koen


>
>
> instead of
>
> <recipe>
> 	recipe-1.0/at91sam9263ek/atmel.patch
> 	recipe-1.0/at32stk1000/atmel.patch
> 	recipe-1.0/at572d940hf/atmel.patch
> 	recipe-1.0/beta1/beta.patch
> 	recipe-1.0/beta2/beta.patch
> 	recipe-1.0/beta3/beta.patch
> 	recipe-1.0/caesar1/caesar.patch
> 	recipe-1.0/caesar2/caesar.patch
> 	recipe-1.0.bb
>
>
> I can think of symlinking at91sam9263ek to at572d940hf
> but then you cannot have a defconfig file per board.
>
> Maybe you can specify:
>
> SRC_URI_append_at91sam9263ek += "file://../atmel/atmel.patch;patch=1"
>
> but this has a fould look about it.
>
> FOr the at91 patches, I took the easy way out and put all the patches
> on www.at91.com, which is no good, since it has been down for
> almost two days :-(
>
>
>




