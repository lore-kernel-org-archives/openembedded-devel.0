Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f43.google.com (mail-it0-f43.google.com
	[209.85.214.43])
	by mail.openembedded.org (Postfix) with ESMTP id EE233731D6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Sep 2016 15:09:18 +0000 (UTC)
Received: by mail-it0-f43.google.com with SMTP id r192so18204608ita.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Sep 2016 08:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=jgaRCcJNA9Bj9Pxo2upJbvSjMv/OU0pT1ICzSSD3whU=;
	b=IYyL994CUYTuSX4VFTDvWypcFchxOvDiRhM/CK8qaR9sLynuqjtK7nCPSIKlEi+Hyf
	t7c7RuxNMl4IKDvMGcS7cELB+nVRThqQbZBUs5t2+vnAwe34RbgNEbLGQ4dyzb5zsxfK
	yqx3Sz34cNbaYtao8I+DZwaDv6LqCe8K3QuWWdGq8ort3NPVwzMuX9OQ9meMyRIJmnA2
	N/ChjPIK5nia0tls6WwNOVWSU4mJHSZjk3s6bTRT3ioXA4YvLGcAqnx6A5N6JTVHDwHm
	umoeBRbdw00Ea2YzVKT+zNTmvIY8gGI9UwJtRaYfqGV2r6MxDgn630WKq/wyi9WftqFD
	iUiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=jgaRCcJNA9Bj9Pxo2upJbvSjMv/OU0pT1ICzSSD3whU=;
	b=ZtNFoI9b24Jqdj3O9SPqa42ibaUYq/P5UHDoG8qUiFiixN8c0Zssc5s7kRgxo1RULU
	gD4MXrExPJk19YV2pvSZ1dYLSB9wp45yJ2XzSb0kzs/v80hBY/qAA76tTC+rRLTsUiz1
	Ly0xlt6QL/PNapp9zszZWc6JREvC3VZHCrO2NW+G4RR/b+/6uVXZViG7qtpucVr6t253
	rH4p9Ejy4mNGsWwsdprCFCKYPYtHAg2xdPSYhSy4gnzsumPX+Si259A7N4yfoUmJhTRf
	pU3ybeO/NPSM6Ppcqc9hPCAxJb0MBrDDhF03enB7uOnjc+KqdokDKSGQiZYg3Gl7zYSC
	5SdA==
X-Gm-Message-State: AE9vXwO+LKVjuKfGleZtZp15ij9gx7p8oKOPec0tcags/qE79nW73ti8/El47KRhpsSCIK5S2Zxnbr5Edm6zNrJo
X-Received: by 10.36.121.206 with SMTP id z197mr6489130itc.22.1474038558616;
	Fri, 16 Sep 2016 08:09:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.135.27 with HTTP; Fri, 16 Sep 2016 08:08:57 -0700 (PDT)
In-Reply-To: <CAAQYJAtf4ixqfk+0Xk2z7jSHE8=b3GWW1m=Viw8Qnu_1ZMCFSQ@mail.gmail.com>
References: <1472730043-31245-1-git-send-email-maxin.john@intel.com>
	<1472730043-31245-5-git-send-email-maxin.john@intel.com>
	<12285709.EfYBoYq9CT@peggleto-mobl.ger.corp.intel.com>
	<1649463.EYVuLskMBZ@peggleto-mobl.ger.corp.intel.com>
	<20160916085050.GA27969@mbabyjoh-desk.ger.corp.intel.com>
	<CAAQYJAtf4ixqfk+0Xk2z7jSHE8=b3GWW1m=Viw8Qnu_1ZMCFSQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 16 Sep 2016 16:08:57 +0100
Message-ID: <CAJTo0LYBx4JAof1mHvPc87eN24kioa9n33K46ig_O_JoE7z1vg@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: Re: [PATCH 4/4] tslib: move recipe from oe-core
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
X-List-Received-Date: Fri, 16 Sep 2016 15:09:21 -0000
Content-Type: text/plain; charset=UTF-8

On 16 September 2016 at 13:10, Andrea Adami <andrea.adami@gmail.com> wrote:

> Well, there is still one drawback...the 'custom' xserver-nodm-init is
> still present but there are patches on the ML for its removal.
>

Hopefully the improvements in oe-core mean the meta-oe recipe can be
removed, but it was decided that it was too late in the cycle to push this
and will wait for 2.3 to release before looking at deleting bits of meta-oe.

Ross

