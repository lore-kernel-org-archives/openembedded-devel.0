Return-Path: <sjl@vctlabs.com>
Received: from dent.vctlabs.com (net-cf9a4187.iis.impulse.net [207.154.65.135])
	by mail.openembedded.org (Postfix) with ESMTP id 563666FFA4
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Jun 2016 05:47:03 +0000 (UTC)
Received: by dent.vctlabs.com (Postfix, from userid 1000)
	id 76337280702; Tue,  7 Jun 2016 22:47:04 -0700 (PDT)
Date: Tue, 7 Jun 2016 22:47:04 -0700
From: "S. Lockwood-Childs" <sjl@vctlabs.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160608054704.GW7939@vctlabs.com>
Mail-Followup-To: "S. Lockwood-Childs" <sjl@vctlabs.com>,
	openembedded-devel@lists.openembedded.org
References: <09856974BCEE6F48AB378E52E4CAA73C230E93B3@chn-hclt-mbs08.HCLT.CORP.HCL.IN>
	<5756DA11.6040509@mlbassoc.com>
	<09856974BCEE6F48AB378E52E4CAA73C230E9E59@chn-hclt-mbs08.HCLT.CORP.HCL.IN>
	<5757ADF4.2080507@mlbassoc.com>
MIME-Version: 1.0
In-Reply-To: <5757ADF4.2080507@mlbassoc.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: Reg: Yocto build error( gcc_4.8)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 08 Jun 2016 05:47:05 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 08, 2016 at 07:32:36AM +0200, Gary Thomas wrote:
> On 2016-06-08 07:20, Praveenreddy Padamati wrote:
> >Hi all,
> >
> >Please find the "gcc_4.8.bb, > do_compile failed with exit code".     error log below
> 
> Do you have any files using NFS (the Poky/Yocto tree, or the build tree)?
> That's not supported because of issues like this.
> 
> Also as mentioned, you have really old version - you should consider updating.
> 
> >| configure: loading cache ./config.cache
> >| configure: error: `CC' has changed since the previous run:
> >| configure:   former value:  `arm-poky-linux-gnueabi-gcc  -march=armv7-a -mthumb-interwork -mfloat-abi=hard -mfpu=neon -mtune=cortex-a9 --sysroot=/home/kumarn/fsl-release-bsp/build/tmp/sysroots/imx6dlsabresd'
> >| configure:   current value: `arm-poky-linux-gnueabi-gcc  -march=armv7-a -mthumb-interwork -mfloat-abi=hard -mfpu=neon -mtune=cortex-a9 --sysroot=/home/kumarn/fsl-release-bsp/build/tmp/sysroots/imx6qsabresd'
> >| configure: error: in `/home/kumarn/fsl-release-bsp/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/gcc/4.8.2-r0/gcc-4.8.2/build.arm-poky-linux-gnueabi.arm-poky-linux-gnueabi/fixincludes':
> >| configure: error: changes in the environment can compromise the build
> >| configure: error: run `make distclean' and/or `rm ./config.cache' and start over
> >| configure: error: `CC' has changed since the previous run:
> >| configure:   former value:  `arm-poky-linux-gnueabi-gcc  -march=armv7-a -mthumb-interwork -mfloat-abi=hard -mfpu=neon -mtune=cortex-a9 --sysroot=/home/kumarn/fsl-release-bsp/build/tmp/sysroots/imx6dlsabresd'
> >| configure:   current value: `arm-poky-linux-gnueabi-gcc  -march=armv7-a -mthumb-interwork -mfloat-abi=hard -mfpu=neon -mtune=cortex-a9 --sysroot=/home/kumarn/fsl-release-bsp/build/tmp/sysroots/imx6qsabresd'
> >| configure: error: in `/home/kumarn/fsl-release-bsp/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/gcc/4.8.2-r0/gcc-4.8.2/build.arm-poky-linux-gnueabi.arm-poky-linux-gnueabi/libiberty':
> >| configure: error: changes in the environment can compromise the build
> >| configure: error: run `make distclean' and/or `rm ./config.cache' and start over
> >| make[1]: *** [configure-fixincludes] Error 1
> >| make[1]: *** Waiting for unfinished jobs....
> >| make[1]: *** [configure-libiberty] Error 1

Yes 1.6 version was a while ago... bitbake got better at figuring out what to 
rebuild in modern times. Probably need to clobber the whole build/tmp area
after switching config from imx6dlsabresd to imx6qsabresd, to force a clean
start instead of assuming that an old bitbake will clean up everything that it
needs to. 

