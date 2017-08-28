Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f53.google.com (mail-pg0-f53.google.com [74.125.83.53])
	by mail.openembedded.org (Postfix) with ESMTP id 6487E60290
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Aug 2017 05:39:58 +0000 (UTC)
Received: by mail-pg0-f53.google.com with SMTP id 83so20700121pgb.4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Aug 2017 22:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=poGrAyY6zuB0KDVaHLLVJQhWv4N5jYxABsNkaHRkMEw=;
	b=ZkOrAR5SGBu5JE+4wrfHxizM0qm3UADhb4T7xG98OjUDsmuGat8fJcj6ChyrgBSEdo
	93gT4CAfbkzKsbsgjASaNu3lpbJOGbWLlqU+r3dwe/fz4zBPMCW/Smmbx7DxkC8a2E0p
	Rnxi+8izApTtG2MB+2iaZ3UZ2hSDmzaZXjW7r1Zkh7SXvrMmsadgGMGVA9N1QbtyVNq5
	jzMBTabQ0iZH5kwFviR+j79Y+V2sndUe9yUJS4+z6bfnkdvVoTnBBAsBpK6wkOa5l0s3
	xbV9jT+7KhVPOLVa96u9aGQrcWC5z5SEi+fk2AiZR4X2MIz677UboJxM+bhDhhzSGuzi
	2HPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=poGrAyY6zuB0KDVaHLLVJQhWv4N5jYxABsNkaHRkMEw=;
	b=gQ7rF7g9AkQj2dpTYTWofYD+Z9VrQZJ4lA1RBGxgjDW9W/3Boe1O6r8053v6w2iTnx
	rDKVNtKO82n5teLyiS/o+HgBpdKQeJDTjf7i0+NoPJnsWr3gtP8c3kf4gXpwehhFZFsi
	NqPHitOWrlju+cxw8QjV+aTb/GrmJLRmlEOxigcAjaXu44RUQSat3MjVIQQ65aiwydLS
	ZOogkewCK1UtkUdzO6b88ZZffobSx4ivcXhnnU0TgqGttbkVTG3YBzt1beeh+3yklkXX
	dlHeSaH98V6PffVL3uj5YvI5xcok3C6Wc9Vaq3L4NErmNmpwd7WCRoHuPsjzCOr/ycfW
	njNQ==
X-Gm-Message-State: AHYfb5gqw+0AWvgghhdxEHC7PWM2Vd7QpWVOJ9MtxWTykg0zMlitKFxy
	j3denDIf7Di3B3r4sWMU5igoOeU/iA==
X-Received: by 10.99.109.142 with SMTP id i136mr5512745pgc.439.1503898799692; 
	Sun, 27 Aug 2017 22:39:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.167.2 with HTTP; Sun, 27 Aug 2017 22:39:29 -0700 (PDT)
In-Reply-To: <4ce1f243-0fb2-666f-f6b5-3f0ac7eb8c07@windriver.com>
References: <20170825071422.3969-1-raj.khem@gmail.com>
	<20170825071422.3969-3-raj.khem@gmail.com>
	<4ce1f243-0fb2-666f-f6b5-3f0ac7eb8c07@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 27 Aug 2017 22:39:29 -0700
Message-ID: <CAMKF1sp85fDxyU4bYMhL9Ru4cUBt=Fhx+gkPVAJ4k9s=k=X_Kw@mail.gmail.com>
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH 3/4] squid: Disable format-truncation warning only with gcc
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
X-List-Received-Date: Mon, 28 Aug 2017 05:39:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 27, 2017 at 9:48 PM, Yi Zhao <yi.zhao@windriver.com> wrote:
> Hi,
>
> I got an error after applied this patch with latest oe-core:
>

yeah, I think its because its bad to use an override which is not in oe-cor=
e
but from meta-clang. Drop this patch and try the v2 I just sent.

> | ../../../squid-3.5.26/src/format/Format.cc: In member function 'void
> Format::Format::assemble(MemBuf&, const Pointer&, int) const':
> | ../../../squid-3.5.26/src/format/Format.cc:345:1: error: '%0*lld'
> directive output may be truncated writing between 1 and 2147483646 bytes
> into a region of size 1024 [-Werror=3Dformat-truncation=3D]
> |  Format::Format::assemble(MemBuf &mb, const AccessLogEntry::Pointer &al=
,
> int logSequenceNumber) const
> |  ^~~~~~
> | ../../../squid-3.5.26/src/format/Format.cc:345:1: note: directive argum=
ent
> in the range [-2147483648, 2147483647]
> | ../../../squid-3.5.26/src/format/Format.cc:542:21: note: 'snprintf' out=
put
> between 4 and 4294967295 bytes into a destination of size 1024
> |              snprintf(tmp, sizeof(tmp), "%0*" PRId64 ".%0*d", fmt->zero=
 &&
> (fmt->widthMin - precision - 1 >=3D 0) ? fmt->widthMin - precision - 1 : =
0,
> static_cast<int64_t>(al->cache.start_time.tv_sec), precision,
> (int)(al->cache.start_time.tv_usec / fmt->divisor));
> |
> ~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> Thanks,
> Yi
>
>
> =E5=9C=A8 2017=E5=B9=B408=E6=9C=8825=E6=97=A5 15:14, Khem Raj =E5=86=99=
=E9=81=93:
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>   meta-networking/recipes-daemons/squid/squid_3.5.26.bb | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta-networking/recipes-daemons/squid/squid_3.5.26.bb
>> b/meta-networking/recipes-daemons/squid/squid_3.5.26.bb
>> index 24cd15669..0260497e7 100644
>> --- a/meta-networking/recipes-daemons/squid/squid_3.5.26.bb
>> +++ b/meta-networking/recipes-daemons/squid/squid_3.5.26.bb
>> @@ -22,10 +22,11 @@ SRC_URI =3D
>> "http://www.squid-cache.org/Versions/v${MAJ_VER}/${MIN_VER}/${BPN}-${P
>>              file://set_sysroot_patch.patch \
>>              file://squid-don-t-do-squid-conf-tests-at-build-time.patch =
\
>>
>> file://0001-SquidNew-use-noexcept-instead-of-throw-for-C-11-comp.patch \
>> -
>> file://0001-configure-Check-for-Wno-error-format-truncation-comp.patch \
>>              file://gcc7-fixes.patch \
>>              file://0001-tools.cc-fixed-unused-result-warning.patch \
>>              "
>> +SRC_URI_append_toolchain-gcc =3D "
>> file://0001-configure-Check-for-Wno-error-format-truncation-comp.patch"
>> +
>>   SRC_URI[md5sum] =3D "dc1830cd361e077814aa39bcc3691d8b"
>>   SRC_URI[sha256sum] =3D
>> "41d8845863dcd026c856508cd1599d417c8947ffd96e86e24085f9893cb8b8c2"
>>
>
>

