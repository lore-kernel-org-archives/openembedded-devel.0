Return-Path: <bounce+4d9b4d.3a5685-openembedded-devel=lists.openembedded.org@asterius.io>
Received: from mail4.static.mailgun.info (mail4.static.mailgun.info
	[104.130.122.4])
	by mail.openembedded.org (Postfix) with ESMTP id B9E7C72FD6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Feb 2017 15:37:58 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=asterius.io; q=dns/txt;
	s=mailo; t=1488296279; h=Content-Type: Cc: To: Subject: Message-ID:
	Date: From: References: In-Reply-To: MIME-Version: Sender;
	bh=wGj/BT9NDe7MWNtVnH3pma/+sVfInj15UhY7mB4+fvs=;
	b=DX6CXQ5HW14vZF+PPxqKbf9KsGUbjQC2f/TXyXSDxT3aFyMQg7srylacEcwwTz+w6+TpADW4
	BYbuyggcZU0/mvyEGc2Lqhuh+bmv1eWuw+Td5NMef/tZmlebnYXtid2gMHq6kooA1XsaYCNw
	4NoRG9DYTYdUKEVzM088xDc7MUI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=asterius.io; s=mailo;
	q=dns; h=Sender: MIME-Version: In-Reply-To: References: From: Date:
	Message-ID: Subject: To: Cc: Content-Type;
	b=VbRF44RreSMm1VQKrK+xEj9V4lFa3+yQCIHnhdXSbFlVFg2ULv3l2OkfPE+R2LwdRRvZKY
	sKzta+xK/mKyOiwU06S3CCOlP0ENdA3rLwitk2s8B19QeEK9OYJDUpFJ+NLLBUB0zssMToAG
	k74O0tHUTc0IDN0F/QDUvYRcBaljQ=
Sender: derek@asterius.io
X-Mailgun-Sending-Ip: 104.130.122.4
X-Mailgun-Sid: WyIzN2NkMyIsICJvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyIsICIzYTU2ODUiXQ==
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com
	[209.85.223.170])
	by mxa.mailgun.org with ESMTP id 58b59956.7f3149dc2270-smtp-out-n03;
	Tue, 28 Feb 2017 15:37:58 -0000 (UTC)
Received: by mail-io0-f170.google.com with SMTP id l7so11644703ioe.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Feb 2017 07:37:58 -0800 (PST)
X-Gm-Message-State: AMke39lUvFb7yNLMQ/A+YinxcAZt1tFwuE+pasv6VhtpaiAK3il0yMDvFwrCTFiK1pSd/E4BxxUJ0Xqi4A6OFA==
X-Received: by 10.107.182.9 with SMTP id g9mr2955225iof.233.1488296277969;
	Tue, 28 Feb 2017 07:37:57 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.156.85 with HTTP; Tue, 28 Feb 2017 07:37:57 -0800 (PST)
In-Reply-To: <CA+chaQe4JwXjKwhFFG62Z3+9zrGpLfoPA+FFNqibypFQMAcrgQ@mail.gmail.com>
References: <1487973956-9430-1-git-send-email-derek@asterius.io>
	<CA+chaQe4JwXjKwhFFG62Z3+9zrGpLfoPA+FFNqibypFQMAcrgQ@mail.gmail.com>
From: Derek Straka <derek@asterius.io>
Date: Tue, 28 Feb 2017 10:37:57 -0500
X-Gmail-Original-Message-ID: <CADNbA1qfBGSOGoqMTL+oH+9khe90q_9PtiNn3wguJus5Kn6N0A@mail.gmail.com>
Message-ID: <CADNbA1qfBGSOGoqMTL+oH+9khe90q_9PtiNn3wguJus5Kn6N0A@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-filesystems][PATCH] xfsprogs: update depends to work correctly with RSS
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
X-List-Received-Date: Tue, 28 Feb 2017 15:37:59 -0000
Content-Type: text/plain; charset=UTF-8

I don't understand why I'm not seeing this failure with the patch and you
are.  The only difference I can think of is that I do a cleansstate prior
to rebuilding, but I would have expected the additional DEPENDS to
invalidate any cached SSTATE that may have been laying around.  Any
thoughts?

On Tue, Feb 28, 2017 at 4:25 AM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> Unfortunately still fails with:
>
> TOPDIR/tmp-glibc/work/core2-64-oe-linux/xfsprogs/4.8.0-r0/xfsprogs-4.8.0/libxfs/.libs/libxfs.so: error: undefined reference to 'uuid_compare'
> TOPDIR/tmp-glibc/work/core2-64-oe-linux/xfsprogs/4.8.0-r0/xfsprogs-4.8.0/libxfs/.libs/libxfs.so: error: undefined reference to 'uuid_copy'
>
> http://errors.yoctoproject.org/Errors/Details/134287/
>
> On Fri, Feb 24, 2017 at 11:05 PM, Derek Straka <derek@asterius.io> wrote:
>
>> Resolves build issue exposed by RSS
>> See http://errors.yoctoproject.org/Errors/Details/130663/
>>
>> Signed-off-by: Derek Straka <derek@asterius.io>
>> ---
>>  meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.8.0.bb | 3 +--
>>  1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.8.0.bb
>> b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.8.0.bb
>> index b4c50a2..f527237 100644
>> --- a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.8.0.bb
>> +++ b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.8.0.bb
>> @@ -15,6 +15,7 @@ inherit autotools-brokensep
>>
>>  PACKAGES =+ "${PN}-fsck ${PN}-mkfs ${PN}-repair libhandle"
>>
>> +DEPENDS += "util-linux"
>>
>>  RDEPENDS_${PN} = "${PN}-fsck ${PN}-mkfs ${PN}-repair"
>>
>> @@ -54,5 +55,3 @@ do_configure_prepend () {
>>  do_install_append() {
>>          oe_runmake 'DESTDIR=${D}' install install-dev
>>  }
>> -
>> -PNBLACKLIST[xfsprogs] ?= "Fails to build with RSS
>> http://errors.yoctoproject.org/Errors/Details/130663/"
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

