Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id A8245609B1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Apr 2014 19:50:44 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id CFCC6F811FF; Mon, 28 Apr 2014 13:50:44 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 0A664F811D8;
	Mon, 28 Apr 2014 13:50:42 -0600 (MDT)
Message-ID: <535EB11D.40702@mlbassoc.com>
Date: Mon, 28 Apr 2014 13:50:53 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <49B816AC-39C5-4A62-A1E3-70A3F065DB0C@gmail.com>
In-Reply-To: <49B816AC-39C5-4A62-A1E3-70A3F065DB0C@gmail.com>
Subject: Re: [meta-xilinx-community] The URL: '${PATCH_LIST}' is invalid and cannot be interpreted
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 28 Apr 2014 19:50:46 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit

On 2014-04-28 13:46, Elvis Dowson wrote:
> Hi,
>
> In the following linux-xlnx-3.8.bbappend,
>
> http://git.yoctoproject.org/cgit/cgit.cgi/meta-xilinx-community/tree/recipes-kernel/linux/linux-xlnx_3.8.bbappend
>
> ZX3_ZYNQ7_PATCHSET = " \
> 			file://zx3-zynq7/0001-ze7000-phy-micrel-phy-init.patch                              \
> 			file://zx3-zynq7/0002-ze7000-phy-adapt-marvell-settings.patch                       \
> 			file://zx3-zynq7/0003-zynq-nand-do-not-wait-on-erase-completion-in-cmd-fct.patch    \
> 			file://zx3-zynq7/0004-clk-remove-clock-notifier-at-unregister.patch                 \
> 			file://zx3-zynq7/0005-xdevcfg-Make-sure-that-devcfg-is-not-in-loopback-mod.patch    \
> 			file://zx3-zynq7/0006-xilinx_emacps-Make-phy-address-configurable.patch             \
> 			file://zx3-zynq7/0007-kernel-sdhci-add-sd-card-support.patch                        \
> 			file://zx3-zynq7/0008-xilinx_emacps-Changed-change_mtu-so-that-it-is-possi.patch    \
> 			file://zx3-zynq7/0009-xilinx_emacps-Set-the-maximum-frame-reception-size-t.patch    \
> 			"
>
> PATCH_LIST_ze7000-zynq7 = "${ZX3_ZYNQ7_PATCHSET}”
>
> <snip>
>
> SRC_URI_append += " ${PATCH_LIST}”
>
> <snip>
>
> I get the following error, for all other machines, except for machine ze7000-zynq7:
>
> ERROR: ExpansionError during parsing /tool/yocto/meta-xilinx/recipes-kernel/linux/linux-xlnx_3.8.bb: Failure expanding variable do_fetch[file-checksums], expression was ${@bb.fetch.get_checksum_file_list(d)} which triggered exception MalformedUrl: The URL: '${PATCH_LIST}' is invalid and cannot be interpreted
>
> If I redefine
>
> SRC_URI_append += " ${PATCH_LIST_ze7000-zynq7}”
>
> it fixes the issue.
>
> However, I was wondering what is the correct way, to use the kernel PATCH_LIST variable?

Just add this to your recipe:
PATCH_LIST = ""

That way, ${PATCH_LIST} will be defined for all contexts.

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

