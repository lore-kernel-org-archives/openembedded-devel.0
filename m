Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <thommycheck@gmx.de>) id 1LfYZu-0007RZ-JN
	for openembedded-devel@lists.openembedded.org;
	Fri, 06 Mar 2009 12:50:58 +0100
Received: (qmail invoked by alias); 06 Mar 2009 11:46:28 -0000
Received: from p57BB734A.dip.t-dialin.net (EHLO [192.168.2.2]) [87.187.115.74]
	by mail.gmx.net (mp023) with SMTP; 06 Mar 2009 12:46:28 +0100
X-Authenticated: #2218979
X-Provags-ID: V01U2FsdGVkX1+RAWg9AxeRKYcPLC3bEPJjH0i70UXGug3TsUAG5V
	6fmsPtVlV4k9H5
Message-ID: <49B10D01.2080801@gmx.de>
Date: Fri, 06 Mar 2009 12:46:09 +0100
From: Thomas Kunze <thommycheck@gmx.de>
User-Agent: Thunderbird 2.0.0.19 (Windows/20081209)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <20090306064607.C5FCC1880D9@amethyst.openembedded.net>
In-Reply-To: <20090306064607.C5FCC1880D9@amethyst.openembedded.net>
X-Y-GMX-Trusted: 0
X-FuHaFi: 0.49
Subject: Re: [oe-commits] Koen Kooi : linux.inc: add back 'yes '' | oe_runmake oldconfig' that got dropped
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
X-List-Received-Date: Fri, 06 Mar 2009 11:50:58 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

GIT User account schrieb:
> Module: openembedded.git
> Branch: org.openembedded.dev
> Commit: cdd27f17b730c0f5ba537fdee6a9086549f67410
> URL:    http://gitweb.openembedded.net/?p=openembedded.git&a=commit;h=cdd27f17b730c0f5ba537fdee6a9086549f67410
>
> Author: Koen Kooi <koen@openembedded.org>
> Date:   Fri Mar  6 07:44:00 2009 +0100
>
> linux.inc: add back 'yes '' | oe_runmake oldconfig' that got dropped
>
> ---
>
>  packages/linux/linux.inc |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
>
> diff --git a/packages/linux/linux.inc b/packages/linux/linux.inc
> index f3d3bf8..984efac 100644
> --- a/packages/linux/linux.inc
> +++ b/packages/linux/linux.inc
> @@ -124,6 +124,7 @@ do_configure_prepend() {
>                  echo "CONFIG_ROOT_NFS=y"                 >> ${S}/.config
>                  echo "CONFIG_CMDLINE=\"${CMDLINE_NFSROOT_USB}\"" >> ${S}/.config
>          fi
> +		yes '' | oe_runmake oldconfig
>  }
>  
>  do_configure_append_avr32() {
>
>
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits
>   
I dropped it accidentally, but the same line is already in do_configure 
from kernel.bbclass. As we only prepend this task there is no reason to 
duplicate it, isn't it?


