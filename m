Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OgEm2-0002J3-E8
	for openembedded-devel@lists.openembedded.org;
	Tue, 03 Aug 2010 12:31:07 +0200
Received: by bwz10 with SMTP id 10so2253154bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Aug 2010 03:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=uppCca2XRz/4k76P5ZSfG6DvqTl1K0wYFg35NxIo+dE=;
	b=dUGfbtWLLhrReZEBaDvo5ppHA1r3X9GowEVW3vn7e3g4/8FDyq7kYSc2aWnqewKhdk
	60InmyaNLzjFMjhfV+UMEEq3mgz52+rCKVFganZFvtqEPo1wtF0P0mumYp+Sbqy2qg3l
	+6hmuBdBXSwbbLqM4bQmA0THXKBTNwcRoRrqY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=Q8n3Kezr4ARI+Ng9BGb4o16URXAEVDvNx7PmPg6y18jYpFxuCff99dwMUSmfILhdzE
	u6WvaT579FfBiAwkQfzZjHEU3O95DOGEb7n3MmvZKIenGBnZ7cmOpVSwSez+TiU7L0bY
	wp1vXYLuVTWtfYZPcx++wlLiCa/iB/4AaEJpc=
MIME-Version: 1.0
Received: by 10.204.126.161 with SMTP id c33mr5095392bks.108.1280831463034; 
	Tue, 03 Aug 2010 03:31:03 -0700 (PDT)
Received: by 10.204.60.208 with HTTP; Tue, 3 Aug 2010 03:31:02 -0700 (PDT)
In-Reply-To: <i38q56$4hq$1@dough.gmane.org>
References: <1280554451-27780-1-git-send-email-raj.khem@gmail.com>
	<i30rie$8aq$1@dough.gmane.org> <i318p1$ec3$1@dough.gmane.org>
	<i31rhg$4a8$1@dough.gmane.org> <i363dm$17p$1@dough.gmane.org>
	<AANLkTinE0=x74yBxHsGCpRLFoQfDF+gHeuHFMG=D+rY_@mail.gmail.com>
	<i38q56$4hq$1@dough.gmane.org>
Date: Tue, 3 Aug 2010 12:31:02 +0200
Message-ID: <AANLkTikpZ=om55=-xO3EChGV6h40wBvNUOQvKcLCm3Lv@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH 0/5][v4] Make multi-machine toolchains to co-exist (Alternate approach)
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
X-List-Received-Date: Tue, 03 Aug 2010 10:31:08 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/8/3 Koen Kooi <k.kooi@student.utwente.nl>

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Acked-by: Koen Kooi <k-kooi@ti.com>
>
> If noone objects, can we get this in ASAP?
>
> Would it be good to do my do_stage patch first?

rationale:
this will require a full rebuild. the do_stage patch does not bump PR (which
is technically probably not needed as nothing changes).
By doing it just before a major change we are sure that it gets rebuild.

However, I cannot apply my patch in the next 6-7 hrs. Feel free to apply it
for me.

Frans.

