Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1KLv8M-0001od-T7
	for openembedded-devel@openembedded.org; Thu, 24 Jul 2008 09:21:07 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1KLv7A-00013y-MJ
	for openembedded-devel@openembedded.org; Thu, 24 Jul 2008 07:19:52 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 24 Jul 2008 07:19:52 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 24 Jul 2008 07:19:52 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 24 Jul 2008 09:19:46 +0200
Message-ID: <g69aeh$5cu$1@ger.gmane.org>
References: <200807240048.20980.bluelightning@bluelightning.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Thunderbird/3.0a2pre (Macintosh; 2008062403)
In-Reply-To: <200807240048.20980.bluelightning@bluelightning.org>
Sender: news <news@ger.gmane.org>
Subject: Re: PATCH: make h2200-bootloader load & depend on mtdblock
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Thu, 24 Jul 2008 07:21:07 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Paul Eggleton wrote:
> Hi there,
>
> The attached patch fixes bug 4451 by making h2200-bootloader depend on
> kernel-module-mtdblock and load the mtdblock module before attempting to use
> it.
>
> http://bugs.openembedded.net/show_bug.cgi?id=4451
>
> Does this look OK?

No

+RDEPENDS = kernel-module-mtdblock

Never ever rdepend on a kernelmodules, since it might be built in to the 
kernel in the future (like it was in the past), only use

RRECOMMENDS_${PN} = "kernel-module-foo"

regards,

Koen



