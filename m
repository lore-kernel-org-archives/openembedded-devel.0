Return-Path: <nick83ola@gmail.com>
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
	[209.85.167.67])
	by mail.openembedded.org (Postfix) with ESMTP id 9BBDE7F7A1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Nov 2019 16:29:37 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id j14so8470242lfk.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Nov 2019 08:29:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=brkGbgqWGvA9bvH6Y94VY+Mj7rT2JWqbdisSFm3l2BM=;
	b=o1K4OipE/3A0pzsLJBlppfwcNs2S94w8goh2LQoick6cvVSKnxAe0q7ywMFICsWIwB
	LRd4wBVkvfK3DpOh64JQG9sB9IZji11M+NZDiko4dN0IKvcoIwD7VrcWzit6aTamZjIq
	hXlFFyTkuyCJeaM+ijEkdYdTvrpoGQ1g9YtKBw4NLntR1YK4Vt+muK2TIFHCJyIYp7MA
	w/afh3YR2Lo0Re0HVUGT7Ew6/zo+xcI+tYZdErShp8haFdwbPfp3Z2muzSuubtyUtuYp
	KPU/YX4vRq/HqswKXelt2vaMABcKLHPsyIi1moeXlNCgmiuLoq/QOZj7w0duisravAm1
	23jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=brkGbgqWGvA9bvH6Y94VY+Mj7rT2JWqbdisSFm3l2BM=;
	b=claI/Nkmblb/ig8yYGqK1qbWuJqbkWpJQ/0b7eC6ivtGp/0A2kxUHMiAIFQYb4LJ0U
	0xU3J2Uj+oE4OkATz6P0sEAMxZ1OY+Mu+TK2uBuuDXfion51YZgl/jhqYAr9ft4QrYCs
	3kQsGimupHCCIDR+jvDC8FGXuHJJLm2GqPba3hb/ghW4P1aUQtKw+W/pPX+doOhAZkch
	qGT6U8dtkuIoVWgnRSxEzNahSfb7SwQpayEX9nN+8JTlkymg+X/3Pbvrx427JymqqXLV
	GLT6ASVgkZyhdlaeWkRAxHVC0Obz94z0L/dFITpKMweE1eEutozp65bpM5kKKJsK/VHO
	5cbw==
X-Gm-Message-State: APjAAAWOtDsU+R5ZxTHavwDsNJLUSb/lbjSnIqcvBiHbjU2KUF5K6YdG
	UcnGdYlCpdPKpGRRp6KgR8t8zbrdohPi7Yt1edQ=
X-Google-Smtp-Source: APXvYqynHvQrtwwteErS6zC7MoW9dkw5aFenJKYZYTOcQpj6jbU3z/hY+ZpZ1FQjyXj1KXJ+/jUp3o94v5icHlLirtQ=
X-Received: by 2002:ac2:4469:: with SMTP id y9mr12071894lfl.33.1573835378083; 
	Fri, 15 Nov 2019 08:29:38 -0800 (PST)
MIME-Version: 1.0
References: <20191114142641.17385-1-nick83ola@gmail.com>
	<CAMKF1spCmkONVx3TRKEU9hKXjbkN7w51K0T69h67OWuHRPLhSQ@mail.gmail.com>
In-Reply-To: <CAMKF1spCmkONVx3TRKEU9hKXjbkN7w51K0T69h67OWuHRPLhSQ@mail.gmail.com>
From: nick83ola <nick83ola@gmail.com>
Date: Fri, 15 Nov 2019 16:29:26 +0000
Message-ID: <CABPh3UMAtC_cP8AMtjyO=BH7w=5b_tLM4HrbT47ZshrGPXxZMg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCH] python-dbus-next: fix recipe position
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
X-List-Received-Date: Fri, 15 Nov 2019 16:29:37 -0000
Content-Type: text/plain; charset="UTF-8"

Thanks
(sorry about this)

On Thu, 14 Nov 2019 at 19:00, Khem Raj <raj.khem@gmail.com> wrote:

> Now that its building, its failing see
> http://errors.yoctoproject.org/Errors/Details/275777/
>
> perhaps its needing
>
> PYPI_PACKAGE = "dbus_next"
>
> On Thu, Nov 14, 2019 at 6:27 AM Nicola Lunghi <nick83ola@gmail.com> wrote:
> >
> > the previous patch:
> >  903bfb78a0 python3-dbus-next: first commit of dbus-next 0.1.2
> >
> > was put in the wrong folder. This fixed that.
> > ---
> >  .../python/{python3-dbus-next => }/python3-dbus-next_0.1.2.bb     | 0
> >  1 file changed, 0 insertions(+), 0 deletions(-)
> >  rename meta-python/recipes-devtools/python/{python3-dbus-next => }/
> python3-dbus-next_0.1.2.bb (100%)
> >
> > diff --git a/meta-python/recipes-devtools/python/python3-dbus-next/
> python3-dbus-next_0.1.2.bb b/meta-python/recipes-devtools/python/
> python3-dbus-next_0.1.2.bb
> > similarity index 100%
> > rename from meta-python/recipes-devtools/python/python3-dbus-next/
> python3-dbus-next_0.1.2.bb
> > rename to meta-python/recipes-devtools/python/python3-dbus-next_0.1.2.bb
> > --
> > 2.20.1
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

