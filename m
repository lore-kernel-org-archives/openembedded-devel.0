Return-Path: <martin.jansa@gmail.com>
Received: from mail-qt0-f182.google.com (mail-qt0-f182.google.com
	[209.85.216.182])
	by mail.openembedded.org (Postfix) with ESMTP id F27D878282
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Jul 2017 16:16:59 +0000 (UTC)
Received: by mail-qt0-f182.google.com with SMTP id p3so29322627qtg.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Jul 2017 09:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=zdfihfISPX7z971Ar06tq0+bwsc9Hn0x6m5taYqS8MA=;
	b=g96QU5/39p1NQbiUAqCXoEWiHM3MpJI5aBTc8Uij8v/ARMz7PgeYo7mf4/yzG/z3ri
	Df3S8+Ypzx4kGLV5Cf8D2XSas/UDLOqpTQYa1VcWL/KYhyltses2U2weNi174D2kRW/g
	18AdEqaJfU4M3DRcDMZt7UV3A/ZidDzJr7QukjyGmEL7VHn0LRUGXrv6oqd3xfbnKQUH
	J4E1SaVWPkQfnCDzgpWKy9zhy7qbWj4FIhLDZfWd4Ca2NHm2D39CV/VQG0wc6Mh8OQ3R
	Kcgvs5V1/VLf2y/eUQzvkRnMNigTwzXXhH/xcsa0PNKjRoFP9WV1tlb9FG4y8/O7C+6H
	1Cog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=zdfihfISPX7z971Ar06tq0+bwsc9Hn0x6m5taYqS8MA=;
	b=Viaqc7bNcwmXOBmL6hS82Uo8KMeI+LWH5MAbXvISRhA7htdJjITt6FfbOefecZ9FBC
	MrTKBsfVZYqmFqihJkzAzUFUlRvwdVewphL2UWFZWV66MqohKll8Uoy+q4gYLdakq9sD
	QBxSGMLcxvjyMWjiIfWZ+hngOl4ayEEbBmxnWxW7VNawXqp8duzWB+jtvWThNv/oxHT3
	quPUcdfOJaFXBGklqUhSLNhMNmyt4ADtdwGzShrDyeU8PBQjtXsxJFdNYlpWEsVupBwM
	v7ZaUIDoT6LcsPjGsRRSsfRamZ8635DRCirDo1wVitPozUPg/lLy8C8ZomGlB65QMm4o
	NmHg==
X-Gm-Message-State: AIVw113Y1+59uFxKObRZDoEeFiuU/Dpe7GLjSXq6vOsPHd8yKAqF5pNn
	TjZ/Tj0CPi+u8PzhesoK+TZgEeOTDw==
X-Received: by 10.129.73.141 with SMTP id w135mr18440783ywa.414.1500999420548; 
	Tue, 25 Jul 2017 09:17:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.73.196 with HTTP; Tue, 25 Jul 2017 09:17:00 -0700 (PDT)
In-Reply-To: <CAJTo0LaRCpeXm93y-ohukgRYa7YMAwC3CP+sKdOBzTCNBO-oEA@mail.gmail.com>
References: <20170720153508.23113-1-ross.burton@intel.com>
	<CA+chaQceN=yak2xd2RqPucsNR2xfnPKAJQztnfEPxovsH6iqGg@mail.gmail.com>
	<CAJTo0LaRCpeXm93y-ohukgRYa7YMAwC3CP+sKdOBzTCNBO-oEA@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 25 Jul 2017 18:17:00 +0200
Message-ID: <CA+chaQdBfJRoxtjC4-v-TV9A=ftJX+Wi-Q=MoxyUzGOgW76FaQ@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
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
X-List-Received-Date: Tue, 25 Jul 2017 16:17:00 -0000
Content-Type: text/plain; charset="UTF-8"

> for example there are two gweather recipes and the blacklisted one is the
one you want to keep.

