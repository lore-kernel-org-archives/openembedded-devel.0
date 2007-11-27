Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rpurdie@rpsys.net>) id 1Ix08y-0000Kw-U7
	for openembedded-devel@openembedded.org; Tue, 27 Nov 2007 14:06:29 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id lARD3cJd015384
	for <openembedded-devel@openembedded.org>; Tue, 27 Nov 2007 13:03:38 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 15060-08 for <openembedded-devel@openembedded.org>;
	Tue, 27 Nov 2007 13:03:35 +0000 (GMT)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id lARD3Ys2015378
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>; Tue, 27 Nov 2007 13:03:34 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <474BFBF6.2000602@whitby.id.au>
References: <474BFBF6.2000602@whitby.id.au>
Date: Tue, 27 Nov 2007 13:03:33 +0000
Message-Id: <1196168613.6780.21.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: RFC: Adding endian support to linux.inc
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 27 Nov 2007 13:06:29 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2007-11-27 at 21:43 +1030, Rod Whitby wrote:
> I wish to propose the following patch to linux.inc to enable automatic
> support for setting the endian configuration value for those CPUs that
> can run in both big and little endian modes.
> 
> This is the first step in rationalisation of ixp4xx-kernel.inc to more
> closely match the other kernel recipes in OE.
> 
> Note that SITEINFO_ENDIANESS is set automatically by siteinfo.class for
> all OE MACHINE settings, not just when MACHINE is ixp4xx.
> 
> Also note that there is no '=' sign near the end of the line added to
> the call to sed.  This is intentional, to remove both commented and
> uncommented settings of CPU_BIG_ENDIAN in the original defconfig.
> 
> --- packages/linux/linux.inc    14e3b9590c6a3ef9334959ab19c1b24b1954b55b
> +++ packages/linux/linux.inc    12ee7627f507a1eb127802f7268674f901a357fc
> @@ -41,11 +41,19 @@ do_configure_prepend() {
>                  echo "# CONFIG_OABI_COMPAT is not set"  >> ${S}/.config
>          fi
> 
> +       #
> +       # endian support
> +       #
> +        if [ "${SITEINFO_ENDIANESS}" = "be" ]; then
> +                echo "CONFIG_CPU_BIG_ENDIAN=y"          >> ${S}/.config
> +        fi
> +
>          echo "CONFIG_CMDLINE=\"${CMDLINE}\"" >> ${S}/.config
> 
>          sed -e '/CONFIG_AEABI/d' \
>              -e '/CONFIG_OABI_COMPAT=/d' \
>              -e '/CONFIG_CMDLINE=/d' \
> +            -e '/CONFIG_CPU_BIG_ENDIAN/d' \
>              -e '/CONFIG_LOGO=/d' \
>              -e '/CONFIG_LOGO_LINUX_CLUT224=/d' \
>              < '${WORKDIR}/defconfig' >>'${S}/.config'
> 
> Silence will be taken as acceptance, and if there are no objections this
> change will be committed sometime this coming weekend.

Ack from me.

It sounds like those other = signs are bugs?

Also, we should really add a function to kernel.bbclass which does this
neatly without all the shell foo. But that is for another time/place
(writing such a function is somewhere on my todo list) :).

Cheers,

Richard






