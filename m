Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vk0-f53.google.com (mail-vk0-f53.google.com
	[209.85.213.53])
	by mail.openembedded.org (Postfix) with ESMTP id EFA3F60079
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Dec 2016 23:59:10 +0000 (UTC)
Received: by mail-vk0-f53.google.com with SMTP id x186so187777268vkd.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 Dec 2016 15:59:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=L95WOmj4N2f0HIkdR0Ka9vTlh5Z1FVApcX4sDbqin18=;
	b=QjX5215pPakfnrRrQxxDd/oKQPvbwVgJIk54BkLte9mn+M2zrr4AMDJKEInLZgSnQ2
	J3OTXMBzH9y2CEV44oiW3vgtCG8teCILxJkuzZTYotdm7im9Z2ODA+FUZknMLElAEGcy
	kxL7b0ayAVnHPcBWpZZR9TO2m1vQr7NKSQGrOzd2XQ76yhlNl4STF7p1tbH3dGbudtKA
	w7pIG+ILPF8D2uNVhCFDS6L9xASdF5svBw6sZxNlJoo4n7Y283yliJJwdIGqGcYuVjOQ
	1ZylxAmNL5glDUIS/UwdteUPscmRgF05HwtzM8rTzyGgs0nTly4vTFlu90H3qpFQAD/C
	nBdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-transfer-encoding;
	bh=L95WOmj4N2f0HIkdR0Ka9vTlh5Z1FVApcX4sDbqin18=;
	b=XNUGrwEUjux0w0vIKpkd9/O1lfSb1WBvDgThbrRUuvlaY5qGQtPlN/xjjrJ9BFI274
	KpOV+yFp12v7l+EyT1ruQKgXpBOBorBovCo5T1c1ziMvHJqzRZhdoyh2zw1tByzt/CFy
	+MlKdzMyOKqkG+MqNqeyPJBMiGV/D56pGDU7gmrMf1XlTWIOSisrytVdutjhRNg9R4T8
	VP2xKoF/i/X9+9CtSfBGRqGArJ/sRLNcbDRYy14OtrHSONofvbreW76LLEazHolX6d36
	GC1pfhBNvu5wfrK2hI4KtYe/e4qyTR476YQyebQQFP53NxBDA20vCHPjDT4GdCAj1B2F
	A24w==
X-Gm-Message-State: AKaTC00UwXc3XLrwSxr5mnTuZ8CNGqVAMA68m0ZoId49Sk0BGmTTmHAdXXAOu2wKMQ0Y/nR4HfwGv3f2IQX6Ow==
X-Received: by 10.31.88.1 with SMTP id m1mr22942457vkb.83.1480982351744; Mon,
	05 Dec 2016 15:59:11 -0800 (PST)
MIME-Version: 1.0
Received: by 10.176.85.157 with HTTP; Mon, 5 Dec 2016 15:59:11 -0800 (PST)
In-Reply-To: <689CB891-7D18-4FEB-9BE5-DF2CD80B066E@gmail.com>
References: <1480979306-21331-1-git-send-email-schnitzeltony@googlemail.com>
	<689CB891-7D18-4FEB-9BE5-DF2CD80B066E@gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Tue, 6 Dec 2016 00:59:11 +0100
Message-ID: <CALbNGRQLu7rhbQP9S0MDBVLdbCPbCybu_nqu++yZpD2fSbn6=g@mail.gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-xfce][PATCH 1/2] exo: fix build after perl update
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
X-List-Received-Date: Mon, 05 Dec 2016 23:59:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 6, 2016 at 12:32 AM, Khem Raj <raj.khem@gmail.com> wrote:
>
>> On Dec 5, 2016, at 3:08 PM, Andreas M=C3=BCller <schnitzeltony@googlemai=
l.com> wrote:
>>
>> fixes:
>>
>> | checking for perl5... no
>> | checking for perl... perl
>> | checking for perl module URI::Escape... no
>> | checking for perl module URI::file... no
>> | checking for perl module URI::URL... no
>> | configure: error: Atleast one of the required Perl modules (URI::Escap=
e, URI::file and URI::URL) was not found on your system
>>
>
> I was seeing same errors. Should this be using native perl instead ?
For exo case I think we already do: The only 'perlish' is
liburi-perl-native in DEPENDS and perlnative in inherit

Andreas

