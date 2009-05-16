Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1M5FnY-0002kz-Uk
	for openembedded-devel@openembedded.org; Sat, 16 May 2009 11:03:21 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1M5Fgj-0003UH-LB
	for openembedded-devel@openembedded.org; Sat, 16 May 2009 08:56:13 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sat, 16 May 2009 08:56:13 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Sat, 16 May 2009 08:56:13 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sat, 16 May 2009 10:55:58 +0200
Message-ID: <gulv2v$l9r$1@ger.gmane.org>
References: <C62896630644CE43BF64B0FF0AC27F0E05AF1C@mail.ad.skymv.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b5pre) Gecko/20090510 Shredder/3.0b3pre
In-Reply-To: <C62896630644CE43BF64B0FF0AC27F0E05AF1C@mail.ad.skymv.com>
Sender: news <news@ger.gmane.org>
Subject: Re: Kernel modules
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
X-List-Received-Date: Sat, 16 May 2009 09:03:29 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16-05-09 01:22, Chuck Kamas wrote:
> Hi all,
>
> I am trying to compile a very small kernel.  To do this I have a few
> kernel modules I would like in the root file system.  But when I load OE
> I see that there are no kernel modules in the fs.  I found a way to
> include them by adding a RDEPENDS line with kernel-module-i2c-core.

And it can't be said enough:

NEVER use rdepends to drag in kernelmodules, use rrecommends instead



