Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f169.google.com (mail-ie0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id 2C5E560EFA
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Apr 2014 20:23:51 +0000 (UTC)
Received: by mail-ie0-f169.google.com with SMTP id rl12so1004166iec.14
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Apr 2014 13:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=r+SnLHNyzeGNPkXQ9zn7cFf4vTvbusyGO84eNAtseLg=;
	b=QEqsKfPEEgJIjAeRw7+pZ/66Of9XA5QMNZFgMiLxEX2jJndOUXgUhxBscmWcb8anI3
	Mvlzae93+jfXzrXg1k/mLZp+VaXWk9PphYy+Ty+6HHgaVua/ie+LYF5WPi0EdYd8rvzC
	oGzO3ApyULUsi9f0btANK7cNgmzBbFCKJcp91JTj086W4e/BNPhHfnYb9X17QCDa+8iW
	3ik7MZh+AHNtkMlgyJti4zUMgkCOiWjLhvWOJB4YBork+Zz/C90OvcJHBfIsUsRcqE8d
	kgHuqwzO8kMNuCWjnmbIP9iAOtFI//6PHPQBikc/Bu5K91/8f0Z0eE7Mq7rcd5wpV0E1
	Qkhg==
MIME-Version: 1.0
X-Received: by 10.50.43.136 with SMTP id w8mr26840203igl.20.1398716631176;
	Mon, 28 Apr 2014 13:23:51 -0700 (PDT)
Received: by 10.50.229.14 with HTTP; Mon, 28 Apr 2014 13:23:51 -0700 (PDT)
Received: by 10.50.229.14 with HTTP; Mon, 28 Apr 2014 13:23:51 -0700 (PDT)
In-Reply-To: <535EB11D.40702@mlbassoc.com>
References: <49B816AC-39C5-4A62-A1E3-70A3F065DB0C@gmail.com>
	<535EB11D.40702@mlbassoc.com>
Date: Mon, 28 Apr 2014 13:23:51 -0700
Message-ID: <CAMKF1sqd2H+bEg1s7T0m0m8C2R9ET1aOJsppEZOQLxs0TYBPGA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
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
X-List-Received-Date: Mon, 28 Apr 2014 20:23:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

-Khem
On Apr 28, 2014 12:51 PM, "Gary Thomas" <gary@mlbassoc.com> wrote:
>
> On 2014-04-28 13:46, Elvis Dowson wrote:
>>
>> Hi,
>>
>> In the following linux-xlnx-3.8.bbappend,
>>
>>
http://git.yoctoproject.org/cgit/cgit.cgi/meta-xilinx-community/tree/recipe=
s-kernel/linux/linux-xlnx_3.8.bbappend
>>
>> ZX3_ZYNQ7_PATCHSET =3D " \
>>
file://zx3-zynq7/0001-ze7000-phy-micrel-phy-init.patch
         \
>>
file://zx3-zynq7/0002-ze7000-phy-adapt-marvell-settings.patch
        \
>>
file://zx3-zynq7/0003-zynq-nand-do-not-wait-on-erase-completion-in-cmd-fct.=
patch
   \
>>
file://zx3-zynq7/0004-clk-remove-clock-notifier-at-unregister.patch
        \
>>
file://zx3-zynq7/0005-xdevcfg-Make-sure-that-devcfg-is-not-in-loopback-mod.=
patch
   \
>>
file://zx3-zynq7/0006-xilinx_emacps-Make-phy-address-configurable.patch
        \
>>
file://zx3-zynq7/0007-kernel-sdhci-add-sd-card-support.patch
         \
>>
file://zx3-zynq7/0008-xilinx_emacps-Changed-change_mtu-so-that-it-is-possi.=
patch
   \
>>
file://zx3-zynq7/0009-xilinx_emacps-Set-the-maximum-frame-reception-size-t.=
patch
   \
>>                         "
>>
>> PATCH_LIST_ze7000-zynq7 =3D "${ZX3_ZYNQ7_PATCHSET}=E2=80=9D
>>
>> <snip>
>>
>> SRC_URI_append +=3D " ${PATCH_LIST}=E2=80=9D
>>
>> <snip>
>>
>> I get the following error, for all other machines, except for machine
ze7000-zynq7:
>>
>> ERROR: ExpansionError during parsing
/tool/yocto/meta-xilinx/recipes-kernel/linux/linux-xlnx_3.8.bb: Failure
expanding variable do_fetch[file-checksums], expression was
${@bb.fetch.get_checksum_file_list(d)} which triggered exception
MalformedUrl: The URL: '${PATCH_LIST}' is invalid and cannot be interpreted
>>
>> If I redefine
>>
>> SRC_URI_append +=3D " ${PATCH_LIST_ze7000-zynq7}=E2=80=9D
>>
>> it fixes the issue.
>>
>> However, I was wondering what is the correct way, to use the kernel
PATCH_LIST variable?
>
>
> Just add this to your recipe:
> PATCH_LIST =3D ""
>

?=3D is better here

> That way, ${PATCH_LIST} will be defined for all contexts.
>
> --
> ------------------------------------------------------------
> Gary Thomas                 |  Consulting for the
> MLB Associates              |    Embedded world
> ------------------------------------------------------------
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

