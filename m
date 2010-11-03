Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PDlav-0006Cz-T5
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Nov 2010 23:14:15 +0100
Received: by gyf3 with SMTP id 3so955541gyf.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Nov 2010 15:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=V5K64J5NiU3zWmJzvIHMhSRT/KOiGin5bKXCbvC4oEE=;
	b=oPq6pJxmLkpHDuAMMAI4IPYF5bpRY+Hh8wfj5XLEB3eOHEG2o8oBu1yFA5iVketA8u
	P4fkaLzOcDqh5uuJKb+cCkBvH943zGuyRV7JpsiSyyCjLKuqgf43uKYCAWfb5YJ6rkMA
	mEnFnWji22/uGNS57g+Uf5bEEhRLY3MJVD02Y=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=nKLaoJ5/ib5u95al1+UGQw6Qj2TudnZ5qS4epZCwxBnkOkoeJn0VGZzTVRir7By82E
	7DIyDR8uJBkxqVrrP6UiSP825ols+2wTxzvJT8QvkskthJ2QGj65lf4zBe7WhHyx5IrW
	hIxFvHE0uJxlm24jaJQIpwgzFPiH8kGDD+/J0=
Received: by 10.90.20.1 with SMTP id 1mr124538agt.145.1288822401013; Wed, 03
	Nov 2010 15:13:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.91.135.18 with HTTP; Wed, 3 Nov 2010 15:13:00 -0700 (PDT)
In-Reply-To: <AANLkTikNnKRhrVWf0J92eazn=C4p4anByx3F+mJBj3kK@mail.gmail.com>
References: <i9p1d0$7q4$1@dough.gmane.org>
	<AANLkTimRY+gDbK9jZvUEuxMAu3PvQ8pnfb3oXjAXeU0B@mail.gmail.com>
	<iaptb1$bpb$1@dough.gmane.org> <4CD07F3E.7040703@eukrea.com>
	<4CD080E2.2000706@mentor.com>
	<AANLkTi=3GwhFb27DDyHnOcQEk1oskP1NSEUw_qaZdNyr@mail.gmail.com>
	<4CD178C2.9010303@mentor.com>
	<AANLkTi=D76QqygmJRdOPEeZJNL9N2X0vyYV8UPVNDPDH@mail.gmail.com>
	<4CD1C33D.3040207@mentor.com>
	<AANLkTiknWyRh2L9u9jbgYgvK5dXx7x2VFeKGhh89TAxJ@mail.gmail.com>
	<AANLkTikNnKRhrVWf0J92eazn=C4p4anByx3F+mJBj3kK@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 3 Nov 2010 15:13:00 -0700
Message-ID: <AANLkTikK6_rzCr3wGONnLwBjGtbfp8ycwfhfu77eXTQZ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] turning conf/machine into a set of bblayers
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
X-List-Received-Date: Wed, 03 Nov 2010 22:14:17 -0000
Content-Type: text/plain; charset=UTF-8

>>
> I'm not planning to.
> This would be the solution if for one reason or another gcc 4.1.2 was
> kicked from the base layers (or the associated binutils).
> I have a very strong preference ot keep them in the base layer.
> This was only intended as an example.
> Apologies for the misunderstanding and confusion.
>

No recipes that are actively used should ever be deleted.

> FM
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


