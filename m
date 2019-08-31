Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id 183FC7F4A4
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 31 Aug 2019 02:34:57 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id p13so7871962qkg.13
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Aug 2019 19:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=YIAo+u21Hu/WbcU8MeycU51fcnNfH6A1McvFVNyGlZY=;
	b=h1DtHpmoyFzsSqY9/3OYcMVvRxW4Ll9ig7lv2trWcZFqqOW4XknWewOH9weQkiF8VB
	e/6dcGjq4mwgozwOHHyj3h+AFQpqyz/XiTf87IgDqrfmfJ1v1aSlqPmlkpU+8V/Ck3RF
	+ATQ/XEhZJuR2Ajc7FwwkvjxLcBvGjNY4nnbXfHe/jxiAx667mnEZxdx/q0Awy+U+HUE
	nHXQKImuGB4KAgHqlZq4m7CZZknU/5VKDTduM416mbe8CCuC8evGWBDtXD+SeIJwSouD
	H5C3xRt+JUkIGmUAASnSLR/Jc1UGQpZ525Cc3Fi+z3+cJq+vh1je9mUFdxBetZgMeMlO
	vOLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=YIAo+u21Hu/WbcU8MeycU51fcnNfH6A1McvFVNyGlZY=;
	b=ID2q7EazXtUhSwUnteAINPL0y+vY11gQ3EKU4YtT4VSF4SzC5qjwtl7fYml5OC+AAa
	Ah02HCqGlmrge5wEHJOt3Ute02vXRbxHgwxlkRg8dKT91Jqh5Etn1ORhrQkfI+LVgSHP
	2xQpbGYYPwaHVFZsrq5hmGSwkO1vRdJHtV4Jn4AgvGnIX7pdr56bM280DBXktYKSj3KK
	OWq9QdEHzzTCnxDWTxtNn0ZXaw5pYGxjSFDAcqdOJNMF2tqrJkVwJL1FCdRuLjaHiIe5
	zY2BqaGvj4+JfGIwYHlvJtXiPljxUk1GWsWj9O0fYrmpEVPL7QaKalIqyI9ImjDU1AH8
	WKuw==
X-Gm-Message-State: APjAAAVl8z9rrPvNhobEdF6pps8mHOhfvKnEVc6TvzsuxeLsW3qz4wzK
	0wgMKlUrFcTKERQP3DUwqTRo+bIiNWnnfG6mods=
X-Google-Smtp-Source: APXvYqxuTWU2BvMbrRLMVYGeHedIjQYrGLa5mwE242ecxXn5TTNAqs/ZIjzB3vZkGb3mic7SU8VFZC6YMNI5lBI8CyU=
X-Received: by 2002:a37:ef1a:: with SMTP id j26mr18852680qkk.474.1567218898607;
	Fri, 30 Aug 2019 19:34:58 -0700 (PDT)
MIME-Version: 1.0
References: <1567217664-14728-1-git-send-email-hongxu.jia@windriver.com>
	<CAMKF1spm2M8ZdiFVDFyM2jgrEM_VS2vTsgp7HtfYjDSnxf5dUw@mail.gmail.com>
	<60a533bc-35e0-058c-6a92-9fe9460a4796@windriver.com>
In-Reply-To: <60a533bc-35e0-058c-6a92-9fe9460a4796@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 30 Aug 2019 19:34:32 -0700
Message-ID: <CAMKF1sq4Q6op9fNJSo+p9LtnimG8HNisrPF_F05mSYkFMMwTnQ@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] layer.conf: add lvm2 as libdevmapper preferred rprovider
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
X-List-Received-Date: Sat, 31 Aug 2019 02:34:58 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 30, 2019 at 7:23 PM Hongxu Jia <hongxu.jia@windriver.com> wrote:
>
> On 8/31/19 10:16 AM, Khem Raj wrote:
> > On Fri, Aug 30, 2019 at 7:14 PM Hongxu Jia <hongxu.jia@windriver.com> wrote:
> >> Since commit [libdevmapper/lvm2: force recipe libdevmapper to populate
> >> sysroot only] applied, if recipe DEPENDS on libdevmapper, we have to
> >> add it to packages RDEPENDS to fix [file-rdeps] QA issue
> >>
> >> Set PREFERRED_RPROVIDER_libdevmapper = "lvm2" in layer.conf to explicit
> >> use lvm2 as libdevmapper preferred rprovider
> >>
> >> Remove unnecessary insane skip
> >>
> > thanks I have staged something similar
>
> Sorry for so many revision, but I think we investigated a way to break
>
> circular dependencies when have to, some kind of tricky, but works, I hope

no worries, thanks for staying up with it.

>
> //Hongxu
>
>
> >> Suggested-by : peter.kjellerstedt@axis.com
> >> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> >> ---
> >>   meta-oe/conf/layer.conf                               | 2 ++
> >>   meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.2.0.bb | 2 --
> >>   2 files changed, 2 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
> >> index 896a5d6..e48fabd 100644
> >> --- a/meta-oe/conf/layer.conf
> >> +++ b/meta-oe/conf/layer.conf
> >> @@ -33,6 +33,8 @@ LAYERSERIES_COMPAT_openembedded-layer = "thud warrior"
> >>
> >>   LICENSE_PATH += "${LAYERDIR}/licenses"
> >>
> >> +PREFERRED_RPROVIDER_libdevmapper = "lvm2"
> >> +
> >>   SIGGEN_EXCLUDERECIPES_ABISAFE += " \
> >>     mplayer-common \
> >>     fbset-modes \
> >> diff --git a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.2.0.bb b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.2.0.bb
> >> index 194842e..0773671 100644
> >> --- a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.2.0.bb
> >> +++ b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.2.0.bb
> >> @@ -89,6 +89,4 @@ EXTRA_OECONF += "--disable-libargon2"
> >>
> >>   FILES_${PN} += "${@bb.utils.contains('DISTRO_FEATURES','systemd','${exec_prefix}/lib/tmpfiles.d/cryptsetup.conf', '', d)}"
> >>
> >> -INSANE_SKIP_${PN} += "build-deps file-rdeps"
> >> -
> >>   BBCLASSEXTEND = "native nativesdk"
> >> --
> >> 2.7.4
> >>
>

