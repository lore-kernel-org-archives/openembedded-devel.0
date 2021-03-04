Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by mx.groups.io with SMTP id smtpd.web08.6052.1614863565052623592
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Mar 2021 05:12:46 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@mailbox.org header.s=mail20150812 header.b=CTHUw7nC;
 spf=pass (domain: mailbox.org, ip: 80.241.56.151, mailfrom: crg7475@mailbox.org)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:105:465:1:2:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4DrrrV6x0MzQlX9;
	Thu,  4 Mar 2021 14:12:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
	content-language:content-transfer-encoding:content-type
	:content-type:in-reply-to:mime-version:date:date:message-id:from
	:from:references:subject:subject:received; s=mail20150812; t=
	1614863559; bh=lQjwQvihd4mf7D7w9T/aO2j7vsC86ePWGtV367OcHeA=; b=C
	THUw7nCT6+guggo8kLBxIbYZftsut7y4NoRo8+FS5AACKcVYXWa0os/LH/6YviQQ
	5Cdzh3pJXlb6zGObHjr621gkcxkOPJcNDY6Jk/c6fmtLOL+R+wJqtHf3eRlqPwQt
	Zh7/GjAzSS8VA47F4C/l4IU7hJKuh1VTgdXDLufca1BS5+kMLeQOH2RFv1rBwor/
	xHWqAncJGIfxeso3ZrlS44S9cw04asXGITobtGd7Nz4yYDJfU+70Vig4RfsTEdF0
	Z0G/Kljatkabdx0putJvme/qQaD8n2Ku/lpyyV4d21Es9m2Hg/jz7zq77xG3K+vs
	oPy3sT/jlcRMrFHZiFHWg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1614863561;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zXoMoNRKhFkeISnndFyfTMMrxNHllDC0uQtwx9tclK8=;
	b=OXYSNGXNuMEkdkSctwcR3TiRkGcb1QS63vqTK7s/A71FBMryz5GWvdtNnrM8Yh2SQvaHAe
	VKoMQ8bC4LHXT3HXXCKMgtrIxo1uP/FVmg/uU3vT9Lz1fQktA6bFn1d/c+AD/3hFeWx0U6
	kkpDxnl00Xs0ML7GlF2vJAACPWv49uPnT/ShkSWV+XpcUKeqXGvKJPn0O+pTu5z3HHyfbb
	hNyP6mmAyIbmu0De7HRuOmT+dCR0O3/6lg/vkoEBCfs4gUXBkcfVsaHBvS1rSTspjiPTqc
	tURjFOTJa5HGxZf28OkwIEsBEXCd7465NDix9JcuvkLMk/PXlRgBgG8IFLJkhA==
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp2.mailbox.org ([80.241.60.241])
	by spamfilter05.heinlein-hosting.de (spamfilter05.heinlein-hosting.de [80.241.56.123]) (amavisd-new, port 10030)
	with ESMTP id incIua0GsCXu; Thu,  4 Mar 2021 14:12:39 +0100 (CET)
Subject: Re: [oe] [meta-multimedia][PATCH 1/2] pipewire: Move to meta-multimedia
To: =?UTF-8?Q?Andreas_M=c3=bcller?= <schnitzeltony@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
 quentin.schulz@streamunlimited.com,
 George Kiagiadakis <george.kiagiadakis@collabora.com>
References: <20210303114130.2317817-1-crg7475@mailbox.org>
 <CALbNGRT-L+khTL5277KAjfqwCdQ66yH-o6tcw35=0cr_CKzttQ@mail.gmail.com>
From: "Carlos Rafael Giani" <crg7475@mailbox.org>
Message-ID: <74063b8d-88e6-6c98-e2d2-7a640f7ebea4@mailbox.org>
Date: Thu, 4 Mar 2021 14:12:38 +0100
MIME-Version: 1.0
In-Reply-To: <CALbNGRT-L+khTL5277KAjfqwCdQ66yH-o6tcw35=0cr_CKzttQ@mail.gmail.com>
X-MBO-SPAM-Probability: 
X-Rspamd-Score: -4.89 / 15.00 / 15.00
X-Rspamd-Queue-Id: E4AF717BA
X-Rspamd-UID: 9d69f8
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Well, fine by me, though I'd like to ask others as well what they think=20
about moving this to oe-core?

On 03.03.21 22:01, Andreas M=C3=BCller wrote:
> On Wed, Mar 3, 2021 at 12:41 PM Carlos Rafael Giani via
> lists.openembedded.org <crg7475=3Dmailbox.org@lists.openembedded.org>
> wrote:
>> Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
>> ---
>>   .../recipes-multimedia/pipewire/pipewire-0.2_git.bb               | =
0
>>   .../recipes-multimedia/pipewire/pipewire_git.bb                   | =
0
>>   2 files changed, 0 insertions(+), 0 deletions(-)
>>   rename {meta-oe =3D> meta-multimedia}/recipes-multimedia/pipewire/pi=
pewire-0.2_git.bb (100%)
>>   rename {meta-oe =3D> meta-multimedia}/recipes-multimedia/pipewire/pi=
pewire_git.bb (100%)
>>
>> diff --git a/meta-oe/recipes-multimedia/pipewire/pipewire-0.2_git.bb b=
/meta-multimedia/recipes-multimedia/pipewire/pipewire-0.2_git.bb
>> similarity index 100%
>> rename from meta-oe/recipes-multimedia/pipewire/pipewire-0.2_git.bb
>> rename to meta-multimedia/recipes-multimedia/pipewire/pipewire-0.2_git=
.bb
>> diff --git a/meta-oe/recipes-multimedia/pipewire/pipewire_git.bb b/met=
a-multimedia/recipes-multimedia/pipewire/pipewire_git.bb
>> similarity index 100%
>> rename from meta-oe/recipes-multimedia/pipewire/pipewire_git.bb
>> rename to meta-multimedia/recipes-multimedia/pipewire/pipewire_git.bb
>> --
>> 2.25.1
>>
> To be honest: I'd prefer the other way: Add it to oe-core (of course
> not this old version). Haven't found the time to check more on details
> but it is a drop in replacement for at least pulseaudio and jack.
>
> Andreas
