Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P1vNm-0008IZ-VA
	for openembedded-devel@lists.openembedded.org;
	Sat, 02 Oct 2010 08:15:44 +0200
Received: by iwn2 with SMTP id 2so4698532iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Oct 2010 23:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=JL/RCY3RHMZR57Rq2Jvqn/on7523aTjq+bYGt+7v+4Y=;
	b=SW+lNT/eXQTsI2GOFiTFt2X3gkxcpmUSqC/+trRSIoGbI5gC7qkBNOEK8wxhgrt9Bo
	fPnPPPrtJ2ATmZhQb6aMeafmTgche571xS/utoQoTXU5PmtoX1iEbOyKVC0xbLzc18XX
	TkOp4vSeik7FMB3nhqXiQn7Y/Fbf7/UavCjuE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=GIsfIJTvmHijSv9fk+VDBK1rn7U+k+r0UFf1gFbvHI3RwzTbPYnoxljfl7mjzEdUxh
	kcoOkvHumU+4vmb0CMQcu3usrfLRKfIlDY7At+3FV0C9XQSImPt3I8J3dsmiS5en3Rej
	KP3zr214TBzqTbPjHySYE+g6waCmvmP64ELW0=
MIME-Version: 1.0
Received: by 10.231.193.11 with SMTP id ds11mr5232754ibb.192.1286000123643;
	Fri, 01 Oct 2010 23:15:23 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Fri, 1 Oct 2010 23:15:23 -0700 (PDT)
In-Reply-To: <131E5DFBE7373E4C8D813795A6AA7F080310F21152@dlee06.ent.ti.com>
References: <1285344532-25131-1-git-send-email-chase.maupin@ti.com>
	<4CA64203.6070702@freyther.de>
	<131E5DFBE7373E4C8D813795A6AA7F080310F21152@dlee06.ent.ti.com>
Date: Sat, 2 Oct 2010 08:15:23 +0200
Message-ID: <AANLkTi=jOASbOCEWLeTZwN-VP2ct82s=c_TzgdhDyZnR@mail.gmail.com>
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
Subject: Re: [PATCH] recipe licenses: update recipe LICENSE fields
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
X-List-Received-Date: Sat, 02 Oct 2010 06:15:44 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/10/1 Maupin, Chase <chase.maupin@ti.com>:

>
> I understand. =A0How should we denote recipes that have dual licenses? =
=A0I figured "GPLv2 NewBSD" mean it was either license. =A0Perhaps this sho=
uld be "GPLv2+NewBSD"?

The perl recipes use |
e.g.
libtest-pod-perl_1.42.bb:LICENSE =3D "Artistic|GPL"

BTW, if you feel like cleaning up the LICENSE stuff: while looking for
the above I noticed some perl modules didn't have LICENSE set (or to
"") and others might have it wrong.

Frans


