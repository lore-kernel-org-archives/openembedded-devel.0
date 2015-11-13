Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ig0-f180.google.com (mail-ig0-f180.google.com
	[209.85.213.180])
	by mail.openembedded.org (Postfix) with ESMTP id 146BD772DC
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Nov 2015 11:39:17 +0000 (UTC)
Received: by igl9 with SMTP id 9so13804164igl.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Nov 2015 03:39:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems_com_br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=Yoq3MYx9VRN8RsWFhU6Xopfi9UKetOiCEaGWPFWg+Wk=;
	b=DDHnTB4RM6+WUaddRYBIBKXPayJFdW97k7s9Xph09cna0PcHaQNWq5gxb+6RFGfga5
	TixZQ81oGH/RPEo2uhfxJp5XGOPfNsvVpEMFHiPQFWSi4zQrHUHZsTbBt6nbh39s7ZAN
	KDRfhtoIR1KpkHPMFMIpyBA2q6RrlNJmKlB/hb1YWdookBmIheqMYukvNz4pa6+icEgn
	g/s1czoDsyHy2XoGvaHxCTpf97+cxJC1Ls5+FS4ftMoUbtQIJ/+LSRHzwSN6JK4pBpZv
	LkB0yv/eINgEp+7pWQLKL237uoN5CqTTqvRge9FbKn9cN15P9/fdbiRRKc5tfoVlcqyU
	++IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=Yoq3MYx9VRN8RsWFhU6Xopfi9UKetOiCEaGWPFWg+Wk=;
	b=H6eZ+6GXNPYSIPvrUBzZgjhlrrIkGiRT0OtZh0afQ9WdpD4hcfOcUjYz7ePLDDeU9C
	H/xb0doLsIC56xYPAN1ze08vQKQOCNkjOsuYuIHRM4L1yV1ZjPyWgKNU/Id7qkLJD6Pl
	h85tTs5O2NFxtKxj9we8lLa0PgbCneDq2gmcxgvgliLJv+CCxYUlIxKx4jNMlAwSYuQo
	8IU/PHTqIjup9kzk1sKC7WV7sLl24cWMcHhyFIJWevgeMuVxW1mSoy4uQgaTQd/pZt/w
	WVBxEOcQOB//6IHgJshAOaVJoYHyUyin1W9k5fqDRM5sEQIJ+v9E2PsqgjKw1AUE70Qg
	mb8Q==
X-Gm-Message-State: ALoCoQmnTGIAVyl8WzikAQCXBsrN0cNMYCfqFVL2Y0oQelLBOB+TYWjJxQl0sIc9Y1io46GBLiHA
X-Received: by 10.50.180.35 with SMTP id dl3mr2846068igc.18.1447414757711;
	Fri, 13 Nov 2015 03:39:17 -0800 (PST)
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com.
	[209.85.223.177])
	by smtp.gmail.com with ESMTPSA id e8sm1200028igl.9.2015.11.13.03.39.15
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 13 Nov 2015 03:39:16 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by iofh3 with SMTP id h3so94759498iof.3;
	Fri, 13 Nov 2015 03:39:15 -0800 (PST)
MIME-Version: 1.0
X-Received: by 10.107.160.198 with SMTP id j189mr19145294ioe.37.1447414755538; 
	Fri, 13 Nov 2015 03:39:15 -0800 (PST)
Received: by 10.36.15.197 with HTTP; Fri, 13 Nov 2015 03:39:15 -0800 (PST)
In-Reply-To: <4335862.fNWyiaI9Bu@peggleto-mobl.ger.corp.intel.com>
References: <58488.10.252.13.130.1447346734.squirrel@linux.intel.com>
	<CALbNGRTcwpywgtSJvm-q6aZHK5vaF5BFcxmKseHYjcy6aWnmBg@mail.gmail.com>
	<4335862.fNWyiaI9Bu@peggleto-mobl.ger.corp.intel.com>
Date: Fri, 13 Nov 2015 09:39:15 -0200
X-Gmail-Original-Message-ID: <CAP9ODKqk4B_i+59asEqoVNjkynBWTACD0cM4f0JdxMCopprTkA@mail.gmail.com>
Message-ID: <CAP9ODKqk4B_i+59asEqoVNjkynBWTACD0cM4f0JdxMCopprTkA@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] qt4 moves out of oe-core - to meta-qt4, or to meta-oe?
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
X-List-Received-Date: Fri, 13 Nov 2015 11:39:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2015 at 5:08 PM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> On Thursday 12 November 2015 18:03:27 Andreas M=C3=BCller wrote:
>> On Thu, Nov 12, 2015 at 5:45 PM,  <alexander.kanavin@linux.intel.com> wr=
ote:
>> > Hello,
>> >
>> > now that 2.0 is out, it's time to move the Qt4 recipes out of oe-core.
>> > This has been discussed previously here:
>> > http://lists.openembedded.org/pipermail/openembedded-core/2015-June/10=
6355
>> > .html
>> >
>> > I'm not sure where the recipes should land, and want to ask your opini=
on.
>> > The options are:
>> > 1) Make a new layer, meta-qt4, under meta-openembedded tree. Move also
>> > everything in meta-oe/recipes-qt (and possibly other spots) to that la=
yer.
>> > This is somewhat more disruptive to people's layer configurations, but
>> > would clearly separate qt4, and slim down meta-oe.
>> >
>> > 2) Simply move the qt4 recipes from oe-core to meta-oe/recipes-qt, so =
they
>> > will be next to all the qt4-based software. This is less disruptive, b=
ut
>> > adds bloat to meta-oe.
>> >
>> > Preferences?
>>
>> 1) or even better in a separate repo
>
> To be honest, I had anticipated this being a separate meta-qt4 repo mysel=
f. It
> would be consistent with what has been done with Qt 5 and much earlier wi=
th
> Qt 3.

Agreed.

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

