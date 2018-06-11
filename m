Return-Path: <leon.anavi@konsulko.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id D4EEB78B8C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Jun 2018 12:35:05 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id v131-v6so16192125wma.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Jun 2018 05:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=jPuPD/cIDSzhwzEElhJhfZ8u39qvdRg0f4NB4v+4FDA=;
	b=PwdmPBJv4aR3STG2clvAkm/UKa2RP5+umkrlzmbGH5DVs3AN0ogbWbv1JP2ZF0lgyw
	6PvG9qytmWBvmepmvbDmzmwC+++bs4tiFGP4rMMSaNMZ5y1/Frj5d0VMdcJqgOxl5beM
	h8CZ3JgaIRj8xdrMdky5/sEJ4Ep5GgDSP7rrg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=jPuPD/cIDSzhwzEElhJhfZ8u39qvdRg0f4NB4v+4FDA=;
	b=h5UMa3Ln2srvZOA6e1Nj25+le3y6K60AgE5vDmWA+t+UmEJdlSyNFJe+L20ut007+x
	5QYe9Opi2FOLriUHBHzlDsy0vl9LUh7lzlbmTfq02k+q6ChISyKJeEjDv4M0bkN1PNS8
	S5YotTDnOjJKZR4wAmmKEzzmrxhLPkxfrnfasWGl806fhEpQmUM2PlgjQK1eYXQ+1DMk
	W9X4WBC74m/U7DkZN9vinKngPZrJkvZiecYjKzUMMOQ4mnsuBxLA4IQUv/NW9R3BESlT
	UZmba5lH5HsiEagrMA2GcB9Bns3AifgtO5ryEwDt29S5Es2W2ct38LsTEaxL001jH2AR
	ZJoA==
X-Gm-Message-State: APt69E0ATyXHyzhJdsHGcy2aB7HyDrQtxLryo9NXAUMimLc0wc1s46Hs
	DioyTrSL2ZYHxE0vjXI3F13DbgZGkUI=
X-Google-Smtp-Source: ADUXVKJixJ44NWfoSVkp/5NpxIgI0TmJ5aTpvQDZHSlBZ9vNceb89jiii4mBVwsvYzyEoGqXFDrxTA==
X-Received: by 2002:a1c:8410:: with SMTP id
	g16-v6mr8127064wmd.26.1528720506181; 
	Mon, 11 Jun 2018 05:35:06 -0700 (PDT)
Received: from [192.168.4.209] ([78.130.197.63])
	by smtp.gmail.com with ESMTPSA id
	r123-v6sm7685856wmb.21.2018.06.11.05.35.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 11 Jun 2018 05:35:05 -0700 (PDT)
To: Khem Raj <raj.khem@gmail.com>
References: <20180604162927.22714-1-leon.anavi@konsulko.com>
	<CAMKF1soJL8txTjcknjkKXCUNK6aBJX-BPy0NgTA-0DtYq=b13w@mail.gmail.com>
From: Leon Anavi <leon.anavi@konsulko.com>
Openpgp: preference=signencrypt
Autocrypt: addr=leon.anavi@konsulko.com; prefer-encrypt=mutual; keydata=
	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
	Z14qQ+tQr2c=
Message-ID: <429b60f2-4587-5ed0-5ef4-ff531b928f2c@konsulko.com>
Date: Mon, 11 Jun 2018 15:35:04 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1soJL8txTjcknjkKXCUNK6aBJX-BPy0NgTA-0DtYq=b13w@mail.gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] nano: Upgrade 2.9.7 -> 2.9.8
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
X-List-Received-Date: Mon, 11 Jun 2018 12:35:06 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

Hi Khem,


On 6.06.2018 04:05, Khem Raj wrote:
> On Mon, Jun 4, 2018 at 9:29 AM, Leon Anavi <leon.anavi@konsulko.com> wr=
ote:
>> Upgrade nano to 2.9.8, the latest version as of 2 June 2018:
>> https://www.nano-editor.org/dist/v2.9/ChangeLog
>>
>> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
>> ---
>>  meta-oe/recipes-support/nano/nano_2.9.7.bb | 8 --------
>>  meta-oe/recipes-support/nano/nano_2.9.8.bb | 8 ++++++++
>>  2 files changed, 8 insertions(+), 8 deletions(-)
>>  delete mode 100644 meta-oe/recipes-support/nano/nano_2.9.7.bb
>>  create mode 100644 meta-oe/recipes-support/nano/nano_2.9.8.bb
>>
>> diff --git a/meta-oe/recipes-support/nano/nano_2.9.7.bb b/meta-oe/reci=
pes-support/nano/nano_2.9.7.bb
>> deleted file mode 100644
>> index 419e5406b..000000000
>> --- a/meta-oe/recipes-support/nano/nano_2.9.7.bb
>> +++ /dev/null
>> @@ -1,8 +0,0 @@
>> -include nano.inc
>> -
>> -do_install_append_libc-musl () {
>> -       rm -rf ${D}${libdir}/charset.alias
>> -       rmdir ${D}${libdir}
> This is failing on musl like below
>
> | make[1]: Leaving directory
> '/mnt/a/oe/build/tmp/work/core2-64-bec-linux-musl/nano/2.9.8-r0/build'
> | rmdir: failed to remove
> '/mnt/a/oe/build/tmp/work/core2-64-bec-linux-musl/nano/2.9.8-r0/image/u=
sr/lib':
> No such file or directory
> | WARNING: /mnt/a/oe/build/tmp/work/core2-64-bec-linux-musl/nano/2.9.8-=
r0/temp/run.do_install.40342:1
> exit 1 from 'rmdir
> /mnt/a/oe/build/tmp/work/core2-64-bec-linux-musl/nano/2.9.8-r0/image/us=
r/lib'
>
>
> I think you might need --ignore-fail-on-non-empty
> option with rmdir

Thank you for the feedback. I reproduced the issue with musl. The
directory that rmdir tries to remove doesn't exist at all so I think the
whole do_install_append_libc-musl is redundant. I did a few tests to
confirm this and I will send a new version of the patch shortly.

Thanks,
Leon

>
>> -}
>> -SRC_URI[md5sum] =3D "e0c6d76c93932f6c41c40842952495f7"
>> -SRC_URI[sha256sum] =3D "b64ab017305b1777e97b5b9b07b31db8aeebfc3e8719f=
61e8da1cf3866d344bd"
>> diff --git a/meta-oe/recipes-support/nano/nano_2.9.8.bb b/meta-oe/reci=
pes-support/nano/nano_2.9.8.bb
>> new file mode 100644
>> index 000000000..ac5f0622b
>> --- /dev/null
>> +++ b/meta-oe/recipes-support/nano/nano_2.9.8.bb
>> @@ -0,0 +1,8 @@
>> +include nano.inc
>> +
>> +do_install_append_libc-musl () {
>> +       rm -rf ${D}${libdir}/charset.alias
>> +       rmdir ${D}${libdir}
>> +}
>> +SRC_URI[md5sum] =3D "31714360342f9baa344e2fa574c144db"
>> +SRC_URI[sha256sum] =3D "c2deac31ba4d3fd27a42fafcc47ccf499296cc69a422b=
becab63f2933ea85488"
>> --
>> 2.14.1
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Leon Anavi
Software Engineer
konsulko.com



