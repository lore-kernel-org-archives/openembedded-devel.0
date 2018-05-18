Return-Path: <schnitzeltony@gmail.com>
Received: from mail-ot0-f195.google.com (mail-ot0-f195.google.com
	[74.125.82.195])
	by mail.openembedded.org (Postfix) with ESMTP id 8D05370057
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 May 2018 07:35:40 +0000 (UTC)
Received: by mail-ot0-f195.google.com with SMTP id g7-v6so8029638otj.11
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 May 2018 00:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=SpNlf2fECxwKnSNKq7a6bokyk/cZfEoyma6Xmeg/unA=;
	b=SgsFuDsRgHg5zdx93LvpOZ5K/1aAu7SEEx0HySakeCx+Cs/4g6mStCVVX1JCAHAaOz
	tqz+oe41Lv6vArejhu8LJiw6YOxfJWXEPk1mfqbqnMtYqCHYX3xdB8ferfszdqAyBCzR
	JIA1sZFLRnuVIgYYchIbjIHyG/5WZIe6GfTjRRpbof0xTGw4Cfbhl+j5zVRbDoUALgLW
	jVh3JOwCYp4h5B4mDeq0KWyXFjhDAXQ3Kc9pRbj1Fdy+Nw+W2hNPwsd9NzGv9D7r8Lvx
	KqzTBDmVqizS9bLFcaX97wykPnmTF4fK5iLgeG+vpPBB3+ptKi9L4/ZhmILZhRUiFXnt
	ultw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=SpNlf2fECxwKnSNKq7a6bokyk/cZfEoyma6Xmeg/unA=;
	b=OuWx/a4bvcDRpr/GbSYp9rmuO1o8FNgPPzE3aXIwB/SON6ZHrhOH/2ylffh2Nifz0F
	QhyjPGfLaR/ernDcSi7+/vsxuIbl2G4SBL5HYYm6CbiCcJeh5FRJvgjPLjRJcVsyKm1r
	93z4VN78j1Sc6OTMps8lphuA8Pm8TilSiU76OajwAXkHgypSmQnqIt/ZwkcaoYEW9eY1
	0PLf0pnQGcJA+XOA1qoax64+ymRIp4D/XJ1hr5oSygm/FfspDbyZkF5fnZJuqPv5H+jy
	acGd00oJAZZ0YKA87FG8D94LsihlecFF1l4lV3+kISSNq85Ic2mfUrIzbYwbnkWJzE0S
	8tKw==
X-Gm-Message-State: ALKqPwdEK6b9mnstGbFZ/I2pohMVh7ugq9U4S7EjNOxCF7FBobKdsn0J
	0MCIRNvpxiHowYzYl6TrAtHN9dnPOdHB7Y3YeHw=
X-Google-Smtp-Source: AB8JxZrzBsELQHw2yLZ6RTLDwLFjq0RbgueBNvO5iUgYoto9C8KI2bRE9mKrw/wuaHvZwUJxJ8lKBUxEgf3W7Jsw3G8=
X-Received: by 2002:a9d:3df4:: with SMTP id
	l107-v6mr5481805otc.73.1526628941006; 
	Fri, 18 May 2018 00:35:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.201.73.11 with HTTP; Fri, 18 May 2018 00:35:40 -0700 (PDT)
In-Reply-To: <20180518072308.GA1715@jama>
References: <20180517232110.22663-1-raj.khem@gmail.com>
	<20180518072308.GA1715@jama>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Fri, 18 May 2018 09:35:40 +0200
Message-ID: <CALbNGRT4t-neLiZ3aEzTmsCtpkp3ToPeYTgAz3aXS_S2wjSFdw@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-gnome][PATCH 1/5] evince: Reset PR to 0
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
X-List-Received-Date: Fri, 18 May 2018 07:35:40 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, May 18, 2018 at 9:23 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Thu, May 17, 2018 at 04:21:06PM -0700, Khem Raj wrote:
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  meta-gnome/recipes-gnome/evince/evince_3.28.1.bb | 1 -
>>  1 file changed, 1 deletion(-)
>>
>> diff --git a/meta-gnome/recipes-gnome/evince/evince_3.28.1.bb b/meta-gnome/recipes-gnome/evince/evince_3.28.1.bb
>> index ce73620b09..97fe769c5d 100644
>> --- a/meta-gnome/recipes-gnome/evince/evince_3.28.1.bb
>> +++ b/meta-gnome/recipes-gnome/evince/evince_3.28.1.bb
>> @@ -3,7 +3,6 @@ LICENSE = "GPLv2"
>>  LIC_FILES_CHKSUM = "file://COPYING;md5=96f2f8d5ee576a2163977938ea36fa7b"
>>  SECTION = "x11/office"
>>  DEPENDS = "gtk+3 libsecret ${@bb.utils.contains('DISTRO_FEATURES','x11','gnome-desktop3','',d)} poppler gstreamer1.0-plugins-base orc adwaita-icon-theme intltool-native gnome-common-native"
>> -PR = "r5"
>
> Why, it makes the version going backwards without any good reason to do
> that.
>
* master still has evince 3.24.0
* I sent a patch a week ago to update to 3.28.1 and forgot to reset
PR. This patch is pending.

-> If the update and this patch are applied in same series version
should not go backwards.

Andreas

