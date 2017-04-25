Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id D7FB572FA7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Apr 2017 13:32:34 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id u65so25009185wmu.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Apr 2017 06:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=0u8QiK4j/6hsR05yiZRvrq6NmpdoZfX4uONg1Y1j8bM=;
	b=VHlhs7LEDMPOpfMAOR4eLqyOCbDqvpCKDhxzeaJPch6nJfXb2dfNjVgz1DgV1l7vm9
	zbTwVeKfvuE1Kit+4OjlWOFCbF6Z0s07C5PJ1piPHhrB8i29P8pTIzNCLdIftGT0YSmJ
	6WokjCpxyCvaCIavwnCLexIw64ehG2Q7j+kGsiToJ7dCUWX0ZKm4bKlkOxbTU8f7Tfhl
	hSRHmZIgAKkBIoYPQiL4Kbf8pF8ObfXcqNig1ep02lfdg3Fl8rR3tSPsKnEBlj+/7T5i
	24bOPk5VoKY2hMssBvc2ZtNgXrbWzbIqIM87SSF/TJebpl1rXML0nB8IlPMbSl7pqbOt
	5PVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=0u8QiK4j/6hsR05yiZRvrq6NmpdoZfX4uONg1Y1j8bM=;
	b=YbwM/nV19WOct5n+3yW3LZWVvletzn1flFEM70voC5WDwVH1y9ghvz+2GQM6GQuxcT
	6datJlFNhc0pIpuIwt1fyjZNEhf8EGa9G3J3vA6i1h0HNI8y2Vw0uo8woT3ICCJ4yD9I
	EHignAdmlDUNmSVH6JPhA0sF6sgQ0RG1282km84x30uSu8zzoeEOfTf3Xz73zQ+yAs89
	cTqU1iK2KIJ93jaYIZl5W59sdqPkNQ8gnH3pF3ki37KsgqCE//0AeCk+1g+cv6fJmEK/
	3225x1fMn9xptu9iOkwAPGO6y2PAYJUHbrjYvjyUhIXjJbyI+YAPmXYfuXKKr+suam9X
	pgHg==
X-Gm-Message-State: AN3rC/4A1vpWjGpHjLf1OV9i8PClsYSC+/vsjGeZn9OkbQffn+JjGdVq
	LHAR9hAqcJhqFW5M4AqimTD/lH7JNySL
X-Received: by 10.80.182.50 with SMTP id b47mr5352985ede.123.1493127155248;
	Tue, 25 Apr 2017 06:32:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.180.141 with HTTP; Tue, 25 Apr 2017 06:32:04 -0700 (PDT)
In-Reply-To: <20170425121114.GA28641@jama>
References: <20170424052058.4952-1-raj.khem@gmail.com>
	<20170425121114.GA28641@jama>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 25 Apr 2017 06:32:04 -0700
Message-ID: <CAMKF1srVm+Db5KJnJj6Z16JhM83t1=KhWhJ_9JWJ+Ef+CZFvng@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-multimedia][PATCH 01/17] musicbrainz: Upgrade to 5.1.0
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
X-List-Received-Date: Tue, 25 Apr 2017 13:32:36 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Apr 25, 2017 at 5:11 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Sun, Apr 23, 2017 at 10:20:42PM -0700, Khem Raj wrote:
>> Drop uclibc specific flags
>
> http://errors.yoctoproject.org/Errors/Details/141292/
>

The patchset I sent yesterday has a fix for it.
http://lists.openembedded.org/pipermail/openembedded-devel/2017-April/112514.html

>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  .../recipes-multimedia/musicbrainz/libmusicbrainz_git.bb           | 7 ++-----
>>  1 file changed, 2 insertions(+), 5 deletions(-)
>>
>> diff --git a/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrainz_git.bb b/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrainz_git.bb
>> index a6a4f6a8a..250c5f14e 100644
>> --- a/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrainz_git.bb
>> +++ b/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrainz_git.bb
>> @@ -5,17 +5,14 @@ LICENSE = "LGPLv2.1+"
>>  LIC_FILES_CHKSUM = "file://COPYING.txt;md5=fbc093901857fcd118f065f900982c24"
>>  DEPENDS = "expat neon neon-native"
>>
>> -PV = "5.0.1+git${SRCPV}"
>> -PR = "r1"
>> +PV = "5.1.0+git${SRCPV}"
>>
>> -SRCREV = "0749dd0a35b4a54316da064475863a4ac6e28e7e"
>> +SRCREV = "44c05779dd996035758f5ec426766aeedce29cc3"
>>  SRC_URI = "git://github.com/metabrainz/libmusicbrainz.git \
>>             file://allow-libdir-override.patch "
>>
>>  S = "${WORKDIR}/git"
>>
>> -LDFLAGS_prepend_libc-uclibc = " -lpthread "
>> -
>>  inherit cmake pkgconfig
>>
>>  do_configure_prepend() {
>> --
>> 2.12.2
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

