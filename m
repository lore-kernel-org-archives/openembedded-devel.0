Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Oj6gM-0002oA-Nz
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Aug 2010 10:29:07 +0200
Received: by eyx24 with SMTP id 24so86538eyx.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Aug 2010 01:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=F9W5jgzeiKk5JHLInH4zJRG3loj4q0nCcjZu7e0WTOE=;
	b=vSh7CDBddgG4naCEqWGwc0ABj84Sxam+zs+U1avGQZphAei0g1LlPlU6fKV6ApXxX5
	6ZMjAoEiDA7LWuG6vveeGENSOz5X/OcwH/Az8uCQkq7beOkmyWxtXAW2xoaDExKiNR67
	extY5E1OQTXXa2+Fo+WFGCJiTtBxIwDslTZas=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=D3kKNZqhOAgrFfcDUswdGLzBApn3tV+QXrQti88x818TrL8oSjpBSz2BxsfX0bj7pM
	g8sX7kgVzsiqc3zJT/Y1oslyCO1OJcHSnj2CocOXFwMP++gtbCBkrdwYxwkajLR3qDcl
	LRvbWqCXBHaYdpkjzLz8tjWYxRwujXVeZoduk=
Received: by 10.213.10.138 with SMTP id p10mr14727345ebp.91.1281515336522; 
	Wed, 11 Aug 2010 01:28:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.213.35.135 with HTTP; Wed, 11 Aug 2010 01:28:36 -0700 (PDT)
In-Reply-To: <0B51A1E7C61D114DAE6FC10B0FD0ABA5018B5F6D@deimsg40.de.net.world>
References: <0B51A1E7C61D114DAE6FC10B0FD0ABA5018B5E82@deimsg40.de.net.world> 
	<AANLkTinK5O3F25QJ40B8+rt5M57BKwWVOYytUEZqvP-D@mail.gmail.com> 
	<AANLkTikjcrh78MDsSbdALEWbZGHU7nwrk14FQFiU=ynA@mail.gmail.com> 
	<AANLkTimbjUYY22nf59gPAw-Xm05mMLNdDA61Ydc63DFs@mail.gmail.com> 
	<i3se2n$gj7$1@dough.gmane.org>
	<AANLkTikUdG4hRo1wJmObU1g5fomeuViCirSBsVFCEYYZ@mail.gmail.com> 
	<AANLkTimVFCKL+M_c0rb=Zu0cktc0_QZQzZikR_T63Wj2@mail.gmail.com> 
	<AANLkTim2yjjPSC6=KfCgqWQteTqSFFga39gNyg7SoB3+@mail.gmail.com> 
	<20100811062010.GB32300@jama>
	<0B51A1E7C61D114DAE6FC10B0FD0ABA5018B5F6D@deimsg40.de.net.world>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 11 Aug 2010 01:28:36 -0700
Message-ID: <AANLkTi=dR+jFv9rSRcPJ7R=3WZYR75nF5P9skD4SMUt1@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.215.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Why PREFERRED_VERSION setting of <distro>.conf overrules local.conf setting ?
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
X-List-Received-Date: Wed, 11 Aug 2010 08:29:07 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Aug 11, 2010 at 12:53 AM, Hauser, Wolfgang (external)
<Wolfgang.Hauser.external@eads.com> wrote:
> Hello,
>
> I don't wanted to initiate heavy changes, for my experience: "Don't
> change a running system".
>
> I just asked for a simple way to use my preferred version for specific
> packages.
>
> As I understand OE, it should be possible to use the main repository
> with some view personal changes to get the image I need.
> If I have to change distro and machine configurations and hold them in
> my overlay, I can't use improvements of the main repository w/o heavy
> changes in my own overlay.
>
> For my opinion, a DISTRO only should be a recommendation for a set of
> working peaces and not a "you have to use it" dictation.
> There may be individual requirements a DISTRO never will be able to
> cover.

well. if you want so many changes to an existing distro then something is wrong
with your distro choice. Few changes can be covered as it should be.

if local overrides are given so much weight than wait for people
asking weird questions and forgetting that they had a change in
local.conf. It has happened
to me and can happen to anybody. The overrides show problems in very subtle
ways sometimes. I think collectively bringing sanity into distros is a
good approach
and few exceptions can be done using local overrides.

I am not in favor of abusing distro's which is what is likely with
such an approach.


>
> Regards
> Wolfgang Hauser
>
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


