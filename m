Return-Path: <armccurdy@gmail.com>
Received: from mail-lf0-f42.google.com (mail-lf0-f42.google.com
	[209.85.215.42])
	by mail.openembedded.org (Postfix) with ESMTP id DD47E770E0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Oct 2015 02:52:10 +0000 (UTC)
Received: by lfeh64 with SMTP id h64so59643265lfe.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Oct 2015 19:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=fCjTzq0QoJcXNnl6f/OYK08Sv3COzEebc+nJ7dOF7gM=;
	b=ZJw8pgFaXUpoBtkjLRK0VgZW1onqFwFQT/yJL09XLAz8Iavd3iJZ/eAmxBTcEdc+Pf
	ZkKAZodKYoutN8n72o/X7WEEsvSAjf5unRbJMAYtOH/sqWKh8P1rGyZfSuRATwLY96Qa
	iKcHy+H8L+55rma+Cub6emP2XCWi8lXGel537qq/9XhTM2OJ9uD0DEtMdxOCQBeXxTmL
	BySufAcD70wZGrdgtwgQz2x05OPlqDfKWGO5DwbJQny9FULOAZEQnp8gmRqpO4U99hKJ
	3vqhNdR0SHa6vlWZ57OMNqI3RLWHkhq6uOOx/HvddFDhiz/GW7nnIbArx7v5MPfpqHZZ
	oQGQ==
MIME-Version: 1.0
X-Received: by 10.180.12.178 with SMTP id z18mr1826693wib.17.1444963929551;
	Thu, 15 Oct 2015 19:52:09 -0700 (PDT)
Received: by 10.194.169.6 with HTTP; Thu, 15 Oct 2015 19:52:09 -0700 (PDT)
In-Reply-To: <CAP9ODKo=UmqZCd2CuwgbrKr3DrvxvqPS1Bi+3-YUiVzF3qutGg@mail.gmail.com>
References: <1444903231-16227-1-git-send-email-samuli.piippo@theqtcompany.com>
	<20151015114726.GC2588@jama>
	<CAP9ODKo=UmqZCd2CuwgbrKr3DrvxvqPS1Bi+3-YUiVzF3qutGg@mail.gmail.com>
Date: Thu, 15 Oct 2015 19:52:09 -0700
Message-ID: <CAJ86T=XBmcnBq5WMP=np08K8nJ4_6MycvfiUZL3Hcu_Pj2DkLg@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-qt5][PATCH] qt5: use extra .pri file from linux-oe-g++ mkspec
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
X-List-Received-Date: Fri, 16 Oct 2015 02:52:13 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Oct 15, 2015 at 6:38 AM, Otavio Salvador
<otavio.salvador@ossystems.com.br> wrote:
> On Thu, Oct 15, 2015 at 8:47 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
>> On Thu, Oct 15, 2015 at 01:00:31PM +0300, Samuli Piippo wrote:
>>> Load additional oe-device-extra.pri in the default linux-oe-g++ mkspec to
>>> allow simple changing of target dependent values. This is useful for any
>>> target that needs to specify e.g., QMAKE_LIBS_EGL or other additional configs.
>>
>> Looks good, but people using this need to be aware that it will cause
>> qtbase and everything depending on it MACHINE_ARCH which is very
>> unfortunate considering the time needed to build things like
>> qtwebengine/qtwebkit.
>
> However I don't see how any BSP needing to pass extra libraries or
> flags would not be machine specific.

Multiple machines based on the same SoC (or SoC family) can often
share the same graphics libraries.

> One way to avoid this would be to split out the QPA backend for those
> to another recipe and this to become machine specific and include the
> .pri file.

Alternatively create "egl.pc" and "glesv2.pc" pkg-config files for the
graphics libs. The qtbase build can then set QMAKE_LIBS_EGL etc
automatically without needing changes to the default linux-oe-g++
mkspec.

e.g. something like:

  https://github.com/heiher/raspberrypi-firmware-pkgconfig/tree/master/pkgconfig

> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

