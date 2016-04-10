Return-Path: <ka6sox@gmail.com>
Received: from mail-vk0-f41.google.com (mail-vk0-f41.google.com
	[209.85.213.41])
	by mail.openembedded.org (Postfix) with ESMTP id 0C14477112
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Apr 2016 20:46:08 +0000 (UTC)
Received: by mail-vk0-f41.google.com with SMTP id k1so190483115vkb.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Apr 2016 13:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to; 
	bh=xCTj4PvkY5Defy3BzUpFsfaP1a1oA3PxyjzvQ6FKPek=;
	b=QMMlU+ZkpnLI6TNH4mPNsEZq3oYvaNPWiYtXGVqgMThQM+k+qdmty1gKBa7D4RtURT
	O+rOVwgD1oCNqmPlaCar4UL7y/zLhzX9H1d9lG5PA4Q5TL9vG8BJTtxd/pPlsC2ZbCgu
	5GtS8xyqAMA80cC+f7mzGiRNnFX9boFh2mxurbKMPTvbZHW5jqvcKoHdcbalxyD7dZSj
	4xqMvwTAaSIghwWPSjeTKEx7JMo+EVW4H/ucQdJl4eVEGCfLq17zImqsQI1efDbngUd9
	2xUrhIwKaEE45rDnxyC4rmk7O61iESZuKws3iB/hX0LWfHM9vQBC5yENGzDxvQEtWPGQ
	sJyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to;
	bh=xCTj4PvkY5Defy3BzUpFsfaP1a1oA3PxyjzvQ6FKPek=;
	b=GuyvACZhjb40h1mHgxpY9UPiW3ifLmmRCZoKi0HgGOcyupyKSio3KdCly4BUGcjRid
	T9VL+MNcKtA6pI62owq841JTdugS+Uc9QoAqPlXGFKM/ro20zG5nR1ntdY0AR+SfwBmy
	O7tleLhBPDiyBgfKcMc8I31jsA1nJ48d+eYEDI4YXh+3oivkgNLxf1PjEO0ywZUH4WBo
	SghJ7HgKvxsKjWVoFw8hYOkwIBajYWQeQTkV0SyN4HjnZ1NspD3HqpkWZ62f7iH8MGbn
	cvnDXuqfC/SRrks4x7Je2ZPQ86+rleUQJvTuOgIdVkvyY+8DqHyCdgqFAI10qD/zq4xh
	7GwQ==
X-Gm-Message-State: AD7BkJJIi9aGeBan9liOrEBJCJFlptGTfgIlLjKdGPi45TZCjrJjNPeQ8SamRdXMkZ8BNYrbX3q8FCBCPUVLKw==
MIME-Version: 1.0
X-Received: by 10.176.3.104 with SMTP id 95mr10031824uat.0.1460321169013; Sun,
	10 Apr 2016 13:46:09 -0700 (PDT)
Received: by 10.103.13.6 with HTTP; Sun, 10 Apr 2016 13:46:08 -0700 (PDT)
In-Reply-To: <570A8618.6000906@balister.org>
References: <20160410061425.GA9652@jama>
	<570A8618.6000906@balister.org>
Date: Sun, 10 Apr 2016 13:46:08 -0700
Message-ID: <CAHQecY5K9+YDfSZgZt5WU-ywYhjZmDw=1Acwp=7VDu4giX--UQ@mail.gmail.com>
From: Tom King <ka6sox@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: State of bitbake world, test-dependencies 2016-04-10
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
X-List-Received-Date: Sun, 10 Apr 2016 20:46:09 -0000
Content-Type: text/plain; charset=UTF-8

http://logs.nslu2-linux.org/buildlogs/oe/world/

On Sun, Apr 10, 2016 at 9:58 AM, Philip Balister <philip@balister.org>
wrote:

