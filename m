Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dbaryshkov@gmail.com>) id 1OLDeP-00051L-9Y
	for openembedded-devel@lists.openembedded.org;
	Sun, 06 Jun 2010 13:04:22 +0200
Received: by gwb20 with SMTP id 20so750505gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Jun 2010 04:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=0JrdDCv660STODTVjxZTxJEVcWtJWXguhY/1EspI714=;
	b=rvmLsybeVQFT7TdcKAQEYfbarlFLo97BZT0WwuaJCj4DzEYuIBtxZEdxTZCEgMyv/J
	CGWyM2GZFajwgH4YfZmCQc8PQ7pZ/8n61HN9GbJhSKUK8rV/A+p33eTBdcj5sE9Lj7T2
	mccJeGWjQs9QLL3fnDb6P6maFnGMGTLL/1W9U=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	b=Z8ml0jUAhrHLR3HhExZ5Xay5xz8xuJ6UTVmEJBgo3RFCXsjdFPWvFHYu0V9hwV7utr
	xMC2ymWurnvsgM5a69a3bmGZUOm1NbRtiNZTKGnxS1jGnr1AhnQDwcfvSzksFYfNm8SQ
	gQ3KPRv0W500lhO3A3wohHVTIea5Ctkp6S2ho=
MIME-Version: 1.0
Received: by 10.100.246.28 with SMTP id t28mr14437418anh.122.1275822001895; 
	Sun, 06 Jun 2010 04:00:01 -0700 (PDT)
Received: by 10.100.5.14 with HTTP; Sun, 6 Jun 2010 04:00:01 -0700 (PDT)
In-Reply-To: <20100604232423.GA9174@gmail.com>
References: <20100604232423.GA9174@gmail.com>
Date: Sun, 6 Jun 2010 15:00:01 +0400
Message-ID: <AANLkTimwSHpzMzYefLJglvpwptOt9cdpEOWGSmeeK6uM@mail.gmail.com>
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: dbaryshkov@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: pcmciautils: fix build to use flex from sysroots, not from host
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
X-List-Received-Date: Sun, 06 Jun 2010 11:04:22 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello,

On Sat, Jun 5, 2010 at 3:24 AM, Khem Raj <raj.khem@gmail.com> wrote:
> Hi
>
> This commit
>
> commit c65ee13298e8c22274b5bcabe06f2116b8b7ebf2
> Author: =A0 =A0 Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
> AuthorDate: Fri Jun 4 16:26:17 2010 +0400
> Commit: =A0 =A0 Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
> CommitDate: Fri Jun 4 16:44:18 2010 +0400
>
> =A0 =A0pcmciautils: fix build to use flex from sysroots, not from host
>
> =A0 =A0Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
>
>
> breaks the build when I have flex-native in ASSUME_PROVIDED.
> It there any specific reason why one should use flex from hosted sysroot =
?
> is the flex package on all distribution broken for some reason ?

Then we either:
1) have to put flex in prerequisites, check it in sanity.bbclass (and
drop flex-native)
2) have to fix pcmciautils to detect path to flex
3) expand some class to autodetect the flex/bison/etc. programs

Because currently pcmciautils just failed for me because I was building the=
m on
the box where I had no flex installed, but build (via some other dependancy=
)
in OE sysroot.

--=20
With best wishes
Dmitry


