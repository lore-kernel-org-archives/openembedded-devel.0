Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LEjeD-0000FZ-Lc
	for openembedded-devel@openembedded.org; Mon, 22 Dec 2008 13:12:33 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LEjZQ-0007sJ-WE
	for openembedded-devel@openembedded.org; Mon, 22 Dec 2008 12:07:37 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Mon, 22 Dec 2008 12:07:36 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Mon, 22 Dec 2008 12:07:36 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 22 Dec 2008 13:07:28 +0100
Message-ID: <ginvu0$hg4$1@ger.gmane.org>
References: <20081222092936.GY2135@buddha.tw.openmoko.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20081217 Shredder/3.0b2pre
In-Reply-To: <20081222092936.GY2135@buddha.tw.openmoko.com>
Sender: news <news@ger.gmane.org>
Subject: Re: Please review john_lee/openmoko-toolchain
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
X-List-Received-Date: Mon, 22 Dec 2008 12:12:33 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22-12-08 10:29, John Lee wrote:
> Hi,
>

>      meta-toolchain-openmoko.bb: add feed to toolchain
>
>      By modifying the opkg config files in the toolchain, the toolchain can
>      expend itself by installing packages from the repository.
>
>
> We need to do some modifications to the contents of toolchain before
> the packaging complete, so we use this variable as a hook.  The
> modification is to create an opkg config file so the toolchain knows
> where to get new packages.  A better way might be to install
> distro-feed-configs, but that includes several opkg config files while
> alias 'opkg-target' uses just one: opkg.conf.

Suggestions for the existing patch:

* rename OPENMOKO_URI to TOOLCHAIN_FEED_URI
* move the modify_opkg_conf () to meta-toolchain.bb
* TOOLCHAIN_FEED_URI ? = "" in meta-toolchain.bb
* TOOLCHAIN_FEED_URI = 
"http://downloads.openmoko.org/repository/testing" in 
meta-toolchain-openmoko.bb or better, conf/distro/openmoko.conf

That way more distributions can use it and each distro version can have 
it's own SDK by setting TOOLCHAIN_FEED_URI in its distro file.

As you might have noticed /etc/opkg/arch.conf isn't in any packages (not 
unlike the initial devnodes), so you have to generate it for the SDK. I 
ran in to the same problem with the online image creator[1] and resorted 
to manually installing the conf files: [2]

regards,

Koen

[1] http://amethyst.openembedded.net/~koen/narcissus/
[2] 
http://dominion.thruhere.net/git/?p=narcissus.git;a=blob;f=README;h=4a6b5998b5c57dfe85b093e456b246f168cb8d2e;hb=HEAD



