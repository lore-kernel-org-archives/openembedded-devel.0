Received: from moutng.kundenserver.de ([212.227.17.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eng1@koblersystems.de>) id 1PvSK9-0005MF-Hc
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Mar 2011 11:33:41 +0100
Received: from [192.168.1.34] (p57B40AF4.dip0.t-ipconnect.de [87.180.10.244])
	by mrelayeu.kundenserver.de (node=mreu1) with ESMTP (Nemesis)
	id 0Lgc09-1QIcxR47qX-00oPwt; Fri, 04 Mar 2011 10:52:25 +0100
Message-ID: <4D70B652.7010706@koblersystems.de>
Date: Fri, 04 Mar 2011 10:52:18 +0100
From: Jan Kobler <eng1@koblersystems.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20110120 Lightning/1.0b3pre Thunderbird/3.1.7
MIME-Version: 1.0
To: Marc Reilly <marc@cpdesign.com.au>
References: <1298984498-27148-1-git-send-email-eng1@koblersystems.de>
	<201103030924.09980.marc@cpdesign.com.au>
In-Reply-To: <201103030924.09980.marc@cpdesign.com.au>
X-Provags-ID: V02:K0:UDE6Yt/BCBT9szVZGCp9TB3fYr+uCysEbXoOXjZZg66
	le2H8mL+yfBD6p9U/SYCCiYkFWZy2CUnNpthvkgrB5agq0rr6/
	Q2vbXFLT+aOs3t2k41Yr8iJ/O8l1QmjGB0qUD21+Wh5e7n0d5Q
	naOPe6noET3qC4yGqju7v8LAiQn7UdJ3aDVTjjs60X1SqvA8Dg
	At0MUqdEBrcYVZeDwwZ4Q==
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [pcm043 1/2] New machine pcm043 Phytec phyCORE-i.MX35
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
X-List-Received-Date: Fri, 04 Mar 2011 10:33:41 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi Marc,

1. I have not found a libgles-mx31 either.

This seems to provide the binary openGL ES library for the i.MX31, like
libgles-omap3 for the beagleboard.

I have derived the BSP for the pcm043 from the BSP of mx31ads and I
copied these definitions too. This seems to be also a problem of mx31ads.

The i.MX31 has a MBX R-S 3D Graphics Core.

2. Before I have released the patch, I have built with bitbake the
minimal-image, opie-image, x11-gpe-image and the xfce46-image for the
pcm043 machine and tested it on the board for a short time.
It is described here:
http://en.gentoo-wiki.com/wiki/Phytec_phyCORE-iMX35/Openembedded

All these images don't use the libgles-mx31. Only when I try to build
the illume-image, bitbake reports a missing libgles-mx31.

3. The i.MX35 has an embedded 2D and vector graphics accelerator
targeting the OpenVG 1.1 graphics API and feature set. The libgles-mx31
is for a different GPU. The i.MX35 doesn't need the libgles-mx31.

I have already tried a new patch, where libgles-mx31 is not used, but I
could not build illume-image successfully. It got stuck somewhere else.

I would like to be able to prove that a patch is working on my board,
before I release it.

4. Are you trying to create an image, where libgles-mx31 is missing?

Best regards

Jan




