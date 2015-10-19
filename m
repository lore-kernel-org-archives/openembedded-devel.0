Return-Path: <anders@chargestorm.se>
Received: from mail-lb0-f179.google.com (mail-lb0-f179.google.com
	[209.85.217.179])
	by mail.openembedded.org (Postfix) with ESMTP id 3FA0777070
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Oct 2015 06:06:06 +0000 (UTC)
Received: by lbbwb3 with SMTP id wb3so72102147lbb.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Oct 2015 23:06:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id
	:mail-followup-to:references:mime-version:content-type
	:content-disposition:in-reply-to:organization:user-agent;
	bh=HVS4v4Ba3CMbpMfYgZmnn7gUl1Fhc5OLQQ3omTu2FQ8=;
	b=Dts6nZs+a1Nq9yJ8HKbtbJ+qrQxYxvCzH/sg+wrcbjz33fCvh4fxprd63qNH1kNakA
	lYuxbpwMFFHIE1kKbvb+8CyGxtWXriHkFIfjnoORaFTstdqzZEO7sGYTEZJc68VLdIG2
	qw3bipwIy/PFGFGE44TRHXwuKXn7NlOO5Kc4tWaJ5A+lCAfc5slnkFS5+Zr3dPHj8Xvl
	ZNkii2DqWUdbD2a1ZN8bdx8mNjIdKOTHp3YBkMovZGPvmqhyXvX/BhwP+x9sXLyZfJ4q
	AmGTq9g9qpDpsny98nQcs1pK4hzJE7huSUdWyYD/tKPud9SNqd5fhya/h1TaDBolmU0K
	WH/Q==
X-Gm-Message-State: ALoCoQkNZ9zzEcWBSRz51B5PAzZzsVGfL1pFhq7ighdudrHU4gWnhpYmUR3RwysSvnC4NCcotrd3
X-Received: by 10.112.63.233 with SMTP id j9mr13505584lbs.113.1445234765442;
	Sun, 18 Oct 2015 23:06:05 -0700 (PDT)
Received: from ad.chargestorm.se (213-64-219-84-no126.business.telia.com.
	[213.64.219.84])
	by smtp.gmail.com with ESMTPSA id nb1sm2199328lbb.9.2015.10.18.23.06.04
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 18 Oct 2015 23:06:04 -0700 (PDT)
Date: Mon, 19 Oct 2015 08:06:03 +0200
From: Anders Darander <anders@chargestorm.se>
To: Martin Jansa <martin.jansa@gmail.com>
Message-ID: <20151019060603.GA16160@ad.chargestorm.se>
Mail-Followup-To: Martin Jansa <martin.jansa@gmail.com>,
	openembedded-devel@lists.openembedded.org
References: <1444933287-26444-1-git-send-email-anders@chargestorm.se>
	<20151015194858.GF2588@jama>
MIME-Version: 1.0
In-Reply-To: <20151015194858.GF2588@jama>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-qt5][PATCH] qtbase: fix QA warning of host uid leakage
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 19 Oct 2015 06:06:08 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

* Martin Jansa <martin.jansa@gmail.com> [151015 21:48]:

> On Thu, Oct 15, 2015 at 08:21:27PM +0200, Anders Darander wrote:
> > Two files in /usr/lib, were own by the uid of the build process.

> > Signed-off-by: Anders Darander <anders@chargestorm.se>
> > ---
> >  recipes-qt/qt5/qtbase_git.bb | 2 ++
> >  1 file changed, 2 insertions(+)

> > diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
> > index 39d02a9..99ac208 100644
> > --- a/recipes-qt/qt5/qtbase_git.bb
> > +++ b/recipes-qt/qt5/qtbase_git.bb
> > @@ -232,6 +232,8 @@ do_install_append() {
> >          chown -R root:root ${D}/${OE_QMAKE_PATH_QT_FONTS}
> >      fi
> >      cp -a ${B}/lib/libqt* ${D}${libdir}

> Can we use install instead of cp to resolve this issue instead of chmod?

Well, that was my first idea too. Though, to be honest, I never looked
into how many files were covered by the cp command.

At least with my minimal configuration Qt, it's only the two files below
that gets copied. So I'll respin the patch to use install instead.

Do you, or someone else know if there are occasions were more than the
two file belows matches ${B}/lib/libqt*?

Cheers,
Anders

> > +    chown root:root ${D}${libdir}/libqtpcre.prl
> > +    chown root:root ${D}${libdir}/libqtpcre.a
> >      # Remove example.pro file as it is useless
> >      rm -f ${D}${OE_QMAKE_PATH_EXAMPLES}/examples.pro
-- 
Anders Darander
ChargeStorm AB / eStorm AB

