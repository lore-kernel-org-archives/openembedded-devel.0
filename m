Return-Path: <martin.jansa@gmail.com>
Received: from mail-wj0-f178.google.com (mail-wj0-f178.google.com
	[209.85.210.178])
	by mail.openembedded.org (Postfix) with ESMTP id 80EB177225
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Dec 2016 15:59:30 +0000 (UTC)
Received: by mail-wj0-f178.google.com with SMTP id v7so256030959wjy.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Dec 2016 07:59:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=82PSA+dFBfbYGXTOm6DutOKMmBexlCwWFYgJ99gdKr8=;
	b=jPFhSW0KVRf3E/I0ZDHX1AzlFCEjSy+QW1kGrWjFMeA2kOuzuOQ83cVI9VfXl3UJ+l
	JETeaFHtSAajLE1jy4p4bbVJO7p4e7Qokk7VaMHhNVq/XxuVTxE5VzWGtbRqP8CgzTrc
	vBUn22TCAX5hwtVFMa5VxYXhfjKo1HrKp1GNuWUato4s2mWIL28Juj+ujnQdQViobpiG
	+LgY2kE5WQerN0YA2RmeFn27Nplx/9dOjdzkjkvz5xgcrvzoZxNk8q5Uh1kJYu/ctOgX
	QuuCjB5RlBqbF7dsu+UFZN6771iTkC/aUe2AzcsCL/GYrOnr1JwgjfCz8XqrJEH+ERfr
	VMVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=82PSA+dFBfbYGXTOm6DutOKMmBexlCwWFYgJ99gdKr8=;
	b=Cayl8UAKMYPvRhaGlTYR/xGvTuOA7bb/VSuMTgMMT+cmKNB00RVylKMI1UJaZ95xh6
	XkJ25k9e/PgT5DsJZZAwFCWwTe5PYOUt5w4raLHcRo6uTv8QYKLj2B/byKec9ZK3JLcg
	yrLvHpO6rW0si+phd68AkB9Bwjdgt4+F2KN7AcvaOU7OnjFupaL/XQy2jTX+Y99k0377
	MWiZ2imsS5wLNWVLYeHvYaMOyBWRzZOkk8RwyyA3ZQgwdhIy8hfO8Kw3PhS6XlBUbkob
	F6P/4Wn+2kKEzkWKZjZ6QGZMFV9cFxov9tV879jqS6DHvAsDRXyvju4YAtihi+ivlPF6
	xRBg==
X-Gm-Message-State: AIkVDXILXSmj7Ps+y0ipP4H/jZHP+wvpJupFJxEZ1sHv20YPrFwv6SK51WtkdhehzH4LGDHXvuESLfAQ6P352w==
X-Received: by 10.194.141.239 with SMTP id rr15mr13572098wjb.144.1482508771425;
	Fri, 23 Dec 2016 07:59:31 -0800 (PST)
MIME-Version: 1.0
Received: by 10.80.148.174 with HTTP; Fri, 23 Dec 2016 07:59:31 -0800 (PST)
In-Reply-To: <CAPuovELANjs1goqXCb3RBSKLcwV3PLT+KqokjDxRGdXnEFp=kg@mail.gmail.com>
References: <1482357220-422-1-git-send-email-mark.asselstine@windriver.com>
	<CABcZANmtther94ZrkEwVn=JYgvLkT2CdTkCLSJPDo7gEHFdaCA@mail.gmail.com>
	<be954776-5d12-dbfb-c782-3f58f1d13361@windriver.com>
	<CAPuovELANjs1goqXCb3RBSKLcwV3PLT+KqokjDxRGdXnEFp=kg@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 23 Dec 2016 16:59:31 +0100
Message-ID: <CA+chaQeJ_YTOc3xjSKr=_yoafO-=U2mAxQnxRrd02hjT6YhH2w@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "paul.eggleton@linux.intel.com" <paul.eggleton@linux.intel.com>
Subject: Re: [meta-webserver][PATCH] apache2: the download has been moved to the 'archives'
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
X-List-Received-Date: Fri, 23 Dec 2016 15:59:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Your original change was already supersedded by the upgrade sent by someone
else.

On Fri, Dec 23, 2016 at 4:56 PM, M. Asselstine <asselsm@mcmaster.ca> wrote:

> On Fri, Dec 23, 2016 at 10:51 AM, Mark Hatle <mark.hatle@windriver.com>
> wrote:
> > On 12/21/16 4:26 PM, Christopher Larson wrote:
> >> On Wed, Dec 21, 2016 at 2:53 PM, Mark Asselstine <
> >> mark.asselstine@windriver.com> wrote:
> >>
> >>> This release of apache2 is no longer found in the main downloads area
> >>> but has been moved to the 'archives'. We should uprev apache2 but for
> >>> now this will at least get the builds working again.
> >>>
> >>> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> >>>
> >>
> >> Wouldn=E2=80=99t it make sense to do a recipe-local addition to MIRROR=
S to
> >> automatically fall back to the apache archive?
> >>
> >
> > That seems wrong to me.  The recipe should point to the proper upstream
> location
> > for the archive.  If the archive moves, then the recipe should be
> updated to match.
> >
> > I know you can easily do local workarounds for mirrors and such, but I
> wouldn't
> > consider putting them into a recipe directly as a good approach as it
> will hide
> > problems from people and make it unclear where the official download
> location is.
> >
> > --Mark
>
> Agreed. I also think that the concept is a bad one as if our apache2
> recipe is so far behind that the upstream has moved it to archived
> that things should break just to give us a kick in the pants to get on
> top of things and complete and uprev. So rather than mess around to
> paper this over I hope my original change can be merged to allow
> builds to complete and I will look to getting a review out for an
> uprev after the holidays.
>
> MarkA
>
>
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

