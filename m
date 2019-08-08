Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id B23B37F2AE
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Aug 2019 15:56:08 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id i18so44284991pgl.11
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Aug 2019 08:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:organization:message-id:date
	:user-agent:mime-version:in-reply-to:content-language;
	bh=YDx4YMXDmzkwd3XhSGyHS8JyNUQHiVi93oSnNzJu3x0=;
	b=k7Tmo3dwhIOnoRoF7Y4gXPwDV+bkbGgau1QU/tADW0N5zhcA+CnXhMPo4ZxMbCWpxD
	bHJtw4RU/DhhbK0q958y5rZPonp00dXKKhm+olLsbe6QFX3OKa/YyaPCBzbDKb2/5bLw
	jlN6dz+bmHHL3A1QxWlZ692e2L02h55kMn0RIbOfM4jXx+fOdhwFvHw9qlnOr5Jr6nxj
	+61lYJjDRYOzi4AFF6F32Bh87imzQH3pomQB9Nc1IGNUdHb8Dw2NHpWF+eGK3sFFEjy8
	PqlrYXHP/AgsPg8+RB2O4i33XMh4JRVOsZfTS4gp6Nq0XZWx+pLo9l7WXta1uYhh5rnB
	zedQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language;
	bh=YDx4YMXDmzkwd3XhSGyHS8JyNUQHiVi93oSnNzJu3x0=;
	b=aESDCClhpjsssLWopG6qW4y7op2vS7LbNZhqv0L/Ts8o0IX8fsbTBRdYVeplzII4Sg
	Ga5VpvRjgPI2jayssOT85jovSSkkqohfZ5KUG4LYcz5lxt322qNgwNqLVV5tPLrAbJsW
	j2OdzdOvQX6yTgS5a5976CAOJfpoPCkfya2dCRJ1UjYj81TKzQrGoZlZctii9FE630uI
	DhyIWb5bKUjpmdZh/VcXq0xT/nZaXgLw81sDVVBUy2qjkaA7E+AYYMgOm/pJ+xQ1A5Qd
	QF/3pPS9n07w8KAS+DlgsI5lCBlc1ZNncbVrTfkXv50Xe3cLvpM1+Ct1mfkmzLw8NL78
	M/kg==
X-Gm-Message-State: APjAAAVxn4ws0Ytinq+isJKiyzzllg8IU7F0YGjs8xUz4PAnuhzT2QbH
	FDV0j/3i9lYGbBhSb/6FpDz/qHoQmLI=
X-Google-Smtp-Source: APXvYqwJDpwTlodQsq2Qu4Uf3TmuuecHBrFpCJENnmWfj0YBqZ0kDFj4UsPGe8B0lwgcBUsQf6wqMA==
X-Received: by 2002:a63:7d49:: with SMTP id m9mr13804048pgn.161.1565279768860; 
	Thu, 08 Aug 2019 08:56:08 -0700 (PDT)
Received: from ?IPv6:2601:646:8500:6bc6::bbfb? ([2601:646:8500:6bc6::bbfb])
	by smtp.gmail.com with ESMTPSA id
	v18sm93614597pgl.87.2019.08.08.08.56.07
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Thu, 08 Aug 2019 08:56:08 -0700 (PDT)
To: Adrian Bunk <bunk@stusta.de>
References: <1565263453-52779-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
	<134762b5-0997-950d-e47b-3fda6e6c885e@gmail.com>
	<20190808052714.GA27264@localhost>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <d157a719-cd11-30b8-5733-3ce6789a9824@gmail.com>
Date: Thu, 8 Aug 2019 08:56:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190808052714.GA27264@localhost>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][patch v5] dnf-plugin-tui: new recipe
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
X-List-Received-Date: Thu, 08 Aug 2019 15:56:08 -0000
X-Groupsio-MsgNum: 78995
Content-Type: multipart/mixed; boundary="------------27EE9B543B83DE26540EDDE8"
Content-Language: en-US

--------------27EE9B543B83DE26540EDDE8
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On 8/7/19 10:27 PM, Adrian Bunk wrote:
> On Wed, Aug 07, 2019 at 09:29:24PM -0700, Khem Raj wrote:
>> ...
>> On 8/8/19 4:24 AM, Zheng Ruoqin wrote:
>> ...
>>> diff --git a/meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_g=
it.bb b/meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git.bb
>> ...
>>> +SRCREV =3D "31d6866d5eda02be9a6bfb1fca9e9095b12eecd1"
>>> +PV =3D "1.0"
>>
>> Drop PV
>> ...
>=20
> This is needed when the file is named _git.

=46rom feeds point of view, PR would do so its not a dealbreaker, secondl=
y
my assumption was in this case it was set sythesized, and eventually
package might release starting 0.0.1 or somesuch but when I looked into
the component code, then 1.0 is a real release [1], therefore it is ok.

>=20
> cu
> Adrian
>=20

[1]
https://github.com/ubinux/dnf-plugin-tui/commit/31d6866d5eda02be9a6bfb1fc=
a9e9095b12eecd1

--------------27EE9B543B83DE26540EDDE8
Content-Type: application/pgp-keys;
 name="pEpkey.asc"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="pEpkey.asc"

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
=3Dsj8j
-----END PGP PUBLIC KEY BLOCK-----

--------------27EE9B543B83DE26540EDDE8--
