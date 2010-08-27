Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Oopt1-000155-1U
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 Aug 2010 05:45:52 +0200
Received: by iwn2 with SMTP id 2so2129734iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Aug 2010 20:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=K/E5wR21durEswjN5IxGb1ov0v4/kY2E7qe8979JsKY=;
	b=lwl4i0P9KbHenJhZWKOVsCljmwgzIklWShQ1mf3OJpcXa00e+YfqYx6epskW0JAI24
	5C71wv4t+3US3oeCVSk+sJ0CZPp1VH/TA4i5epk438e13m728Dx0d17UgQ7xgCHOaXkW
	05PSa/vmGglIshf+zQ4hyPgQm0Y5lDgO/egD0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=SH9OwaKthfv2AaiVft36FQF9Il3in0Wgafv19Kztgb8AjeTpBktWI7zsHX0pd2GJMG
	Cqig53MIrS28CaeKXEclqV6T+bYuEPKAQSXgdnNIvMJI4LrFEPgppA29vIdHy9KnwFLk
	ztfvKnfa7hdUBM4kd+LRB6z8KJcixHg2iTumg=
Received: by 10.231.161.73 with SMTP id q9mr419985ibx.70.1282880724142; Thu,
	26 Aug 2010 20:45:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.207.8 with HTTP; Thu, 26 Aug 2010 20:45:03 -0700 (PDT)
In-Reply-To: <AANLkTi=WnKFoiutD+vZHEQLDQzmFnhdrUMjYrvc_MNam@mail.gmail.com>
References: <AANLkTim6-d4krhcMuAZojQVNdy3W-m_ON-mOvK5y3tqn@mail.gmail.com>
	<4C76C597.9050302@mlbassoc.com>
	<AANLkTinnnfOCw3m_q6_d27o9Luyw4dWS-uVhJzYUTTbZ@mail.gmail.com>
	<4C76CD2C.2090102@mlbassoc.com>
	<AANLkTi=WnKFoiutD+vZHEQLDQzmFnhdrUMjYrvc_MNam@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 26 Aug 2010 20:45:03 -0700
Message-ID: <AANLkTi=cBDtFg9=GvPu0t01hVOhO=4uS5kwSAqLT+cax@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: testing branch 2010-08-23
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
X-List-Received-Date: Fri, 27 Aug 2010 03:45:52 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Aug 26, 2010 at 4:20 PM, Graham Gower <graham.gower@gmail.com> wrote:
> """if a build fails, then issues are reported, and the testing-testing
> branch is moved ahead to capture fixes made in the dev branch. Once
> the issue is fixed, all combinations are retested."""
>
> Can I suggest that the testing-testing branch not be moved ahead?


I think yes the fixes should be committed to master and then pulled
into the testing-testing branch
IOW testing-testing moved ahead to new head on each monday and I think
if you have successful build
on prior monday and dont want to test it the tag should still be
there. I think continuous build is the only
way we can make sure that what we are committing is not breaking
stuff. ideally testing branch should move
every time a fix is committed upstream which was reported in
testing-testing branch but Monday to Monday is
ok too.

 Its
> not really fair on testers to have to retest, especially if the branch
> is moved ahead a couple of times. Obviously breakages should be fixed
> and committed, but can't it just wait for the following week's testing
> branch to show up as a successful build?
>
> -Graham
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


