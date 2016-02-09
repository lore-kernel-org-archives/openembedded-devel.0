Return-Path: <brunovern.a@gmail.com>
Received: from mail-oi0-f49.google.com (mail-oi0-f49.google.com
	[209.85.218.49])
	by mail.openembedded.org (Postfix) with ESMTP id 69C8060721
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Feb 2016 14:00:20 +0000 (UTC)
Received: by mail-oi0-f49.google.com with SMTP id m82so15304361oif.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Feb 2016 06:00:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:content-type; bh=CidJZHb57hF81r9hzrdXmh6F+YUsnslQCm8sLc9hyvs=;
	b=hQmoVzLUvUqm4bQYm1TV8wpppkCwEkx/iuyPwMr+fpaXSoEwFyhLWX9r8NMT/jmg3z
	gxcWW37APeo2bDoqNk8kZ1GctobzIEK0Y/BslIiYC343NWskpcuuVDKE5Ruh5Gbwq5yr
	WOedvFB86NYCyJSjX2cHB6+uroR3+CvNwAZuAasllZfFO20RC4MW5P3z0DX1k3QKD82d
	cFeNcPnHXn2iYG0N6z7+CcgkLLxHI4niyJY1XxvLE5DzBWbszZ3gR/ixuNRwnjuYN5Py
	pHy/ln1f3UHcdhXV8jNlFtE7fm3IjMmxI3mYOS3n9z9B6v5VX0jdd/tvik5roYkvVIHs
	TfEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:content-type;
	bh=CidJZHb57hF81r9hzrdXmh6F+YUsnslQCm8sLc9hyvs=;
	b=bXREU4FDd8vgmlEp75VnTbvMu1XrcMy1W6Il2YRNMk29TCOHKRL0+tVVnUwnVIFTDS
	lgjkgO+EwBCjJMC5K8dcgu1Pcc0evLOP/R6Ubg08vEoJxvgRb2BW5MBXLYpUi+aC7rlQ
	e4pd1jJCt6P+gtlR4PxL5quO1yFmPArbesx0E639yR4/pTGCGIieNPOo71sTCnB/rNBw
	KugvqKRbYVyjZTLZR1TZpZ9y/W56DU+cvpj1Ts1uDddUdFuwu2Y20lIT2KxuEdSrlbPE
	6QW2IYrQqGtt5DBxh9Y4j3qed06p3RMTUMXfuaEyb2HAXFi4QBUffzb21udjDJxmhxe3
	QkqQ==
X-Gm-Message-State: AG10YORZL+eMvveLQ8Hu/5yb4ZLxhc1aDBTGH+SLLbLmrVxkPCchisvceFohQTuGZH17658j8RiYRIETkhfmPw==
X-Received: by 10.202.102.214 with SMTP id m83mr3730290oik.56.1455026421314;
	Tue, 09 Feb 2016 06:00:21 -0800 (PST)
MIME-Version: 1.0
References: <1454260743-18688-1-git-send-email-BrunoVern.a@gmail.com>
	<20160201151944.GE2639@jama>
In-Reply-To: <20160201151944.GE2639@jama>
From: Bruno Vernay <brunovern.a@gmail.com>
Date: Tue, 09 Feb 2016 14:00:12 +0000
Message-ID: <CAF3KAoQXP0GyX8jorvckBcGFiPNP-u5UDJ2kLyJWgUuPDUZPLQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [PATCH 1/3] Fixes runtime error when loading modules
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
X-List-Received-Date: Tue, 09 Feb 2016 14:00:24 -0000
Content-Type: text/plain; charset=UTF-8

I checked out on master and my changes are already there and I confirm that
it works.
http://cgit.openembedded.org/meta-openembedded/commit/meta-oe/recipes-support/openldap/openldap_2.4.43.bb?id=f3b3c1fdd88f3084c3cea11cd39e86216ba93218

I am currently writing ptest, I was able to find examples, it is on going.
But, I am still wondering that there are no documentation on how to use the
recipe, people are really expected to read the recipe source and find out?

Bruno

On Mon, Feb 1, 2016 at 4:17 PM Martin Jansa <martin.jansa@gmail.com> wrote:

> On Sun, Jan 31, 2016 at 06:19:01PM +0100, BrunoVernay wrote:
> > Signed-off-by: BrunoVernay <BrunoVern.a@gmail.com>
>
> openldap in master was upgraded to 2.4.43 more than month ago:
>
> commit 03d613e570ae262b32322d1fa2eeb47c38518478
> Author:     fan.xin <fan.xin@jp.fujitsu.com>
> AuthorDate: Fri Dec 11 09:50:39 2015 +0900
> Commit:     Martin Jansa <Martin.Jansa@gmail.com>
> CommitDate: Fri Dec 18 12:43:22 2015 +0100
>
>     openldap: upgrade to 2.4.43
>
> Rebase, re-verify and re-send with subject following:
> http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines
>
> Regards,
>
> > ---
> >  meta-oe/recipes-support/openldap/openldap_2.4.42.bb | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/meta-oe/recipes-support/openldap/openldap_2.4.42.bb
> b/meta-oe/recipes-support/openldap/openldap_2.4.42.bb
> > index 49fcb56..caca16b 100644
> > --- a/meta-oe/recipes-support/openldap/openldap_2.4.42.bb
> > +++ b/meta-oe/recipes-support/openldap/openldap_2.4.42.bb
> > @@ -148,6 +148,8 @@ PACKAGES += "${PN}-overlay-proxycache"
> >  # it was disabled for cross-compiling.
> >  CPPFLAGS_append = " -D_GNU_SOURCE -DURANDOM_DEVICE=\'/dev/urandom\'"
> >
> > +LDFLAGS += "-pthread"
> > +
> >  do_configure() {
> >      cp ${STAGING_DATADIR_NATIVE}/libtool/build-aux/ltmain.sh ${S}/build
> >      rm -f ${S}/libtool
> > --
> > 2.5.0
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

