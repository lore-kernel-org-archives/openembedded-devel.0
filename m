Return-Path: <bounce+4d9b4d.3a5685-openembedded-devel=lists.openembedded.org@asterius.io>
Received: from mail4.static.mailgun.info (mail4.static.mailgun.info
	[104.130.122.4])
	by mail.openembedded.org (Postfix) with ESMTP id E7D157894B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Mar 2018 13:55:53 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=asterius.io; q=dns/txt;
	s=mailo; t=1521467755; h=Content-Type: Cc: To: Subject: Message-ID:
	Date: From: References: In-Reply-To: MIME-Version: Sender;
	bh=RqeiBJj8mUgnPK2kbVw4MU4San1y59ACEtaKa+U1lkQ=;
	b=BPh0EWifhziFbQA+SbC6cMKdLMXWLJ/idQqaAdTtMyZkzr2cUfvjNhq1Td1JBIcUqIcgUHHV
	pig/zPw+hgFRAXKocsdA8UkGKgNYrM+hMkyidmDnvgO3Rwnz2nHL4dTvkTH9cNvezR7ySXth
	5RjS8QnvkEYDSRTOJisS0E0CKUg=
X-Mailgun-Sid: WyIzN2NkMyIsICJvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyIsICIzYTU2ODUiXQ==
X-Mailgun-Sending-Ip: 104.130.122.4
Sender: derek@asterius.io
Received: from mail-io0-f169.google.com (mail-io0-f169.google.com
	[209.85.223.169])
	by mxa.mailgun.org with ESMTP id 5aafc16b.7f82a406fab0-smtp-out-n01;
	Mon, 19 Mar 2018 13:55:55 -0000 (UTC)
Received: by mail-io0-f169.google.com with SMTP id e79so12655285ioi.7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Mar 2018 06:55:55 -0700 (PDT)
X-Gm-Message-State: AElRT7Ely4dJ1rHQd73qiZCId6pdqRpiWIOvTZI9rcvLeGDS1GfpaJ3d
	pUxpjMVP3zhFO+UVkWLAPmidBqxQK7yNVpMRNb4=
X-Google-Smtp-Source: AG47ELseqE03EHDM5So9XlU1xrV1NH1RRjITDCgcS59dy/iw6AQcyBCp+s3otZpaK5ZrnEqwwhR6PUzJAOEgxX//MB8=
X-Received: by 10.107.176.208 with SMTP id z199mr5076746ioe.245.1521467754635; 
	Mon, 19 Mar 2018 06:55:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.140.6 with HTTP; Mon, 19 Mar 2018 06:55:53 -0700 (PDT)
In-Reply-To: <CADNbA1pcjD7BjF20VrXGOF5Qe7tj_kj6Jr8bGfNcKj2tSTgLwQ@mail.gmail.com>
References: <CALw8SCUwyJA29Ytmgo4rOL+cyVDDZyOePFWnVp-H2Y03BWDYkg@mail.gmail.com>
	<CADNbA1pcjD7BjF20VrXGOF5Qe7tj_kj6Jr8bGfNcKj2tSTgLwQ@mail.gmail.com>
From: Derek Straka <derek@asterius.io>
Date: Mon, 19 Mar 2018 09:55:53 -0400
X-Gmail-Original-Message-ID: <CADNbA1o0SFW-QkcV8vsBTN8i9pC-MV6Ycff_j6iVgLZ_+6YHVQ@mail.gmail.com>
Message-ID: <CADNbA1o0SFW-QkcV8vsBTN8i9pC-MV6Ycff_j6iVgLZ_+6YHVQ@mail.gmail.com>
To: Mirza Krak <mirza.krak@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: meta-python/rocko
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
X-List-Received-Date: Mon, 19 Mar 2018 13:55:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ah, you wanted the python3 version.  I just noticed that.  Stand by

On Mon, Mar 19, 2018 at 9:54 AM, Derek Straka <derek@asterius.io> wrote:

>
>
> On Mon, Mar 19, 2018 at 9:45 AM, Mirza Krak <mirza.krak@gmail.com> wrote:
>
>> Hi.
>>
>> I came across some break-age in meta-python/rocko. More specifically
>> that there is no python3-asn1crypto recipe though several packages
>> depend on it.  I can trigger this by building python3-requests.
>>
>
> I see the commit adding python-asn1cryto in the rocko branch.  Are you
> using an outdated rocko branch?  What commit is HEAD in your rocko branch=
?
>
>
>> I was reading the archives of the mailing list that indicated that
>> there some some instability regarding meta-python recently but nothing
>> covering this.
>>
>> I noticed the following commit [1], which mentions that it should be
>> merged together with another commit to actually add the
>> python3-asn1crypto. Which seems did not actually happen when the merge
>> was done.
>>
>> python3-asn1crypto was actually added in this commit [1] on master and
>> I can not seen that it has been back-ported. Note the somewhat commit
>> cryptic commit message in [2] where it does not actually say that it
>> added a python3-asn1crypto package.
>>
>
> To see the full history of a file, you'll need to tell git to follow, and
> you can see it was added in commit 8ceeb8b[1] not 80b6e6; however, both a=
re
> in rocko.
>
> `git log --follow ./meta-python/recipes-devtools/python/python3-
> asn1crypto_0.24.0.bb`
>
> [1] - http://cgit.openembedded.org/meta-openembedded/commit/
> meta-python?h=3Drocko&id=3D8ceeb8b512a265b03b2175943a01d9318ebb8634
>
>
> -Derek
>
>>
>>
>> [1]. http://cgit.openembedded.org/meta-openembedded/commit/meta-p
>> ython?h=3Drocko&id=3D187f959fbd220678595c2aa1fe1e17b00a0b2d92
>>
>> [2]. http://cgit.openembedded.org/meta-openembedded/commit/meta-p
>> ython/recipes-devtools/python/python3-asn1crypto_0.24.0.bb?i
>> d=3D80b6e6f151588765000cf17d2b86d0ded762def1
>>
>> --
>> Med V=C3=A4nliga H=C3=A4lsningar / Best Regards
>>
>> Mirza Krak
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
>
>

