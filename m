Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PotY5-00083J-QC
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Feb 2011 09:12:46 +0100
Received: by iyj8 with SMTP id 8so4523477iyj.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Feb 2011 00:11:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=kmkWfMuHLKxN0C1IC7XlP+PVoZlkPxMPppZXQfh5CAk=;
	b=K2sj87U/7QufVRRhvEp8LXuvT4OSUPtaOhFOs/+3V/QxKBLLOk54oXARizpAwsjGo4
	tpWVORjby2bFrc12MXiMicBxm25NKQVlmYFhA9yvUCo+k38DUMzIJXEmeLJdyNDV7IX2
	twZGoWqBqGvaJeOkxBrQGEd1L5YWM9liKmhGc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=sx5SWmQG6aHn2E/NAbWLgmBDJaHR5JVioBjflo4NENwBweBodJFnqbXumPO4zpI+LE
	XYAU3YzF6/+nXYOUIWvBGZm8lcLK80aUCp26NUBqvWuCRfYxAtbqhoF8F3C+3ydkqUQr
	WCeyVNmCTmM039scTVV5SfTA1jVLZ5YngR6qw=
MIME-Version: 1.0
Received: by 10.231.10.200 with SMTP id q8mr2685207ibq.122.1297671096301; Mon,
	14 Feb 2011 00:11:36 -0800 (PST)
Received: by 10.231.30.73 with HTTP; Mon, 14 Feb 2011 00:11:36 -0800 (PST)
In-Reply-To: <4D58D5EF.6000807@dresearch.de>
References: <4D58D5EF.6000807@dresearch.de>
Date: Mon, 14 Feb 2011 09:11:36 +0100
Message-ID: <AANLkTi=4i_m8J4qFCwntdo-qb4CHn98UH+kuz4O=zcgT@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: bitbake exit codes?
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
X-List-Received-Date: Mon, 14 Feb 2011 08:12:46 -0000
Content-Type: text/plain; charset=ISO-8859-1

2011/2/14 Steffen Sledz <sledz@dresearch.de>:
> While setting up Jenkins/Hudson jobs for the testing-release-2011.03 branch based on the testscript.sh from the contrib subdir i hit the following problem.
>
> bitbake (1.10.2) finally reports "NOTE: Task Summary: Attempted 1217 tasks of which 0 didn't need to be rerun and 0 failed.". So it seems that the build was successful. But bitbake did not return 0 but 1. So Jenkins marks the build as failed.
>
> I guess the exit code 1 is coming from some QA Issues. How do we handle that if if my guess is right?
>
> Do we mark such a build run as successful in our test matrix?
>
> Has bitbake a defined set of exit codes that we can evaluate in the testscript.sh?
>
> Steffen
>
>
There have been a few threads on this in the past.
One of the ways (and maybe the best one) to get around this is to fix
the QA errors.

Frans


