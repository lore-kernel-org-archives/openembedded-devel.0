Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f175.google.com (mail-io0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id DBB68781F7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Jul 2017 15:08:58 +0000 (UTC)
Received: by mail-io0-f175.google.com with SMTP id l7so57156628iof.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Jul 2017 08:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=3tBftdIRi9Q73wo5HJwfJyInO9HoYmY1SxDRBvzv43Y=;
	b=SBxyyIgDXnEMNyJH2iAZqoPJgxrzvY8g6ZE1VSTdJvIyQkSWF9eATPAn3tZi1rZvKB
	BYyq/wiZ8zTJWHBhHOQRPT1QzklVN7auZjWydRx1tqE9QGcUtjPfa7GgY+cs6Yanlisi
	I/ILiHvJBAWj14YxijpaA7vSQ2dquAW65eSwl5r/y3tNlsSWyC/LGDB2R9aJA83mJqVW
	sOQXgDdwbEKsTbInGdaR4Pil+IIAuqoohy4y5xF8khBcYnYqrlNujIrK1K35UL8WhC31
	TJqLnOdFnrUjJxnBAgCgHlxDn9ilkDe/gibpDt5t2G/QgKgItysvOtdJo9RXF6PgHd5k
	EN1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=3tBftdIRi9Q73wo5HJwfJyInO9HoYmY1SxDRBvzv43Y=;
	b=jTm5rQ2FTYtzePmc6Cw7Lar9Ga4Cp/Bm1yJYcj6KPr7nM3AsRuOtIu6GYJzdjjUdXD
	bOEnbqXuP1UzNrJJFg/48SzPCySyBZL4Hvm5Ixyoelgjxfu/ke5rLyCh7LsBoHengpvv
	gSIJzrBe2MAHGp0EBaVRXmc4cZ4mT+lDPh7w7ZusL7+Ve63EPEkK+SnZ1+dsERQ7l4bD
	6wfF7VjSV73wwxzeMmpq0YPQnnoDzxd8ua+lcx80LDL1wF3fL8F5nz7MVIqpqVCF0+2R
	Wu6E+UuOj8sH90mPVczD0xvUq5wxPEfFfWc0XzAs0N9llRCKOso3EMF0xEdXMaSOKnoZ
	EzbA==
X-Gm-Message-State: AIVw113lrG6HBve/nirgsqN5RzeHoSK3pj68XZXdWLUE9RfKVY2wI2+b
	nJ8YrSpSIIv+vyOB/vbAxocSOFoRkv/S
X-Received: by 10.107.132.33 with SMTP id g33mr18676533iod.300.1500995339918; 
	Tue, 25 Jul 2017 08:08:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.135.234 with HTTP; Tue, 25 Jul 2017 08:08:39 -0700 (PDT)
In-Reply-To: <CA+chaQceN=yak2xd2RqPucsNR2xfnPKAJQztnfEPxovsH6iqGg@mail.gmail.com>
References: <20170720153508.23113-1-ross.burton@intel.com>
	<CA+chaQceN=yak2xd2RqPucsNR2xfnPKAJQztnfEPxovsH6iqGg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 25 Jul 2017 16:08:39 +0100
Message-ID: <CAJTo0LaRCpeXm93y-ohukgRYa7YMAwC3CP+sKdOBzTCNBO-oEA@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH][meta-gnome 1/9] cheese: remove (previously blacklisted)
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
X-List-Received-Date: Tue, 25 Jul 2017 15:08:59 -0000
Content-Type: text/plain; charset="UTF-8"

I'd prefer you not to remove all blacklisted packages, for example there
are two gweather recipes and the blacklisted one is the one you want to
keep.  Would you prefer that I fiddle the blacklistings and leave them to
expire when the message says?

Ross


On 21 July 2017 at 09:56, Martin Jansa <martin.jansa@gmail.com> wrote:

> The PNBLACKLIST message says it will be removed on 2017-09-01. I already
> have a patch which will remove all blacklisted recipes with such
> PNBLACKLIST but I'll apply it only at the end of next month.
>
> On Thu, Jul 20, 2017 at 5:35 PM, Ross Burton <ross.burton@intel.com>
> wrote:
>
>> Cheese 2.30.1 is very old (2010) and has been blacklisted for some time,
>> so
>> remove it.
>>
>> Signed-off-by: Ross Burton <ross.burton@intel.com>
>> ---
>>  meta-gnome/recipes-apps/cheese/cheese_2.30.1.bb | 26
>> -------------------------
>>  1 file changed, 26 deletions(-)
>>  delete mode 100644 meta-gnome/recipes-apps/cheese/cheese_2.30.1.bb
>>
>> diff --git a/meta-gnome/recipes-apps/cheese/cheese_2.30.1.bb
>> b/meta-gnome/recipes-apps/cheese/cheese_2.30.1.bb
>> deleted file mode 100644
>> index 3f5a5b124..000000000
>> --- a/meta-gnome/recipes-apps/cheese/cheese_2.30.1.bb
>> +++ /dev/null
>> @@ -1,26 +0,0 @@
>> -SUMMARY = "Take photos and videos with your webcam, with fun graphical
>> effects"
>> -LICENSE = "GPLv2"
>> -LIC_FILES_CHKSUM = "file://COPYING;md5=a17cb0a873d252440acfdf9b3d0e7fbf"
>> -
>> -DEPENDS = "gtk+ gstreamer gst-plugins-base libcanberra udev librsvg
>> gnome-desktop evolution-data-server intltool-native"
>> -
>> -PR = "r2"
>> -
>> -inherit gnome
>> -
>> -SRC_URI[archive.md5sum] = "1599fded8a1797ea51fb010af4e6c45b"
>> -SRC_URI[archive.sha256sum] = "48f03470c6f527caa0e3b269d3afc
>> ff86ae0939a74f66ce030d4eed3bc3cbd9a"
>> -GNOME_COMPRESS_TYPE="bz2"
>> -
>> -FILES_${PN} += "${datadir}/dbus-1"
>> -RRECOMMENDS_${PN} = "gst-plugins-good-meta gst-plugins-base-meta"
>> -
>> -EXTRA_OECONF += "--disable-scrollkeeper"
>> -
>> -do_configure_prepend() {
>> -    sed -i -e "s: help : :g" ${S}/Makefile.am
>> -}
>> -
>> -PNBLACKLIST[cheese] ?= "Depends on blacklisted gstreamer - the recipe
>> will be removed on 2017-09-01 unless the issue is fixed"
>> -
>> -PNBLACKLIST[cheese] ?= "Depends on blacklisted gnome-desktop - the
>> recipe will be removed on 2017-09-01 unless the issue is fixed"
>> --
>> 2.11.0
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
>
>

