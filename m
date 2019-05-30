Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 0AD0E7E1CA
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 May 2019 12:20:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45F6B25Qqnz3L;
	Thu, 30 May 2019 14:20:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1559218859;
	bh=UlB7QGowPOdhaltL4atckdwphDr0vFHwJaEvecRnXmk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nUN48SDwTGt0Qem/awVL0e6gWXgCtyXhxVb1RdVvmUYCXJF8A8SRX+9XGDAwzUP5y
	FI8uyEcJlYy7/fSbvhPATa1DyJJWHyhOf/CcBwnWOSe5PREW1vOOKytO+HIFXRfLb6
	E7s9/mZFq7ZUizLxvdOjG6J5bwnR50ary+fPzI9QKLQfT/xCUQZsgEP1gTaEa8+qcK
	SfIDMS5GZlZw9/+vD15Sh9JMawtIVOzKEAjgfiTeOiUdvc6wvwEPMlXaBQErmtFslH
	6VFGxx0z+htW4/QN5oc7IbRahHd7PMIT9eZNzL187OHl7RrsRgMhw161gMRBNsr/MB
	rd+DOtL7UvDO2+AptyWQlYC4rgxG7FRZN98GRgRPXv9CiDQRl3cXQ9zmiEBk6DJnEr
	fcjI0VKRxnMVaDbmU3Z1Afp0zZLWokmVB7GYgEVFhc/P3CW2OMzFL0mGShSDkN9Pjl
	Lf4TXrXsXs9TSrXUESJUZmoWNQChjeZP0lsktBXE/0M498iwn467vEYYhSOJBB7f31
	9QeQ06CDfiXUnln+CJdsC346VNtzljiMAZTl66hxmpKGszpUN79hhWfvwMfqLwEeRe
	WeVMEwU4ODPTS+xmBtRYKrIuG5Yw3sD64BdzPffiH+igZXEjdRrycewxrHKzTYVWdv
	lyUwp0QWiMJw+ycC906KxnZY=
Date: Thu, 30 May 2019 15:20:56 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Paolo Valente <paolo.valente@linaro.org>
Message-ID: <20190530122056.GE20599@localhost>
References: <20190530102539.65935-1-paolo.valente@linaro.org>
	<20190530111457.GA20599@localhost>
	<F1150B1F-B591-4579-A7BC-AA5ED008C07C@linaro.org>
MIME-Version: 1.0
In-Reply-To: <F1150B1F-B591-4579-A7BC-AA5ED008C07C@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: ulf.hansson@linaro.org, openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] s-suite: push SRCREV to version 3.4
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
X-List-Received-Date: Thu, 30 May 2019 12:20:59 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, May 30, 2019 at 02:15:21PM +0200, Paolo Valente wrote:
> 
> 
> > Il giorno 30 mag 2019, alle ore 13:14, Adrian Bunk <bunk@stusta.de> ha scritto:
> > 
> > On Thu, May 30, 2019 at 12:25:39PM +0200, Paolo Valente wrote:
> >> Signed-off-by: Paolo Valente <paolo.valente@linaro.org>
> >> ---
> >> meta-oe/recipes-benchmark/s-suite/s-suite_git.bb | 4 ++--
> >> 1 file changed, 2 insertions(+), 2 deletions(-)
> >> 
> >> diff --git a/meta-oe/recipes-benchmark/s-suite/s-suite_git.bb b/meta-oe/recipes-benchmark/s-suite/s-suite_git.bb
> >> index 706a55e11..db1945dd0 100644
> >> --- a/meta-oe/recipes-benchmark/s-suite/s-suite_git.bb
> >> +++ b/meta-oe/recipes-benchmark/s-suite/s-suite_git.bb
> >> @@ -2,8 +2,8 @@ SUMMARY = "Small collection of benchmarks for storage I/O"
> >> LICENSE = "GPLv2"
> >> LIC_FILES_CHKSUM = "file://COPYING;md5=b529aaa6a0c50f15d29f89609b5c22f3"
> >> 
> >> -SRCREV = "262227ec9de4be1ab41d9918d32ceb773089f1dd"
> >> -PV = "3.2+git${SRCPV}"
> >> +SRCREV = "8d22ab8a4cc1484622c47ac9c5944fb9a61a5c0f"
> >> +PV = "3.4+git${SRCPV}"
> >> SRC_URI = "git://github.com/Algodev-github/S.git;protocol=https;branch=master"
> >> ...
> > 
> > The problem was already there before, but the upgrade gives the
> > opportunity to get rid of the +git${SRCPV}, which is incorrect
> > when exactly the release is packaged.
> > 
> 
> Sorry,
> you pointed this out already, but then I thought I had solved it.  Now
> I also understand why the previous push-up to 3.3 was not it.
> 
> And now, I'm sorry, but I think I'd better to ask for your help
> explicitly: how should I fix this exactly?

Just remove the +git${SRCPV} from the PV line:

-SRCREV = "262227ec9de4be1ab41d9918d32ceb773089f1dd"
-PV = "3.2+git${SRCPV}"
+SRCREV = "8d22ab8a4cc1484622c47ac9c5944fb9a61a5c0f"
+PV = "3.4"

> Thanks for your patience,
> Paolo


cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


