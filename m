Return-Path: <pbasista@gmail.com>
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
	[209.85.167.195])
	by mail.openembedded.org (Postfix) with ESMTP id AA9826C5C1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Nov 2018 23:33:12 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id u18so20956539oie.10
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Nov 2018 15:33:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=jJLSNkE5yTGjoddpgjXtSkftz6AwZMDzFUyUNbxD6BY=;
	b=KJDUImc22XreLHuaBrzImg+QoOB+AkL02/hiHvlM1AnEsO/qbNUNTAw+Yd3Eq4X4N6
	7jAEol5zDn4RjHU3faMQAsnUhh0PMSXxkl32nLnQ6x1ZdhIuupIMRR/ivA30309x4eje
	0tGJlI5GL1bRgUk6V4iAxCMlZL0ICMzrJp++/9VOsfntrYCgFVZ0GoVo/GEJBG3P5I3n
	bN9utTXdhYbh84Uq2Mds2OXyEK5DiljUM51XP1cEDIFMoqDOFTgvRj801vWHulAbFijo
	2TvLxDjMCb20I2VYcjethnHh7o7iVl7vgZNBudek3hSllase+HrUGWnYrCztAvbiOq/e
	l98g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=jJLSNkE5yTGjoddpgjXtSkftz6AwZMDzFUyUNbxD6BY=;
	b=a0rppw/NY3GxiCmwifzBZcwqexVyK4V74UXx3kbpciPJJryv7ae+XYKaN1FI6hhub2
	B9B8dEHSPdyqwdboIaj/c1quookgs1kIKQejjgEAIbWDVhuruLA7p4o4GeJltmk1PeNk
	Wq2qcgi8f5CcfYYRpvJtyrbEFBDAwWiqYyd1i0KATP5QrveZoB5eY2uvectIKul3juFJ
	62O0Zm7MIbba+qg+GZiu+X+j/SSmgJuWnBI1cYuuWNF4/QmzdbNu/4+SSDLEM+d7DCno
	VR7p2QwUWSfSHOuVHewdMlrpWxidW/auOt0qX3ygo+EApePoe3NGqhK8yHPJ4cyAZWpB
	q3xQ==
X-Gm-Message-State: AGRZ1gLyhW2FrB8Jlfe1js5WLmlHcPHK5tvA1IiFsIy4IdHpQ4qjBagc
	vYyv5XdHgB0jtD6qkpE5GQG28jhC2UzkkYaRI+I=
X-Google-Smtp-Source: AJdET5cKzflH8a/6bonnGcqvpWp7kgOopnOKkId8ovx1yTzD15fTDIwTo/Xtbp1Yu/2P+raq1zraIzz/NsfXYuOB83E=
X-Received: by 2002:aca:cfca:: with SMTP id
	f193mr18507627oig.141.1543361593428; 
	Tue, 27 Nov 2018 15:33:13 -0800 (PST)
MIME-Version: 1.0
References: <20181123223022.30597-1-pbasista@gmail.com>
	<CA+chaQetQT7MbnrguBOhzANeL-w734KQRzWwcaL2+6oEwp-7zQ@mail.gmail.com>
In-Reply-To: <CA+chaQetQT7MbnrguBOhzANeL-w734KQRzWwcaL2+6oEwp-7zQ@mail.gmail.com>
From: =?UTF-8?Q?Peter_Ba=C5=A1ista?= <pbasista@gmail.com>
Date: Wed, 28 Nov 2018 00:33:02 +0100
Message-ID: <CA+2FH0Leh1eR3sfhsSU4EfG+mQzo_em_tqfXaUCVZ_EzRhRa1Q@mail.gmail.com>
To: martin.jansa@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-multimedia][PATCH v4] Add a working Tvheadend recipe
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
X-List-Received-Date: Tue, 27 Nov 2018 23:33:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 27, 2018 at 11:31:46PM +0100, Martin Jansa wrote:
> What is supposed to provide libdvbcsa? It's not in any public layers
> registered here:
> https://layers.openembedded.org/layerindex/branch/master/recipes/?q=3Dlib=
dvbcsa
I am not familiar with this list, so I am not quite sure why it does not
appear there.

I am using the oe-alliance build environment:
https://github.com/oe-alliance/build-enviroment

which uses among others also this repository of recipes:
https://github.com/oe-alliance/oe-alliance-core

It contains libdvbcsa:
https://github.com/oe-alliance/oe-alliance-core/blob/4.2/meta-oe/recipes-mu=
ltimedia/libdvbcsa/libdvbcsa.bb

I thought that the following two "meta-oe" directories:
http://cgit.openembedded.org/meta-openembedded/tree/meta-oe?h=3Dmaster
https://github.com/oe-alliance/oe-alliance-core/tree/4.2/meta-oe

are supposed to contain the same recipes. But it turns out they are
different.

Only the first one appears in the list you have mentioned
while the libdvbcsa recipe only appears in the second one.
I do not know how such a situation is supposed to be handled properly.

Regards
Peter Ba=C5=A1ista

