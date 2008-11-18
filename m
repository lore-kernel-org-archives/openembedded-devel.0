Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1L2SOX-0003Kd-O8
	for openembedded-devel@openembedded.org; Tue, 18 Nov 2008 16:21:38 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1L2SMA-0001DB-Ms
	for openembedded-devel@openembedded.org; Tue, 18 Nov 2008 15:19:10 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 18 Nov 2008 15:19:10 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 18 Nov 2008 15:19:10 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 18 Nov 2008 16:19:02 +0100
Message-ID: <gfumd6$ki2$1@ger.gmane.org>
References: <20081115005654.GA20517@denix.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b2pre) Gecko/20081114 Shredder/3.0b1pre
In-Reply-To: <20081115005654.GA20517@denix.org>
Sender: news <news@ger.gmane.org>
Subject: Re: [RFC] Update git/git-native
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
X-List-Received-Date: Tue, 18 Nov 2008 15:21:41 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15-11-08 01:56, Denys Dmytriyenko wrote:
> Hi,
>
> I'd like to propose to update the git recipe (specifically, the native one) to
> something newer than 1.5.3, currently used. The problem with that particular
> version is that it does not work reliably through the proxy. Here is the
> symptom:
>
> $ GIT_PROXY_COMMAND=~/git-proxy.sh /OE/tmp/staging/i686-linux/usr/bin/git --version
> git version 1.5.3
>
> $ GIT_PROXY_COMMAND=~/git-proxy.sh /OE/tmp/staging/i686-linux/usr/bin/git clone git://git.infradead.org/mtd-utils.git
> Initialized empty Git repository in /tmp/mtd-utils/.git/
> fatal: The remote end hung up unexpectedly
> fatal: early EOF
> fatal: index-pack died with error code 128
> fetch-pack from 'git://git.infradead.org/mtd-utils.git' failed.
>
> The first version to work reliably with GIT_PROXY_COMMAND is 1.5.4:
>
> $ GIT_PROXY_COMMAND=~/git-proxy.sh /OE/tmp/staging/i686-linux/usr/bin/git --version
> git version 1.5.4
>
> $ GIT_PROXY_COMMAND=~/git-proxy.sh /OE/tmp/staging/i686-linux/usr/bin/git clone git://git.infradead.org/mtd-utils.git
> Initialized empty Git repository in /tmp/mtd-utils/.git/
> remote: Counting objects: 2308, done.
> remote: Compressing objeremote: cts: 100% (676/676), done.
> remote: Total 2308 (delta 1592), reused 2308 (delta 1592)
> Receiving objects: 100% (2308/2308), 942.42 KiB | 595 KiB/s, done.
> Resolving deltas: 100% (1592/1592), done.
>
> I'm not sure if there is some requirement to stick with 1.5.x version of git,
> if not the latest stable version is 1.6.0.4 - I am attaching patches for both
> just in case, with corresponding ticket #4835.
>
> Please provide any comments.

git (for the target) fails to build for arm: 
http://tinderbox.openembedded.net/packages/233747/

could you have a look at it?

regards,

Koen



