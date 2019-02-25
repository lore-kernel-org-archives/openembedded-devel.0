Return-Path: <schnitzeltony@gmail.com>
Received: from mail-it1-f195.google.com (mail-it1-f195.google.com
	[209.85.166.195])
	by mail.openembedded.org (Postfix) with ESMTP id 6EBE37C899
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Feb 2019 22:08:19 +0000 (UTC)
Received: by mail-it1-f195.google.com with SMTP id e24so942463itl.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Feb 2019 14:08:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=uCpz1ESOlE/UGXvtBV+ubjip1TJUQVcM/3KLuPzVyLo=;
	b=Vlm6DAWJ69boJSRY4ExEdUKulvDT4cd9//LXemsKB3Lhsi/8PRNiNQb8uHWKw7P5yn
	XmTrTfrHCfzVH26Nj78OzZ6fxdfOl+1p3o1CkH0fZejWcZYqFMMN2BSw8cfl9SOFG8TY
	mz76X0QNaZCNnPtT2222EZ2+F3ETr5fuz17Qejxyf1W/zLKvuLCkqGfQYTVjcdPfAlFa
	NnHnFwIJlJ1KobGmq4KkDVrqlad3t7Z5mueQ6GJd5gIpKwOlmlcyVBnH3+znjIF3l6G3
	PiEW6sLgvhqLXZ3OWJqjUyEedwuyxPVmzp+ftl8GXS9+0Uih9IEBhOjmoVTuTKP+mUzP
	jeKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=uCpz1ESOlE/UGXvtBV+ubjip1TJUQVcM/3KLuPzVyLo=;
	b=jqE6xoroq6mNFpyuUYK29jE7mW5ModZNJbD/lkzVbzbj9mbCfoSYLJYLKiFr9YDLkK
	Csm1ieZURvFtPqTeyoM/cHR1Gt+nVSCLa3V4IzC8lXaFoVcgzmIgWNNcrMWcFzssCMbO
	6cXx/MYZHPEvd8r138fXJhLfGuu5wWd/xdSOzKcXV2YNcTnl/IH29D9++FL4G7TyHA0h
	SEAWzl1ZWOXMJOgG1ZjCTwvXqTSVPgU+K5H7wqGMACzwkPSXy1yo/+h63FEiAtVBFOX2
	IFYnE8fvaSXqQyBpTDf/uN7MB+QEuLWR4JwSfpISzS6kN7y9uthK6HiYFWFSifjwPJGN
	xmNA==
X-Gm-Message-State: AHQUAuaLhD4+zVrra6xKg1WI90q77EP1ghG+odrM7NtBAT38JpFLmxLt
	Uo9Cz8i/LyX9GwyZ6cQTPTZjKiH3+6zwZComATc=
X-Google-Smtp-Source: AHgI3IbDPk4E+BPpO3M1y4CDWwvP5nYRG1wEsso4BVWWRwp1S1PqesSoUQAP21S1O7+YwWKmXNBij2DbeQpc0Caoki8=
X-Received: by 2002:a02:6a0b:: with SMTP id l11mr9434589jac.138.1551132500492; 
	Mon, 25 Feb 2019 14:08:20 -0800 (PST)
MIME-Version: 1.0
References: <20190225172823.4030-1-michael.davis@essvote.com>
	<CALbNGRTxkytzRsu4MaB4vy=0k8gEDWytqsaq-6YydBPDhBik6A@mail.gmail.com>
	<655290B7709079438B7932553958E60DA1633629@ESS-EX01.essvote.corp.local>
In-Reply-To: <655290B7709079438B7932553958E60DA1633629@ESS-EX01.essvote.corp.local>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Mon, 25 Feb 2019 23:08:07 +0100
Message-ID: <CALbNGRRj_0S72ehe0G10kd+UEnkxyDSotQRBTMGAOEHcg3OHdw@mail.gmail.com>
To: "Davis, Michael" <michael.davis@essvote.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] plymouth: Update to version 0.9.4
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
X-List-Received-Date: Mon, 25 Feb 2019 22:08:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 25, 2019 at 9:07 PM Davis, Michael
<michael.davis@essvote.com> wrote:
>
> I have it running right now on i686 and x86_64.  I don=E2=80=99t have a n=
ew enough kernel to test the new rotation functions that were added, but my=
 custom theme loads up and works the same as 0.9.2.  Happens to be built ag=
ainst Thud not master, but I don't know if that would make a difference.
>
> Mike
Thanks for feedback.

Andreas

