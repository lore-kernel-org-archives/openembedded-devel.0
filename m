Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D240BC433EF
	for <webhook@archiver.kernel.org>; Thu, 12 May 2022 16:15:54 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
 [209.85.160.170])
 by mx.groups.io with SMTP id smtpd.web11.125.1652372152900305510
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 May 2022 09:15:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mgO5AsVl;
 spf=pass (domain: gmail.com, ip: 209.85.160.170,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f170.google.com with SMTP id g3so3558606qtb.7
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 May 2022 09:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=q6Thq5W1xXnClFEyD09pXIUEexY9n69kXriKz3tAK0Y=;
        b=mgO5AsVlNuXnJGsMLcmreQ3szHDoqv6muKxxqEG/iIQ5/tI1bSNWWLl+z2KSw0Y1wT
         vcl6xjA0uy70bP/EmzMLr32NTJd2zkUmu+Hi33Un7gelyzcuQK6M8pEWl95SgM5BW5FK
         CevgmwNu6fjj3dr8hbaGFsmCINa80wCaIwEDUzNKBY3pUhKZxZm+YJo44MBaYzJtCMeG
         WVso3tkhqDJAqGuRuVFUIt17jg5NpWMquZQmVEbDZmorAuQLnzPNtxg1hR4jMSILuORF
         wWgIGnVVWup83d+Tn2OAnlJYhVFJyQZF0xJgwjiBJm5ybUkE5xAgcRXPOKe3Us5xjrlb
         tVjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=q6Thq5W1xXnClFEyD09pXIUEexY9n69kXriKz3tAK0Y=;
        b=jUPckg5WtzjGZeab6PtUm6y+mfu/0pV8FDsY2EYBU+lhsAEiViskQZE4CTXodxuvxP
         /nKiPm+r86AiNwoNhmDoWgClTcYwMm2ZwHCAA8qONwpqYvD83LW9HGsAvPEjEJDCROWl
         RPxkmjRGewgCG2vdxLbYvGK5wKEgk5iLXtTzdbGwgsIR6GqDNHHw0wCdqYMWlTnlSIym
         WzeyRCD887K08PpqL1Pn09zhNTE4Wb2qcPkQG+ixspUuMXojan0+8PKJ1kQ+yjpQCwQO
         0OJD4//U8DtcMQJ/EnHvmvMIwL0AQl8Sfn2xwHFoclcJjwS8bwfx7dSs/2amkCc+62Ni
         FS4Q==
X-Gm-Message-State: AOAM531GdnZnai4w2NVJ1EjJi1DnzSSymw4s4hTb78r8D1yUuzo/Lz+P
	xkjpBJ8UEPG7TFePE23FEEH6jcOrj6rn3qm8szc=
X-Google-Smtp-Source: 
 ABdhPJyup8Et55ZeRXMRLPYQiA1aJcz/GzUxRs9JF437aF99vdo7onRzm2gMArxa6CQPpP9LJGdt8cmeFoKsTHx0FBE=
X-Received: by 2002:ac8:7d44:0:b0:2f3:af0b:dec1 with SMTP id
 h4-20020ac87d44000000b002f3af0bdec1mr504774qtb.634.1652372151760; Thu, 12 May
 2022 09:15:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220511074522.28499-1-kai.kang@windriver.com>
 <CAMKF1so30+Ec6+vMCCaKaXy8hrJUeT3pDk=sE2Xa=DPY-VxHFQ@mail.gmail.com>
 <12c05411-f04e-f956-4ca7-051bc4c0a5fe@windriver.com>
In-Reply-To: <12c05411-f04e-f956-4ca7-051bc4c0a5fe@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 12 May 2022 09:15:25 -0700
Message-ID: 
 <CAMKF1spQcoh8NQ8-cd13jNKewtWhMYwZaAT1A53n71Fb2Gv9EQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v2] wxwidgets: enable to use private fonts
To: Kai <kai.kang@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 May 2022 16:15:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97082

On Wed, May 11, 2022 at 11:23 PM Kai <kai.kang@windriver.com> wrote:
>
> On 5/11/22 11:21 PM, Khem Raj wrote:
> > On Wed, May 11, 2022 at 12:45 AM kai <kai.kang@windriver.com> wrote:
> >> From: Kai Kang <kai.kang@windriver.com>
> >>
> >> Enable option wxUSE_PRIVATE_FONTS of wxwidgets if build with gtk. It
> >> allows application to use the font from the given file even if it is
> >> not globally installed on the system.
> >>
> >> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> >> ---
> >> v2:
> >> * use upper case 'ON' to align with others in oe
> >>
> >>   meta-oe/recipes-extended/wxwidgets/wxwidgets_3.1.5.bb | 1 +
> >>   1 file changed, 1 insertion(+)
> >>
> >> diff --git a/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.1.5.bb b/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.1.5.bb
> >> index 6b57cb54c..b9b1dcf0d 100644
> >> --- a/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.1.5.bb
> >> +++ b/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.1.5.bb
> >> @@ -39,6 +39,7 @@ EXTRA_OECMAKE += " \
> >>       -DwxUSE_LIBTIFF=sys \
> >>       -DwxUSE_REGEX=builtin \
> >>       -DwxPLATFORM_LIB_DIR=${@d.getVar('baselib').replace('lib', '')} \
> >> +    ${@bb.utils.contains('PACKAGECONFIG', 'gtk', '-DwxUSE_PRIVATE_FONTS=ON', '', d)} \
> > why not add it to the packageconfig setting itself ?
> It is an useful feature for wxwidgets with gui, so I want it  to be
> enabled by default. And it requires pango to make it work.
>
> I can see gtk3 depends on pango but qtbase doesn't. So only check 'gtk'

I meant to do something like below instead of this patch.

PACKAGECONFIG[gtk] = "-DwxBUILD_TOOLKIT=gtk3 -DwxUSE_GUI=ON
-DwxUSE_PRIVATE_FONTS=ON,,gtk+3,,,no_gui qt"

> here.
>
> Regards,
> Kai
>
> >
> >>   "
> >>   EXTRA_OECMAKE:append:libc-musl = " \
> >>       -DHAVE_LOCALE_T=OFF \
> >> --
> >> 2.17.1
> >>
> >>
> >> -=-=-=-=-=-=-=-=-=-=-=-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#97033): https://lists.openembedded.org/g/openembedded-devel/message/97033
> >> Mute This Topic: https://lists.openembedded.org/mt/91031050/1997914
> >> Group Owner: openembedded-devel+owner@lists.openembedded.org
> >> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> >> -=-=-=-=-=-=-=-=-=-=-=-
> >>
>
> --
> Kai Kang
> Wind River Linux
>