Are you talking about libgweather and libgweather3? Both are blacklisted
for long time, one because it fails to compile with gcc6 and the other one
because it conflicts with first.

Yes you're right the libgweather3 probably doesn't need to be blacklisted
as long as conflicting libgweather is, but as both are blacklisted for long
time and nobody sent changes to fix either of them I can only assume that
nobody cares about them -> both will be removed as the blacklist message
says. Unless someone steps up and fixes them before 2017-09-01.



On Tue, Jul 25, 2017 at 5:08 PM, Burton, Ross <ross.burton@intel.com> wrote:

> I'd prefer you not to remove all blacklisted packages, for example there
> are two gweather recipes and the blacklisted one is the one you want to
> keep.  Would you prefer that I fiddle the blacklistings and leave them to
> expire when the message says?
>
> Ross
>
>
> On 21 July 2017 at 09:56, Martin Jansa <martin.jansa@gmail.com> wrote:
>
>> The PNBLACKLIST message says it will be removed on 2017-09-01. I already
>> have a patch which will remove all blacklisted recipes with such
>> PNBLACKLIST but I'll apply it only at the end of next month.
>>
>> On Thu, Jul 20, 2017 at 5:35 PM, Ross Burton <ross.burton@intel.com>
>> wrote:
>>
>>> Cheese 2.30.1 is very old (2010) and has been blacklisted for some time,
>>> so
>>> remove it.
>>>
>>> Signed-off-by: Ross Burton <ross.burton@intel.com>
>>> ---
>>>  meta-gnome/recipes-apps/cheese/cheese_2.30.1.bb | 26
>>> -------------------------
>>>  1 file changed, 26 deletions(-)
>>>  delete mode 100644 meta-gnome/recipes-apps/cheese/cheese_2.30.1.bb
>>>
>>> diff --git a/meta-gnome/recipes-apps/cheese/cheese_2.30.1.bb
>>> b/meta-gnome/recipes-apps/cheese/cheese_2.30.1.bb
>>> deleted file mode 100644
>>> index 3f5a5b124..000000000
>>> --- a/meta-gnome/recipes-apps/cheese/cheese_2.30.1.bb
>>> +++ /dev/null
>>> @@ -1,26 +0,0 @@
>>> -SUMMARY = "Take photos and videos with your webcam, with fun graphical
>>> effects"
>>> -LICENSE = "GPLv2"
>>> -LIC_FILES_CHKSUM = "file://COPYING;md5=a17cb0a873
>>> d252440acfdf9b3d0e7fbf"
>>> -
>>> -DEPENDS = "gtk+ gstreamer gst-plugins-base libcanberra udev librsvg
>>> gnome-desktop evolution-data-server intltool-native"
>>> -
>>> -PR = "r2"
>>> -
>>> -inherit gnome
>>> -
>>> -SRC_URI[archive.md5sum] = "1599fded8a1797ea51fb010af4e6c45b"
>>> -SRC_URI[archive.sha256sum] = "48f03470c6f527caa0e3b269d3afc
>>> ff86ae0939a74f66ce030d4eed3bc3cbd9a"
>>> -GNOME_COMPRESS_TYPE="bz2"
>>> -
>>> -FILES_${PN} += "${datadir}/dbus-1"
>>> -RRECOMMENDS_${PN} = "gst-plugins-good-meta gst-plugins-base-meta"
>>> -
>>> -EXTRA_OECONF += "--disable-scrollkeeper"
>>> -
>>> -do_configure_prepend() {
>>> -    sed -i -e "s: help : :g" ${S}/Makefile.am
>>> -}
>>> -
>>> -PNBLACKLIST[cheese] ?= "Depends on blacklisted gstreamer - the recipe
>>> will be removed on 2017-09-01 unless the issue is fixed"
>>> -
>>> -PNBLACKLIST[cheese] ?= "Depends on blacklisted gnome-desktop - the
>>> recipe will be removed on 2017-09-01 unless the issue is fixed"
>>> --
>>> 2.11.0
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>>
>>
>>
>

