Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
	[209.85.215.172])
	by mail.openembedded.org (Postfix) with ESMTP id 0A0D9799B5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Sep 2018 17:56:21 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id z3-v6so4984015pgv.8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Sep 2018 10:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=80puNEUlNWUdigs80bH9O7a5d15uz9FKX7zzMB8z7j0=;
	b=T5aVZp7w9TOn8adNLefS4JMTPUma4g+3NDDudEq1a5jI68Qjt2biyj1yFbRrqEV6RG
	w0bFNIP0tE07VHjtoSMtDKoK8eUjTeYK5LKbLBwBK8VJYmWPlCi7EZu2DmTBirT8eeog
	GV1eCw2/9MGOp+NSKSBttBz7I/dr5JcedCkByu44qT5G+EWYb1+xGHzycWgEF6zn4z7w
	uTaLz2uV7bgb+HwB3IpEfwI9+W4oq0+qKvfo3vW8vHY/6HLy9y+WXyBO4hiuENWMBuh0
	oAz5n6OU1Rs6C8X8Kg096CnWUNdzEL6bxKGbSoPFajeNlmD4bY0oupkiFDJa5nU2z4AF
	PTag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=80puNEUlNWUdigs80bH9O7a5d15uz9FKX7zzMB8z7j0=;
	b=Keuv+k4ykWFiYKqACBUtuelUrF0FRMRLsgXNwGWXGoA9ghyQXkAj+WJHQcJPUTjDxS
	YK3PcHzKKABHA2aezXVUyWJcJT4cqJdYM+qnLtBr6veMwY4wcZYppBBY85Lg1ZQpXZ95
	o5cfEVpV+BZTEGqK73/TMfBNlvFb/1Md+ybWXXpzNaS8ymDtZ0bePWGaCGPbF0pnrpKF
	KeH1uHBPYVQ1Tjpk2IcTNBSCsfRaH7W/rvLlzQ0FBN861le7QcSSukmlTPAk6v0oqeZW
	z9ovZFfQptX8epHWnXakdzvhpkslvCy2/dqIuU3n2rLkgyOCHqOQ+DwBl6+jEVcXtTjk
	cmWQ==
X-Gm-Message-State: ABuFfohl565x5o5pG8cO+26mCj7mcUIhm+doQiqoxUyarAJm7izaFtUb
	W/byPrkaR9WeWNyPhJnA7YxIioP2
X-Google-Smtp-Source: ACcGV62Tfc7dzIKJBZwSbLzRxRt+TkpTuWMDhH1cJPIdejxoi+72tjefRn+HjtV7+ceTSmq3lJSqRA==
X-Received: by 2002:a62:7043:: with SMTP id
	l64-v6mr18007298pfc.65.1538157382532; 
	Fri, 28 Sep 2018 10:56:22 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:e960:91d2:2331:2d71?
	([2601:202:4180:c33:e960:91d2:2331:2d71])
	by smtp.gmail.com with ESMTPSA id
	r23-v6sm10843953pfj.5.2018.09.28.10.56.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 28 Sep 2018 10:56:21 -0700 (PDT)
To: =?UTF-8?Q?Andreas_M=c3=bcller?= <schnitzeltony@gmail.com>
References: <5bae4634.1c69fb81.9e934.4f05@mx.google.com>
	<CALbNGRRzTMgObShEYvhePn2gCSA7CmgiZ3wCEpcov6ssnJLJgw@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <3e6aade1-e371-07b3-dd56-13a5d887ece3@gmail.com>
Date: Fri, 28 Sep 2018 10:56:20 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CALbNGRRzTMgObShEYvhePn2gCSA7CmgiZ3wCEpcov6ssnJLJgw@mail.gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: meta-oe sumo-next pull reatest
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
X-List-Received-Date: Fri, 28 Sep 2018 17:56:22 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US



