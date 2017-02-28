Return-Path: <bounce+4d9b4d.3a5685-openembedded-devel=lists.openembedded.org@asterius.io>
Received: from mail4.static.mailgun.info (mail4.static.mailgun.info
	[104.130.122.4])
	by mail.openembedded.org (Postfix) with ESMTP id A447560068
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Feb 2017 13:35:29 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=asterius.io; q=dns/txt;
	s=mailo; t=1488288929; h=Content-Type: Cc: To: Subject: Message-ID:
	Date: From: References: In-Reply-To: MIME-Version: Sender;
	bh=avfcdn9licicLhyL7KVQJ1XuIaJreRhmKJylCqKmM3s=;
	b=TKQuEFSdzXyA3ad2pBcJ7TV6DAJQRqgLiEcE+rX5QZGHGKUJ7Av/ahfXJL6uGWkzWW65SI4s
	yHqn8kaT9H4jsxTmGBZdZkuQzkDgAgEFZ0lmcQV8Scw/Ingj4dWXdAbn5cKLsdtyORraVFPN
	s1IdVvOOdXIFRfBxeiYIU+rVqDg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=asterius.io; s=mailo;
	q=dns; h=Sender: MIME-Version: In-Reply-To: References: From: Date:
	Message-ID: Subject: To: Cc: Content-Type;
	b=XRJrme8C15s0bpNxU84+UtzmejNQC9ixUTATlD/+OOwdjJ15ac6R+wTqMUxt7SolIPte+U
	HsgZJ8nu0MRhKG3UhTlcTHPfPZnFRa9aS5a/musc3jM8p5y5w8j5lMVvjn42boqbWaOrqXRP
	WaZejFKr6k/9IP1ZiiQFI8kbUnSNE=
Sender: derek@asterius.io
X-Mailgun-Sending-Ip: 104.130.122.4
X-Mailgun-Sid: WyIzN2NkMyIsICJvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyIsICIzYTU2ODUiXQ==
Received: from mail-io0-f180.google.com (mail-io0-f180.google.com
	[209.85.223.180])
	by mxa.mailgun.org with ESMTP id 58b57ca0.7f6dd0726cb0-smtp-out-n01;
	Tue, 28 Feb 2017 13:35:28 -0000 (UTC)
Received: by mail-io0-f180.google.com with SMTP id l7so9143573ioe.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Feb 2017 05:35:28 -0800 (PST)
X-Gm-Message-State: AMke39mcdASwW8JD9MHLOZByLddjpzgwOSu+RhboLLX5e9MpWvLy0UbPCX73C9OCaByk5VyYfk6u7dainES9cg==
X-Received: by 10.107.169.201 with SMTP id f70mr3052457ioj.161.1488288927826; 
	Tue, 28 Feb 2017 05:35:27 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.156.85 with HTTP; Tue, 28 Feb 2017 05:35:27 -0800 (PST)
In-Reply-To: <CA+chaQeS8Ld3S3mveAR7khLECbax-eGejUAEyL0vrPJrP8AH9w@mail.gmail.com>
References: <1487975723-10180-1-git-send-email-derek@asterius.io>
	<CA+chaQeS8Ld3S3mveAR7khLECbax-eGejUAEyL0vrPJrP8AH9w@mail.gmail.com>
From: Derek Straka <derek@asterius.io>
Date: Tue, 28 Feb 2017 08:35:27 -0500
X-Gmail-Original-Message-ID: <CADNbA1pFu3LZ7dH2NknHnGFJrW-gHM57DreC6==JfiQsaNrF8Q@mail.gmail.com>
Message-ID: <CADNbA1pFu3LZ7dH2NknHnGFJrW-gHM57DreC6==JfiQsaNrF8Q@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] efivar: unblacklist package and those that depend on it
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
X-List-Received-Date: Tue, 28 Feb 2017 13:35:29 -0000
Content-Type: text/plain; charset=UTF-8

Ah, I see why they were building on my box and failing here; I hadn't
updated oe-core in a while so I didn't have the latest RSS changes.  I'll
get v2's up for these patch sets

On Tue, Feb 28, 2017 at 4:22 AM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> It still doesn't build, recent log:
>
> http://errors.yoctoproject.org/Errors/Details/134285/
>
> probably missing pkgconfig inherit as above those undefined references to
> popt* it also shows:
>
> /bin/sh: 1: pkg-config: not found
> /bin/sh: 1: pkg-config: not found
>
>
> On Fri, Feb 24, 2017 at 11:35 PM, Derek Straka <derek@asterius.io> wrote:
>
>> The package appears to build without modification
>>
>> Signed-off-by: Derek Straka <derek@asterius.io>
>> ---
>>  meta-oe/recipes-extended/efibootmgr/efibootmgr_0.12.bb | 4 ----
>>  meta-oe/recipes-extended/efivar/efivar_0.24.bb         | 3 ---
>>  2 files changed, 7 deletions(-)
>>
>> diff --git a/meta-oe/recipes-extended/efibootmgr/efibootmgr_0.12.bb
>> b/meta-oe/recipes-extended/efibootmgr/efibootmgr_0.12.bb
>> index f2b9454..b25cfca 100644
>> --- a/meta-oe/recipes-extended/efibootmgr/efibootmgr_0.12.bb
>> +++ b/meta-oe/recipes-extended/efibootmgr/efibootmgr_0.12.bb
>> @@ -25,7 +25,3 @@ EXTRA_OEMAKE = "'CC=${CC}' 'CFLAGS=${CFLAGS}
>> -I${S}/src/include `pkg-config --cf
>>  do_install () {
>>      install -D -p -m0755 src/efibootmgr ${D}/${sbindir}/efibootmgr
>>  }
>> -
>> -
>> -
>> -PNBLACKLIST[efibootmgr] ?= "Depends on blacklisted efivar"
>> diff --git a/meta-oe/recipes-extended/efivar/efivar_0.24.bb
>> b/meta-oe/recipes-extended/efivar/efivar_0.24.bb
>> index 4c7793f..f641a30 100644
>> --- a/meta-oe/recipes-extended/efivar/efivar_0.24.bb
>> +++ b/meta-oe/recipes-extended/efivar/efivar_0.24.bb
>> @@ -40,6 +40,3 @@ do_install_append_class-native() {
>>  }
>>
>>  BBCLASSEXTEND = "native"
>> -
>> -
>> -PNBLACKLIST[efivar] ?= "Fails to build with RSS
>> http://errors.yoctoproject.org/Errors/Details/132821/"
>> --
>> 2.7.4
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
>
>

