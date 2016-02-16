Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pf0-f179.google.com (mail-pf0-f179.google.com
	[209.85.192.179])
	by mail.openembedded.org (Postfix) with ESMTP id B5F8B6612D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Feb 2016 11:38:56 +0000 (UTC)
Received: by mail-pf0-f179.google.com with SMTP id x65so103964331pfb.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Feb 2016 03:38:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:content-type; bh=Mu89sg17OswuorlORNU991WsI/T2TnxYvBPnPqwceQY=;
	b=CKrCuVqdKJr1YmDRy5H6x29cVTzVGY2Bu7Oulq/yuV2EXUDDeK05JnjDh8B5R7ZdZM
	FOepkFEGeT8uwhk7EeECDzcw/Tb5+3qR//ZVkBsYMwF6jnqjiOKhKWQtYmeCwYH/fusA
	UaiSa1EdAjuFYyvnJEgeHdw67lUlrIdS1oWMAPZbFOnvxxN3bs54BqoqgF99BoPmqEvo
	vg4IbmQ6HorJw3RmxxGcLsMz0pT3LdQ1grQQlLvl9CeAkwizazTdjtqf5JATbrqXYcu3
	JS4Cj8XvgRscOBTGZm799uTZKz+3lWvrpUH3fu0lO//AhSfGmoaYWVf85fyo5EPb8Quo
	Lm9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:content-type;
	bh=Mu89sg17OswuorlORNU991WsI/T2TnxYvBPnPqwceQY=;
	b=J/8JBYgNVW/3BZUIP2r3RtYXOSwuSJc5lHA0RWaUoIio4Vuzjzo1wGYjEkABcaQwti
	lVuYGhuvSyKI5Ig3BIsZO4qh6+s+R954byGbCxWhJRthfFAbme8l5Cncp7eI9MGmYtIZ
	3OZtiMn9/ywzaoZY+q2XZ5wW3EtOsnF2hvBkIjCAD4c6ktDjHlWSi5rBMEjmvjAYtkYB
	WLHGLUVlOzUu6IxmSbJdJmPwPv+xDiNXBiHrJJPz4tldvlwUkaS6l48YV5Mcxw9z5gPn
	Q3HBYywWB/2hGbaSQZzpLI/52i8v1Xxrk/toDJm7mdpl0ApQSM2phIDuQpYmiWvd3QIP
	AD+g==
X-Gm-Message-State: AG10YOQAqjjCT2t61olWUSKPKczXIOpZ0wUunVkRX6biDa14DhfvBnT2QN4ghSPQEaiHqw==
X-Received: by 10.98.71.147 with SMTP id p19mr30399436pfi.165.1455622737110;
	Tue, 16 Feb 2016 03:38:57 -0800 (PST)
Received: from mail-pf0-f169.google.com (mail-pf0-f169.google.com.
	[209.85.192.169]) by smtp.gmail.com with ESMTPSA id
	tb10sm16380477pab.22.2016.02.16.03.38.55
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 16 Feb 2016 03:38:55 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-pf0-f169.google.com with SMTP id e127so104056636pfe.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Feb 2016 03:38:55 -0800 (PST)
MIME-Version: 1.0
X-Received: by 10.98.93.155 with SMTP id n27mr30274647pfj.88.1455622735022;
	Tue, 16 Feb 2016 03:38:55 -0800 (PST)
Received: by 10.66.79.8 with HTTP; Tue, 16 Feb 2016 03:38:54 -0800 (PST)
In-Reply-To: <56C2E83A.6080908@theqtcompany.com>
References: <1455467128-4533-1-git-send-email-samuli.piippo@theqtcompany.com>
	<CAP9ODKrU=fgJ_ooz4_oOpMWRxw+e_UHLc9VrNy3ne=wWdS3Msw@mail.gmail.com>
	<56C2E83A.6080908@theqtcompany.com>
Date: Tue, 16 Feb 2016 09:38:54 -0200
X-Gmail-Original-Message-ID: <CAP9ODKqw8CKiXfdkbpXXonKO52ap8Cw9u2zsd_+x=57s0_CAWg@mail.gmail.com>
Message-ID: <CAP9ODKqw8CKiXfdkbpXXonKO52ap8Cw9u2zsd_+x=57s0_CAWg@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH] nativesdk-qtbase: use runtime linked dbus
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
X-List-Received-Date: Tue, 16 Feb 2016 11:38:56 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Feb 16, 2016 at 7:13 AM, Samuli Piippo
<samuli.piippo@theqtcompany.com> wrote:
> On 16.02.2016 00:34, Otavio Salvador wrote:
>>
>> On Sun, Feb 14, 2016 at 2:25 PM, Samuli Piippo
>> <samuli.piippo@theqtcompany.com> wrote:
>>>
>>> Remove direct dependency to nativesdk-dbus. Instead configure
>>> qtbase to use runtime linked dbus library, if that is found.
>>>
>>> Signed-off-by: Samuli Piippo <samuli.piippo@theqtcompany.com>
>>
>>
>> Why? This puts a dependency on the host operating system version.
>>
>> Am I missing something?
>>
>
> Currently nativesdk-qtbase does not package libQt5DBus.so, so there nothing
> in the SDK that actual uses dbus, but it's still built as a dependency.
> If "qt5: add Qml support to lupdate" patch is merged, then nativesdk-dbus
> would be pulled into SDK as well, although I think it's still unlikely that
> anyone would need it. If there is really need for it, then you can always
> add nativesdk-dbus to your toolchain.

So why not remove libQt5Dbus.so at all, from the nativesdk?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

