Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id A9E2771A6E
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Dec 2016 05:56:19 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id e9so3532013pgc.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Nov 2016 21:56:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-transfer-encoding:mime-version:subject:date:references
	:to:in-reply-to:message-id;
	bh=NLJe5rJJf3O52QOAlGirBU8FIJeKMJ98LfUnrQPOtfg=;
	b=HWfqdY3jGX5Xm3e58OV4FZyCfSEwkwlORhE/dwc+BVRF93B2bB3DOLj1Wvq1RpZCIZ
	YU2JQyhtZDGAeRvqQ2QPGuiiOmG0JeQOnBfRVend1JrS24rO87ft0NAYxFmOzwk/EWXT
	HACJKXj7qoJup2oX4MJhq8Wd2E45uyvBRyY7ElocNj1ljdtYSB3fvI39SxiV6XxvaWS4
	H/YtDiWQ3PdX5chgKRqlj8v7jnttKC5AQusoxNfDVilCxiIKjSZ59UXJdduq6njjYVUN
	kzgleSpGkiSikbRgXPjzRjX59FAWc3omDMYWOcxUOTHjfh+wM3wqLyUeQYRQGki7v9gs
	Q0nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:content-transfer-encoding:mime-version
	:subject:date:references:to:in-reply-to:message-id;
	bh=NLJe5rJJf3O52QOAlGirBU8FIJeKMJ98LfUnrQPOtfg=;
	b=kufsJR346SFWSVWev9AodnGQkH6uGpokeq4mLhhKn9a/pY2fij8amDoYE3C/QwAsK/
	T9QtUsEADyvXljGStyK1iyYsv3d/MRTAzRcCHumZfIdbZqVuFajNixnJ3uZ1xvRHTaGp
	V9Sd97Va3grjbl/vBOSduUjVJuMxI+rlU/Bpd60R8W8h9oYl9Skdlb0dXm+mc5ksKvQz
	OGTKaRitBJ6LYbZJXuVH7oA2zuusfUDrpWd+R73aj94ay84Ts6nZ10DoMW8KLGHPVqsn
	jmI0AgZQwcezERA2gAZLYa8ZIGSQ2w0c6G8SsH1MAUfLu06K1LpgYlIxxAx1a/RKUb3+
	CuyA==
X-Gm-Message-State: AKaTC024HeT/LRn2QN1KUUHdDMQDbNAcsGd4MSBAlNt8IjG8smInBsefj54RBEqQYmbt5w==
X-Received: by 10.98.65.156 with SMTP id g28mr37301238pfd.110.1480571780667;
	Wed, 30 Nov 2016 21:56:20 -0800 (PST)
Received: from ?IPv6:2601:646:8882:b8c:4522:3d41:8a3e:c6d5?
	([2601:646:8882:b8c:4522:3d41:8a3e:c6d5])
	by smtp.gmail.com with ESMTPSA id
	p13sm89221126pgf.47.2016.11.30.21.56.19
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Nov 2016 21:56:20 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 10.1 \(3251\))
Date: Wed, 30 Nov 2016 21:56:19 -0800
References: <20161128225759.9756-1-raj.khem@gmail.com>
	<20161129195922.GD2700@jama>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20161129195922.GD2700@jama>
Message-Id: <D3EEFEDE-F132-40B8-B698-1234B06117EC@gmail.com>
X-Mailer: Apple Mail (2.3251)
Subject: Re: [meta-oe][PATCH] libva: Import from meta-intel and update to 1.7.3
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
X-List-Received-Date: Thu, 01 Dec 2016 05:56:19 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> On Nov 29, 2016, at 11:59 AM, Martin Jansa <martin.jansa@gmail.com> =
wrote:
>=20
> On Mon, Nov 28, 2016 at 02:57:59PM -0800, Khem Raj wrote:
>> This recipe is used by intel and amd BSP layers
>> additional copies are also there see
>> =
https://layers.openembedded.org/layerindex/branch/master/recipes/?q=3Dlibv=
a
>=20
> I'm sorry to report more and more issues, but this is causing few more =
autodetected dependencies
>=20
> mpv-0.15.0: mpv rdepends on libva-x11, but it isn't a build =
dependency, missing libva in DEPENDS or PACKAGECONFIG? [build-deps]
> mpv-0.15.0: mpv rdepends on libva, but it isn't a build dependency, =
missing libva in DEPENDS or PACKAGECONFIG? [build-deps]

Sent a patch for this.

>=20
> and there is another one caused by libvdpau I haven't noticed before:
> ffmpeg-3.2: libavutil rdepends on libvdpau, but it isn't a build =
dependency, missing libvdpau in DEPENDS or PACKAGECONFIG? [build-deps]
>=20

Sent a patch to OE-Core for this.



