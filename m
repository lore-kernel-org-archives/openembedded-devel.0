Return-Path: <adam.yh.lee@gmail.com>
Received: from mail-vc0-f170.google.com (unknown [209.85.220.170])
	by mail.openembedded.org (Postfix) with ESMTP id E394965EA8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 May 2014 21:10:48 +0000 (UTC)
Received: by mail-vc0-f170.google.com with SMTP id lf12so6976832vcb.29
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 May 2014 14:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=HAFNhS4+1iYNmmoLEN6IduG8N2MaH2ojKV5vvpQADz0=;
	b=ZFZ60nNCTqO7DeoYcRh3xOJa16IZ6bgxvfzn5PQcUNA+sTkl9akvOPhHRri9hH0Ve1
	36vGe0saEeX7ZJGusy8ZYMIObap0yBb5+jLOJuI2hAldD50TxtRHpXKfYvbUTHbVT08l
	D0lwPTX1HhJqB2NQ9EYUN3Y/W1nl++ZI2a6ifSRSomwsms5yWXu/uC8D2vGpJxmBZXe1
	t79K5r2VwoXjCbc6vOohKLVpf2TK2mr/eAgGBiTdKhRMz5+vh2EMgxrnEpEnrqVgCpVc
	wm+aVxaLJBX9XSaUU112/h1JZuwiU5RHxewc/dXbtoaB8Z5NbpS4TBSsXISVwDggRZDL
	elQw==
MIME-Version: 1.0
X-Received: by 10.220.106.7 with SMTP id v7mr2540925vco.46.1400274649279; Fri,
	16 May 2014 14:10:49 -0700 (PDT)
Received: by 10.52.85.67 with HTTP; Fri, 16 May 2014 14:10:49 -0700 (PDT)
In-Reply-To: <CAMKF1sqQ6qEWUGOdrfaLNcmFacaGTWTiLtMtJ7YaNJyLMkENtA@mail.gmail.com>
References: <CAFeBWL4O6Uv6d+KoKQcHdzKZpog0OYnNA794jYRcJEovw88X9g@mail.gmail.com>
	<CAP71Wjz70nHPpYu-kYF_rHAardHZr-bVj+La3fJaH9R9Tf9pDA@mail.gmail.com>
	<CAMKF1sqQ6qEWUGOdrfaLNcmFacaGTWTiLtMtJ7YaNJyLMkENtA@mail.gmail.com>
Date: Fri, 16 May 2014 14:10:49 -0700
Message-ID: <CAFeBWL5drZxwdjB78cjz-H5n7qJFLb46Lb7zS6X4c-sdh9W9Jg@mail.gmail.com>
From: Adam Lee <adam.yh.lee@gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: initramfs only supported in x86?
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
X-List-Received-Date: Fri, 16 May 2014 21:10:54 -0000
Content-Type: text/plain; charset=UTF-8

Hi Khem, thanks for your pointers. Just gave that a shot, and my
initramfs uImage actually takes longer to boot (at about 9 seconds
from cold to user space vs 7 seconds before). Good data point!

Adam

On Thu, May 15, 2014 at 10:41 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Thu, May 15, 2014 at 1:33 PM, Nicolas Dechesne
> <nicolas.dechesne@linaro.org> wrote:
>> On Thu, May 15, 2014 at 7:13 PM, Adam Lee <adam.yh.lee@gmail.com> wrote:
>>> Hello everyone, I thought I'd compare the performance of booting
>>> rootfs from MMC vs ramdisk (the way Android is doing it). Some says it
>>> may possibly take longer in ramdisk because the rootfs has to be first
>>> loaded into memory. I'd like to test it out myself.
>>>
>>> So I discovered core-image-minimal-initramfs, and thought it was
>>> exactly what I needed. However the build doesn't go far, because its
>>> dependency initramfs-live-install [1] only seems to support x86:
>
> live images are for x86 only because it uses syslinux and friends.
> However you can choose any other image to become initramfs image and
> bunsle it into kernel
>
> you have to use
>
> INITRAMFS_IMAGE = "your-initramfs-image"
> INITRAMFS_IMAGE_BUNDLE = "1"
>
>
>>>
>>> COMPATIBLE_HOST = "(i.86|x86_64).*-linux"
>>>
>>> Is this the limitation of current OE? or am I just looking at the wrong corner?
>>
>> i recently had to build an initrd too, and notice that as well... so i
>> am not sure exactly what that means. I am glad you asked... however if
>> you want to test an initrd, you can simply build *any* image and make
>> sure to build the 'cpio' from IMAGE_FSTYPES. you can then use the
>> generated cpio archive as an inited.
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

