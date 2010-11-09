Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1PFxRs-00072M-Ur
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Nov 2010 00:17:57 +0100
Received: by wyb34 with SMTP id 34so22666wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Nov 2010 15:16:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=b71i/73vG+0Okq2zBcK3NKF0eheBLkbAr9u7Abo1L+4=;
	b=rEJVA0BNeUPZ90HhUhjSqSWjEvLPPNqcd4fmPLL7dyNFVs5nxfZgE77gxNI5Uyc2/Q
	Ffhy02hH7X24ZZUWJvqUD6j2hdTvTrgJ6crICyu7NcNPWqp9rXEMy43SmCYDWQ9eP4C/
	unkLtRMXgvx/wjfy6BMRKMT5fAnCx6rBbCB6E=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=Q0+g4y1bCVfdFn1I/tr+LmjQaM2SW6y8nzbhO0XudNddsZCnufmXs/3EACOwmqZT3x
	hJ5wbxupfXUR6SWOKJf3iNQFV7JW/vW3U4nlaHVhUbiG07kIewW/BMUSa4O9YMGFCADI
	FSvzuPY1+5LbwNBX0tgDVskS97Ir8z8FCGTpM=
MIME-Version: 1.0
Received: by 10.227.132.206 with SMTP id c14mr6809963wbt.78.1289344618185;
	Tue, 09 Nov 2010 15:16:58 -0800 (PST)
Received: by 10.227.32.147 with HTTP; Tue, 9 Nov 2010 15:16:58 -0800 (PST)
In-Reply-To: <AANLkTi=JbmuXAXPD=8jNS2kTsuC9SS=UL4vepkHw1Wqt@mail.gmail.com>
References: <4CD731A8.3020809@gmail.com>
	<AANLkTi=Rk8Fm_Xq08J89J-s4bx=QQeTHfMan4HZknYWs@mail.gmail.com>
	<AANLkTi=JbmuXAXPD=8jNS2kTsuC9SS=UL4vepkHw1Wqt@mail.gmail.com>
Date: Wed, 10 Nov 2010 09:46:58 +1030
Message-ID: <AANLkTiniF0VTUKNW9frOLmuwL=UHn6r3xo=aNt9d2F4W@mail.gmail.com>
From: Graham Gower <graham.gower@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: bitbake weirdness during -k world
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
X-List-Received-Date: Tue, 09 Nov 2010 23:17:58 -0000
Content-Type: text/plain; charset=ISO-8859-1

Problem(s) fixed by these commits.
http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=b6d7a41d8ae0c916b217264b135998ac2d8bce4c
http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=fe0b4102c33f7300aaf8b139ee2d73820e12d635

Thanks to Chris for pointing it out once I'd narrowed it down to a
particular recipe.

-Graham


