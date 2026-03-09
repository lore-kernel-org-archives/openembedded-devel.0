Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A94CFCA176
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 18:40:49 +0000 (UTC)
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22155.1773081648798105363
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Mar 2026 11:40:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aQD/PYeX;
 spf=pass (domain: gmail.com, ip: 209.85.160.42, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-415e568a7ecso2812194fac.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 09 Mar 2026 11:40:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773081648; cv=none;
        d=google.com; s=arc-20240605;
        b=cyooQ5VB9Q2H7TnQwU8mzgHdFCvOpmZS/g5z9ASSuyxidysyI8n6hfpuFEr4T14u9w
         73PeQ4cb+yJB9UnOEEs3ZNt9iC+Hc3u9cp4prdJ4Ro2hyUhagtlQeGxnkcqaf5jdzTmg
         vrwi94kmTHvudUECotTx/gLv9PBh6SuJRXo886dEAjus7nMc/IvxmAXUNv3Q5+1Ekg+8
         o+y51gik4bFZ51OvBW2mkxPo6ab5rz75idKGlkTjfm7Qn2Ljb5cUaVCz3ejuzpuBtQiA
         LcUeEJ9+kGD3sc3TpxdRUaMqoB4/BevJdvFjyDG7Atpk3jV1/gD7BrUIYTEAITSD6m7M
         H09Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Sj3vFgowDPdhN8mNIEYMaBK8NzoGlaQiwMx/orUSnyg=;
        fh=/pKZqiJO6ZyW8l1F3cqMwIj3cJesZI6SFBUzs2mKL9s=;
        b=IevIL6DBRM/h58MGiYYWGqI6QoDOzvIgDfx0B1FT5+ienXaYTjPvOeWCrG8gtWWk+c
         hWwMFT19fMmwJMlABbUp6xn7QCAnKg07QTbMcFhogNbpUSfOc9XTMiTVzSEVFYgdDDUJ
         dFNaWnsmUSayQ8K6sxh+DS+i2p2n6jB29fhYvcBvK4U7EOJgjOL/mJZWDHq/UF0gYBfH
         kZOlNJ0ADHZaoisiYOqACIS7HoVznX5Hu/jZn9rfAiPcqbkMrUi0HnzpDQMKQgAzJLuF
         Fdi8OMGHD7lZmKpzd8Qs8GzBkR7pCgAaRzjsteBTjuoUTYE3YYumcA7GbD9PB9pMAGqT
         YI/A==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773081648; x=1773686448; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sj3vFgowDPdhN8mNIEYMaBK8NzoGlaQiwMx/orUSnyg=;
        b=aQD/PYeX5q64JdbCbFMzNTzORyJEdFllKI+XiNL3VKlocQJWVuER++Iur7qWDHOaXv
         mpUjNyuwCwXa1ELAaWF3t6HsQn2L57RKzhmWFnHYCIMuD4WofwOA/7eBZeS1vBOnO9Oj
         V99ebbpN946qBadIADG4r6KgMOw3hsqMObO4s9mvGgFHyxoRZg1arpKxFiqTtkkjoi/E
         wxyQxoGDVrfkBQW+b2AVAjtbhfIT7Y4Oq3r2TIaqlA2+8DC1wI8xRwmn51yXb3fERJPl
         5zTnq+Jt7A9SU9SSL0RhLyFiYVC8FvEDjAYimpY5VOZtmakqSO4EWBVNTGH/DKz8HQih
         P6jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773081648; x=1773686448;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Sj3vFgowDPdhN8mNIEYMaBK8NzoGlaQiwMx/orUSnyg=;
        b=aTKclKO7S5L1VTF8OfeVheArnl6cLWvKZ7q2mqRSCMxbzW1GTJP/ja+huY531726Z5
         o5CZqj+eyhrhLXeck05oH1c7rV953JAyZSjY5l7J0mQf04KCC3m8eSA9qXuvjlnZUUt0
         srcUfr/RRSqAmjNebyl1arcOG0g+Z6Xe4E30FwFnMr8Rok4CAptAo9DCWhE/hwDLsgSC
         7VGHKAhQ5qilMaVNxbTEFDAEpvzRU3x3SlU9n7tJDdeDYrIMl8tczxtK2QLjOWQRlmjK
         RdiPPZKz3XtaMM9ta9/IjUVZebTJ4QjpREcZdKLFls+hsrwBB1XHuCyS4CygwRo4D0xX
         yqGg==
X-Gm-Message-State: AOJu0YxN8qwJqyWy68n4ozOFExQrTO5Ie27LaMkI23IqEGv8vgHfL3Az
	gGXpjqh7z9b/aFpnsdPHX/iTyuxlmgsjzmvuuI35ADGw3BE87J6jxP9mSqZsD6Qyx1/tVbCL21m
	Cpq1SFc0A5DiyJhZmsm2cGWT5woqOudc=
X-Gm-Gg: ATEYQzza42sNdJ/ueWKB3y0FZt+OSiWM4kXS9/jYQgx6Wta5cbrxT9BbvPYsh/xi34u
	nYZOOgwhk+qpjJ7k7JkHP9UHG1L1LQahxuW27sSwjaD2IPogOnBftuyWuopA5IsBg1+GUmGvGUf
	c7P4E9ZtmBDqsEtlCXCFTei3Xu0YBmpHri7oYOWzldp3E9lo5FKLSYFNoxAsw8qB5gEja9z8du4
	y573v88sJLoeMbYwWnA4gWVnxpzpAqzr+G00bWwOVm9qBpbULQTz05fE+dAA2PZ52t9I4ODHyWz
	0fbQn//l
X-Received: by 2002:a05:6871:d3c8:b0:3ec:5cc6:315f with SMTP id
 586e51a60fabf-416e3f84fa8mr7537406fac.3.1773081647871; Mon, 09 Mar 2026
 11:40:47 -0700 (PDT)
MIME-Version: 1.0
References: <20260309100630.404637-1-andrej.kozemcak@siemens.com> <20260309100630.404637-14-andrej.kozemcak@siemens.com>
In-Reply-To: <20260309100630.404637-14-andrej.kozemcak@siemens.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Tue, 10 Mar 2026 07:40:36 +1300
X-Gm-Features: AaiRm52qWx7pYWiK32J4Wg1SDQw-YWcorIPzO15D7cyxHUwAxGC7c1jdqSWeP6c
Message-ID: <CADySD0GNT2MFwP4cKG0SSYVd+wMBM7iA3idq+cG5OfQ-8ufMOQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 14/14] zchunk: upgrade 1.5.2 -> 1.5.3
To: andrej.kozemcak@siemens.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 Mar 2026 18:40:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125005