On 09/28/2018 08:26 AM, Andreas M=C3=BCller wrote:
> On Fri, Sep 28, 2018 at 5:18 PM, Armin Kuster <akuster808@gmail.com> wr=
ote:
>> The following changes since commit be79b8b111a968efdbe5e1482d0c246d0b2=
4763e:
>>
>>   fuse: CVE-2018-10906 (2018-08-26 11:03:11 -0700)
>>
>> are available in the git repository at:
>>
>>   git://git.openembedded.org/meta-openembedded sumo-next
>>
>> for you to fetch changes up to 2bb21ef27c4b0c9d52d30b3b2c5a0160fd02b96=
6:
>>
>>   poppler: Update to 0.64 (2018-09-27 08:49:10 -0700)
>>
>> ----------------------------------------------------------------
>> Armin Kuster (1):
>>       grpc: move it from oe to networking layer
>>
>> Khem Raj (2):
>>       gedit: Add dep on python-six-native
>>       poppler: Update to 0.64
> ^ Why this update in stable release?

It fixes the build issue sumo has had since it released.

- armin
>> Martin Jansa (2):
>>       libqb: Fix build with gold
>>       openocd: prevent fetching git submodules during do_configure
>>
>> Nicolas Dechesne (1):
>>       meta-multimedia: fixup LAYERDEPENDS
>>
>> Paul Eggleton (1):
>>       protobuf: make python-protobuf dependency optional and default t=
o off
>>
>> Sinan Kaya (1):
>>       dnsmasq: CVE-2017-15107
>>
>> Takuro Ashie (1):
>>       uim: Fix SRC_URI
>>
>>  meta-gnome/recipes-gnome/gedit/gedit_2.30.4.bb     |   6 +-
>>  meta-multimedia/conf/layer.conf                    |   2 +-
>>  ...txt-Fix-grpc_cpp_plugin-path-during-cross.patch |   0
>>  ....txt-Fix-libraries-installation-for-Linux.patch |   0
>>  ...s.txt-Find-c-ares-in-target-sysroot-alone.patch |   0
>>  .../recipes-devtools/grpc/grpc_1.8.5.bb            |   0
>>  .../recipes-support/dnsmasq/dnsmasq_2.78.bb        |   1 +
>>  .../dnsmasq/files/CVE-2017-15107.patch             | 263 ++++++++++++=
+++++++++
>>  meta-oe/recipes-devtools/openocd/openocd_git.bb    |  26 +-
>>  .../recipes-devtools/protobuf/protobuf_3.5.1.bb    |   7 +-
>>  meta-oe/recipes-extended/libqb/libqb_1.0.3.bb      |   8 +
>>  ...ists.txt-Add-libpoppler-to-link-along-wit.patch |  29 +++
>>  .../{poppler_0.63.0.bb =3D> poppler_0.64.0.bb}       |  18 +-
>>  meta-oe/recipes-support/uim/uim_1.8.6.bb           |   2 +-
>>  14 files changed, 339 insertions(+), 23 deletions(-)
>>  rename {meta-oe =3D> meta-networking}/recipes-devtools/grpc/grpc/0001=
-CMakeLists.txt-Fix-grpc_cpp_plugin-path-during-cross.patch (100%)
>>  rename {meta-oe =3D> meta-networking}/recipes-devtools/grpc/grpc/0001=
-CMakeLists.txt-Fix-libraries-installation-for-Linux.patch (100%)
>>  rename {meta-oe =3D> meta-networking}/recipes-devtools/grpc/grpc/0004=
-CMakeLists.txt-Find-c-ares-in-target-sysroot-alone.patch (100%)
>>  rename {meta-oe =3D> meta-networking}/recipes-devtools/grpc/grpc_1.8.=
5.bb (100%)
>>  create mode 100644 meta-networking/recipes-support/dnsmasq/files/CVE-=
2017-15107.patch
>>  create mode 100644 meta-oe/recipes-support/poppler/poppler/0001-glib-=
CMakeLists.txt-Add-libpoppler-to-link-along-wit.patch
>>  rename meta-oe/recipes-support/poppler/{poppler_0.63.0.bb =3D> popple=
r_0.64.0.bb} (76%)
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel



