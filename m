Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f169.google.com (unknown [209.85.213.169])
	by mail.openembedded.org (Postfix) with ESMTP id 8D88C605B3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 May 2014 05:41:29 +0000 (UTC)
Received: by mail-ig0-f169.google.com with SMTP id hl10so1269447igb.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 May 2014 22:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=tGQbwNRiiOacoYhHkEzaRdyo088hKy0HXbFDzvL5rjc=;
	b=P/N19mhs+6AtVePEeJSdqR3wY/nJu2AHtzSIvbNeBjJj5L7gv6gR2oCPbIB3PAYyHj
	dD/uepkKzPhszaHgWSlCz2cRYcjH1r4lZ23XRz6IfYMWA7d1Mj/VgQhlp4XXHgEW8OPs
	ynyG8wu7vQp/Fv/NSF/tykoIa54iIfIGyt3r6+T/mkVhcZylAIgX4T/hu0Ficc1obIF2
	2jpdmEyOmrm+PYPCKDdNlohbO7cBQ63kFhBr1PT+ZI0xBTZ6hKyLIn/WQA8GDzoqwy5F
	TDiQb8xZPLU9QaZTLo8wYC/m2pA42stKY4RroAu9LzIXfTUmUbWmIXOhL88nNhbALXhC
	n5Wg==
X-Received: by 10.42.68.18 with SMTP id v18mr13538896ici.1.1400218890132; Thu,
	15 May 2014 22:41:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.79.133 with HTTP; Thu, 15 May 2014 22:41:00 -0700 (PDT)
In-Reply-To: <CAP71Wjz70nHPpYu-kYF_rHAardHZr-bVj+La3fJaH9R9Tf9pDA@mail.gmail.com>
References: <CAFeBWL4O6Uv6d+KoKQcHdzKZpog0OYnNA794jYRcJEovw88X9g@mail.gmail.com>
	<CAP71Wjz70nHPpYu-kYF_rHAardHZr-bVj+La3fJaH9R9Tf9pDA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 15 May 2014 22:41:00 -0700
Message-ID: <CAMKF1sqQ6qEWUGOdrfaLNcmFacaGTWTiLtMtJ7YaNJyLMkENtA@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Fri, 16 May 2014 05:41:32 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, May 15, 2014 at 1:33 PM, Nicolas Dechesne
<nicolas.dechesne@linaro.org> wrote:
> On Thu, May 15, 2014 at 7:13 PM, Adam Lee <adam.yh.lee@gmail.com> wrote:
>> Hello everyone, I thought I'd compare the performance of booting
>> rootfs from MMC vs ramdisk (the way Android is doing it). Some says it
>> may possibly take longer in ramdisk because the rootfs has to be first
>> loaded into memory. I'd like to test it out myself.
>>
>> So I discovered core-image-minimal-initramfs, and thought it was
>> exactly what I needed. However the build doesn't go far, because its
>> dependency initramfs-live-install [1] only seems to support x86:

live images are for x86 only because it uses syslinux and friends.
However you can choose any other image to become initramfs image and
bunsle it into kernel

you have to use

INITRAMFS_IMAGE = "your-initramfs-image"
INITRAMFS_IMAGE_BUNDLE = "1"


>>
>> COMPATIBLE_HOST = "(i.86|x86_64).*-linux"
>>
>> Is this the limitation of current OE? or am I just looking at the wrong corner?
>
> i recently had to build an initrd too, and notice that as well... so i
> am not sure exactly what that means. I am glad you asked... however if
> you want to test an initrd, you can simply build *any* image and make
> sure to build the 'cpio' from IMAGE_FSTYPES. you can then use the
> generated cpio archive as an inited.

