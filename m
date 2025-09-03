Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73EEBCA1009
	for <webhook@archiver.kernel.org>; Wed,  3 Sep 2025 16:07:33 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
 by mx.groups.io with SMTP id smtpd.web10.16833.1756915650692653943
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Sep 2025 09:07:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TlBHvSre;
 spf=pass (domain: gmail.com, ip: 209.85.128.179, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-72267c05111so850547b3.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 03 Sep 2025 09:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756915650; x=1757520450; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mSFlGfwxiKV9W424vsXRReLsJZQBAim1nQObjc3ZahI=;
        b=TlBHvSreFLrL04/hqP+c/R2wsvJWOYJnINNHVz3LAxzGvhKWXZ3Xyx/2Gk8a9AOYef
         zNkfLO3zRaTkzHSlNRp1nToRS0N4WFVMr35f0Y/CQ22Od6z/l8CXOKwdciNF6IeS+SMQ
         VMqSVa0jD96nXUecZAARLFY+K7w5aLnXiuIqO3Xn2gXWBfqBkfbIYEy4pGO2U+ChdjV8
         HNb2L/Et/2lhdlMo482jerJVETZG+efJyW/vcMNEJt9mcHfO4VdeJ63TANZxu107C07J
         1QaqoEljdYpwbI0fBv465jiJ3KfpiqHfjPrGhY8C7hNLM5f74gs7DG6S0FOqfh8YjzGN
         jJew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756915650; x=1757520450;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mSFlGfwxiKV9W424vsXRReLsJZQBAim1nQObjc3ZahI=;
        b=jgZ7egiKTR0c5NWmVG9TbpUT0bn9niiSymFIpHxDiwhjr2WncnWvytOrigfw+rm1VG
         MZdMyhcin0U4WqbIIw708VP6Ip1X+kI1NSj+beyC35TlZ6qfalX755bLV+8Mu7iu5/xZ
         aIuk0fOLuER3Us1b6nzjnMU5YHj0A1HEgVMahnnmFUdnnhA804XY4atJMNBdZ7FgJjKa
         J7m6Y/eA4PXDcZwEzTSqx/RruAIN6p4YGXalI21O7IfxsYW4CTzPFin4uQdn713bTACl
         Bp7sID1iDG5K0CP7NnwB31H8A83mXDxobT83AoUPsTvJPlyEzaq0pM0Kd5sJ1R1Wocv5
         OBLg==
X-Gm-Message-State: AOJu0Yz6ItY34BHj+9uq1bQwOt5Mis07GRutdrwamZNkFkLSByYQcqlu
	AgYPjR3foForzjcDjDdOGaLcFk8SG/qV7cNSVLPX2pMaoohIIqdsvXx2Vvy9ztAa7z8kCRp5X4O
	enLtoySdSyU0EGmSE6kke/0MRUbIItko=
X-Gm-Gg: ASbGncuagbBHsvmRYJ2Uk2sDndTMAXIKa3rbfal2nmo8QEKUqxEmun2u67aBWl9w0ZP
	DOwqhOAb0ofcAPcxEuIT4I9dfiWHX9RAbGT2W9zuzhfaa6+SeokJMigFBm/QThPvAwVx+hWoY84
	R6hDFOp3bQ6vgFCsPy0nrfYj2YEA9PRxG9mHWP0su+KHKAE2w5bQHxFW+V90jcKRAZO+eBEoxGr
	b1Fm51OMh/paQaM1AqrEplwMT+I7yy+fdeJQlhNC6MY5sDXG+7Cs3IT8cqBKeBrceGv/4HGZZX+
	3A6nEfo/3EEHqFvd/+zIHZr8jZKm8cjPMpvr/rxknTr27zKXW9IIRPXwFQ==
X-Google-Smtp-Source: AGHT+IHBXctDL6FIgMa3MOPVQVb1PgC/wsmMNHdpDZ8/nOuxAmMyFHe/JLOyDoZKGZ7zJgW5DamdtbFPGU+RNCC3YCA=
X-Received: by 2002:a05:690c:64c7:b0:71c:1a46:48d5 with SMTP id
 00721157ae682-7227640525cmr159623907b3.21.1756915649644; Wed, 03 Sep 2025
 09:07:29 -0700 (PDT)
MIME-Version: 1.0
References: <20250903062503.122121-1-hongxu.jia@windriver.com>
 <20250903062503.122121-3-hongxu.jia@windriver.com> <CAMKF1srmfThv_-t+EMG2CVHQ_Pnh5rbF_BbD8FdGr87RWMBWqA@mail.gmail.com>
 <c5043bba-033e-49eb-b8d7-0db80e4f78e3@windriver.com>
In-Reply-To: <c5043bba-033e-49eb-b8d7-0db80e4f78e3@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 3 Sep 2025 09:07:02 -0700
X-Gm-Features: Ac12FXwvMozV-9GRgmpFSPHpf1ow1CcKAT77Qvq7c6161oNggRs8sNUabCsiixk
Message-ID: <CAMKF1sqKxiL=a-4Wg1eyuEf5nDXxprC7tHJV_-NNvDg7GB=1wg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 3/3] cheese: require distro feature opengl
To: hongxu.jia@eng.windriver.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Sep 2025 16:07:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119259

