Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 717CD6079F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 May 2018 14:08:45 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id f189-v6so3827723pfa.7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 May 2018 07:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=UXC4PK0CZk4YzBsZhrxBVa7g6EbRlo7u+9uu7sJR6zI=;
	b=QhJeFrJYo8s5iL/9b7Y28/tI2xHypFstUeWqamuTev4CWSq58X7bDEH215xU02/KE/
	+pj9nJo1XukGxKwYFVDO7jOfkCywxdJS6uaUFtjuWAoTc61m8XQZUXK1reFFRu3MB9Rh
	6TRAKojwtJpceWu89MUFN3cgO+cHLEZEyBs1t0VFc3wt5oxQBsf0MD2KsC8zJHfZ/pTb
	x2QMn3rcC8SoQCDNn94MVKDc0heFhcBPVsvAIfNyyw+XV7v5XInD2lPhW+7Z8Z1xZrmC
	O3EK4+UkzlyRm4yB0q1uDyv+mSUW5r8yf+LmzAT959FRS4soafRDDkP+658dXwoNOupI
	ADBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=UXC4PK0CZk4YzBsZhrxBVa7g6EbRlo7u+9uu7sJR6zI=;
	b=L7Cicrn3dQhU0i38KOy6JMhRitidj4ffmG89ZWhN21gqqn0facP3GoFCU/KPaWlMMb
	CB4lNKl24/vLE/fSrJe3nZjZeMur2YvutOZ3EXc67vq8aedDA7Uj2UAje3GardmdxXxZ
	UBq0euF+Onq7FRXkeAZpgTF+pqT0sLOWxt2S2GaJogc57PR2DUBO3WDYETXe2zyQnsmj
	9hhnY7S1tu5gs769PpdeMFdhOL9n0KoNTaLC9BYZLITwXs3qj9rCiRCOU4fgBzlWGkxA
	I+TgDh1PAsvCdKceK/NGwh+FLW/+wJzGm07UbBra+FzsrxNPZZeQHWxTTcRB8mrB62GR
	pR5Q==
X-Gm-Message-State: ALKqPweHcdpE/MXBRu2fHe4l9Rxy2rJhiao5VNJg8SFPa5abUHhLAqFZ
	bawLVBrNjPCfSZI5zYaF5DgcBh+4BXW0PhbVmB0=
X-Google-Smtp-Source: AB8JxZoUGPdb4A+MecsiJsuclgSzyqbQnmocrTow3iMxZONYMtzfNLSCphOV7COcHss3g8wtXaVF+LAoF6eou4ifB3k=
X-Received: by 2002:a62:3c10:: with SMTP id j16-v6mr9599349pfa.7.1526652526106;
	Fri, 18 May 2018 07:08:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:90a:8b91:0:0:0:0 with HTTP; Fri, 18 May 2018 07:08:15
	-0700 (PDT)
In-Reply-To: <20180518072308.GA1715@jama>
References: <20180517232110.22663-1-raj.khem@gmail.com>
	<20180518072308.GA1715@jama>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 18 May 2018 07:08:15 -0700
Message-ID: <CAMKF1soqMdfMd1iqyDzds958_t1WanZA5xWXJcfsD9_JtCkpKQ@mail.gmail.com>
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
X-List-Received-Date: Fri, 18 May 2018 14:08:45 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, May 18, 2018 at 12:23 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
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

it should be merged into original patch from Andreas.

>>
>>  inherit gnome pkgconfig gtk-icon-cache gsettings gobject-introspection distro_features_check systemd
>>
>> --
>> 2.17.0
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

