Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id C001377221
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Dec 2016 15:58:00 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id u144so53559565wmu.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Dec 2016 07:58:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Aoq7fG2xUkfO21L9pwJaeBYxmciA7Y6iFP044J5W+vk=;
	b=WBOTPYimibklYElJqRNikUCNvZIgWeG+F2+EDXs66IXtUfJSK4yvLaVY6w+DtkGUgJ
	U6Vbt7YSGiqKl9vKLqwPufW6/IFoCgU5saVlHUZad+vsNoC1XP4M9y/WkIrU1BGND0JT
	Za5pMMIdU++ZSJGT2DH2hb+82vvuS8IT2foF1mBjFxC7zM0gMZOBGzTjwrFz7Q13lceY
	JeJ7q6lBYCIGrN0gK3uK69FReBDPxNwCZrCkOdLjsmOZdgKEJqz1GmrNV818ksFh8a6M
	J6R/TRSK3RAjy8IMj60B5UP64OgJ4cTy4KZ68YpDdUn/Jd0l+qlAqXmjWf6mEuod/0rA
	S5dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Aoq7fG2xUkfO21L9pwJaeBYxmciA7Y6iFP044J5W+vk=;
	b=XgMftOWkToRRHj96jE50SGbBKkhXGud3yUgaCWiJPfdIORy4SrdmaKPk3E+oMq2t+i
	rwgTPcxWCO0uRPwGFi6nFnEf9ka+gdY1J4wCQY1cQX851QCcJcRej4kzr03eC2TnZfrY
	BjwsV+e15pPH5iJUWiOFSlMIUkjISALo5grV7kURCgIgu3JFTlDZbmbIqORakDCIEHsf
	oMBy57t7soQftVZ0poBxXMqbdQYKDgyVp3JmZ4FdPFWYK6SSXjHP3AR7sVt96VJm3go2
	WPmAJsy2YhQlQy7agsnA6yj0y4GBxth4orpdHcU8OMytctVfTTW8IlEzrcWkfji8zSSt
	oN9w==
X-Gm-Message-State: AIkVDXJNQahOU6DXC9irJUieI0c7CQhbkWwt4zTz+ZLU15imOcLnO+HnpI0OnSTZYzpfRHo+XWSNkAqMeIMcWw==
X-Received: by 10.28.18.194 with SMTP id 185mr15755390wms.124.1482508681367;
	Fri, 23 Dec 2016 07:58:01 -0800 (PST)
MIME-Version: 1.0
Received: by 10.80.148.174 with HTTP; Fri, 23 Dec 2016 07:58:00 -0800 (PST)
In-Reply-To: <be954776-5d12-dbfb-c782-3f58f1d13361@windriver.com>
References: <1482357220-422-1-git-send-email-mark.asselstine@windriver.com>
	<CABcZANmtther94ZrkEwVn=JYgvLkT2CdTkCLSJPDo7gEHFdaCA@mail.gmail.com>
	<be954776-5d12-dbfb-c782-3f58f1d13361@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 23 Dec 2016 16:58:00 +0100
Message-ID: <CA+chaQdHG3Vp6=2DPAWY1GVRcWHL9FwJWnxRJ_64camEmAyhag@mail.gmail.com>
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
X-List-Received-Date: Fri, 23 Dec 2016 15:58:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

In this case (and all where the source is moved to archive subdirectory or
site as soon as there is newer release available) I think it's OK,
especially when it's local for just the recipe.

Otherwise the "proper upstream location" can disappear at any time, like
just after we release the metadata - and nobody will go back to morty,
krogoth, jethro, dizzy to check how many apache2 archives were affected to
fix all the SRC_URIs in recipes.



On Fri, Dec 23, 2016 at 4:51 PM, Mark Hatle <mark.hatle@windriver.com>
wrote:

> On 12/21/16 4:26 PM, Christopher Larson wrote:
> > On Wed, Dec 21, 2016 at 2:53 PM, Mark Asselstine <
> > mark.asselstine@windriver.com> wrote:
> >
> >> This release of apache2 is no longer found in the main downloads area
> >> but has been moved to the 'archives'. We should uprev apache2 but for
> >> now this will at least get the builds working again.
> >>
> >> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> >>
> >
> > Wouldn=E2=80=99t it make sense to do a recipe-local addition to MIRRORS=
 to
> > automatically fall back to the apache archive?
> >
>
> That seems wrong to me.  The recipe should point to the proper upstream
> location
> for the archive.  If the archive moves, then the recipe should be updated
> to match.
>
> I know you can easily do local workarounds for mirrors and such, but I
> wouldn't
> consider putting them into a recipe directly as a good approach as it wil=
l
> hide
> problems from people and make it unclear where the official download
> location is.
>
> --Mark
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

