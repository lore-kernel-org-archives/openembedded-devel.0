Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>) id 1RvCbM-0006Cp-Ru
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Feb 2012 19:50:44 +0100
Received: by wgbdr13 with SMTP id dr13so803755wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Feb 2012 10:42:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=P/HN/Rp+sCf1usq7l5wy1gVLTSJRqeIC+Z3MOjKYSqc=;
	b=updDtbtTkSCEuNKTpSE8h1oVgRJxUez2kyObUjnJu4IBB1eWbm+vPNJHtXK7PuLdo2
	hbnH0hC33TvHqwl1LwBFC14gpSBhFtBbhFIhM8Cueoa49jAOxAWj3RaJ3hKZFStgwHr1
	Lqyl/mc/eCgv7lROFl/DEFtDAoITtHVeniyjk=
MIME-Version: 1.0
Received: by 10.181.13.113 with SMTP id ex17mr42645316wid.15.1328726561247;
	Wed, 08 Feb 2012 10:42:41 -0800 (PST)
Received: by 10.216.93.7 with HTTP; Wed, 8 Feb 2012 10:42:40 -0800 (PST)
Received: by 10.216.93.7 with HTTP; Wed, 8 Feb 2012 10:42:40 -0800 (PST)
In-Reply-To: <CAMKF1sr8EKC1tzDTHNEb0k4x_oN1bU6aCz_aJjDVPYEOho799Q@mail.gmail.com>
References: <20111117223303.96550@gmx.net>
	<CAMKF1spxE8kXQwsX3WYnazpGZDDmZoafvmvxLBRBvfZxdfbgdQ@mail.gmail.com>
	<20111118200047.GD2101@mx.loc>
	<CAC1BbcTp=fd=wSW6rTs4g4RdSSGJLPtTw1wCw8fy1dy9POVu2A@mail.gmail.com>
	<CAMKF1spxWumvNh5sCG8wgectH2HvcNjoDoo6VBYzBTKqwuyQaQ@mail.gmail.com>
	<20120202143311.112290@gmx.net>
	<CAMKF1sr423aR2GnJ6LQy6pdf8nfB_M+wjae5E_xi7ZUsc-cfQw@mail.gmail.com>
	<20120202160604.78480@gmx.net>
	<CAC1BbcTnVS4oqpcbDDbxOuBCDQPcb8cQDznJk58=neVOuC695w@mail.gmail.com>
	<20120202213801.8530@gmx.net>
	<CAMKF1srQcXyjwv2e9=gtKo_T+Q4uC6YXivmROCnnFM3aS5xxWg@mail.gmail.com>
	<4F2BDE2A.3000201@st.com>
	<CAMKF1srDugybTEsusbc0XG1NM5BGVQEHxTBSw3_1aFCFunsCPw@mail.gmail.com>
	<CAC1BbcTEmnZFWrS2PKwt1nnM0h1w+UAun37D4Ep7YyYSbaJXaA@mail.gmail.com>
	<CAMKF1sr8EKC1tzDTHNEb0k4x_oN1bU6aCz_aJjDVPYEOho799Q@mail.gmail.com>
Date: Wed, 8 Feb 2012 19:42:40 +0100
Message-ID: <CAC1BbcTHi_rKU7yjBVYpRBv9V_1vdvHE-qFrs+TG4taxg85Tog@mail.gmail.com>
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: uclibc@uclibc.org, Peter Mazinger <ps.m@gmx.net>,
	openembedded-devel@lists.openembedded.org,
	Carmelo AMOROSO <carmelo.amoroso@st.com>
Subject: Re: future branch
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
X-List-Received-Date: Wed, 08 Feb 2012 18:50:45 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Feb 8, 2012 4:53 PM, "Khem Raj" <raj.khem@gmail.com> wrote:
>
> On Wed, Feb 8, 2012 at 7:15 AM, Bernhard Reutner-Fischer
> <rep.dot.nop@gmail.com> wrote:
> > I am merging your future branch into master ATM. A couple of questions:
>
> Bernhard
>
> As i have said earlier currently there are regressions where X does
> not start. and its hard to tell

Core-image-sato does not build for me due to some buggy package that
unconditionally uses *netgrp() or the like.
Not amused, way out without going beserk?

