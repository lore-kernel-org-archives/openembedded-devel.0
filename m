Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ua0-f193.google.com (mail-ua0-f193.google.com
	[209.85.217.193])
	by mail.openembedded.org (Postfix) with ESMTP id 2FA3262132
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Dec 2016 12:39:55 +0000 (UTC)
Received: by mail-ua0-f193.google.com with SMTP id 50so31781014uae.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 Dec 2016 04:39:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=782Xb1FBdy6x5r/cMR9nogMXSkQwGJn4t7tXBiUcM7k=;
	b=isEoduJFpunhlZ3fDiej48Iqrco3RO/fIJGrb2uwoXsmtsXBGM15XhUj71t8IYaM6M
	F3uxxCKSkJ/2kNPGqy7kkhR9bjoQQ0RNTtHR7QYLm46leg2LE9Zm3FyeLDzoYEkMbrT3
	pQ8TrL2YKbwTj5/4mKmnjhCrPZ75fr9Lbs9JX2viP1M2tmJAU1zK/XCj5b+8hZSsIwqT
	qjLMtTgTTy3Zlg9cKRpw/8K2K8sl6EB5BHGmgDZkFvWTAKk5EBkMWqaeSCCTjZqL/O1t
	uphZas5BMcjkM+V3vt6D7JX3xS8SAnctARJncOwZCwWuRLm5nUp0n+2cjS/6H+3qN4Jo
	7jdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=782Xb1FBdy6x5r/cMR9nogMXSkQwGJn4t7tXBiUcM7k=;
	b=cFd3a1Ln445WxDgrLbL9rOHU3gvxsJKnRyo6QbvAWtjfSnMFzbx6nT/gUXRUNGaOhZ
	f7P559YruhcCB2Gx9MGWQejhEtmx6X/+x1pbIjDUIxu3fS928evKVelk2YcJtXKobCzl
	sIsD1WUWyI0MDQPJm0L6yw2knrPER1uKNZAJD1c9mAwJxb9PSdYhTiGwr7ZlpFUEAolP
	HB5NkBcfCG7MKrcbREcoYUwaMf0YYMuMkMn+fJQwws87Yelm0STtVt56/rPvNavRVDcP
	/mZ0ngyYSx8U0SG6ZIE9c3ebiFblbos0S9DwUNIyXba4ytmVxQ2ZLH2Tb+X9ehEkCLdM
	EpVA==
X-Gm-Message-State: AKaTC03Ka5bKcgJwWvwEDW1eyLOjFW/R3vY7kcX+6e9yohLQV3JmFie6uv4VEr6AJxaV+Q==
X-Received: by 10.159.41.36 with SMTP id t33mr25718295uat.142.1480941596717;
	Mon, 05 Dec 2016 04:39:56 -0800 (PST)
Received: from mail-ua0-f175.google.com (mail-ua0-f175.google.com.
	[209.85.217.175]) by smtp.gmail.com with ESMTPSA id
	w135sm4124892vkw.11.2016.12.05.04.39.55
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Dec 2016 04:39:55 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ua0-f175.google.com with SMTP id 51so346511851uai.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 Dec 2016 04:39:55 -0800 (PST)
X-Received: by 10.176.84.8 with SMTP id n8mr8409117uaa.29.1480941595319; Mon,
	05 Dec 2016 04:39:55 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.182.83 with HTTP; Mon, 5 Dec 2016 04:39:54 -0800 (PST)
In-Reply-To: <1480940003.17535.32.camel@gmx.de>
References: <20161129164817.16671-1-dev@codyps.com>
	<CABcZANkz-QEg-+rLr0q-W8BD5K6Z=UFs3MUpZHQXRO+T2xF2hw@mail.gmail.com>
	<1480940003.17535.32.camel@gmx.de>
Date: Mon, 5 Dec 2016 10:39:54 -0200
X-Gmail-Original-Message-ID: <CAP9ODKoKgUXWkor0+fKX=HONz6zBTPLUKJ04tEYDACPvfGA8zA@mail.gmail.com>
Message-ID: <CAP9ODKoKgUXWkor0+fKX=HONz6zBTPLUKJ04tEYDACPvfGA8zA@mail.gmail.com>
To: Patrick Ohly <patrick.ohly@gmx.de>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	Otavio Salvador <otavio@ossystems.com.br>,
	Mario Domenech Goulart <mario@ossystems.com.br>
Subject: Re: [meta-java][PATCH] move from bb.data.getVar(x, d, 1) to d.getVar(x, True)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 05 Dec 2016 12:39:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 5, 2016 at 10:13 AM, Patrick Ohly <patrick.ohly@gmx.de> wrote:
> On Tue, 2016-11-29 at 13:16 -0700, Christopher Larson wrote:
>> On Tue, Nov 29, 2016 at 9:48 AM, Cody P Schafer <dev@codyps.com> wrote:
>>
>> > bb.data.getVar was removed, need to use the modern mechanism.
>> >
>> > Signed-off-by: Cody P Schafer <dev@codyps.com>
>> > ---
>> >  classes/java-library.bbclass              |  4 ++--
>> >  recipes-core/icedtea/icedtea7-native.inc  |  2 +-
>> >  recipes-core/openjdk/openjdk-7-common.inc |  2 +-
>> >  recipes-core/openjdk/openjdk-8-common.inc | 10 +++++-----
>> >  recipes-core/openjdk/openjdk-common.inc   |  6 +++---
>> >  5 files changed, 12 insertions(+), 12 deletions(-)
>> >
>> > diff --git a/classes/java-library.bbclass b/classes/java-library.bbcla=
ss
>> > index 144cd2f..58d5a40 100644
>> > --- a/classes/java-library.bbclass
>> > +++ b/classes/java-library.bbclass
>> > @@ -23,8 +23,8 @@ def java_package_name(d):
>> >    pre=3D""
>> >    post=3D""
>> >
>> > -  bpn =3D bb.data.getVar('BPN', d, 1)
>> > -  ml =3D bb.data.getVar('MLPREFIX', d, 1)
>> > +  bpn =3D d.getVar('BPN', True)
>> > +  ml =3D d.getVar('MLPREFIX', True)
>> >
>>
>> If you=E2=80=99re working on master, even the =E2=80=98, True=E2=80=99 i=
s no longer needed, FYI.
>
> I suspect that meta-java master is meant to work with more than just
> bitbake master, so keeping the parameter makes sense.
>
> I think the change is okay and I'd love to see it merged as soon as
> possible. In Ostro OS, updating to bitbake and OE-core master is blocked
> by this meta-java incompatibility with bitbake master.
>
> Can someone with commit rights to meta-java please merge it?

We are on it. Fabio is testing the meta-java patches for merging.

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

