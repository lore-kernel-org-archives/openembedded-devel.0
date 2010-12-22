Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1PVRnc-00008C-BK
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Dec 2010 17:44:24 +0100
Received: by wwi17 with SMTP id 17so5227546wwi.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Dec 2010 08:44:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:cc:content-type:content-transfer-encoding;
	bh=mmgQWYWR+D9E0PH4Usy8z2g8nIvdYlxsCIKFYcEEki4=;
	b=tkwBiIktBIBxRfT5SR4kmbcusbnKEa99GLLprkTXnyMM1QNkldrrg+bq2MDdX5PxMC
	eOfT50H7D2PD4lxI1+lfvqOlgn6Gh2KeEhcfRKCTvDJaEiCO5eTEmjxgNvOPVRcwggCC
	qv2qr3KxPXndf0SGGSbnRSECHldYmbJCWvA04=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type
	:content-transfer-encoding;
	b=XYAE9Xkr0+zJGO0DaBae8/DCTQnSdnOjZPPSjh5CLXwB8aFZ2ChGXtb5FAH67JX/9r
	WI1CZirapzPJI+dQJloYbA6enhixV4WQFMri72E6Fy7cLs6NZHZfzStaHgMAnjO/lVvc
	CuDUaImPLj2QiLioLVUpZUwHxD1awzQF6t9f8=
Received: by 10.216.150.134 with SMTP id z6mr7980521wej.27.1293036253450; Wed,
	22 Dec 2010 08:44:13 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.67.67 with HTTP; Wed, 22 Dec 2010 08:43:53 -0800 (PST)
In-Reply-To: <4D1228DF.6090004@mentor.com>
References: <1293016481-703-1-git-send-email-koen@openembedded.org>
	<AANLkTinhDm2O+71-+ec_LX1DOQ9bO6gpiwNOE3fauswA@mail.gmail.com>
	<iesrb1$mue$1@dough.gmane.org>
	<AANLkTinurP-H+XiaeLgaUe6Uq6oN5xYd1H0QnqiyhEW_@mail.gmail.com>
	<4D121D05.4090806@mentor.com> <iet6s1$h1r$1@dough.gmane.org>
	<4D1228DF.6090004@mentor.com>
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 22 Dec 2010 09:43:53 -0700
X-Google-Sender-Auth: VgAFJprVNK5v6XZ1v8Tsg5QWhE4
Message-ID: <AANLkTi=+2cXyskJw=U-yQ-R94z7UO_U09h4EO_e=+=1p@mail.gmail.com>
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
X-List-Received-Date: Wed, 22 Dec 2010 16:44:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 22, 2010 at 9:35 AM, Tom Rini <tom_rini@mentor.com> wrote:
> I agree and would like it done soon too (well, I'd almost rather see 1.11=
 be
> required, yaaay parallel parsing) but since we can't tell 1.10.0 from .1 =
and
> I don't think this week (since that's just a few more days) is too bad.
> =C2=A0Chris, when can you do a 1.10.2?

I might be able to get to it today.  We really need to make the
process more automated.  We should also stop using berlios for bitbake
release tarballs and just rely on the oe site / freshmeat / cgit, imo.
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


