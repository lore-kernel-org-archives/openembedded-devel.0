Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1R7PpH-0008MS-F6
	for openembedded-devel@lists.openembedded.org;
	Sat, 24 Sep 2011 12:51:19 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 999)
	id 7605F166095D; Sat, 24 Sep 2011 04:45:58 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from hermes.chez-thomas.org (localhost.localdomain [127.0.0.1])
	by mail.chez-thomas.org (Postfix) with ESMTP id CFA4B16608EC;
	Sat, 24 Sep 2011 04:45:56 -0600 (MDT)
Message-ID: <4E7DB4E4.5090202@mlbassoc.com>
Date: Sat, 24 Sep 2011 04:45:56 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:6.0.2) Gecko/20110906 Thunderbird/6.0.2
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1316770597.99899.YahooMailNeo@web121512.mail.ne1.yahoo.com>
	<4E7C63C8.3050900@mlbassoc.com>
	<CAOU-OA+uKFYL4nJutdTHsUCYnGy9=NiYW65jGbRk76+GL6iocg@mail.gmail.com>
In-Reply-To: <CAOU-OA+uKFYL4nJutdTHsUCYnGy9=NiYW65jGbRk76+GL6iocg@mail.gmail.com>
Subject: Re: ti_cgt_c6000_6.1.17_setup_linux_x86.bin error while installing ti-codec-engine
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
X-List-Received-Date: Sat, 24 Sep 2011 10:51:19 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2011-09-23 14:46, Michael Poole wrote:
> On Fri, Sep 23, 2011 at 6:47 AM, Gary Thomas wrote:
>> Check to make sure that you don't have write permission to /opt
>> If you have write permission in the directory /opt, the installer
>> fails to put the tools where they belong in your OE build.
>
> Is it generally known that this limitation is due to a bug in
> ti-eula-unpack.inc?  (Python's print automatically adds a newline,
> which the code's author apparently did not expect.)  My local repo has
> these changes to allow in-tree installs by users with write access to
> /opt; please pardon Gmail's mangling of leading whitespace:

I don't know if this is a generally known fact; it should be, I reported it to
this list more than a year ago and was basically ignored [actually told I just
shouldn't have write access to /opt so the issue was my own fault...]

Does the unpack work with your patches if /opt is not writeable?

>
> diff --git a/recipes/powervr-drivers/libgles-omap3.inc b/recipes/powervr-driv
> index ab4b248..5acc4da 100644
> --- a/recipes/powervr-drivers/libgles-omap3.inc
> +++ b/recipes/powervr-drivers/libgles-omap3.inc
> @@ -19,7 +19,8 @@ SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sd
>   S = "${WORKDIR}/OMAP35x_Graphics_SDK_${SGXPV}"
>
>   # Logic to unpack installjammer file
> -TI_BIN_UNPK_CMDS="Y: qY:workdir:Y"
> +TI_BIN_UNPK_CMDS="Y:workdir"
> +TI_BIN_UNPK_WDEXT = "/Graphics_SDK_${SGXPV}"
>   require ../ti/ti-eula-unpack.inc
>
>   BINLOCATION ?= "${S}/gfx_rel"
> diff --git a/recipes/powervr-drivers/omap3-sgx-modules_1.6.16.3977.bb b/recip
> index 216b3ae..be4b7a1 100644
> --- a/recipes/powervr-drivers/omap3-sgx-modules_1.6.16.3977.bb
> +++ b/recipes/powervr-drivers/omap3-sgx-modules_1.6.16.3977.bb
> @@ -5,7 +5,8 @@ LICENSE = "GPLv2"
>   # http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsdk/
>   # see libgles-omap3.inc for detailed installation instructions
>
> -TI_BIN_UNPK_CMDS="Y: qY:workdir:Y"
> +TI_BIN_UNPK_CMDS="Y:workdir:"
> +TI_BIN_UNPK_WDEXT = "/Graphics_SDK_${SGXPV}"
>   require ../ti/ti-eula-unpack.inc
>
>   SGXPV = "4_03_00_02"
> diff --git a/recipes/ti/ti-eula-unpack.inc b/recipes/ti/ti-eula-unpack.inc
> index 3b79c24..82ea785 100644
> --- a/recipes/ti/ti-eula-unpack.inc
> +++ b/recipes/ti/ti-eula-unpack.inc
> @@ -53,7 +53,7 @@ python ti_bin_do_unpack() {
>               wdext = bb.data.getVar('TI_BIN_UNPK_WDEXT', localdata)
>               wdext = bb.data.expand(wdext, localdata)
>               cmd = workdir+wdext
> -        print>>f, "%s\n" % cmd
> +        print>>f, "%s" % cmd
>       f.close()
>
>       # Expand the tarball that was created if required
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


