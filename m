Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vb0-f51.google.com (mail-vb0-f51.google.com
	[209.85.212.51])
	by mail.openembedded.org (Postfix) with ESMTP id 316AF6A967
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jun 2013 07:28:48 +0000 (UTC)
Received: by mail-vb0-f51.google.com with SMTP id x17so4924332vbf.38
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jun 2013 00:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=S+wF2r4/fjT4MU6GHvsdYbqftEMJVH2iuN5s6rvvBsI=;
	b=SygTIUXbJTgzwF0OPOr+HTNsOMsQQzoNyPmDiuayiclIqTya6FVBsmh7eqIUkL/Y9t
	G4bzmgC0OAPpB292XT+ZeI0D+qIfETQNqp4Y509Hrfm2XCa//0R6zhDKwJQvU4bKm+h8
	BAwooTC+iXxri+Kz6e3TXc+/C2CM2TCQLwX/bcYJs76yRWM/yHf7BlDiLU0irpx22XXV
	FThwcipb808K0qJiqpU90aeavW5XtTtpGhiKB3ArU9+YTFCq7ZQOjmcr177Io5EKMNfU
	qOG554yAFtc8MUwwPnwJSBhbgAZfuO3KPnBE8PtPGRe/nni72P602FgaYo4BtASwX9MA
	GRNA==
MIME-Version: 1.0
X-Received: by 10.58.6.141 with SMTP id b13mr7564365vea.45.1370935728729; Tue,
	11 Jun 2013 00:28:48 -0700 (PDT)
Received: by 10.52.70.76 with HTTP; Tue, 11 Jun 2013 00:28:48 -0700 (PDT)
In-Reply-To: <CAMKF1spqaK7Lapq+ty4gpwu7n7OLhQrCevFxzaNQ72PLRhBQeQ@mail.gmail.com>
References: <1370928876-14423-1-git-send-email-schnitzeltony@googlemail.com>
	<1370928876-14423-12-git-send-email-schnitzeltony@googlemail.com>
	<CAMKF1spqaK7Lapq+ty4gpwu7n7OLhQrCevFxzaNQ72PLRhBQeQ@mail.gmail.com>
Date: Tue, 11 Jun 2013 09:28:48 +0200
Message-ID: <CALbNGRS33w6-qiM-fEcb4Amt3-dXv5VwdnxwS3Wh4vmEA-sCKg@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-gnome/meta-oe/meta-xfce 11/15] networkmanager: rework settings/dependencies for polkit/consolekit
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 11 Jun 2013 07:28:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 11, 2013 at 8:59 AM, Khem Raj <raj.khem@gmail.com> wrote:
> On Mon, Jun 10, 2013 at 10:34 PM, Andreas M=C3=BCller
> <schnitzeltony@googlemail.com> wrote:
>> +PACKAGECONFIG =3D "${@base_contains('DISTRO_FEATURES','systemd','system=
d','consolekit',d)}"
>
> intention is to have either systemd or consolekit but not both at same
> time is that correct ?

yes - FWIW I took this one from polkit

