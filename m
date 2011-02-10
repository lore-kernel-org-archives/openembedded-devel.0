Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Pndc4-00072t-60
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Feb 2011 21:59:40 +0100
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1Pndb0-0001lg-NK from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Feb 2011 12:58:34 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Thu, 10 Feb 2011 12:58:34 -0800
Received: from [172.30.80.144] ([172.30.80.144]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 10 Feb 2011 13:58:33 -0700
Message-ID: <4D545173.8080904@mentor.com>
Date: Thu, 10 Feb 2011 13:58:27 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4D544976.6010800@drewtech.com>
In-Reply-To: <4D544976.6010800@drewtech.com>
X-OriginalArrivalTime: 10 Feb 2011 20:58:33.0672 (UTC)
	FILETIME=[4762AC80:01CBC965]
Subject: Re: openembedded with a prebuilt external toolchain
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
X-List-Received-Date: Thu, 10 Feb 2011 20:59:40 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/10/2011 01:24 PM, Joey Oravec wrote:
> Hi,
>
> I'm trying to use openembedded with an external prebuilt toolchain. The
> docs at http://docs.openembedded.org/usermanual/usermanual.html mark
> this as TODO so maybe we can "do" that in this email chain. :)
>
> Marvell provides a *.tar.gz with gcc and C libraries, which I've
> uncompressed somewhere in my home directory. My goal is to build a root
> filesystem with some assortment of packages, but at this point I'm just
> trying "bitbake nano" which is the very first example in the Getting
> Started. That seems like a logical start to board bring-up.
>
> I'm assuming that I need to add some lines to build/conf/local.conf that
> tell OE to make no attempt at building its own compiler or C library (it
> can't anyway, it doesn't know my chip!) and to call my pre-built one
> instead. It looks like I'd want to add a few lines about TOOLCHAIN_*,
> but that uses a recipe for external toolchain, which assumes that it has
> some meta toolchain, and I'm floundering and getting nowhere. Couldn't
> find any of these magic variables documented in the usermanual so I've
> been digging through recipes to learn any of this.
>
> Is it possible to add a few lines that tell OE the path and filename of
> my compiler? Or is it more complicated than that?

We talked about this a little on IRC and I provided the example of how 
to use the CodeSourcery recipes that exist today.  The marvell toolchain 
however will need it's own special love.  To start with, using the CSL 
recipe is roughly:
### CSL public ARM does <arch>-none-linux, so fill in the -none.
#TOOLCHAIN_VENDOR = "-none"
### CSL public ia32 does i686-pc-linux, so fill in the -pc.
#TOOLCHAIN_VENDOR = "-pc"

#### Bring in external-toolchain-csl.bb
#TOOLCHAIN_BRAND = "csl"
#TOOLCHAIN_TYPE = "external"

### Where the CSL version is installed.
#TOOLCHAIN_PATH = "/scratch/ia32-2010.09"
### Where inside the CSL install the target libraries exist.
#TOOLCHAIN_SYSPATH = "${TOOLCHAIN_PATH}/i686-pc-linux-gnu"
### Add tools to the PATH automatically.
#PATH_prepend = "${TOOLCHAIN_PATH}/bin:"

Now what you'll want to do is make an external-toolchain-marvell.bb and 
set TOOLCHAIN_BRAND to "marvell" and tweak TOOLCHAIN_VENDOR such that we 
go from what OE normally says TARGET_SYS is to what your tools actually 
say it is.  Then it's a matter of tweaking the contents of 
external-toolchain-marvell.bb to copy the right things out of the 
marvell install and into where OE wants them.  In this regard, the -csl 
recipe may be more instructive than the -generic recipe as the -generic 
recipe (along with external-toolchain.bb) are targeted at toolchains 
exported by OE and thus require little mangling to work.

-- 
Tom Rini
Mentor Graphics Corporation


