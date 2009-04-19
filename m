Received: from [78.47.116.26] (helo=drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1LvVmE-0005gr-Nj
	for openembedded-devel@lists.openembedded.org;
	Sun, 19 Apr 2009 14:05:39 +0200
Received: from andromeda.vanille.de (e180184011.adsl.alicedsl.de
	[85.180.184.11])
	by drlauer-research.com (Postfix) with ESMTP id 21CE758462D
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Apr 2009 14:30:01 +0200 (CEST)
From: "Michael 'Mickey' Lauer" <mickey@vanille-media.de>
Organization: Vanille-Media
To: openembedded-devel@lists.openembedded.org
Date: Sun, 19 Apr 2009 14:01:26 +0200
User-Agent: KMail/1.11.2 (Linux/2.6.27-11-generic; KDE/4.2.2; x86_64; ; )
References: <200904191354.08027.g.eismann@gmx.net>
In-Reply-To: <200904191354.08027.g.eismann@gmx.net>
MIME-Version: 1.0
Message-Id: <200904191401.26942.mickey@vanille-media.de>
Subject: Re: adding new kernel defconfig
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
X-List-Received-Date: Sun, 19 Apr 2009 12:05:39 -0000
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Sunday 19 April 2009 13:54:07 G. Eismann wrote:
> Hi there,
>
> I am new with openembedded and I am trying to build a kernel for a new
> machine.
>
> In my machine config file I have these lines:
>
> PREFERRED_PROVIDER_virtual/kernel = "linux"
> PREFERRED_VERSION_linux = "2.6.25"
>
> When I build the kernel, bitake downloads a 2.6.25 kernel: OK
> But it takes the kernel config from recipes/linux/linux/defconfig
>
> I have added my own defconfig file in
> recipes/linux/linux-2.6.25/mymachine/defconfig but I dont know how to say
> bitbake to use it.

If you have set MACHINE=mymachine and are using a DISTRO configuration which 
includes a reasonable set of OVERRIDES; then $MACHINE is included in these 
OVERRIDES; which means, bitbake will copy $MACHINE/defconfig (if present) into 
$WORKDIR.

:M:



