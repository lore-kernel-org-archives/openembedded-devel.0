Return-Path: <ticotimo@gmail.com>
Received: from mail-vk0-f67.google.com (mail-vk0-f67.google.com
	[209.85.213.67])
	by mail.openembedded.org (Postfix) with ESMTP id 640C262135
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Nov 2016 04:42:33 +0000 (UTC)
Received: by mail-vk0-f67.google.com with SMTP id x186so2788057vkd.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Nov 2016 21:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=5VJ2z+odPXCKKk7SIAAPADsRIuwJ2ozXyAmzHJlM+mg=;
	b=iRp/5HXFwfZu1nSALFiX78QbhKdyWZIScnQi/v7PwBU/YzQB6kEczGQneSSJIxIgnA
	8BzjHGmGQWpn3gzJMix33ip/S8wvxAVXsu9rgLFHeNXcF742sekSa90aQIkNbAyWTGFy
	blezC47PforocgQJMDUypsK7IeeninkwN09YGyE6a2B4XIQoo9Bm/JwGxf/G7gUyRsQz
	Gj9XvDADB7yYZx/6wfwc4l7up79SKTTYpeNn4cXM+7edW42vSl+uObLSm32k2+RQVN3t
	k/NzIE7r7MSd1CKKEtZeHoyw1UCO0YQzHXhuk4XlSwsHT0h+zh3rC4udNvAGfzqngDTq
	5yQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=5VJ2z+odPXCKKk7SIAAPADsRIuwJ2ozXyAmzHJlM+mg=;
	b=dEMooTK4UqgTO6edVVA8Ug11O2cwjpiBOJMmVdnnA9/+f8HKxLDPzmGoC5CIERW3Zm
	zQ29sIujY+3YcqICtVf/bsOEXiYH7OBQWFFfduJvIGaquIdM37rG0jQLIgpt4cLthDOC
	1THHM6vll4NUMqfHHNYRLaaCzu+XDz4KmZqIIolZvFabQBd4Yyd3xQbIs8Hhn3LD7jIT
	qKrOZi2chCBiBTTSCm29sqZryMY9OViEaZmQgJOQMvhr/WnCW77X0uIe/w6VBaNAPuex
	wQiSoB9qg/nTIvaHeqNxeQ/5AnlBrvV0grQxa0Ahi638LS7ak5wrWSmn/4nV9YLHKt2S
	CLaw==
X-Gm-Message-State: ABUngvfkgxSi6mTFea1/bddkcdMWekAasiksSYW1YrtXqmjATdizrmlFPhn1cUHKYQWKoBi0VjLV+3xk1Z1YIA==
X-Received: by 10.31.50.204 with SMTP id y195mr10187301vky.29.1478234554744;
	Thu, 03 Nov 2016 21:42:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.107.142 with HTTP; Thu, 3 Nov 2016 21:42:34 -0700 (PDT)
In-Reply-To: <CAMKF1spNzuAWTGU+S_n2v8PD8yZSz8OhRfj6NwZs_Qfu3rK5KA@mail.gmail.com>
References: <1478225282-27345-1-git-send-email-timothy.t.orling@linux.intel.com>
	<CAMKF1spNzuAWTGU+S_n2v8PD8yZSz8OhRfj6NwZs_Qfu3rK5KA@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Thu, 3 Nov 2016 21:42:34 -0700
Message-ID: <CANx9H-C=g=ai3AO-95nWa49+9Jv=_00AA7sBBcBXHN4OVjG_Zg@mail.gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH] mariadb: use faster download URL
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
X-List-Received-Date: Fri, 04 Nov 2016 04:42:34 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Nov 3, 2016 at 8:05 PM, Khem Raj <raj.khem@gmail.com> wrote:

> On Thu, Nov 3, 2016 at 7:08 PM, Tim Orling
> <timothy.t.orling@linux.intel.com> wrote:
> > The current URL takes about 2 hours to download.
>
> how fast is new one, do they keep the tarballs there for long time ?
> or shove them into archive after new release is out
>
> 10 MB/s vs. 3.4KB/s by my test.
It is the same organization, just a different server.
We could instead trust GitHub archives if you prefer. But the current URL
is just not working.


> >
> > Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
> > ---
> >  meta-oe/recipes-support/mysql/mariadb.inc | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta-oe/recipes-support/mysql/mariadb.inc
> b/meta-oe/recipes-support/mysql/mariadb.inc
> > index edef40b..689b8ab 100644
> > --- a/meta-oe/recipes-support/mysql/mariadb.inc
> > +++ b/meta-oe/recipes-support/mysql/mariadb.inc
> > @@ -4,7 +4,7 @@ SECTION = "libs"
> >  LICENSE = "GPLv2"
> >  LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882b
> be"
> >
> > -SRC_URI = "http://archive.mariadb.org/mariadb-${PV}/source/mariadb-$
> {PV}.tar.gz \
> > +SRC_URI = "http://downloads.mariadb.com/MariaDB/mariadb-${PV}/source/
> mariadb-${PV}.tar.gz \
> >             file://fix-cmake-module-path.patch \
> >             file://remove-bad-path.patch \
> >             file://fix-mysqlclient-r-version.patch \
> > --
> > 2.7.4
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

