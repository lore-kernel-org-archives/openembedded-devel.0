Return-Path: <eric@eukrea.com>
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
	by mail.openembedded.org (Postfix) with ESMTP id 02B116A528
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 May 2013 15:10:30 +0000 (UTC)
Received: from e6520eb (pac33-2-82-240-38-71.fbx.proxad.net [82.240.38.71])
	(Authenticated sender: eukrea)
	by smtp2-g21.free.fr (Postfix) with ESMTPSA id A78804B021F;
	Tue, 28 May 2013 17:10:25 +0200 (CEST)
Date: Tue, 28 May 2013 17:10:24 +0200
From: Eric =?UTF-8?B?QsOpbmFyZA==?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130528171024.51624971@e6520eb>
In-Reply-To: <51A4C7C1.6050706@mlbassoc.com>
References: <1369604103-31315-1-git-send-email-raj.khem@gmail.com>
	<1369604103-31315-2-git-send-email-raj.khem@gmail.com>
	<51A4C7C1.6050706@mlbassoc.com>
Organization: =?UTF-8?B?RXVrcsOpYQ==?= Electromatique
X-Mailer: Claws Mail 3.9.0 (GTK+ 2.24.16; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Subject: Re: [meta-browser][PATCH 2/2] chromium: Add recipes for 29.0.1518
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
X-List-Received-Date: Tue, 28 May 2013 15:10:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Gary,

Le Tue, 28 May 2013 09:05:37 -0600,
Gary Thomas <gary@mlbassoc.com> a =C3=A9crit :
> Have you tried this?  I just built it for my ARMv7a (i.MX6Q SabreLite) an=
d it
> seems to hang up on any page that uses JavaScript.  Try most any of the l=
inks
> on the "Chrome Help" page.
>=20
> Maybe I'm missing something?
>=20
can you try to change=20
    'v8_use_snapshot': 1,

to=20
    'v8_use_snapshot': 0,

in oe-defaults.gypi ?

Eric

