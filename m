Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f54.google.com (mail-wg0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 34E3C72A78
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Apr 2015 11:00:48 +0000 (UTC)
Received: by wgin8 with SMTP id n8so111545119wgi.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Apr 2015 04:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=44La8MGG+j8uk6OnZNMPSG7oJpCx6qhKNenoOP8mxgo=;
	b=vCj9ObGTsJWP45ESyyi/DtSpWW9nFtIR3HmyB4UP4eqdKA8Ruol6tmmSzd1DFYkoqB
	ce9z8xiBaiYoG8tmqmtSPKtlsj4BCv7cJGrP/SN6mMClS/a/Gp2uUjMU5odB0oIfg5mz
	6S1nzLrIoVAl3XpQdAqTPHPLmMV7Y3eqnmxLcrmvyuQjxgmi3wZjURB+TlGvA/i5MBPM
	hpgc1hIoLc/1W/qQ537YuH0hJgo23bDTKqQX8wIQ3zseiPzXFWkiXcTIhTpGEHfhKbdf
	1T3biE5J23lprO4qAfhFD6hR0v2f6OgRO797u45hcMfQCaoKZjOBjwrbXcKaIZG60KBs
	5qlw==
X-Received: by 10.194.90.47 with SMTP id bt15mr21799622wjb.41.1430132449247;
	Mon, 27 Apr 2015 04:00:49 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id m1sm11124502wiw.7.2015.04.27.04.00.48
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 27 Apr 2015 04:00:48 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 27 Apr 2015 13:01:45 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150427110145.GC2379@jama>
References: <1429890232-20762-1-git-send-email-cristian.iorga@intel.com>
	<20150427045319.GA6712@ad.chargestorm.se>
	<2199106.4TMPZeLVjV@peggleto-mobl.ger.corp.intel.com>
	<CAJTo0LYZzODifjO+11BunepKdoGv5=ftfhmheNBjbf-Yios8Eg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYZzODifjO+11BunepKdoGv5=ftfhmheNBjbf-Yios8Eg@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Anders Darander <anders@chargestorm.se>
Subject: Re: [meta-oe][meta-systemd][PATCH V3 1/2] bluez4_4.101.bbappend: update according to bluez4
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
X-List-Received-Date: Mon, 27 Apr 2015 11:00:49 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 27, 2015 at 11:54:49AM +0100, Burton, Ross wrote:
> On 27 April 2015 at 09:28, Paul Eggleton <paul.eggleton@linux.intel.com>
> wrote:
>=20
> > > If you look at meta-systemd today, you'll see that there's only a min=
or
> > > number of recipes from oe-core, that's being appended. All the other
> > > recipes that previously where appended to from meta-systemd, has got
> > > their systemd support directly in their own recipes.
> >
> > It depends on what you mean by systemd "support". What's left over in m=
ost
> > of
> > the meta-systemd bbappends is RPROVIDES/RREPLACES/RCONFLICTS on the pac=
kage
> > names which we haven't used for a couple of years by now; surely at some
> > point
> > we should let those die with meta-systemd?
>=20
>=20
> FWIW I agree here. Those names are only for compatibility with
> meta-systemd, so they can stay in meta-systemd and eventually be retired.

They were already migrated from meta-systemd to meta-openembedded/*
layers long time ago, so now when bluez4 is being added to meta-oe then
for consistency sake it should get these names inside of the recipe as
well.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

