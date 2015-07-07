Return-Path: <ticotimo@gmail.com>
Received: from mail-ig0-f175.google.com (mail-ig0-f175.google.com
	[209.85.213.175])
	by mail.openembedded.org (Postfix) with ESMTP id 4C5B075D37;
	Tue,  7 Jul 2015 16:58:52 +0000 (UTC)
Received: by igcsj18 with SMTP id sj18so266637721igc.1;
	Tue, 07 Jul 2015 09:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=p6lJY3fp/H3j16P2SilniyOglR4BgH/Q2QgaYJOaEwU=;
	b=gAx9Mr9mTqbki8TUaqYSjvV7PmCJRZSB5xsGkZeld1fcV3gs54lJ+kE6fCOfV2+yAa
	YgyCC915+xUCxfQ9QYSdj/qtcMZJ+Noqa+E943ofRqcQOgOV3H8uaM9FBXuGfqdEu8dE
	EJqksh8YDNwc9qexWirHjARCJEuS4JVQiHzcEkfYTgnFOycmueJg563CI4eEqveS6u7R
	2Nk068jKRC9w9M9SKpUryErNzlQ0Ra8e2f3eGEiHgpixe2utfcnuq8FpOAbcPwR9qobn
	nd1VlEKPtRjCybmwrWS4d8vWBJMIy8kZuckTqQYSDCrK+TEIR8Mfxbyh7qiJ7U2Gr6is
	n4FA==
MIME-Version: 1.0
X-Received: by 10.50.2.3 with SMTP id 3mr79885480igq.34.1436288332718; Tue, 07
	Jul 2015 09:58:52 -0700 (PDT)
Received: by 10.36.215.129 with HTTP; Tue, 7 Jul 2015 09:58:52 -0700 (PDT)
In-Reply-To: <20150707105449.GA2397@jama>
References: <20150707105449.GA2397@jama>
Date: Tue, 7 Jul 2015 09:58:52 -0700
Message-ID: <CANx9H-AHXXY_FQ9FSVs2Wg-H7mhSGFPw5EyeUm53aEBgdMPeCA@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] State of bitbake world, Failed tasks 2015-07-04
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
X-List-Received-Date: Tue, 07 Jul 2015 16:58:53 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Jul 7, 2015 at 3:54 AM, Martin Jansa <martin.jansa@gmail.com> wrote:

> http://www.openembedded.org/wiki/Bitbake_World_Status
>
> <snip>
>
> == Failed tasks 2015-07-04 ==
>
> INFO: jenkins-job.sh-1.3.1 Complete log available at
> http://logs.nslu2-linux.org/buildlogs/oe/world/log.report.20150705_101525.log
>
> === common (9) ===
>     * /meta-openembedded/meta-efl/recipes-efl/efl/epdf_svn.bb, do_compile
>     * /meta-openembedded/meta-multimedia/recipes-mkv/mkvtoolnix/
> mkvtoolnix_git.bb, do_compile
>     * /meta-openembedded/meta-oe/recipes-extended/cmpi-bindings/
> cmpi-bindings_git.bb, do_compile
>     * /meta-openembedded/meta-oe/recipes-extended/openwsman/
> openwsman_2.6.0.bb, do_compile
>     * /meta-openembedded/meta-oe/recipes-extended/polkit/polkit_0.112.bb,
> do_configure
>     * /meta-openembedded/meta-oe/recipes-extended/sblim-sfcb/
> sblim-sfcb_1.4.8.bb, do_compile
>     * /meta-openembedded/meta-perl/recipes-perl/libextutils/
> libextutils-cppguess-perl_0.07.bb, do_configure
>     * /meta-openembedded/meta-perl/recipes-perl/libmodule/
> libmodule-pluggable-perl_5.1.bb, do_configure
>     * /meta-openembedded/meta-perl/recipes-perl/libmodule/
> libmodule-runtime-perl_0.014.bb, do_configure
>
> <snip>


The three perl modules are failing because libmodule-build-perl is no
longer included in perl 5.22 upgrade and this commit:
http://git.openembedded.org/openembedded-core/commit/?id=80afd9650328de2eb17ba0e104ee2c76a7fb983e

Rather than cripple cpan-build.bbclass, a recipe for libmodule-build-perl
direct from CPAN is needed and will need to be added to oe-core, unless we
want cpan-build.bbclass to do nothing useful.

I am working on it after hours, but it may take a few days.

--Tim

