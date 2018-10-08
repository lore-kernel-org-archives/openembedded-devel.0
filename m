Return-Path: <btgoodwin@geontech.com>
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com
	[209.85.222.182])
	by mail.openembedded.org (Postfix) with ESMTP id B61DB74775
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Oct 2018 21:27:51 +0000 (UTC)
Received: by mail-qk1-f182.google.com with SMTP id a85-v6so13001621qkg.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Oct 2018 14:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=geontech-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=12pJ2+RZJI/zIQL5dyfVhwIGeKF7HrNqNX6pvl962nQ=;
	b=diptSlJpuUmj/5BSIbR+nSfVyNUKlmKv3Bsz+SnuIRFta1K23kipfF3eiRDdz8Jr/Z
	yUnlGx2GsZYXhK+v1p0LfWR6Uxiq86Qlq327ROrnq2LwKG4YIWdXIYohTS7E+7zbDDRW
	KAYjNDpD5ec1Kh9tFNW+EQOSTVFFab6OtGBqciosFm+mQPvxGM71ROvq7FMC3g4prfu5
	xBuw2kTWLeE5CLRyiG2aoh8JG4+k5K229+SNqt3/EeiGCCibOs1X+E5MfwQy6fE4J5Ol
	uF3TBQdKhme0nZrIpvt3gzersdx6SmjcAeFbFCqyL/j70RPmKlYhql5BzFREkmxuBzgi
	AAnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=12pJ2+RZJI/zIQL5dyfVhwIGeKF7HrNqNX6pvl962nQ=;
	b=ByFUiMcXk+bryVIwD8f0LiiM79tZr2j/Nw23ZNdK4+39nUEAfT6vHkS5UV8xwMqZmo
	Cp8bEi7vm1lFxB2E8HU5bxI4Ug/cPHrGZaewy52o403/UMiQaZcdJckgA/Dcl15TkZVY
	/laxw33UNggMI//f8HRlb5n+j+xcR+SMZKfnCu/ypz+3csK1oT2fq9PsMsbsqd27U3+l
	NTbhQ3kw2ggbOxtKflxZeS/VdlTM3GjTihE5CBTqxlqNFYxamkhZlyvaZr9UFQ5vWVpN
	TeMXo/EbgDHjHuuaXdqI0qidnQLSlW3e/hZSw7JT2M8b0j0diHltKMYzkR1/8y6mOqP2
	2htw==
X-Gm-Message-State: ABuFfoj5bCwd65twnCZ5ceYUslVh9/KrEvwuOkuEqlrYIUTVy/fxb6Sd
	/xhaDucC+Y7dKQRxzwlZZYohwRqhYQ5bhrsBRYz5FNGOo30=
X-Google-Smtp-Source: ACcGV600d8GGyYOPmAOCyc3wTMHfwHYKzNKgjxa2AQ1K3CTZ2pJf1iIfFIaUDYDsCkHIhR6V7pPkAOVtf5KtPp5OFCs=
X-Received: by 2002:a37:2044:: with SMTP id
	g65-v6mr19137201qkg.177.1539034071819; 
	Mon, 08 Oct 2018 14:27:51 -0700 (PDT)
MIME-Version: 1.0
References: <CABudRdzubOL9HwpnYNBDzybRkJj-EUeHMni26oWzErqJysjF4w@mail.gmail.com>
In-Reply-To: <CABudRdzubOL9HwpnYNBDzybRkJj-EUeHMni26oWzErqJysjF4w@mail.gmail.com>
From: Thomas Goodwin <btgoodwin@geontech.com>
Date: Mon, 8 Oct 2018 16:27:40 -0500
Message-ID: <CABudRdyHEgpAHSuAwwnAZPyp+8uf5V+Y7Fn-fvOopAwJZjjiGA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [sumo, rocko, pyro, morty] xerces-c, change of SRC_URI
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
X-List-Received-Date: Mon, 08 Oct 2018 21:27:51 -0000
Content-Type: text/plain; charset="UTF-8"

I apologize, a bad copy paste given that mirror has *dist* in it:

SRC_URI = "${APACHE_MIRROR}/xerces/c/3/sources/${BP}.tar.bz2"
SRC_URI[md5sum] = "d04ae9d8b2dee2157c6db95fa908abfd"
SRC_URI[sha256sum] =
"9408f12c1628ecf80730bedbe8b2caad810edd01bb4c66f77b60c873e8cc6891"

On Mon, Oct 8, 2018 at 4:21 PM Thomas Goodwin <btgoodwin@geontech.com>
wrote:

> The URI for this recipe is to a server that seems to only maintain the
> most recent version of the source tarball (currently 3.2.x vs. recipe
> version 3.1.4):
>
> http://apache.lauf-forum.at/xerces/c/3/sources/
>
>
> The server listed in APACHE_MIRROR does contain the correct sources (
> https://archive.apache.org), so:
>
>
> SRC_URI = "${APACHE_MIRROR}/dist/xerces/c/3/sources/${BP}.tar.bz2"
> SRC_URI[md5sum] = "d04ae9d8b2dee2157c6db95fa908abfd"
> SRC_URI[sha256sum] =
> "9408f12c1628ecf80730bedbe8b2caad810edd01bb4c66f77b60c873e8cc6891"
>
>
> Note, the MD5 and SHA256 are correct for each of the impacted branches of
> meta-openembedded; they're listed here for completeness.
>
> Regards,
>
> Thomas
>