On Mon, Mar 9, 2026 at 11:06=E2=80=AFPM Andrej Kozemcak via
lists.openembedded.org
<andrej.kozemcak=3Dsiemens.com@lists.openembedded.org> wrote:
>
> The tag is not on any branch.
>
> tag cannot be added to SRC_URI as it does not seem to work with nobanch

Can you please share more details about what was not working?
I gave it a quick test and was able to fetch using following SRC_URI
SRC_URI =3D "git://github.com/zchunk/zchunk.git;protocol=3Dhttps;nobranch=
=3D1;tag=3D${PV}"

cheers
Ankur

>
> Changelog:
>   https://github.com/zchunk/zchunk/compare/1.5.2...1.5.3
>
> Changes:
>   - update to 1.5.3
>   - rename internal close() functions to close_zck_component to avoid POS=
IX conflict on AIX
>
> Signed-off-by: Andrej Kozemcak <andrej.kozemcak@siemens.com>
> ---
>  .../zchunk/{zchunk_1.5.2.bb =3D> zchunk_1.5.3.bb}               | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-oe/recipes-support/zchunk/{zchunk_1.5.2.bb =3D> zchunk_1.5.3=
.bb} (82%)
>
> diff --git a/meta-oe/recipes-support/zchunk/zchunk_1.5.2.bb b/meta-oe/rec=
ipes-support/zchunk/zchunk_1.5.3.bb
> similarity index 82%
> rename from meta-oe/recipes-support/zchunk/zchunk_1.5.2.bb
> rename to meta-oe/recipes-support/zchunk/zchunk_1.5.3.bb
> index bbdd06dfda..56aa0baf2e 100644
> --- a/meta-oe/recipes-support/zchunk/zchunk_1.5.2.bb
> +++ b/meta-oe/recipes-support/zchunk/zchunk_1.5.3.bb
> @@ -3,9 +3,9 @@ DESCRIPTION =3D "A file format designed for highly effici=
ent deltas while maintain
>  LICENSE =3D "BSD-2-Clause"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Ddaf6e68539f564601a5a5869c31e5=
242"
>
> -SRC_URI =3D "git://github.com/zchunk/zchunk.git;protocol=3Dhttps;branch=
=3Dmain"
> +SRC_URI =3D "git://github.com/zchunk/zchunk.git;protocol=3Dhttps;nobranc=
h=3D1"
>
> -SRCREV =3D "222d1a4da3661dd95c2445b96f7e1e208f55d219"
> +SRCREV =3D "366cf22e725fc273abe0e082c707753cce76c453"
>
>  DEPENDS =3D "zstd"
>  DEPENDS:append:libc-musl =3D " argp-standalone"
> --
> 2.47.3
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#124975): https://lists.openembedded.org/g/openembedde=
d-devel/message/124975
> Mute This Topic: https://lists.openembedded.org/mt/118218620/3619737
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nkur.tyagi85@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

