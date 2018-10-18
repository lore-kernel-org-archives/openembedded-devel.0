Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id 05CD579BC2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Oct 2018 01:55:44 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id d14-v6so32524324qto.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Oct 2018 18:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=NyYnO9S86/hoAyyCz7+iBhEkHO4npQM2Hh89tmjI9u0=;
	b=d2nJzY5VlDMljK2+k/AndhRaD/yZUewIWyB3OgqfoWfvQWEa/J/KDpwgu7imfdPSj3
	OjGIXiviZx6WOj7nHk5c5v5wzkRIFxXSCifhyUF9FuMd5zeB2sOOdG56HebfWPQrX8z9
	McDALo+UFOnlqpekQgsU0XjCWNJz5ns4lY28ck9bxxJ/ulV2MLvu5Fdw6tp5xokrNH4X
	tgOw0Me0NW7vE4syIU2biy4V8FFVZX+d/GnQHJe1qZ6mxEwj2TKTSUSp5ukXjKNPJbLF
	O+Sbh7Qu8cJw/KONtheVifdLuXz+WXDyeJHMM/rrNTv1PtMmqJoKnmCjnAnNRb43E1rZ
	42UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=NyYnO9S86/hoAyyCz7+iBhEkHO4npQM2Hh89tmjI9u0=;
	b=puk0uzuu9kQzHImPwWXwebDWbsas9OTTdOM5l6e8OQ18L4xTuBTyO5pTatwslUtiMd
	5iPaJU/JoELhSAI2RglEhDO1n9/ZWg/AWY4mjUHh2BP9y2+eO7MfaPsijHJJmhdUfzNr
	S8wGF7RY9iZpnNwkhp5bYS9ZORI8jNeADpL5FN3Xd4YeAhILLX5SF8A0uv/uQ/6rHoGW
	6i5U3erStyanSzkEI/Zn8/I1hRYYknnsI3pQCepM5w1d9U39MFar/YLJirmljiIxRsEr
	h4nCXnXdMBRX+enFQB7217UHAfjQX59fjmSahpibC9ajvuwAqme7bP34fCYAG4q4xJEX
	YVbw==
X-Gm-Message-State: ABuFfojoHu7ATEeNcVhoNIMooO3mXKJIggMySzXVeWaIWFKMO4f6t/6e
	LQZLk0oPkhOJwdDcBm8Vn1CaWjZJlUU00qj0GhA=
X-Google-Smtp-Source: ACcGV63WdM6o9W0FoFORW3u+FYapdU1DvwJE05vD3wlq9sQaTgHSO/CrIhqJzl7CrdrJuUx3rkbKJQBkVi0oPXkjnfI=
X-Received: by 2002:a0c:8b4d:: with SMTP id d13mr24762372qvc.194.1539827745744;
	Wed, 17 Oct 2018 18:55:45 -0700 (PDT)
MIME-Version: 1.0
References: <20181009045520.32013-1-douglas.royds@taitradio.com>
	<7c69b683-e925-c5a7-d190-0eb0e240dd47@taitradio.com>
In-Reply-To: <7c69b683-e925-c5a7-d190-0eb0e240dd47@taitradio.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 17 Oct 2018 18:55:19 -0700
Message-ID: <CAMKF1srrnBJcYt=29nyciFB_b4c+qOL_atQ8okfesUD8ypPk1g@mail.gmail.com>
To: Douglas Royds <douglas.royds@taitradio.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] openldap: Reproducibility: Remove user, hostname, pwd from version string
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
X-List-Received-Date: Thu, 18 Oct 2018 01:55:45 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 17, 2018 at 6:08 PM Douglas Royds
<douglas.royds@taitradio.com> wrote:
>
> This patch is already on meta-openembedded master:
>
>     http://git.openembedded.org/meta-openembedded/commit/?id=ed5c1c19963546f09201747b11b94b71729b0bcd
>
> For the record, I have just submitted it upstream:
>
>     http://www.openldap.org/its/index.cgi/Incoming?id=8928
>
> Should I submit a new patch, changing the upstream-status to "Submitted"?

you can, also add a appropriate link to mailing list post that lists
the submission

>
>
> On 9/10/18 5:55 PM, Douglas Royds wrote:
>
> > Upstream-Status: Pending
> > Signed-off-by: Douglas Royds <douglas.royds@taitradio.com>
> > ---
> > ...
> >
> > diff --git a/meta-oe/recipes-support/openldap/openldap/remove-user-host-pwd-from-version.patch b/meta-oe/recipes-support/openldap/openldap/remove-user-host-pwd-from-version.patch
> > ...
> > +-WHOWHERE="$USER@`uname -n`:`pwd`"
> > ++WHOWHERE="${SOURCE_DATE_EPOCH:-$USER@`uname -n`:`pwd`}"
>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

