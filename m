Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2714FC47077
	for <webhook@archiver.kernel.org>; Thu, 11 Jan 2024 20:08:37 +0000 (UTC)
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
 by mx.groups.io with SMTP id smtpd.web10.2634.1705003712959161441
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Jan 2024 12:08:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=F0jFG9k9;
 spf=pass (domain: gmail.com, ip: 209.85.160.41, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-20440084f25so1845626fac.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 11 Jan 2024 12:08:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705003712; x=1705608512; darn=lists.openembedded.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y2dlzBbtAAXC1VL10NSyYx+ZwDnf68lV1LsPprvn9X0=;
        b=F0jFG9k9TECYGESAT+PF5ZC9aeXJ0iRXh1CEdY0I9QynSRgC2TmnYtm8CtnAYGLUIy
         +KNf3dP6DZqzpdpjR/bODC3AtPdVgEwRD4IN5saHoL0jn61IUAm7sRI/unVdjxpMYUnX
         xRlxmwqcK1vPyoVNgWpGp0lafhqsF1k6nWN05OD+6f2c7xjmqm/PY5loW1sYcg567i4v
         +C55RZVQNkXocsUpLuPIhtlHZYyTofov28EXguWOJ2/HvMzKLFlQEOxtPB7QXOzHpqzc
         784SVDDYorb5c/uSoor294A59OZLgFsKXIE7cHCZ8bPeuD2G7+nQ9XNPBbSO6N0TbTd5
         awBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705003712; x=1705608512;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y2dlzBbtAAXC1VL10NSyYx+ZwDnf68lV1LsPprvn9X0=;
        b=CjM2YsOwjRPGR3BzSdlIxOyRRin6neZY35GhQv02TnIJ+PtioIWwkY/xU+YU2jlI03
         WJy8qakbOQlfKBMDmry0SDF1AP++w00wyRzwwNO+IYHL8KGMAirCJVKwdLuCCMVkatb1
         SpKPLeeY9pMjCJD5xImqZccSLxag0UQzO8Bo1aF+jum25druVU9JYiAtC4VNRn6Bq+q7
         OF7kdP/GBeGZroWfGx2zkOmbrGfzozXdi6GPQ7mVDPczKV3yXg9pe/1dKaNElhBfklHM
         hJn3AdYY8RcuXOAbNCTUyA7J+fvM0smZbP0YWOt8xADUlSc+zJrfs2vs2NgmyQm1IKs7
         vwFQ==
X-Gm-Message-State: AOJu0YztfqAdw4HP9sdenbEnLB/F35QZXecfg5B79AeizwzuoBxlwtiJ
	jrN8pwdRdSXLY56gNwXVvuWpS3WYtmUUZNTREe/QKKrykGiWpQ==
X-Google-Smtp-Source: AGHT+IH+vFdWIP8nGc3qeZ3fKV/nmsA1e4vkoV5txa+Y+17VodpwM1YfQaEHt3SYszkfV0nUVNbAQAsDCYPVacU5O4A=
X-Received: by 2002:a05:6870:9607:b0:1fb:706b:5164 with SMTP id
 d7-20020a056870960700b001fb706b5164mr269335oaq.90.1705003711980; Thu, 11 Jan
 2024 12:08:31 -0800 (PST)
MIME-Version: 1.0
References: <20231220204125.28017-1-alex.kiernan@gmail.com> <170366529007.1947762.2816571771491423966.b4-ty@gmail.com>
In-Reply-To: <170366529007.1947762.2816571771491423966.b4-ty@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 11 Jan 2024 12:08:06 -0800
Message-ID: <CAMKF1sr4zL612z=FTZrb=m66ccZGD0mBnSFmsV8wiSwk95=T+Q@mail.gmail.com>
Subject: Re: [meta-oe][PATCH] thin-provisioning-tools: Upgrade 1.0.4 -> 1.0.9
To: openembedded-devel@lists.openembedded.org, 
	Alex Kiernan <alex.kiernan@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 11 Jan 2024 20:08:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108227

This fails in do_patch with musl. see
https://errors.yoctoproject.org/Errors/Details/749637/

On Wed, Dec 27, 2023 at 12:21=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrot=
e:
>
>
> On Wed, 20 Dec 2023 20:41:25 +0000, Alex Kiernan wrote:
> >
>
>
> Applied, thanks!
>
> [1/1] thin-provisioning-tools: Upgrade 1.0.4 -> 1.0.9
>       commit: b7d5acb3523c95054a0431a5291866d7b5bde5a2
>
> Best regards,
> --
> Khem Raj <raj.khem@gmail.com>
>

