Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Ogjtr-0002MO-Pw
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Aug 2010 21:45:16 +0200
Received: by gxk2 with SMTP id 2so2285198gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Aug 2010 12:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=VyyNh3fVsom+fMAJwFN53BcKC8QZqBrXCjP8WHUzfGY=;
	b=J2FYafm1s3P3K4TO9TOTEOQEmm+BxUtYrCUUQFNW4fYeDZ15LX5jAc8FyZ7lHBlxz8
	4zLiMHuNrhSdbzrALBV4QQUjQ94O60bqap0Rm4GH7uBdu2DGFu/RvEpVeyp6O0J9mSa1
	cElwkyVo9tTljl+aN4gQmd2Ig89fqGXHs77bo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=FJCEyP1XGgyLGLIW0Oc/sjqaGbfOMaX8mu7SEKud0BGm7tnlHS3C2xUXY4ypzOxzdc
	oUKNvvKnlWJnRFhtJarPrErJs4yvYWJyck1lcdjV9119tRQLj+GhgBwotl3ZH/ncz64k
	EpouIrDqaNFgWrBFW4vJtb0wIQLQbXz4K0BAo=
Received: by 10.100.91.1 with SMTP id o1mr10519411anb.186.1280951109445; Wed, 
	04 Aug 2010 12:45:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.12.137 with HTTP; Wed, 4 Aug 2010 12:44:49 -0700 (PDT)
In-Reply-To: <4C5990C1.8050302@gmx.net>
References: <4C5990C1.8050302@gmx.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 4 Aug 2010 12:44:49 -0700
Message-ID: <AANLkTin4Sp6JsUww_LwtppEgXpuEkhKSScDZQfnE80g9@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: MULTIMACHINE builds and PACKAGE_ARCH=all recipes
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
X-List-Received-Date: Wed, 04 Aug 2010 19:45:17 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Aug 4, 2010 at 9:09 AM, Robert Schuster <thebohemian@gmx.net> wrote:
> Hi,
> I am in the process of updating the java recipes to use
> BBCLASSEXTEND="native" and fixing the do_stage use. However now I hit a
> problem because of a workaround which was added months ago to install
> Java libraries (jars) into one common directory in a multimachine build.
> This workaround was *additionally* specifically added to the angstrom
> 2008 distribution.
>
> The problem that people wanted to solve was that in a multimachine build
> the installation of a PACKAGE_ARCH="all" recipe was only being done once

that seems a bug to me.

> and so from the 2nd machine onwards the build process was unable to
> access the jars.
>
> For me I always wondered how it is for python, C# or perl
> programs/libraries which we provide and why there is no problem with
> them. As it looks they go the simple way and simply do not appear to
> have set PACKAGE_ARCH="all".
>
> So for now I see 2 solutions for the Java recipes:
> 1) Java packages do not appear as arch-independent anymore.

its going to work but has additional penalty of compiling stuff.

> 2) Bitbake (or OE) should be taught to install an arch dependent package
> into all sysroots of a multimachine build.
>

this seems the right fix.

> The former is quickly done because most recipes use java-library.bbclass
> but I find this technically wrong somehow (it also slows down everyone's
> multimachine builds considerably).
>
> I don't know how difficult or feasible it is to implement the 2nd option
> (Bitbake gods anyone?) or whether there might even be a third option.
>
> I only know that the shit has hit the fan ... :-/
>
> Regards
> Robert
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>


