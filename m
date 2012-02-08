Received: from mail-lpp01m020-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RvDB0-0007RR-7E
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Feb 2012 20:27:34 +0100
Received: by lbol12 with SMTP id l12so446301lbo.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Feb 2012 11:19:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=5xoEYrz8+PMKp/JNz8YHofG5Cu6l9Mcn3k/CLSZk8vY=;
	b=t7OJnCPwR/tPY+z3AUa5O0O3DI7HHHNscplF8fZE48sBW/q12TjkD8g9r432jhbNXu
	piRMykEKs7DLj6jjqV19I0AuPoUjy1tL2DZPh6gRV6FwX51O2t/OmzZf0mBOGVlgsjqZ
	jxwaUD229+gcQRIimbsP0Ld26HBNm9BljiV0w=
Received: by 10.112.32.1 with SMTP id e1mr8493809lbi.3.1328728770320; Wed, 08
	Feb 2012 11:19:30 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.5.201 with HTTP; Wed, 8 Feb 2012 11:19:00 -0800 (PST)
In-Reply-To: <CAC1BbcTHi_rKU7yjBVYpRBv9V_1vdvHE-qFrs+TG4taxg85Tog@mail.gmail.com>
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
	<CAC1BbcTHi_rKU7yjBVYpRBv9V_1vdvHE-qFrs+TG4taxg85Tog@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 8 Feb 2012 11:19:00 -0800
Message-ID: <CAMKF1soUL2p=ymicjq6UtiGWvM2_BBMU1JLNR4H+Db+YXOOimw@mail.gmail.com>
To: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
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
X-List-Received-Date: Wed, 08 Feb 2012 19:27:34 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Feb 8, 2012 at 10:42 AM, Bernhard Reutner-Fischer
<rep.dot.nop@gmail.com> wrote:
> Core-image-sato does not build for me due to some buggy package that
> unconditionally uses *netgrp() or the like.
> Not amused, way out without going beserk?

Yeah with future branch here is my patch. git am it.

http://uclibc.org/~kraj/0001-uclibc-git-Update-to-latest-plus-future-branch.patch

apply that on master of oe-core

then set

UCLIBCVERSION = "0.9.33+gitr%" in local.conf


