Return-Path: <bounce+4d9b4d.3a5685-openembedded-devel=lists.openembedded.org@asterius.io>
Received: from mail4.static.mailgun.info (mail4.static.mailgun.info
	[104.130.122.4])
	by mail.openembedded.org (Postfix) with ESMTP id A43CB774FD
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Feb 2017 21:48:38 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=asterius.io; q=dns/txt;
	s=mailo; t=1487972919; h=Content-Type: Cc: To: Subject: Message-ID:
	Date: From: References: In-Reply-To: MIME-Version: Sender;
	bh=xWsKowxbopKlRwNeODlcLppa6Z0lVNmH1hghLQH7Ul4=;
	b=qgTEOjxsnMH1ytN6cXqzi7DPCSNbo/zSkDh9Fq0bihMj1l+33pw0DugQ8219U+2CO1jFmT7T
	A3+ANOMtu43RNZ/4hvYWOkXdZbTRXgPFrNW3YBNWFzK6SC2y66fyZFufxHVQ3KqyswB6BYiR
	L9hjGxhR3wgcCzT5u5B1Q6gYAX8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=asterius.io; s=mailo;
	q=dns; h=Sender: MIME-Version: In-Reply-To: References: From: Date:
	Message-ID: Subject: To: Cc: Content-Type;
	b=Ac22yXssjKlBYL3TnrnX44L4q3gGXG8USr2PuiU5aLlhf2FL9NDW8arwjj5rdWP/hjNC6h
	7XedDmBUVNDU3A4zs0+kY+O70TUqSP8q5QhfQa2BIeJSVmnFmjPpufHkV25NQkiWLptyW2gk
	CofgeE1zmje4HiSntO3Kp51by0Mus=
Sender: derek@asterius.io
X-Mailgun-Sending-Ip: 104.130.122.4
X-Mailgun-Sid: WyIzN2NkMyIsICJvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyIsICIzYTU2ODUiXQ==
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com
	[209.85.223.170])
	by mxa.mailgun.org with ESMTP id 58b0aa37.7f842c1cf9b0-smtp-out-n02;
	Fri, 24 Feb 2017 21:48:39 -0000 (UTC)
Received: by mail-io0-f170.google.com with SMTP id l66so2375819ioi.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Feb 2017 13:48:38 -0800 (PST)
X-Gm-Message-State: AMke39lfflrAcTzjlJRUgJXgIACFnasz4BJuzfe7jIYXMbiQOW1nYPS5uP95qViieoDNCX/IYOKWHcu3zp65qg==
X-Received: by 10.107.151.146 with SMTP id z140mr5567401iod.161.1487972918412; 
	Fri, 24 Feb 2017 13:48:38 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.156.85 with HTTP; Fri, 24 Feb 2017 13:48:38 -0800 (PST)
In-Reply-To: <CA+chaQd=bR6pdo+9Jj89mLZ3Ee608w605wK604qgCLfRofkMsg@mail.gmail.com>
References: <1487971493-28136-1-git-send-email-derek@asterius.io>
	<CA+chaQd=bR6pdo+9Jj89mLZ3Ee608w605wK604qgCLfRofkMsg@mail.gmail.com>
From: Derek Straka <derek@asterius.io>
Date: Fri, 24 Feb 2017 16:48:38 -0500
X-Gmail-Original-Message-ID: <CADNbA1oj+=qSvLkD3482-6EHZD0gaHkK_1fRiWJhjZDwAFiSjw@mail.gmail.com>
Message-ID: <CADNbA1oj+=qSvLkD3482-6EHZD0gaHkK_1fRiWJhjZDwAFiSjw@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] postgresql: update inherit to work correctly with RSS
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
X-List-Received-Date: Fri, 24 Feb 2017 21:48:40 -0000
Content-Type: text/plain; charset=UTF-8

Indeed.  I was a few days out of date.  Thanks.

-Derek

On Fri, Feb 24, 2017 at 4:34 PM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> This was already fixed in master:
> http://git.openembedded.org/meta-openembedded/commit/?id=
> 18b373d1429172f13d30bc389687424163076a20
>
> On Fri, Feb 24, 2017 at 10:24 PM, Derek Straka <derek@asterius.io> wrote:
>
>> Resolves build issue exposed by RSS
>> See http://errors.yoctoproject.org/Errors/Details/131632/
>>
>> Signed-off-by: Derek Straka <derek@asterius.io>
>> ---
>>  meta-oe/recipes-support/postgresql/postgresql.inc       | 4 ++--
>>  meta-oe/recipes-support/postgresql/postgresql_9.4.10.bb | 2 --
>>  2 files changed, 2 insertions(+), 4 deletions(-)
>>
>> diff --git a/meta-oe/recipes-support/postgresql/postgresql.inc
>> b/meta-oe/recipes-support/postgresql/postgresql.inc
>> index 314c23d..cce513f 100644
>> --- a/meta-oe/recipes-support/postgresql/postgresql.inc
>> +++ b/meta-oe/recipes-support/postgresql/postgresql.inc
>> @@ -19,7 +19,7 @@ DESCRIPTION = "\
>>  "
>>  HOMEPAGE = "http://www.postgresql.com"
>>  LICENSE = "BSD"
>> -DEPENDS = "zlib readline tzcode-native gettext-native"
>> +DEPENDS = "zlib readline tzcode-native "
>>
>>  ARM_INSTRUCTION_SET = "arm"
>>
>> @@ -37,7 +37,7 @@ LEAD_SONAME = "libpq.so"
>>  # LDFLAGS for shared libraries
>>  export LDFLAGS_SL = "${LDFLAGS}"
>>
>> -inherit autotools pkgconfig perlnative pythonnative useradd update-rc.d
>> systemd
>> +inherit autotools gettext pkgconfig perlnative pythonnative useradd
>> update-rc.d systemd
>>
>>  CFLAGS += "-I${STAGING_INCDIR}/${PYTHON_DIR} -I${STAGING_INCDIR}/tcl8.6"
>>
>> diff --git a/meta-oe/recipes-support/postgresql/postgresql_9.4.10.bb
>> b/meta-oe/recipes-support/postgresql/postgresql_9.4.10.bb
>> index 4787e57..5498350 100644
>> --- a/meta-oe/recipes-support/postgresql/postgresql_9.4.10.bb
>> +++ b/meta-oe/recipes-support/postgresql/postgresql_9.4.10.bb
>> @@ -9,5 +9,3 @@ SRC_URI += "\
>>
>>  SRC_URI[md5sum] = "1171df0426fe4da5a29f6cdaf2e8b812"
>>  SRC_URI[sha256sum] = "7061678bed1981c681ce54c76b98b
>> 6ec17743f090a9775104a45e7e1a8826ecf"
>> -
>> -PNBLACKLIST[postgresql] ?= "Fails to build with RSS
>> http://errors.yoctoproject.org/Errors/Details/131632/"
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

