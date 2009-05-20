Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1M6n7k-0001bK-EM
	for openembedded-devel@openembedded.org; Wed, 20 May 2009 16:50:29 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1M6n0S-0008Fz-67
	for openembedded-devel@openembedded.org; Wed, 20 May 2009 14:42:56 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 20 May 2009 14:42:56 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 20 May 2009 14:42:56 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 20 May 2009 16:42:45 +0200
Message-ID: <gv14t5$8pn$1@ger.gmane.org>
References: <1242805678-20645-1-git-send-email-denis@denix.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b5pre) Gecko/20090515 Shredder/3.0b3pre
In-Reply-To: <1242805678-20645-1-git-send-email-denis@denix.org>
Sender: news <news@ger.gmane.org>
Subject: Re: [PATCHv2 0/8] Restructure TI DaVinci platforms and introduce new EVMs
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
X-List-Received-Date: Wed, 20 May 2009 14:50:49 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20-05-09 09:47, Denys Dmytriyenko wrote:
> Second version of the patches, addressing all the previous comments.
>
> This set of patches restructures the support for Texas Instruments DaVinci
> platforms by reusing the existing davinci-dvevm machine (renaming it along
> the way to a more specific dm6446-evm) and introducing new EVM boards -
> dm6467-evm, dm355-evm, dm365-evm and dm357-evm. Not all the boards have
> proper support in the upstream kernel/u-boot yet.

Looks good to me

regards,

Koen



>
> Denys Dmytriyenko (8):
>    davinci.inc: add common DaVinci machine configuration
>    dm6446-evm: rename machine from davinci-dvevm and add defconfig
>    dm6467-evm: add new machine definition and defconfig
>    dm355-evm: add new machine definition and defconfig
>    dm365-evm: add new machine definition
>    dm357-evm: add new machine definition
>    linux-davinci: build linux-davinci kernels for dm6446, dm6467 and
>      dm355 EVMs
>    u-boot: update git recipe with the new DaVinci EVMs
>
>   conf/machine/davinci-dvevm.conf                  |   24 -
>   conf/machine/dm355-evm.conf                      |    7 +
>   conf/machine/dm357-evm.conf                      |    7 +
>   conf/machine/dm365-evm.conf                      |    7 +
>   conf/machine/dm6446-evm.conf                     |    7 +
>   conf/machine/dm6467-evm.conf                     |    7 +
>   conf/machine/include/davinci.inc                 |   26 +
>   recipes/linux/linux-davinci/dm355-evm/defconfig  | 1223 +++++++++++++++
>   recipes/linux/linux-davinci/dm6446-evm/defconfig | 1738 ++++++++++++++++++++++
>   recipes/linux/linux-davinci/dm6467-evm/defconfig | 1241 +++++++++++++++
>   recipes/linux/linux-davinci_2.6.28.bb            |    4 +-
>   recipes/linux/linux-davinci_git.bb               |   11 +-
>   recipes/u-boot/u-boot_git.bb                     |    6 +-
>   13 files changed, 4278 insertions(+), 30 deletions(-)
>   delete mode 100644 conf/machine/davinci-dvevm.conf
>   create mode 100644 conf/machine/dm355-evm.conf
>   create mode 100644 conf/machine/dm357-evm.conf
>   create mode 100644 conf/machine/dm365-evm.conf
>   create mode 100644 conf/machine/dm6446-evm.conf
>   create mode 100644 conf/machine/dm6467-evm.conf
>   create mode 100644 conf/machine/include/davinci.inc
>   create mode 100644 recipes/linux/linux-davinci/dm355-evm/defconfig
>   create mode 100644 recipes/linux/linux-davinci/dm6446-evm/defconfig
>   create mode 100644 recipes/linux/linux-davinci/dm6467-evm/defconfig




