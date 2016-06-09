Return-Path: <kergoth@gmail.com>
Received: from mail-it0-f66.google.com (mail-it0-f66.google.com
	[209.85.214.66])
	by mail.openembedded.org (Postfix) with ESMTP id 450FB60667;
	Thu,  9 Jun 2016 17:02:48 +0000 (UTC)
Received: by mail-it0-f66.google.com with SMTP id z123so5912787itg.2;
	Thu, 09 Jun 2016 10:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=ilzvZkNQ+sX99WpiAQifbzc9DFQF1jc4AJI0bPZMnCs=;
	b=wZH+MmaZlTzEX2My2wXo5eHZwv8zSOgCv3H6AeuzRZ9WJKcNieN1aeNHp6yDOvkLSq
	07eG1OhMFOxY+0msCWK+mpM9JndAkufBM6AHvEi4Xz4pkoGyS8mrylT9RRkjGBj5X6FS
	uAtBxCKpbo/d34w//iW/inRIgJRrvpi/0o044D55lYjS2kpCvgpz8avo0kqUg4W0UPwp
	Ge+4uet48V+ZFsIkbBoDdwwCD1/vgFO5O6D5Y3dvhfTewEU9QzvPxVTamk2Ro18lHcTt
	f/tlNPKf4UCMAHqpkuCCN8R7khHff7ufV+z9FAOXpRsneISjXc3GNXLX5zfbI+MCJeY2
	wB+Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kergoth-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=ilzvZkNQ+sX99WpiAQifbzc9DFQF1jc4AJI0bPZMnCs=;
	b=deXW4YUN41G2O+mRyg84XQRPOARkGwgDFpBFa16DF0YU+gB6yv8BJyGxnwA8mr/JQ7
	ukIud5H9opHEyAAW2aRDd/5PFo0cCvzWqtVJIcd3saGRdGAlD8mHCmi/qUcme6rkhrz2
	50zOoo+iq5itP1HBG8MOAac1jXb64e5CZCiRziLhTA3LFc+muOaMpyxnI1wlGykNv8jF
	yOIyztrjXhYaXt7hM0LAlD+SFrMAxugWrPNYtb9TPYHGOlvJTbGBdKnM+Efis+hpNiWo
	y4OodZOIBu8s1LzKyGUBTjHZW5O5MoUkKLORMvTb5YVHL7s0MrYciOV1zqvJsI2B6pg3
	xxJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=ilzvZkNQ+sX99WpiAQifbzc9DFQF1jc4AJI0bPZMnCs=;
	b=I9e+vp1dNfxbh6b4mPkaQbhARkitPvyG2WyBQYaam0MjZTPVd5tMMYNcbktcchfvz/
	xwGMjIGgRlcZEUWBvDP7rWkJIsMOUKxIsLf4kcE17uxvTH/tAzPnXeHXkyrV11b6YmrP
	ecy3c1ymoUcbvLNhg9XlbnrmTPljfhQgVAFwCjuEobgfheoMU/YurHAzDpV5WpdiaRmd
	NHQYjLV4d8xyGqwG50+i5IWL4oTPDXxUI4u24WiGhSeZa8fgWpbCPSGKnn/srzb441Dv
	FQ3k3qVLFVoUA2UJhMWxJNs11j4mZc6M2QLrksF35a+pxOMAtYr8Y6Ehdkd7uvqoTys6
	XFxg==
X-Gm-Message-State: ALyK8tLojLB96Oc/E7i/Xc7l0xbSgvS/oyIWQVFuhxuvZU9yYzICYlCL9UBwWnr5EDS/la9+zVXTLO3CzcoI5A==
X-Received: by 10.36.40.69 with SMTP id h66mr19924236ith.66.1465491769675;
	Thu, 09 Jun 2016 10:02:49 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.130.66 with HTTP; Thu, 9 Jun 2016 10:02:30 -0700 (PDT)
In-Reply-To: <20160609070345.GA27764@jama>
References: <20160609070345.GA27764@jama>
From: Christopher Larson <clarson@kergoth.com>
Date: Thu, 9 Jun 2016 10:02:30 -0700
X-Google-Sender-Auth: CXIv_dLORzrp18zxQPVTX9MxKtg
Message-ID: <CABcZAN=DzML_E8PWTf2zB1einsWZm9iyepo6T95eaJdGXmqfHA@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Openembedded Discussion <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] State of bitbake world 2016-06-07
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
X-List-Received-Date: Thu, 09 Jun 2016 17:02:49 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jun 9, 2016 at 12:03 AM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> This report includes python3 changes, there are few more failures, but
> it's hard to see what is new, so I've sent couple PNBLACKLISTs for
> recipes reported in previous 2 reports which are still failing with
> glibc-2.24 and gcc-6. Hopefully next report will show only "new" issues
> caused by python3 switch.
>
> == Number of issues - stats ==
> {| class='wikitable'
> !|Date               !!colspan='3'|Failed tasks
>  !!colspan='6'|Failed depencencies                    !!|Signatures
>     !!colspan='12'|QA !!Comment
> |-
> ||              ||qemuarm       ||qemux86       ||qemux86_64
> ||qemuarm||max||min     ||qemux86||max||min     ||all   ||already-stripped
>     ||libdir        ||textrel       ||build-deps    ||file-rdeps
> ||version-going-backwards       ||host-user-contaminated
> ||installed-vs-shipped  ||unknown-configure-option
> ||symlink-to-sysroot    ||invalid-pkgconfig     ||pkgname       ||
> |-
> ||2016-06-07    ||34    ||40    ||39    ||84    ||38    ||37    ||92
> ||42    ||41    ||0     ||0             ||0             ||1
>  ||3             ||18            ||0             ||0             ||0
>      ||0             ||0             ||0             ||0             ||
> |}
>
> http://www.openembedded.org/wiki/Bitbake_World_Status


chkconfig-alternatives-native is failing, but natives are excluded from
world by default. This recipe should only be built if it's the preferred
update-alternatives-native provider, otherwise you'll hit the conflict that
your build is hitting. If you're undoing the EXCLUDE_FROM_WORLD for all
natives, better keep it here. I am surprised the bits that skip
non-preferred recipes didn't happen here, though.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