On Tue, Sep 2, 2025 at 11:37=E2=80=AFPM hongxu via lists.openembedded.org
<hongxu.jia=3Deng.windriver.com@lists.openembedded.org> wrote:
>
> On 9/3/25 14:32, Khem Raj via lists.openembedded.org wrote:
>
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender an=
d know the content is safe.
>
> On Tue, Sep 2, 2025 at 11:25=E2=80=AFPM hongxu via lists.openembedded.org
> <hongxu.jia=3Deng.windriver.com@lists.openembedded.org> wrote:
>
> Make cheese require distro feature opengl. Otherwise it fails
> to build world if 'opengl' doesn't exist in DISTRO_FEATURES.
> ...
> |ERROR: Nothing PROVIDES 'clutter-gst-3.0' (but meta-openembedded/meta-gn=
ome/recipes-gnome/
> cheese/cheese_44.1.bb DEPENDS on or otherwise requires it)
> |clutter-gst-3.0 was skipped: missing required distro feature 'opengl' (n=
ot in DISTRO_FEATURES)
> |ERROR: Required build target 'meta-world-pkgdata' has no buildable provi=
ders.
> |Missing or unbuildable dependency chain was: ['meta-world-pkgdata', 'che=
ese', 'clutter-gst-3.0']
> ...
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  meta-gnome/recipes-gnome/cheese/cheese_44.1.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta-gnome/recipes-gnome/cheese/cheese_44.1.bb b/meta-gnome/=
recipes-gnome/cheese/cheese_44.1.bb
> index 180f3f6319..8e78162991 100644
> --- a/meta-gnome/recipes-gnome/cheese/cheese_44.1.bb
> +++ b/meta-gnome/recipes-gnome/cheese/cheese_44.1.bb
> @@ -5,6 +5,8 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Da17cb0a873d252=
440acfdf9b3d0e7fbf"
>
>  inherit gnomebase gobject-introspection vala itstool gtk-icon-cache gset=
tings gnome-help gtk-doc
>
> +REQUIRED_DISTRO_FEATURES =3D "opengl"
> +
>
> this also needs inherit features_check
>
> It is not necessary, because bbclass gtk-icon-cache has inherited feature=
s_check already [1]
>

hmm ok. Perhaps a mention of indirect inclusion would have been good
for future references, but not a big deal.

> [1] https://git.openembedded.org/openembedded-core/tree/meta/classes-reci=
pe/gtk-icon-cache.bbclass#n16
>
> //Hongxu
>
>  SRC_URI +=3D "file://0001-libcheese-Add-GtkWidget-cast-to-avoid-an-incom=
patibl.patch"
>
>  SRC_URI[archive.sha256sum] =3D "5f2185c4c99e54ddf2b8baf60c82819950e54952=
e132e8639875f3edcbf8f68e"
> --
> 2.34.1
>
>
>
>
>
>
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#119195): https://lists.openembedded.org/g/openembedde=
d-devel/message/119195
> Mute This Topic: https://lists.openembedded.org/mt/115041303/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

