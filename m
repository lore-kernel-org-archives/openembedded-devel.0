Received: from mail-gh0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SpcXU-0001Ki-C2
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Jul 2012 11:51:56 +0200
Received: by ghbz2 with SMTP id z2so3115771ghb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jul 2012 02:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=0MBo26TGwArQXgTVML48AVs17LnlU9FkmcQqOUPWTk4=;
	b=pORR2l4XvJjWsSGSyN19/qEl1FhVYU6iKdFRf8MD1kubcuhynA4uinkKCFatha7Owo
	Vd0DFEIt0zaRqt/REKkkV9nP34bkZWN+mABikDivc0A+HpHwlNmrRqEz09kKjQDxSPZC
	iBKqj0eZlY9OAna21E2RxCw0KR+hjJ/wNk8a5zJ6sJ+LL3yfG0aQOD1SgDgJ9cEamXJS
	oWGVIV8NPRBglrbOqiOxez0ApHM8Kqns4F/NLrjNiAN79Dh05coXVVeQ/m3dtg902Bua
	C8UWz3/WrYAULTgSdpzrWcVell/0G8Mmhps2CAab/WbFxPjtkZY99fQ2+MGOH/ESCWje
	9XNA==
MIME-Version: 1.0
Received: by 10.50.181.232 with SMTP id dz8mr310654igc.36.1342172441307; Fri,
	13 Jul 2012 02:40:41 -0700 (PDT)
Received: by 10.64.9.165 with HTTP; Fri, 13 Jul 2012 02:40:41 -0700 (PDT)
In-Reply-To: <jtonri$ov3$2@dough.gmane.org>
References: <1342168240-7760-1-git-send-email-schnitzeltony@googlemail.com>
	<1342168240-7760-15-git-send-email-schnitzeltony@googlemail.com>
	<jtonri$ov3$2@dough.gmane.org>
Date: Fri, 13 Jul 2012 11:40:41 +0200
Message-ID: <CALbNGRR1ezjSQOaPwZpBDSdjHJ_GRLOuXUQ--ZJdaK07kDS-ow@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe, V2 14/32] udisks: move systemd support to meta-systemd
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
X-List-Received-Date: Fri, 13 Jul 2012 09:51:56 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 13, 2012 at 10:56 AM, Koen Kooi <koen@dominion.thruhere.net> wr=
ote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Op 13-07-12 10:30, Andreas M=FCller schreef:
>> Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com> ---
>> meta-oe/recipes-support/udisks/udisks_1.0.4.bb     |   10 +++-------
>> .../udisks/udisks/add-systemd-support.patch        |    0
>> .../recipes-support/udisks/udisks_1.0.4.bbappend   |   13 +++++++++++++
>
> As a more generic remark about udisks and systemd: no need to start this
> units on boot, they get automatically started when needed when using a GU=
I.
> I'm not sure there are any non-GUI users of udisks currently, but if ther=
e
> are, please speak up!
>
> regards,
>
> Koen
I did the udisks systemd patch long time ago [1]. At that time it
fixed automount problem in xfce dm-less environment. I will test
without starting on boot and let you know.

Andreas

[1] http://cgit.openembedded.org/meta-openembedded/commit/meta-oe/recipes-s=
upport/udisks?id=3Ddc32361d19b49c9cb2df1d73dc61dfe7255a11b2


