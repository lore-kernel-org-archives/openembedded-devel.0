Return-Path: <twoerner@gmail.com>
Received: from mail-lf0-f50.google.com (mail-lf0-f50.google.com
	[209.85.215.50])
	by mail.openembedded.org (Postfix) with ESMTP id C789960807
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 May 2018 00:40:27 +0000 (UTC)
Received: by mail-lf0-f50.google.com with SMTP id o123-v6so471887lfe.8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 May 2018 17:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=8+w/gMMjze0q2bDA5GqZ/ZpzvReQ+5lFKciG+kqHGpg=;
	b=ODVCbMSU3mjQcZ9cc6EUvFF8ZukBRB/LUTlPxhSf6Q3XSF0kkP3OwEcXO+UO4za3FB
	E0v4+wZkuTVLZxPyOjBZ4ttbOgvOG0RLPJ9hOMUWpBw6JZe0ImgKZuRydf1SZi4nCJJU
	V0us53hTGpwcFFl6QLzghMs8+hAjQc2KgovPhUhAir9V8otHnt2MUDSw1J3VKqo36S83
	SkDl0jnn8y46d/sDAf8dmPU+t64eXhauZj5x1dtLAEm7vgeq5pahbZ5txRrBJALFUtmL
	4vBD8WT6QOGTgBEuwCxFaZhGuOgHk1CklPTKE5OKxjssUbfRlbQHIIhKJgbHWHchXgaq
	pyHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=8+w/gMMjze0q2bDA5GqZ/ZpzvReQ+5lFKciG+kqHGpg=;
	b=AQqsBEmfuQPaqsnAenV95/b6vjTlIdzufPP9LdYFRVSvg5UQ1PxoqY1AeNv2yQeexH
	36n/ruMGqN8ekhu/Zq5b3atdGfoVLaP+W9JRBobOV4jAWppD1Odb3d03yqOiO+9/6dT2
	+RidavW+JLHsJ1WqLDeL0LknodpyiQd+DGrt9ACKdhK4oO9+v7V7J5ZT0J4v9O2gD3KS
	51NAxLloiMRfEy3WCRNDjZoC8E5dTxDLQitonXJ+wxnwG80+x/umQUp3DhbrJQNKOTOI
	LtZj6+xPFEHrYByIY1ERfLkuibPhagurOVpJElEdadR0tKNsxF+VF2clshLwbYavy05y
	Rguw==
X-Gm-Message-State: ALQs6tANVMtkdswU6+BAVWd5Ryx84NW54u7reUZIIys47O3Tr0srZmWL
	/Ccm/4mIl7hv4SLWxTQjVlDl74MdTbvEGYG4fNY=
X-Google-Smtp-Source: AB8JxZoP5pgcbzterqKbcscZGAjHi03Yy9KbgqTmqyytjZbGIq0AuCelS/xFknIKsF5uj3D9zXeE7BiAMc8qycom5wM=
X-Received: by 2002:a2e:4dd6:: with SMTP id
	c83-v6mr30880705ljd.126.1525912828019; 
	Wed, 09 May 2018 17:40:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a19:17a1:0:0:0:0:0 with HTTP;
	Wed, 9 May 2018 17:40:27 -0700 (PDT)
In-Reply-To: <CAJ86T=WLNNu_dR2-QazLZXoWXcdY0inh1KxyF_EC_LebQJHS9A@mail.gmail.com>
References: <20180509224633.17514-1-twoerner@gmail.com>
	<CAJ86T=WLNNu_dR2-QazLZXoWXcdY0inh1KxyF_EC_LebQJHS9A@mail.gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
Date: Wed, 9 May 2018 20:40:27 -0400
Message-ID: <CAHUNapRkJ=uwNYEm2QEUJXeWNt=-1gkXB+H_tJiskfHnZkpEZQ@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-multimedia][PATCH] openh264: switch away from github archive
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
X-List-Received-Date: Thu, 10 May 2018 00:40:28 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, May 9, 2018 at 7:34 PM, Andre McCurdy <armccurdy@gmail.com> wrote:

> On Wed, May 9, 2018 at 3:46 PM, Trevor Woerner <twoerner@gmail.com> wrote:
> > +OPENHBRANCH = "openh264v1.7"
>
> "openh264" is a combination of "open" and "h264", so using "openh" in
> this variable name looks a little odd?
>
> Since the variable is local to the recipe, maybe just "BRANCH" would be OK?
>

I assumed (but didn't test or check) that something as plain as BRANCH
would conflict with any number of dozens of established internal variables
:-) So I figured I'd scope it.

I'll try BRANCH and send a v2.

