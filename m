Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-io0-f180.google.com (mail-io0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id 9A1ED770E7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Oct 2015 13:35:56 +0000 (UTC)
Received: by iofl186 with SMTP id l186so124054037iof.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Oct 2015 06:35:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:content-type;
	bh=/kiRX+81w0LaYfWzj+vPHrBohWD6H+BWaXMaByPPS/s=;
	b=b//2gpplNUC1lHPlPU4N+yMfgwzQQSirkgr5XohRPmSUGT8nKXCed4NtxxPT5FzTDW
	dsSHXE2JY0FflGO3GXHSc95ENYq1H9x5EC5QklVrD3bn8HVD9qC7z/poQgDJe4excSuu
	3nOCQL8YcY+Lo/RCvd5laM/2fTqbd+9aklDi4nmg09SfsdhRKXwcJOIKKks2ebbhISVi
	w+1/fyZ+4riFxwY7L2THasUGrR9hAPLpDOdo+oF2fImJkktSJ0xpp3fQM1tiFFqM85KX
	Kboqx6Cbhx4jyp9rD8jts3kPewlloY+pYxSSfPQAXlo1DYyJ0AAx6ZfPrM3LnVKADDMT
	k2TQ==
X-Gm-Message-State: ALoCoQkmytHODGk8v8IU4SdGc2EFXSH24l93Z/Hvx3Llcl9+1QBvcztDIhQiFpaK2SxjSuurHzlF
X-Received: by 10.107.132.23 with SMTP id g23mr10935558iod.175.1445002557077; 
	Fri, 16 Oct 2015 06:35:57 -0700 (PDT)
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com.
	[209.85.223.177])
	by smtp.gmail.com with ESMTPSA id l80sm66138iod.34.2015.10.16.06.35.55
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 16 Oct 2015 06:35:55 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by iodv82 with SMTP id v82so123751179iod.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Oct 2015 06:35:55 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.107.131.147 with SMTP id n19mr16840896ioi.192.1445002555395; 
	Fri, 16 Oct 2015 06:35:55 -0700 (PDT)
Received: by 10.36.218.7 with HTTP; Fri, 16 Oct 2015 06:35:55 -0700 (PDT)
In-Reply-To: <CAJ86T=XBmcnBq5WMP=np08K8nJ4_6MycvfiUZL3Hcu_Pj2DkLg@mail.gmail.com>
References: <1444903231-16227-1-git-send-email-samuli.piippo@theqtcompany.com>
	<20151015114726.GC2588@jama>
	<CAP9ODKo=UmqZCd2CuwgbrKr3DrvxvqPS1Bi+3-YUiVzF3qutGg@mail.gmail.com>
	<CAJ86T=XBmcnBq5WMP=np08K8nJ4_6MycvfiUZL3Hcu_Pj2DkLg@mail.gmail.com>
Date: Fri, 16 Oct 2015 10:35:55 -0300
Message-ID: <CAP9ODKo0fU2kQZid_Jdq+k9YiEG1t7RevATxKAHWMR5K9UCPGg@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Fri, 16 Oct 2015 13:35:57 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Oct 15, 2015 at 11:52 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
> On Thu, Oct 15, 2015 at 6:38 AM, Otavio Salvador
> <otavio.salvador@ossystems.com.br> wrote:
>> On Thu, Oct 15, 2015 at 8:47 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
>>> On Thu, Oct 15, 2015 at 01:00:31PM +0300, Samuli Piippo wrote:
>>>> Load additional oe-device-extra.pri in the default linux-oe-g++ mkspec to
>>>> allow simple changing of target dependent values. This is useful for any
>>>> target that needs to specify e.g., QMAKE_LIBS_EGL or other additional configs.
>>>
>>> Looks good, but people using this need to be aware that it will cause
>>> qtbase and everything depending on it MACHINE_ARCH which is very
>>> unfortunate considering the time needed to build things like
>>> qtwebengine/qtwebkit.
>>
>> However I don't see how any BSP needing to pass extra libraries or
>> flags would not be machine specific.
>
> Multiple machines based on the same SoC (or SoC family) can often
> share the same graphics libraries.
>
>> One way to avoid this would be to split out the QPA backend for those
>> to another recipe and this to become machine specific and include the
>> .pri file.
>
> Alternatively create "egl.pc" and "glesv2.pc" pkg-config files for the
> graphics libs. The qtbase build can then set QMAKE_LIBS_EGL etc
> automatically without needing changes to the default linux-oe-g++
> mkspec.
>
> e.g. something like:
>
>   https://github.com/heiher/raspberrypi-firmware-pkgconfig/tree/master/pkgconfig

We do similar for i.MX and we made a sub-arch to allow sharing the binaries.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

