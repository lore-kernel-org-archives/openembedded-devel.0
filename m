Return-Path: <debrabander@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45F30C3DA4A
	for <webhook@archiver.kernel.org>; Mon,  5 Aug 2024 07:08:05 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web11.2670.1722841682707372427
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Aug 2024 00:08:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=k1TDLoIU;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: debrabander@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5bb477e3a6dso1074010a12.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 05 Aug 2024 00:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722841681; x=1723446481; darn=lists.openembedded.org;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :from:content-transfer-encoding:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vq3Re7lQ85QcUOufG3gJvLyeoO1c5Y74J6ku8OT05N8=;
        b=k1TDLoIUhu1cQb+z7PvpBMwnBU9vFLCbpilUJ4iL7vp5mFuL6/FTDiV1CsdEnXjXcB
         VdBnAVFyzGHWKfqN+saoR5YBH41g0Krf1QuwdEiec+/U1QYJ/KN2c8KI6LyBzl4XO6zL
         vVBoqjQf7I2sKB0PHStt2TMG6fROeQNy9VZK6o1GwA7PyMkIsC7TqBS+O7K6Ep0Fgd+p
         5NEVe1hqT7Zcj4afEvApiFC/P0Q2j8dxr+LvrkZTXTnwJoE6FB/ksNggy5QUkm6kz+nq
         O5gtSq552zH/5lkn8ENjXIqsIVp7W0xqq6T864ssVkcecgzcyRRPSwvn5X2JbZBs70Dv
         Wv7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722841681; x=1723446481;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :from:content-transfer-encoding:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vq3Re7lQ85QcUOufG3gJvLyeoO1c5Y74J6ku8OT05N8=;
        b=b3cTCU1w8t6smilg4q59UXaVLBOR8fCX/E0EqZKxObtgHZsHuw7Yn4ApnlknD+HoPp
         4TywTWRx2lNwf5vfQRSHwww4ftwTQSb//mCQwmcGaEMm95oFvPuVjyMqaRgZHyCmYtLX
         EETn1mC6k8fMJC7mgIEJz4njYQ0hFZdF2NQss+xR/9pqkMAueoDfc2UAeg+aDq7YyIqe
         tQ35xtycszP9Sm1ipkVRIUA0ntULOIFjHZSYEoGJsNMPk68jZy6bt175f5qRVefGwiPt
         1ftQP/XRFjhnHSrung6DySxaa2Mz7wFMWEWb+mlHiZJdeRmcai4wBrGNn2iWN/T8IMSS
         IkQw==
X-Forwarded-Encrypted: i=1; AJvYcCWiMA5J/qw65poaKFc2yHxUHep+X2z9vZZf/uFOgB5SJQGQfO129aUjvMC7b11vS2sc8DBFR/8kXQC5fOfFhxwQTRSbD9AohpX1nhLvtcJHyg5t/d4N4dEZIQ==
X-Gm-Message-State: AOJu0YyoNZ0k99lqS3GZg7VnR9M88YKs0+GYy4ftFk73+zb55boHZ5X3
	kXGlI4caQFGV6wAbYyPNTviwvhpClD5PPUm4Zn4QOPruMUB8Pqdd
X-Google-Smtp-Source: AGHT+IHSJKWM+5Po+elgTw7LuCxm8aYZINkkHMfRjbguHUXoRHmfGxdtshuyTXFhSkhf2B5ThwiF1w==
X-Received: by 2002:a50:fe8d:0:b0:5a1:7d68:62d8 with SMTP id 4fb4d7f45d1cf-5b7f59e06admr6979960a12.38.1722841680541;
        Mon, 05 Aug 2024 00:08:00 -0700 (PDT)
Received: from smtpclient.apple ([89.205.142.217])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5b83bf3a2e1sm4510302a12.87.2024.08.05.00.07.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Aug 2024 00:08:00 -0700 (PDT)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Frank de Brabander <debrabander@gmail.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [oe] [meta-python][scarthgap][PATCH] python3-pydantic-core: upgrade 2.16.3 -> 2.18.1
Date: Mon, 5 Aug 2024 09:07:48 +0200
Message-Id: <547021D2-496C-4944-BCDA-438EBD0B42E0@gmail.com>
References: <4453e069-6679-42ae-b3bb-cdd223bf9da1@gmail.com>
Cc: dev@g0hl1n.net, openembedded-devel@lists.openembedded.org,
 tim.orling@konsulko.com
In-Reply-To: <4453e069-6679-42ae-b3bb-cdd223bf9da1@gmail.com>
To: akuster808 <akuster808@gmail.com>
X-Mailer: iPhone Mail (21F90)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 Aug 2024 07:08:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111509



> Op 3 aug 2024 om 18:51 heeft akuster808 <akuster808@gmail.com> het volgend=
e geschreven:
>=20
> =EF=BB=BF
>=20
>> On 7/31/24 4:07 AM, Frank de Brabander wrote:
>> I was unaware of this discussion when I created the fix for master.
>> Note that I've silenced the TMPDIR QA message, this still needs a
>> proper fix in master as well.
>>=20
>> This indeed needs to be fixed in scarthgap as well, since the
>> incompatible versions do break some code. My two cents for the available
>> options:
>>=20
>>  - Revert pydantic upgrade (from 2.7.0 back to 2.6.4)
>>  - Update pydantic-core to 2.18.1
>>  - Use master (pydantic 2.7.3 and pydantic-core 2.18.4)
>>=20
>> Would only downgrade if this is the *only* allowed option according to
>> the LTS branch policy. Version 2.7.x includes new features compared to
>> 2.6.4. Removing these with a downgrade would violate the LTS patch policy=

>> of not merging "ABI/API breakage".
>=20
> We have had this type of situation with a pkg (A) update in master and the=
n new lts was branched. We found out other later additional pkgs needed to u=
pdated to work with pkg (A). pydantic update was in Master before scarthgap w=
as branched.
>>=20
>> Option 2 or 3 are my preferred choices and they fall within the
>> "fixes for bugs" category of the LTS patch policy. Option 2 is the smalle=
st
>> change to fix the problem, but option 3 includes some additional upstream=

>> fixes with the update from 2.7.0 to 2.7.3.
>=20
> Master should be failing so if Master gets a revert of pydantic back to 2.=
6.4, then Scarthgap will follow. Is this an option? - Armin

As far as I know master works now, so a revert would make no sense in that c=
ase.

>>=20
>>=20
>> Regards,
>> Frank
>=20

