Return-Path: <adam.yh.lee@gmail.com>
Received: from mail-ve0-f171.google.com (unknown [209.85.128.171])
	by mail.openembedded.org (Postfix) with ESMTP id E87E860144
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 May 2014 22:58:13 +0000 (UTC)
Received: by mail-ve0-f171.google.com with SMTP id oz11so2156967veb.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 May 2014 15:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=PkNoXVAKRoDyiaQaUcFAvyRGQbqLKSv/S7KmFlX+iQA=;
	b=o+5Yxb4n3I9snyt/pos6NK1wOBn20B0Fvfq0OMn1l3/ud7Nkmfe0RKFLemleS7rtM5
	FQsYgYGKCdNAaV9WdbXWtZ+eQXov+FubimgwAhSBBb00R4lr87ibpVCBpM40vaqA924t
	75z5M9rebOL5WBB1g1UydNJ++k6DHqOlHdxOLDgO/BmbxzZe0e/1HFsWUimzqwF73cyW
	+D6BCNK3UNEvIWzlg6WysEUaeK6geSB4lu8qKTUV94UTcp0qmi5LRsIadXWhNOqQ0Tja
	ZPqfCn5RfUlrx5iitnf6bCeRfBk7m747jLUXFZD/1h+JmOPesHtmmYt2ZxraoXKMj6r9
	dQfw==
MIME-Version: 1.0
X-Received: by 10.221.44.73 with SMTP id uf9mr10870992vcb.9.1400194694029;
	Thu, 15 May 2014 15:58:14 -0700 (PDT)
Received: by 10.52.85.67 with HTTP; Thu, 15 May 2014 15:58:13 -0700 (PDT)
In-Reply-To: <CAP71Wjz70nHPpYu-kYF_rHAardHZr-bVj+La3fJaH9R9Tf9pDA@mail.gmail.com>
References: <CAFeBWL4O6Uv6d+KoKQcHdzKZpog0OYnNA794jYRcJEovw88X9g@mail.gmail.com>
	<CAP71Wjz70nHPpYu-kYF_rHAardHZr-bVj+La3fJaH9R9Tf9pDA@mail.gmail.com>
Date: Thu, 15 May 2014 15:58:13 -0700
Message-ID: <CAFeBWL6o5OuM1i8y_JAc5uyXKh2-N1G1mpRiBdk8sg3q-BFQng@mail.gmail.com>
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
X-List-Received-Date: Thu, 15 May 2014 22:58:15 -0000
Content-Type: text/plain; charset=UTF-8

Hi Nicolas, thanks for your response. I built core-image-minimal in
cpio, but the size is whopping 69MB. It will take a couple seconds
just to load the image into the memory, which defeats the purpose of
using the ramdisk to boot. After watching 300 ms from reset-to-shell
boot video [1] using 1.5MB large kernel + rootfs combined, the size of
the core-image-minimal feels gargantuan and my boot time of ~7 seconds
feels like an eternity. That said, my goal is to reduce the boot time
through optimization of the current image. Writing custom boot loader
or severely crippling the rootfs is out of scope. So I thought the
tested and proven core-image-minimal-initramfs would be a great start.

Adam

[1] http://www.makelinux.com/emb/fastboot/omap

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
>>
>> COMPATIBLE_HOST = "(i.86|x86_64).*-linux"
>>
>> Is this the limitation of current OE? or am I just looking at the wrong corner?
>
> i recently had to build an initrd too, and notice that as well... so i
> am not sure exactly what that means. I am glad you asked... however if
> you want to test an initrd, you can simply build *any* image and make
> sure to build the 'cpio' from IMAGE_FSTYPES. you can then use the
> generated cpio archive as an initrd.
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

