Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PVT6v-000206-J5
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Dec 2010 19:08:27 +0100
Received: by yxd5 with SMTP id 5so2424894yxd.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Dec 2010 10:08:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:cc:content-type
	:content-transfer-encoding;
	bh=ps02VTyNfeYmzD99KhgqC1fs+3kK61yz7Mf2CP3DyvA=;
	b=IBsqDYteLHAZ5wWVWXP+qjNtfIRbP7syB3jGJ5RjEEdXue34Hm9fCzoBLVSiXiEYf7
	VuY4LTGDFp9UHqk7H+UfTSh5NaOrA0c0osEBNF/DbUkheI+JcxUqg/HIXPb5WfHDtADO
	9abp9kLhBBhYl1Y8m6Jg2KlZrnO5br+gmxNHo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=qJImZdLUHHlRkAPi7RCWMZvaiTfiTSEx8Qi98WDjT40T2xRwAOdq8j8k6XNo3lTrQb
	c0hHl4am4ZdgcuNcW4aCcSpOW+cXcLGXKKBXI0WuEZyxtMcbl15HNoNgP2PzDAdge+Gg
	7dcew9zQ9pnLUx7CbuU2L8q5BqdfOpkKBB6UE=
Received: by 10.90.120.17 with SMTP id s17mr8847021agc.193.1293041296574; Wed,
	22 Dec 2010 10:08:16 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.86.4 with HTTP; Wed, 22 Dec 2010 10:07:56 -0800 (PST)
In-Reply-To: <AANLkTi=+2cXyskJw=U-yQ-R94z7UO_U09h4EO_e=+=1p@mail.gmail.com>
References: <1293016481-703-1-git-send-email-koen@openembedded.org>
	<AANLkTinhDm2O+71-+ec_LX1DOQ9bO6gpiwNOE3fauswA@mail.gmail.com>
	<iesrb1$mue$1@dough.gmane.org>
	<AANLkTinurP-H+XiaeLgaUe6Uq6oN5xYd1H0QnqiyhEW_@mail.gmail.com>
	<4D121D05.4090806@mentor.com> <iet6s1$h1r$1@dough.gmane.org>
	<4D1228DF.6090004@mentor.com>
	<AANLkTi=+2cXyskJw=U-yQ-R94z7UO_U09h4EO_e=+=1p@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 22 Dec 2010 10:07:56 -0800
Message-ID: <AANLkTi=U08hjE7qSRHQm29yd0B0dnUJ_6cTxABD4F2tC@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: Re: [PATCH] sanity: release 2010.12 is out, so bump minimum bitbake to 1.10.0 per TSC decision
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
X-List-Received-Date: Wed, 22 Dec 2010 18:08:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 22, 2010 at 8:43 AM, Chris Larson <clarson@kergoth.com> wrote:
> On Wed, Dec 22, 2010 at 9:35 AM, Tom Rini <tom_rini@mentor.com> wrote:
>> I agree and would like it done soon too (well, I'd almost rather see 1.1=
1 be
>> required, yaaay parallel parsing) but since we can't tell 1.10.0 from .1=
 and
>> I don't think this week (since that's just a few more days) is too bad.
>> =C2=A0Chris, when can you do a 1.10.2?
>
> I might be able to get to it today. =C2=A0We really need to make the
> process more automated. =C2=A0We should also stop using berlios for bitba=
ke
> release tarballs and just rely on the oe site / freshmeat / cgit, imo.

our cgit now has the possibility to download tarballs so proabably
just pointing to cgit ?
e.g. http://git.openembedded.org/cgit.cgi/bitbake/snapshot/bitbake-1.10.1.t=
ar.bz2
is there
and so are others

> --
> Christopher Larson
> clarson at kergoth dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus
> Maintainer - Tslib
> Senior Software Engineer, Mentor Graphics
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


