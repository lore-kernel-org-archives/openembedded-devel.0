Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D15F5C35FFC
	for <webhook@archiver.kernel.org>; Tue, 25 Mar 2025 03:55:47 +0000 (UTC)
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
 by mx.groups.io with SMTP id smtpd.web10.58438.1742874942810640762
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Mar 2025 20:55:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YPInyG6R;
 spf=pass (domain: gmail.com, ip: 209.85.210.51, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-727388e8f6cso3217163a34.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 24 Mar 2025 20:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742874942; x=1743479742; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DdycqC4jdaDrdpIv53NwEmmQbAnLhDU5SwtBTpomt3k=;
        b=YPInyG6RZqXCiEFNCBaxBTnmI7SQhSIJ16diaaUxTpF1zkcwn/XaYWEGivOUqhC2VJ
         gW91313bo2LOqCjheihgvWasiMkHAb+fcbPw6qRH+5iBCbb1sary7tNjM7DvuSZYuCJe
         CNkjVc91lKl+EhtOJ9GMhkaNLO5R/JAaf53uTM/3DzZbL8w/Z8i8+fctj/e9qv1IY+FT
         XWloCikKL7VffVbjYzvyzTbX8T4gtSvWojVmYyPxhHcf32xWZnwZKU+6Ufx/kotPDzk3
         8KFVDjWl+ALZ8LkLgwJe+6MSMRVmNbre4si6B4nHFgZUoyErI28XisO7PHbyE0D/4NKM
         QFkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742874942; x=1743479742;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DdycqC4jdaDrdpIv53NwEmmQbAnLhDU5SwtBTpomt3k=;
        b=URTh6jdeYMHjsTUxrfznoC9oDdB7fMM697KhuJQTtemYCmgZpX5LIV3HiuxWnw9KzE
         L4IAOYObX//jgHpp5m5oZD0xnzyN8iUjtVaoJrd88EACTDwXV/0YQSlkl219MpRrvKRR
         sNWp6bbJJNrgYRBr8CJQJKX1alsyDyyUv/PlitBokNoWC6+s7jxiHxVU//l6SvQ6k6sE
         99a80EKpmBujHL3YkpMrBRHmT4F/Ccqdtf9ZYxGkWvEpK5CO9sJgRblDBF/s2QzFFc3A
         VdztIREEfSfU6rgtG4nBo1/6ciWRSPUwsUmKfFNeTpAhn/i8kLTW9ts/+TgxQG2ukMMy
         S/qQ==
X-Gm-Message-State: AOJu0YwoIFhC1ILZLNIza740Gl2S4VVybJ0ihtcKciOHwIQgGeGsY7/I
	fqhSGv5IpHTWxYvbNI6zVnSsvqYfEKSZ2niHlInKBvSXJyI9IZAUXHfC8kXEog5t/clm3iJ42Ql
	zZl8n8wjC6QKIdYCsCyrQaYMdBto=
X-Gm-Gg: ASbGncsSMMggDAWGnVi5JIUW5pWtPdXVIXuvaCabkrSs3YZpMdBYjTpR1Qjx+f363P0
	x5I5BAY+/1xjm/MINcR2zYKyacWHR67SuEnJZoBqp4F54rV1kNw7imJzSaK6kynTQlxmIYHVLBv
	n7JlTShvnGqxItdCP3aZ7ZAZeP
X-Google-Smtp-Source: AGHT+IEu1pfMzHvuLTiWPSiYw+VJjurrRTSplz2voT2b4evZH0kxLPFyzo8g2Lmufbb/a38qMCag6uboCay2qTR2CBg=
X-Received: by 2002:a05:6830:6e97:b0:72b:8326:f0c7 with SMTP id
 46e09a7af769-72c0af1b614mr10866206a34.28.1742874941974; Mon, 24 Mar 2025
 20:55:41 -0700 (PDT)
MIME-Version: 1.0
References: <20250324140353.2905738-1-f_l_k@t-online.de> <CAMKF1soDa_09QUOabb266UOLud+q9xocpTAasDKdzjEWLFKNfg@mail.gmail.com>
 <2TUNTS.P902VCBXV8FL2@googlemail.com>
In-Reply-To: <2TUNTS.P902VCBXV8FL2@googlemail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 24 Mar 2025 20:55:15 -0700
X-Gm-Features: AQ5f1JrP443r_f5xEMSG0--unK6aVdLjB_mcMIOkSYNYEClBeSXrnQAsDkRc_cM
Message-ID: <CAMKF1socK+VMbMyhZ3qgVCXiAAE6Gwo39=MrywdLjGFqX19xhw@mail.gmail.com>
Subject: Re: [oe] [meta-multimedia][PATCH] pipewire: update 1.4.0 -> 1.4.1
To: Markus Volk <mrksvolk@googlemail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 03:55:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116218

On Mon, Mar 24, 2025 at 8:52=E2=80=AFPM Markus Volk <mrksvolk@googlemail.co=
m> wrote:
>
> On Mon, Mar 24 2025 at 19:06:00 -07:00:00, Khem Raj <raj.khem@gmail.com> =
wrote:
>
> This commit is not on master branch but on 1.4 branch, so please update t=
he branch=3D value to 1.4 as well.
>
>
> Sorry, I forgot to refresh the patch before sending

no worries, its just that round trip is long since CI here takes
forever. I have sent another version of patch to update the branch
from PV
what do you think?