> Where are the log files?
>
> Philip
>
> On 04/10/2016 02:14 AM, Martin Jansa wrote:
> > This time complete test of all recipes, for both qemux86 and qemuarm.
> >
> > qemux86:
> >
> > Found differences:
> > WARN: jasper: jasper-bin rdepends on libgl-mesa, but it isn't a build
> dependency?
> > WARN: jasper: jasper-bin rdepends on libglu, but it isn't a build
> dependency?
> > WARN: jasper: jasper-bin rdepends on mesa-glut, but it isn't a build
> dependency?
> > WARN: samba: samba rdepends on libpam, but it isn't a build dependency?
> > WARN: libdrm: libdrm-tests rdepends on cunit, but it isn't a build
> dependency?
> > WARN: libdrm: libdrm-tests rdepends on libdrm-amdgpu, but it isn't a
> build dependency?
> > WARN: enchant: enchant rdepends on hunspell, but it isn't a build
> dependency?
> > Found errors:
> > ERROR: 50 issues were found in these recipes:
> chkconfig-alternatives-native core-image-rt core-image-rt-sdk
> core-image-sato-dev core-image-sato-sdk core-image-sato-sdk-ptest cpupower
> cyrus-sasl enchant fontforge gtkmathview jasper libdrm lttng-modules
> meta-ide-support meta-world-pkgdata nativesdk-zeroc-ice netmap
> netmap-modules openlmi-networking openlmi-providers openlmi-storage
> packagegroup-core-tools-profile perf proxy-libintl python-pyparsing samba
> sblim-sfcb tiptop zeroc-ice
> >
> > 2_max/failed/chkconfig-alternatives-native.log
> > 2_max/failed/core-image-rt-sdk.log
> > 2_max/failed/core-image-rt.log
> > 2_max/failed/core-image-sato-dev.log
> > 2_max/failed/core-image-sato-sdk-ptest.log
> > 2_max/failed/core-image-sato-sdk.log
> > 2_max/failed/cpupower.log
> > 2_max/failed/cyrus-sasl.log
> > 2_max/failed/fontforge.log
> > 2_max/failed/lttng-modules.log
> > 2_max/failed/meta-world-pkgdata.log
> > 2_max/failed/nativesdk-zeroc-ice.log
> > 2_max/failed/netmap-modules.log
> > 2_max/failed/netmap.log
> > 2_max/failed/openlmi-networking.log
> > 2_max/failed/openlmi-providers.log
> > 2_max/failed/openlmi-storage.log
> > 2_max/failed/packagegroup-core-tools-profile.log
> > 2_max/failed/proxy-libintl.log
> > 2_max/failed/zeroc-ice.log
> >
> > 3_min/failed/core-image-rt-sdk.log
> > 3_min/failed/core-image-rt.log
> > 3_min/failed/core-image-sato-dev.log
> > 3_min/failed/core-image-sato-sdk-ptest.log
> > 3_min/failed/core-image-sato-sdk.log
> > 3_min/failed/cyrus-sasl.log
> > 3_min/failed/fontforge.log
> > 3_min/failed/gtkmathview.log
> > 3_min/failed/meta-world-pkgdata.log
> > 3_min/failed/nativesdk-zeroc-ice.log
> > 3_min/failed/perf.log
> > 3_min/failed/proxy-libintl.log
> > 3_min/failed/python-pyparsing.log
> > 3_min/failed/sblim-sfcb.log
> > 3_min/failed/zeroc-ice.log
> >
> > qemuarm:
> >
> > Found differences:
> > WARN: samba: samba rdepends on libpam, but it isn't a build dependency?
> > WARN: libdrm: libdrm-tests rdepends on cunit, but it isn't a build
> dependency?
> > WARN: libdrm: libdrm-tests rdepends on libdrm-amdgpu, but it isn't a
> build dependency?
> > WARN: enchant: enchant rdepends on hunspell, but it isn't a build
> dependency?
> > Found errors:
> > ERROR: 55 issues were found in these recipes:
> chkconfig-alternatives-native core-image-minimal-initramfs core-image-rt
> core-image-rt-sdk core-image-sato-dev core-image-sato-sdk
> core-image-sato-sdk-ptest core-image-testmaster-initramfs cyrus-sasl
> enchant fontforge gtkmathview ipmiutil libdrm meta-world-pkgdata
> nativesdk-zeroc-ice netmap-modules perf proxy-libintl remake samba
> sblim-sfcb zeroc-ice
> >
> > 2_max/failed/chkconfig-alternatives-native.log
> > 2_max/failed/core-image-minimal-initramfs.log
> > 2_max/failed/core-image-rt-sdk.log
> > 2_max/failed/core-image-rt.log
> > 2_max/failed/core-image-sato-dev.log
> > 2_max/failed/core-image-sato-sdk-ptest.log
> > 2_max/failed/core-image-sato-sdk.log
> > 2_max/failed/core-image-testmaster-initramfs.log
> > 2_max/failed/cyrus-sasl.log
> > 2_max/failed/fontforge.log
> > 2_max/failed/ipmiutil.log
> > 2_max/failed/meta-world-pkgdata.log
> > 2_max/failed/nativesdk-zeroc-ice.log
> > 2_max/failed/netmap-modules.log
> > 2_max/failed/proxy-libintl.log
> > 2_max/failed/remake.log
> > 2_max/failed/zeroc-ice.log
> >
> > 3_min/failed/core-image-minimal-initramfs.log
> > 3_min/failed/core-image-rt-sdk.log
> > 3_min/failed/core-image-rt.log
> > 3_min/failed/core-image-sato-dev.log
> > 3_min/failed/core-image-sato-sdk-ptest.log
> > 3_min/failed/core-image-sato-sdk.log
> > 3_min/failed/core-image-testmaster-initramfs.log
> > 3_min/failed/cyrus-sasl.log
> > 3_min/failed/fontforge.log
> > 3_min/failed/gtkmathview.log
> > 3_min/failed/ipmiutil.log
> > 3_min/failed/meta-world-pkgdata.log
> > 3_min/failed/nativesdk-zeroc-ice.log
> > 3_min/failed/perf.log
> > 3_min/failed/proxy-libintl.log
> > 3_min/failed/remake.log
> > 3_min/failed/sblim-sfcb.log
> > 3_min/failed/zeroc-ice.log
> >
> >
> >
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

