Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com [209.85.160.194])
 by mx.groups.io with SMTP id smtpd.web11.21574.1585165620083105926
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Mar 2020 12:47:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Kj25unA3;
 spf=pass (domain: gmail.com, ip: 209.85.160.194, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f194.google.com with SMTP id e14so3323690qts.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Mar 2020 12:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ja5ScoqeirFPx7Ht8F7QWk/xx6DnF8TGRcA+l/BspKw=;
        b=Kj25unA3uVnQvecmYJzv0dilqFqIUY8PX5a3QnjTtZu+kI0BXFW7stIi881SMrx/ny
         e/nvk/IxNcfSrb/47EG8g5W88wGbSdKi44xFbBfY+LdTUTYq+nloPYgzwFTS7HBzE1/z
         eQ1Gb3xC8kBlhL1qY281LS6HpL2gL/wmeN3xUc5Wcj3i1bqjqHUKPXCp61k9D+v+Q6Gn
         fu9mUxPfBMOwdJundFNlbfWOHNcbj0pKZ1QfjlRjV70JXc2fILmhCUEY8rvwZF5+Xz34
         WiWqjWulT0AR148UL3hwX9DCoWYThgbd2yBe6NSZoeFE5poUb3RQ6yLZnwCl53K3NpzY
         N+eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ja5ScoqeirFPx7Ht8F7QWk/xx6DnF8TGRcA+l/BspKw=;
        b=AVNUW78XdHBaZ0VH9/cJeoKv7YL20OtJQ7/Md64QNT2w2X9hmhcP0YoQ8C75etR2Pp
         pYqcbxa6kNRcAVPGLB+DMJ1XJr1JDBnCPzWvvQcaeBn94XRQ/zkNayH0G3FRi45s4pws
         BMIomWJ8sddl0HbD4Lerv1QFpY4IouJhbSwQ5EaEOHCl1tnPJi1mIRHgEzCnF5zR5s7G
         hdJcLkkCmZNIUj7mp+p9kF1coVqDGVToLEy+qirTtil8HvLXJoOwEpsQneXGO1a783Vr
         6AjkVLtGw2ZvPRNUz2IJT1SqEOzCBm+1KsIfHnRQSlzpjfw74M2PXoe0M6KHvFMrUkox
         PeYw==
X-Gm-Message-State: ANhLgQ03F4pBzTSE5Hrs7PFuEWLTv+FNCMMlpmm6Qjoz3cT2Ps+pIqPh
	WJY5RVb3uCrUM61jo8sQ6UWgZg/jNBI3Vtra+uU=
X-Google-Smtp-Source: ADFU+vukJHM/dJdotON8KXtEqVIe5cG1Lrkm2pFbn4zS71BDZAkoUldxm7PzbK1lpdUl75T+RSr+ld3tDTWJljd81xg=
X-Received: by 2002:aed:3607:: with SMTP id e7mr4494893qtb.316.1585165618898;
 Wed, 25 Mar 2020 12:46:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200325164838.977493-1-mkelly@xevo.com> <a2bc1b96-73b0-8caf-7d3a-e49c1ddd5436@gmail.com>
 <1f54cb63-78ec-58fa-c430-b70dde91dbea@xevo.com>
In-Reply-To: <1f54cb63-78ec-58fa-c430-b70dde91dbea@xevo.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 25 Mar 2020 12:46:32 -0700
Message-ID: <CAMKF1sp4Drht0XEi9qRB0GH1BmnguvkZZLvbfST3ETciP+2gpg@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH v2] python3-pint: upgrade 0.9 -> 0.11
To: Martin Kelly <mkelly@xevo.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 25, 2020 at 10:11 AM Martin Kelly <mkelly@xevo.com> wrote:
>
> On 3/25/20 9:59 AM, Khem Raj wrote:
> >
> >
> > On 3/25/20 9:48 AM, Martin Kelly wrote:
> >> Also add a dependency on python3-setuptools-scm-native to make this
> >> build with the newer version.
> >>
> >
> > Can you rebase it on master-next please ?
> >
>
> I just did, and it applies cleanly with no changes (applying on top of
> cfa5f5689: "python3-matplotlib: update to version 3.2.1"). Would you
> like me to send an identical v3 anyway?
>
> That aside, I will make sure to base future patches on master-next.
>


Description: [meta-python,v2] python3-pint: upgrade 0.9 -> 0.11
Applying: python3-pint: upgrade 0.9 -> 0.11
error: patch failed: meta-python/recipes-devtools/python/python-pint.inc:9
error: meta-python/recipes-devtools/python/python-pint.inc: patch does not apply
Patch failed at 0001 python3-pint: upgrade 0.9 -> 0.11
hint: Use 'git am --show-current-patch=diff' to see the failed patch
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".
'git am' failed with exit status 128

> >> Signed-off-by: Martin Kelly <mkelly@xevo.com>
> >> ---
> >>   meta-python/recipes-devtools/python/python-pint.inc         | 6 ++++--
> >>   .../python/{python3-pint_0.9.bb => python3-pint_0.11.bb}    | 0
> >>   2 files changed, 4 insertions(+), 2 deletions(-)
> >>   rename meta-python/recipes-devtools/python/{python3-pint_0.9.bb =>
> >> python3-pint_0.11.bb} (100%)
> >>
> >> diff --git a/meta-python/recipes-devtools/python/python-pint.inc
> >> b/meta-python/recipes-devtools/python/python-pint.inc
> >> index 0900d91d7..4a9300900 100644
> >> --- a/meta-python/recipes-devtools/python/python-pint.inc
> >> +++ b/meta-python/recipes-devtools/python/python-pint.inc
> >> @@ -9,7 +9,9 @@ PYPI_PACKAGE := "Pint"
> >>   inherit pypi
> >> -SRC_URI[md5sum] = "d0681cb7cfaca9fc68ce7edab0d08d88"
> >> -SRC_URI[sha256sum] =
> >> "32d8a9a9d63f4f81194c0014b3b742679dce81a26d45127d9810a68a561fe4e2"
> >> +SRC_URI[md5sum] = "3a8f29c2a30efd35af4b5c5a224ef965"
> >> +SRC_URI[sha256sum] =
> >> "308f1070500e102f83b6adfca6db53debfce2ffc5d3cbe3f6c367da359b5cf4d"
> >> +
> >> +DEPENDS += "python3-setuptools-scm-native"
> >>   BBCLASSEXTEND = "native"
> >> diff --git a/meta-python/recipes-devtools/python/python3-pint_0.9.bb
> >> b/meta-python/recipes-devtools/python/python3-pint_0.11.bb
> >> similarity index 100%
> >> rename from meta-python/recipes-devtools/python/python3-pint_0.9.bb
> >> rename to meta-python/recipes-devtools/python/python3-pint_0.11.bb
> >>
> >>
> >>
> >>
> 
