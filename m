Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1M5aqz-0007ZV-DV
	for openembedded-devel@openembedded.org; Sun, 17 May 2009 09:32:13 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1M5ak3-0003GL-B9
	for openembedded-devel@openembedded.org; Sun, 17 May 2009 07:25:03 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sun, 17 May 2009 07:25:03 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Sun, 17 May 2009 07:25:03 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sun, 17 May 2009 09:24:51 +0200
Message-ID: <guoe44$ff1$1@ger.gmane.org>
References: <C62896630644CE43BF64B0FF0AC27F0E05AF1C@mail.ad.skymv.com>	<200905160931.25224.marcin@juszkiewicz.com.pl>	<200905161121.55689.g.eismann@gmx.net>
	<f96d234e0905161438u2bd28611lb3041e4dc5d0afe8@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b5pre) Gecko/20090510 Shredder/3.0b3pre
In-Reply-To: <f96d234e0905161438u2bd28611lb3041e4dc5d0afe8@mail.gmail.com>
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
X-List-Received-Date: Sun, 17 May 2009 07:32:13 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16-05-09 23:38, Cliff Brake wrote:
> On Sat, May 16, 2009 at 5:21 AM, G. Eismann<g.eismann@gmx.net>  wrote:
>
>> BTW, is there any way to install the modules but not the kernel image?
>> I have the kernel in a separate partition, so I don't need it into the rootfs.
>
> One way is to put the following in the kernel recipe:
>
> FILES_kernel-image_<machine_name>  = ""

Please don't do that, it breaks all sorts of things, one of which is 
field upgrades.

regards,

Koen



