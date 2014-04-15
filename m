Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-oa0-f48.google.com (mail-oa0-f48.google.com
	[209.85.219.48])
	by mail.openembedded.org (Postfix) with ESMTP id 2505465E77
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Apr 2014 12:57:24 +0000 (UTC)
Received: by mail-oa0-f48.google.com with SMTP id m1so10631972oag.21
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Apr 2014 05:57:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=UCdkGD5gEwJTw8lo3pIWCfFv294kWtifbghp4pvUGcQ=;
	b=P3wRnqnk3fr5FYQoJnbszZm3bw9Dtpr5xqM0KHl7PcwSjQWs1lrboRQGjTyB83fCql
	iGaRQz2qYnh6HJgkhXeoCQ6vxApeBv8skYTcFaPiik/NdXbkPZcZ41lJIczZgSGNlxcv
	PwrA/0rs9BqxPrmm1dok8dKwuoezyiTjnOJTu320HlXxAY21v0g74CT/JZA+ZjvinUpT
	yJCqCmv0lqPGj8ZBXNqVC79ahAlm/s/PmccnKfhfvX+PdaV9sIT+vLjEskTDtmPcjdcm
	cAINbC07thgzB4Ii9OB25XcgbPQgZtbbsT8IQc2NEC2oEiMFoZyBiF1809ze0em1kbHe
	B3CQ==
X-Gm-Message-State: ALoCoQkwDFKGEHryIoPYA+nT1cst02ucb9zoYbFTu+V8g5UVU4+v9qeRoJOtzSStBS1qylgd/oOQ
X-Received: by 10.182.75.161 with SMTP id d1mr1306522obw.7.1397566644481; Tue,
	15 Apr 2014 05:57:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.76.110.9 with HTTP; Tue, 15 Apr 2014 05:57:03 -0700 (PDT)
In-Reply-To: <CALYKT1ifSP62Tduyb3mvg-1C0_DqZJfYxKq0poZHZgwYthL_yQ@mail.gmail.com>
References: <CALYKT1ifSP62Tduyb3mvg-1C0_DqZJfYxKq0poZHZgwYthL_yQ@mail.gmail.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Tue, 15 Apr 2014 14:57:03 +0200
Message-ID: <CAP71WjykwNA6uu=kCKyq-T1r3-_X+DifQROuCv1SyPUNE-2ybg@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: Where can I get a arm cross toolchain for oe-core?
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
X-List-Received-Date: Tue, 15 Apr 2014 12:57:28 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Apr 15, 2014 at 1:42 PM, Journeyer J. Joh
<oosaprogrammer@gmail.com> wrote:
> I use OE for qualcomm's MDM + AP soc system.
> OE is used on AP side.
>
> The build environment is bitbake based and I felt it like a sandbox system.
> I am sorry I don't know about OE, bitbake very well.. almost I know
> nothing..
>
> I can build the target image. Yes.
> But I wonder how I compile any 3rd party applications for my target.
> I did build one by adding the application source code into the whole image
> source tree.
> This way builds the application as a part of the target image. I can find
> it in /usr/bin with other default applications together.
>
> And I did build another by using a general arm cross toolchain like
> arm-none-linux-gnueabi-gcc.
> Using this toolchain is simple and easy. But there is no gurantee that this
> toolchain has identical libc that is used in the target image. It's not
> only the libc, runtime library, and hardware floating point operation
> configurations are not certain, not guranteed.
>
> I believe there should exist one that 100% syncs with OE bitbake compile
> environment.
> I doubt if I can try to use just OE bitbake environment for those 3rd party
> applications.
>
> How am I supposed to go forward?

you have (at least) 2 options:
 1- create 'native' OE/bitbake recipes for your own
applications/libraries, that way your s/w will be integrated during
the image creation.
 2- use the OE SDK, which produces a toolchain and sysroot compatible
with the image you've built. You can cross compile any application
using this SDK and you're guaranteed that the SDK will match (libc,
...) the content of the target image. For for information about this,
you can look at [1] and [2].

[1] http://www.yoctoproject.org/docs/1.5.1/ref-manual/ref-manual.html#cross-development-toolchain-generation
[2] http://www.yoctoproject.org/docs/1.5.1/adt-manual/adt-manual.html

