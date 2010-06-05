Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <aspnair@gmail.com>) id 1OKn8i-0008QB-4x
	for openembedded-devel@lists.openembedded.org;
	Sat, 05 Jun 2010 08:46:08 +0200
Received: by pxi14 with SMTP id 14so516047pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Jun 2010 23:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=jT9Y6ZrP3pRQiLs5Tp2AuWmyXlPAcPge1mgKQgK7vR0=;
	b=GXgyoxL7nJomIPf+ntb5z6KwnR2E9tbpp6vSVaFk/Y2tvIhimLyZ/Qk3jfJB7hGE0Y
	Rzt1kjq9r/JGcH5awWHX+rhuiYqEm9Am4ISE64b1kUDlCLsHb09bes04jWgoDX5jiNQg
	FlbDI3dAYiIV9GlacqEXF6ntsflYA1pV6gK2o=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=SGpkCYiUlcpnB5Q2H3yRswDEAVvxSGWJYxex2yfbDdl52A6abgJJo6klbyGAbTAmdK
	Rc0ikr6233WlZpKHzkIsdtV5U1yG3OsVO1CnfgK2ty/P2Tk5sQmcQ382fTf/DjEkCTCx
	YjqgQkTuYwP7tRqhf6IoVAGqlr9AHEXFk9Ie0=
MIME-Version: 1.0
Received: by 10.142.207.20 with SMTP id e20mr510875wfg.105.1275720093698; Fri, 
	04 Jun 2010 23:41:33 -0700 (PDT)
Received: by 10.115.16.18 with HTTP; Fri, 4 Jun 2010 23:41:33 -0700 (PDT)
In-Reply-To: <AANLkTimq1dViDpqTm-GTFbjaAtkJVeA7Yru3Fkusgbkb@mail.gmail.com>
References: <AANLkTinzFcGTINenNR72-NtuZUijkAY55BVKYL9r0ea8@mail.gmail.com>
	<AANLkTimq1dViDpqTm-GTFbjaAtkJVeA7Yru3Fkusgbkb@mail.gmail.com>
Date: Sat, 5 Jun 2010 12:11:33 +0530
Message-ID: <AANLkTin8Ey_qQo7QjpXmA_Fxf41_5WGajst3vRDsNY-i@mail.gmail.com>
From: Anand Sivaram <aspnair@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.212.175
X-SA-Exim-Mail-From: aspnair@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Questions about openembedded stable branch
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 05 Jun 2010 06:46:09 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sat, Jun 5, 2010 at 09:00, Khem Raj <raj.khem@gmail.com> wrote:

> On Fri, Jun 4, 2010 at 1:09 AM, Anand Sivaram <aspnair@gmail.com> wrote:
> > As I was going through the stable documentation given at
> > http://wiki.openembedded.net/index.php/Stable
> > I had a couple of questions.
> >
> > * Seems like there should have been a release "stable/2010" some time
> around
> >  March, but I could not find any mention about that release.
>
> There is no 2010 release yet.
>
> >
> > * OE repository contains very few tags.  Also there is no
> >  "year.month" tag as given by the stable branch documentation.
> >
>
> once release is panned out that will be tagged.
>
> > * Is there any testing branch (like in Debian) where relatively "stable"
> >  packages are moved and they eventually become stable?
>
> .dev/master is the most active branch but there is no testing branch per
> say.
>
> >  Or is it like mainline linux kernel where features are frozen, then
> >  do RC releases and finally the stable release?  It looks like
> >  origin/org.openembedded.dev is a rolling/floating place where
> >  packages/features are constantly getting included.
>
> thats right.
>
> >
> > * I would like to know how the stable/2010 branch is created.
>
> Do you want to know how or when ?
>
> >
> > * My main objective is to find a branch/tag/version
> >  newer than stable/2009 and more stable than the dev main branch.
> >
>
> you can use .dev of any day.
>
> > Thanks and Regards
> >
> > Anand
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



Thanks Khem for your inputs.
>> * I would like to know how the stable/2010 branch is created.
> Do you want to know how or when ?
I meant, the overall big picture and criteria of creating the stable/2010
branch.  Is it feature/bug fix/time/stability driven etc.

