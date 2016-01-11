Return-Path: <ankur.tyagi85@gmail.com>
Received: from mail-vk0-f46.google.com (mail-vk0-f46.google.com
	[209.85.213.46])
	by mail.openembedded.org (Postfix) with ESMTP id C67067317D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Jan 2016 19:25:51 +0000 (UTC)
Received: by mail-vk0-f46.google.com with SMTP id i129so91924762vkb.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Jan 2016 11:25:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=FtEe9ho+8SNutg5EI2ZJ0z4FZ/uDXnVkPmeAc3IcX7o=;
	b=HJBPF5shdAM//zAk1vNT0UzT2rS3/CmcftlDgRXazg1H5OIcRiLV/x/r6EoG76ll8e
	5LNj0kS3olhoiyy60zfmBJiM6rUaLf505dzbV4r6e0ptlABxeF93ZTL7x7EUs/lKd5r5
	2iyncaBHJg0Mh7EzSYJRKZFTyDSQWbYOV7A1pNDPTiQrsZs2mlRAX3lNLTGiwSwaVFyb
	eejbqyS9AH6v50aV1UW1S2VrFlqTFKAiIBiCn5rP2vl4rHOHYL6v8eS9ki/GyCZYhweW
	yDgDxCiRMJmiQTOYYhkPCRE1LDRnWaFeliY2P3PrCBlH4yl7XzAM7D77D7564QjghYfd
	oZnA==
X-Received: by 10.31.3.207 with SMTP id f76mr91247698vki.15.1452540351808;
	Mon, 11 Jan 2016 11:25:51 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.166.146 with HTTP; Mon, 11 Jan 2016 11:25:32 -0800 (PST)
In-Reply-To: <CAMKF1sqmg8gOj3_jjJTGebJQj+msh5tquKnOOV8zwShJtoHaUA@mail.gmail.com>
References: <CADySD0EiW1oO_wezsLtEFX8h2V-ByykrgfSvOvGLJJLWyrm4uw@mail.gmail.com>
	<CAMKF1sqmg8gOj3_jjJTGebJQj+msh5tquKnOOV8zwShJtoHaUA@mail.gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Mon, 11 Jan 2016 11:25:32 -0800
Message-ID: <CADySD0Fx+VpoaPNgFSwvne6D1ENxH=F-v4cpSJmjRtc2rpkS2A@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: bitbake meta-toolchain-qt5 error
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
X-List-Received-Date: Mon, 11 Jan 2016 19:25:52 -0000
Content-Type: text/plain; charset=UTF-8

included stdint.h in qnetworkinfo_linux.cpp but still getting the same error

On Mon, Jan 11, 2016 at 10:47 AM, Khem Raj <raj.khem@gmail.com> wrote:

> On Mon, Jan 11, 2016 at 10:37 AM, Ankur Tyagi <ankur.tyagi85@gmail.com>
> wrote:
> >
> /home/nws/yocto-fido-dev/oe-layersetup/build/arago-tmp-external-linaro-toolchain/sysroots/am335x-evm/usr/include/bluetooth/bluetooth.h:159:9:
> > error: expected identifier before '*' token
> > |   return bt_get_unaligned((const uint64_t *) ptr);
>
> this means that stdint.h is missing from includes.
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

