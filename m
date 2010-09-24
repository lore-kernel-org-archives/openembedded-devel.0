Received: from 68.mail-out.ovh.net ([91.121.185.69])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1OzAN7-0000VT-CI
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Sep 2010 17:39:38 +0200
Received: (qmail 31848 invoked by uid 503); 24 Sep 2010 15:53:21 -0000
Received: from 30.mail-out.ovh.net (213.186.62.213)
	by 68.mail-out.ovh.net with SMTP; 24 Sep 2010 15:53:21 -0000
Received: (qmail 9827 invoked by uid 503); 24 Sep 2010 15:22:00 -0000
Received: from b6.ovh.net (HELO mail420.ha.ovh.net) (213.186.33.56)
	by 30.mail-out.ovh.net with SMTP; 24 Sep 2010 15:21:59 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 24 Sep 2010 17:39:28 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO ?192.168.1.15?)
	(ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 24 Sep 2010 17:39:28 +0200
Message-ID: <4C9CC62F.5000804@eukrea.com>
Date: Fri, 24 Sep 2010 17:39:27 +0200
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; fr;
	rv:1.9.2.9) Gecko/20100915 Thunderbird/3.1.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1285339946-7340-1-git-send-email-iwamatsu@nigauri.org>
In-Reply-To: <1285339946-7340-1-git-send-email-iwamatsu@nigauri.org>
X-Ovh-Tracer-Id: 14280914419413331273
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-SA-Exim-Connect-IP: 91.121.185.69
X-SA-Exim-Mail-From: eric@eukrea.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] machine/sh7785lcr: Add new machine for Renesas SH7785 reference board
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
X-List-Received-Date: Fri, 24 Sep 2010 15:39:38 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

Le 24/09/2010 16:52, Nobuhiro Iwamatsu a écrit :
> * Machine config for Renesas SH7785 reference board.
> * Add kernel config for 2.6.32, 33, 34 and 35.
>
> Signed-off-by: Nobuhiro Iwamatsu<iwamatsu@nigauri.org>
> ---
>   conf/machine/include/tune-sh4.inc              |    2 +
>   conf/machine/sh7785lcr.conf                    |   20 +
>   recipes/linux/linux-2.6.32/sh7785lcr/defconfig | 1833 ++++++++++++++++++++++
>   recipes/linux/linux-2.6.33/sh7785lcr/defconfig | 1869 +++++++++++++++++++++++
>   recipes/linux/linux-2.6.34/sh7785lcr/defconfig | 1877 +++++++++++++++++++++++
>   recipes/linux/linux-2.6.35/sh7785lcr/defconfig | 1927 ++++++++++++++++++++++++
>   recipes/linux/linux_2.6.35.bb                  |    1 +
>   7 files changed, 7529 insertions(+), 0 deletions(-)
>   create mode 100644 conf/machine/sh7785lcr.conf
>   create mode 100644 recipes/linux/linux-2.6.32/sh7785lcr/defconfig
>   create mode 100644 recipes/linux/linux-2.6.33/sh7785lcr/defconfig
>   create mode 100644 recipes/linux/linux-2.6.34/sh7785lcr/defconfig
>   create mode 100644 recipes/linux/linux-2.6.35/sh7785lcr/defconfig
>
you only neet to add the defconfig for the kernel you support (2.6.35) 
as the other files won't be used.

Eric


