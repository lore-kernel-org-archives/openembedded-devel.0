Return-Path: <oleksandr.kravchuk@pelagicore.com>
Received: from mail-io0-f182.google.com (mail-io0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id D3110606BF
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  7 Jan 2017 09:12:55 +0000 (UTC)
Received: by mail-io0-f182.google.com with SMTP id f103so51438320ioi.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 Jan 2017 01:12:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=pelagicore-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=goseSrWlkvam6CDrRsZB0Eg9aTh2m53FplA5XAfWlGw=;
	b=J2n57tC2AdAs4QrJo1B884KQJQwEBVmLHzMYJ6lISsXEelytFu8pgo2jWtG+RO5TTa
	tRBT5Eg6pIppMBVSu1CjZ9uCSuIZR16MZK12IXBlo08DwC93oP4eCuV1fgwwmUr8hT4m
	lIkKPBpt4s54FL5bneSNcR/jTdPfoc6UTDqRT+TDR69r8MBoFJcwGSZJY5dncobpTqX3
	+lHHfTGKMQtQQ9ZWp5/CcyZIl5zl+InN2ga1Uh2mz4a+2DRLUgb2i8e81kvP/Bl638/I
	IaoK1MPjKxUl+9Q+A/HBN9b2D3M2iOSADPCaJoiHeOk0Io9uufk/PILl9nezckCwG70s
	1KtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=goseSrWlkvam6CDrRsZB0Eg9aTh2m53FplA5XAfWlGw=;
	b=eIvKqZO24iPSVuCboLMOiBDuo4OAR3k+W70EnXBD4hNtMM50zDEJ7mvdQ4lIsaoZPA
	HLzvmBPK9UHw81olRzCLHBKsWA7Oxu+IOLP8ME3jb4NVdMFzdVoeeVyMi0/D0HwhYP0n
	mkges5vG7G0UdcW0S0WP62z1FBJTBLMGYli3mmAWiQzr6pcCvYxmwCTJ/nwZdHtezOZ6
	ze3iHRNY8SVRDX+tGa9taAfVRTDgF5g1/APR7xqkV/AxxGPc/1khCHG7TS4N7wev66zC
	T8BgP+ZA9xncpQz+WMdbCN6vF15eikZ77atpbD7kFhSh9AEbQBDbo4nrD2VRJ8xZ14ex
	IA6g==
X-Gm-Message-State: AIkVDXK2JU/vTybwpv5m+LGyRJVnDWp76z6LYBYZe2WdfCeolzL+9/YIRddbByieAm2MNTPg+ZSUgZxI0rQjjhnB
X-Received: by 10.107.169.202 with SMTP id f71mr1812774ioj.199.1483780375852; 
	Sat, 07 Jan 2017 01:12:55 -0800 (PST)
MIME-Version: 1.0
Received: by 10.64.144.99 with HTTP; Sat, 7 Jan 2017 01:12:35 -0800 (PST)
In-Reply-To: <20170105180258.GA3243@jama>
References: <1483345698-2761-1-git-send-email-oleksandr.kravchuk@pelagicore.com>
	<20170105180258.GA3243@jama>
From: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
Date: Sat, 7 Jan 2017 10:12:35 +0100
Message-ID: <CAKuJqM83ELOk+n=gGNzdqqNLHFXwdB0=gWe-67hLVWV=pbx+Dg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH] tcpdump: upgrade to 4.8.1
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
X-List-Received-Date: Sat, 07 Jan 2017 09:12:56 -0000
Content-Type: text/plain; charset=UTF-8

Martin -

Thank you for the comment. I will try to pay closer attention to
warnings during testing in the future.

I have sent a fix to the mailing list, "[meta-networking][PATCH]
tcpdump: remove obsolete enable-ipv6 configure flag".

On 5 January 2017 at 19:02, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Mon, Jan 02, 2017 at 09:28:18AM +0100, Oleksandr Kravchuk wrote:
>> Signed-off-by: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
>
> Causes:
> ERROR: tcpdump-4.8.1-r0 do_configure: QA Issue: tcpdump: configure was passed unrecognised options: --enable-ipv6 [unknown-configure-option]
> ERROR: tcpdump-4.8.1-r0 do_configure: Fatal QA errors found, failing task.
> ERROR: tcpdump-4.8.1-r0 do_configure: Function failed: do_qa_configure
>
>> ---
>>  .../recipes-support/tcpdump/{tcpdump_4.7.4.bb => tcpdump_4.8.1.bb}    | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>  rename meta-networking/recipes-support/tcpdump/{tcpdump_4.7.4.bb => tcpdump_4.8.1.bb} (91%)
>>
>> diff --git a/meta-networking/recipes-support/tcpdump/tcpdump_4.7.4.bb b/meta-networking/recipes-support/tcpdump/tcpdump_4.8.1.bb
>> similarity index 91%
>> rename from meta-networking/recipes-support/tcpdump/tcpdump_4.7.4.bb
>> rename to meta-networking/recipes-support/tcpdump/tcpdump_4.8.1.bb
>> index e18228f..18efb9b 100644
>> --- a/meta-networking/recipes-support/tcpdump/tcpdump_4.7.4.bb
>> +++ b/meta-networking/recipes-support/tcpdump/tcpdump_4.8.1.bb
>> @@ -12,8 +12,8 @@ SRC_URI = " \
>>      file://add-ptest.patch \
>>      file://run-ptest \
>>  "
>> -SRC_URI[md5sum] = "58af728de36f499341918fc4b8e827c3"
>> -SRC_URI[sha256sum] = "6be520269a89036f99c0b2126713a60965953eab921002b07608ccfc0c47d9af"
>> +SRC_URI[md5sum] = "32f57943649f276e09236ba66622bb0c"
>> +SRC_URI[sha256sum] = "20e4341ec48fcf72abcae312ea913e6ba6b958617b2f3fb496d51f0ae88d831c"
>>  export LIBS=" -lpcap"
>>
>>  inherit autotools-brokensep ptest
>> --
>> 2.7.4
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>



-- 
echo "EOF" >> /var/tmp/email

