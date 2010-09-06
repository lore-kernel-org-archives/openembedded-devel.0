Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Osf2y-000299-OP
	for openembedded-devel@lists.openembedded.org;
	Mon, 06 Sep 2010 18:59:57 +0200
Received: by iwn2 with SMTP id 2so4322580iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Sep 2010 09:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=owB46L5m7OL4Bfgd8stuMTj9p/STVGM1RJlo2p1VL+o=;
	b=nVQvXY6Ft+n0QhjnPc2I/FUihWQ6Vlp03A74BOGQ2GVzzFtgnridyCodWjzY0aL86f
	B/x2jU7LrhXj2l1FOdX3dn9GZVOOX2GnpdG6B6V/kPa0s5wshZxJ1Js09UAQuQrHZjmz
	CTNvXK71XdsVuO60JDpS12y3gCPW8VvRTYAkg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=sMuJC/8mX2FTveD1ngkTQi670FdZHbhDQ2lgBnC1dTwg3vsTF/6yk9MYx5hXSWFDjB
	l90xJp6ed6AI36iRoU2GK6uJ18JUTkrWwv4DZO6xv1CxHKKJR28q4Tuv503XfQY9orbH
	qMq0jjeQmSGq/exGktHh5VwhbrbsAPkUM5bb4=
MIME-Version: 1.0
Received: by 10.231.191.74 with SMTP id dl10mr6452520ibb.157.1283792357831;
	Mon, 06 Sep 2010 09:59:17 -0700 (PDT)
Received: by 10.231.208.17 with HTTP; Mon, 6 Sep 2010 09:59:17 -0700 (PDT)
In-Reply-To: <AANLkTiktKfjWwgs2-xAxoOWH7_RdXfkbAYiOZoCbf51M@mail.gmail.com>
References: <AANLkTi=j4E6ZLet=qemx-Ec1CaySKLCuzZMDriX9WQ=T@mail.gmail.com>
	<4C835C8E.1000008@eukrea.com>
	<AANLkTi=GrTNa2H+UZjM6RrYU6xAx-DZg2KwDix8MzOgM@mail.gmail.com>
	<4C836376.3050709@eukrea.com>
	<AANLkTiktKfjWwgs2-xAxoOWH7_RdXfkbAYiOZoCbf51M@mail.gmail.com>
Date: Mon, 6 Sep 2010 18:59:17 +0200
Message-ID: <AANLkTi=3MVqehDdODOS_HhSfo4XcY=owt-=t+_THQYrY@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: ushare_hg (the leading ushare recipe) does not fetch
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
X-List-Received-Date: Mon, 06 Sep 2010 16:59:57 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/9/6 Frans Meulenbroeks <fransmeulenbroeks@gmail.com>:
> Eric,
>
> I think the problem is resolved. Somewhere something went wrong with
> installing 1.10.
> Although my bitbake dir was a symlink to the 1.10 dir it still
> reported as 1.8.18, so guess either I misplaced things or maybe this
> is a pre 1.10 version.
>
> berlios is currently not responding so cannot re-download 1.10. I'll
> try later and let you know the result.
>
> Thanks alot for your help!
>
> Frans
>

Retested with 1.10 and help of Eric.
The patch works for me.
Maybe I had to install mercurial to get thngs going (after applying the patch).
mercurial is not in the sanity checker. alternately maybe hg.py should
warn or we should have a mercurial_native recipe.

Frans


