Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 531CDC4707C
	for <webhook@archiver.kernel.org>; Fri, 12 Jan 2024 19:23:45 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web10.1056.1705087416869631232
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Jan 2024 11:23:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hg/HR7vq;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: festevam@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-28c05f68d1cso1127332a91.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 12 Jan 2024 11:23:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705087416; x=1705692216; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z/I+CgRCUmrEfz6sVo562CfdiwBaH7mTdPhLbMP5gcs=;
        b=hg/HR7vqGFyFnIIcvzxIvkevenN2kiWLkMw7GQKJYBRnGToTO/cMvPcr9pRRGnTpIH
         RSgcypt7zB2+TKCLl7DagKa1caLcb7C2kYQi8WB3rB5QGi5+sPVY+3skHxV/amvVudu4
         Q+a+otAR0pMW9SpD62opaZoTjh/P6L/GxxLztMRzHO5aD7zTCVe0ZiL6rhMBr+8THbK8
         0V4DuG1gNMr1ssR6HWp4/nci6RYFtxNekLVPY0WXl7ddJNW72hTGEEN4mscfleZhG3cY
         n/AewccaSgqnE3LS266HdswAG3cMWDUhIycpyds+MjvNjTT8cTaYUR0L1QFXUm377zyl
         /G2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705087416; x=1705692216;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z/I+CgRCUmrEfz6sVo562CfdiwBaH7mTdPhLbMP5gcs=;
        b=T3bbKxWe2IiJZycKqPLgBvijP8HfevDKwXjrE/0HbjeKCSwVYIqkIFiXkeDsg+D/e5
         K87aDIPwdK6TmownwWUYp/BELkCsYIxyIfgeaLdhq3ssH1hlfJDorjwLMkv79vDDUA7e
         q+RznGsjOZVKFYZewJr20k2kWY0L4tO1edSVWIrH1QihoLhj00D62NQqmBjDF5nDR4nM
         r0vF+DkXXgj8DYX4cUnHblnivoStyK6Wb6+359EaGcpfVatuDSyTyGEJ/y7fbLMjX5Pj
         xf85Hg9tJEL3D1ZTAzANdcYsTTJPZrExeZPLKOenKgp4gF5vQOevNFC0mHl0Y4UNL9dN
         AIlg==
X-Gm-Message-State: AOJu0Yy/MtCpIAcMkA4/SHL01RQJB1xjtLcLn0lsRp+ycTSEhUtVf2p/
	AQjvh9EgTB+dRqA0GiLJLsoDJFoZi5/n/6FQZyA=
X-Google-Smtp-Source: AGHT+IHaPCDp99J+MRxxzFqatHC500JuFsXddVZCp8eGoH+AVXXmrG3utgdKBuwYOUlPnJ4WcSkBnUOnu7mDxQC9dMc=
X-Received: by 2002:a17:90b:1b0b:b0:28d:2e64:88ae with SMTP id
 nu11-20020a17090b1b0b00b0028d2e6488aemr2749791pjb.2.1705087416289; Fri, 12
 Jan 2024 11:23:36 -0800 (PST)
MIME-Version: 1.0
References: <20240112191944.3025922-1-derek@asterius.io>
In-Reply-To: <20240112191944.3025922-1-derek@asterius.io>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 12 Jan 2024 16:23:24 -0300
Message-ID: <CAOMZO5BfN63x0Hf8M6Sdgnms2=zgfexX0-8AqOAcDDi2D8AinA@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python-4.8.2: update to version 4.8.2
To: Derek Straka <derek@asterius.io>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 12 Jan 2024 19:23:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108252

On Fri, Jan 12, 2024 at 4:19=E2=80=AFPM Derek Straka <derek@asterius.io> wr=
ote:
>
> Signed-off-by: Derek Straka <derek@asterius.io>

Maybe change the Subject to:

python3-engineio: update to version 4.8.2

