Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 21FFC60685
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Aug 2018 16:03:41 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id 93-v6so10842392qks.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Aug 2018 09:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=tFkHxKYVDSzTuuZ1Sy6DnLcMJA498QP84eM007xT/kw=;
	b=nd98y4a0H13Fr0oytosDdm+O/30JdMNtdoK60/oWjEr2uW/UHVC5AxAo2ps7xVX8md
	026l3Tol78nyZ+xXbkFlMygbh12LsHF2d8nxVP/2n0xkUYd7rLiLYK8x+YsHOtDey2E+
	lGSh8fS5wqqtnFbdoZBrEc9bmlzdL2gTFQ8HTcWbGCVVqRRg+LTfx8e5w5/8FNkYzGxY
	NRVEZU3J2hlC43hYL+INRwWHDi5AOdNpWKjgvyILXr4JoNTVVsVZcPUDYGImO0sXj2b8
	yfRhtjc3gqpnrOaVnafMdl5IuCzijMHSa7mnmcBdxZw2j/QQvdgDlGnqScrRNHp/ldCg
	OIeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=tFkHxKYVDSzTuuZ1Sy6DnLcMJA498QP84eM007xT/kw=;
	b=k5jxSz02tCQetDYsdB5vUfYC7D25TDvkhdEVy27GfqtS1jl6cr9rZ6mbZhT8JBgULd
	EMpK/o7z435WlxibwYUErHfE8DdwlmuGslRcJvnNnSj2EpfZfq4RINraLag+xmgwucir
	/LpkT/o3IAK1+mHtGpTn4vVjjV8JSHO5QiWTmUNvAYZkqVcSZPDZiQa1BDLYGfBw/8Oo
	RSTUiZwciwJq6Ft6yqImyfG4sBmNBTzQKCadj/4cRryjsaBzIz/OZ44889XpECEH541u
	XDQzWIYHkhY0Q7mdPzjznDaNqODPQu78t0EgxPj40LCWvrxGAzU/BLaapNEoyfEZ0945
	XE2Q==
X-Gm-Message-State: APzg51DYHVrIKcoCuWa5c6DBpH+W3yYEUAEW9Oglkg11RuMj5eDR5gKT
	FkqiHmCFDCc0BK22uDc//0cIlQJDF/neM7s/AUk=
X-Google-Smtp-Source: ANB0VdY0r2eOLusbGlZgTBtVpYt3KCTkwxTrsnZOHUsrm2oRsDKFonx4W17GaGFy8rQOaD8Zi6pC/BeinM8F/ms8z1M=
X-Received: by 2002:a37:454a:: with SMTP id
	s71-v6mr14214029qka.2.1535385822654; 
	Mon, 27 Aug 2018 09:03:42 -0700 (PDT)
MIME-Version: 1.0
References: <1535024421-10058-1-git-send-email-kuo-lang.tseng@intel.com>
	<CAMKF1soraLLWVhx+tk3fB8dv1gB7yarS8vqJMum8Vkg7C+XiHQ@mail.gmail.com>
	<CAMKF1sqboZpbh3iXhPfvHfZZtNqiUu0UHhq4OhjDuo9wVLCbvA@mail.gmail.com>
	<1535358939.21109.8.camel@ktseng-HP-Compaq-Elite-8300-SFF>
In-Reply-To: <1535358939.21109.8.camel@ktseng-HP-Compaq-Elite-8300-SFF>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 27 Aug 2018 09:03:16 -0700
Message-ID: <CAMKF1spLjnQSOvvKsqTrXpX5e4r9Y9pQGJUeBi_QC33cCakMjw@mail.gmail.com>
To: kuo-lang.tseng@intel.com
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v2] turbostat: upgrade to 18.07.27
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
X-List-Received-Date: Mon, 27 Aug 2018 16:03:42 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Aug 27, 2018 at 8:38 AM Kuo-Lang Tseng <kuo-lang.tseng@intel.com> wrote:
>
> Thanks for passing the build information. New to OpenEmbedded project
> and is there a tree that I can clone to duplicate the build issue?
>

Details are in error logs, you might want to use
master-next branch on poky or openembedded-core

> On Fri, 2018-08-24 at 08:57 -0700, Khem Raj wrote:
> > another failure seen in License checksum mismatch
> >
> > http://errors.yoctoproject.org/Errors/Details/187128/
> > On Fri, Aug 24, 2018 at 1:12 AM Khem Raj <raj.khem@gmail.com> wrote:
> > >
> > > it does not seem to build see
> > > http://errors.yoctoproject.org/Errors/Details/187118/
> > > On Thu, Aug 23, 2018 at 11:44 AM Kuo-Lang Tseng
> > > <kuo-lang.tseng@intel.com> wrote:
> > > >
> > > > Update the license hash value also since SPDX header has been
> > > > inserted to kernel COPYING file since v4.17.
> > > >
> > > > Signed-off-by: Kuo-Lang Tseng <kuo-lang.tseng@intel.com>
> > > >
> > > > v2: add meta-oe prefix to subject line
> > > > ---
> > > >  .../turbostat/{turbostat_3.4.bb => turbostat_18.07.27.bb}               | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >  rename meta-oe/recipes-kernel/turbostat/{turbostat_3.4.bb => turbostat_18.07.27.bb} (96%)
> > > >
> > > > diff --git a/meta-oe/recipes-kernel/turbostat/turbostat_3.4.bb b/meta-oe/recipes-kernel/turbostat/turbostat_18.07.27.bb
> > > > similarity index 96%
> > > > rename from meta-oe/recipes-kernel/turbostat/turbostat_3.4.bb
> > > > rename to meta-oe/recipes-kernel/turbostat/turbostat_18.07.27.bb
> > > > index 3559417..5e64efa 100644
> > > > --- a/meta-oe/recipes-kernel/turbostat/turbostat_3.4.bb
> > > > +++ b/meta-oe/recipes-kernel/turbostat/turbostat_18.07.27.bb
> > > > @@ -12,7 +12,7 @@ processor frequency and idle power saving state residency on supported \
> > > >  processors."
> > > >
> > > >  LICENSE = "GPLv2"
> > > > -LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
> > > > +LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
> > > >
> > > >  COMPATIBLE_HOST = '(x86_64.*|i.86.*)-linux'
> > > >  COMPATIBLE_HOST_libc-musl = "null"
> > > > --
> > > > 1.9.1
> > > >
> > > > --
> > > > _______________________________________________
> > > > Openembedded-devel mailing list
> > > > Openembedded-devel@lists.openembedded.org
> > > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>

