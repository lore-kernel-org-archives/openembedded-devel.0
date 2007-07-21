Received: from [64.233.162.235] (helo=nz-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <sdgvulpes@gmail.com>) id 1ICEBb-0004rG-CZ
	for openembedded-devel@lists.openembedded.org;
	Sat, 21 Jul 2007 14:35:51 +0200
Received: by nz-out-0506.google.com with SMTP id j2so893784nzf
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Jul 2007 05:35:00 -0700 (PDT)
Received: by 10.142.76.4 with SMTP id y4mr97272wfa.1185021299718;
	Sat, 21 Jul 2007 05:34:59 -0700 (PDT)
Received: by 10.143.40.5 with HTTP; Sat, 21 Jul 2007 05:34:59 -0700 (PDT)
Message-ID: <f34f85580707210534m7c736ad5p4f81e24a21413078@mail.gmail.com>
Date: Sat, 21 Jul 2007 08:34:59 -0400
From: "Todd Blumer" <sdgvulpes@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <E1ICDci-0000NH-2q@linuxtogo.org>
MIME-Version: 1.0
References: <E1ICDci-0000NH-2q@linuxtogo.org>
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] org.oe.dev hx4700.conf: prefer version 1.2.0 of xserver-kdrive since it supports w100
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
X-List-Received-Date: Sat, 21 Jul 2007 12:35:52 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

OK, it took me a bit to get the commit keys working. Sorry about all
of the "junk" added to the tree. Got it resolved now.
--
Todd


On 7/21/07, todd commit <openembedded-commits@lists.openembedded.org> wrote:
> hx4700.conf: prefer version 1.2.0 of xserver-kdrive since it supports w100
>
> Author: todd@openembedded.org
> Branch: org.openembedded.dev
> Revision: 32975812e0004f33de2c1c4806e1b4f94c1f9b83
> ViewMTN: http://monotone.openembedded.org/revision.psp?id=32975812e0004f33de2c1c4806e1b4f94c1f9b83
> Files:
> 1
> conf/machine/hx4700.conf
> Diffs:
>
> #
> # mt diff -r0c6870e8d6fb45fd8c2560a65ff6d82d6a044a78 -r32975812e0004f33de2c1c4806e1b4f94c1f9b83
> #
> #
> #
> # patch "conf/machine/hx4700.conf"
> #  from [a98297fd1c958ca100de38bd071c622423c22d11]
> #    to [7fc3dbf7c795d1c23929a02c6fb2d560d8674018]
> #
> ============================================================
> --- conf/machine/hx4700.conf    a98297fd1c958ca100de38bd071c622423c22d11
> +++ conf/machine/hx4700.conf    7fc3dbf7c795d1c23929a02c6fb2d560d8674018
> @@ -27,7 +27,9 @@ MODUTILS = "26"
>  PREFERRED_PROVIDER_virtual/kernel = "linux-handhelds-2.6"
>  PCMCIA_MANAGER = "pcmciautils"
>  MODUTILS = "26"
> +
>  XSERVER = "xserver-kdrive-w100"
> +PREFERRED_VERSION_xserver-kdrive = "1.2.0"
>
>  PREFERRED_VERSION_orinoco-modules = "0.15rc1"
>
>
>
>
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits
>


