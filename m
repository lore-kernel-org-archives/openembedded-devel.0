Return-Path: <bounce+4d9b4d.3a5685-openembedded-devel=lists.openembedded.org@asterius.io>
Received: from mail4.static.mailgun.info (mail4.static.mailgun.info
	[104.130.122.4])
	by mail.openembedded.org (Postfix) with ESMTP id 3C8857893E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Mar 2018 13:56:43 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=asterius.io; q=dns/txt;
	s=mailo; t=1521467804; h=Content-Type: Cc: To: Subject: Message-ID:
	Date: From: References: In-Reply-To: MIME-Version: Sender;
	bh=P6W1L9mctxF4z+wO2gfuy9dHV1xv/9yfhpYaZlV30UE=;
	b=f+jSi1t52qHSsH+YrTwDN0MVM+xNmib3rX66lQm/hVtPmybmTeASW5zIaTN+RVP0SxAZRrTi
	Xi6XqF/RkrlKc9eZAeW8QiYEjbsIoV5GNPSbqBDW5TxrAZNKUsdMN9wKXT3B9MVnJOZ+uvyH
	zT+2uXO80PiOAqvtNBvFvFw3mLE=
X-Mailgun-Sid: WyIzN2NkMyIsICJvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyIsICIzYTU2ODUiXQ==
X-Mailgun-Sending-Ip: 104.130.122.4
Sender: derek@asterius.io
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com
	[209.85.223.174])
	by mxa.mailgun.org with ESMTP id 5aafc19c.7fd38b4e9530-smtp-out-n02;
	Mon, 19 Mar 2018 13:56:44 -0000 (UTC)
Received: by mail-io0-f174.google.com with SMTP id o4so6635506iod.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Mar 2018 06:56:44 -0700 (PDT)
X-Gm-Message-State: AElRT7ELCdqpKI6ROWJIBBJzFEpOfJ7HeX3X7ZOZbWEC2jpfxXOv7Rfk
	6NbW33EZra0ehWt4Z+IpU6M3cc0CtBbrL0ry034=
X-Google-Smtp-Source: AG47ELt/waTVhjMUJ58pAurLmv+konqm3KRyJ51jrk2hZcirBMyRFGbYbQXEMxBFBy4Z/0jQ2z/nRLUQiibTDqFki4w=
X-Received: by 10.107.176.208 with SMTP id z199mr5079850ioe.245.1521467804108; 
	Mon, 19 Mar 2018 06:56:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.140.6 with HTTP; Mon, 19 Mar 2018 06:56:43 -0700 (PDT)
In-Reply-To: <CADNbA1o0SFW-QkcV8vsBTN8i9pC-MV6Ycff_j6iVgLZ_+6YHVQ@mail.gmail.com>
References: <CALw8SCUwyJA29Ytmgo4rOL+cyVDDZyOePFWnVp-H2Y03BWDYkg@mail.gmail.com>
	<CADNbA1pcjD7BjF20VrXGOF5Qe7tj_kj6Jr8bGfNcKj2tSTgLwQ@mail.gmail.com>
	<CADNbA1o0SFW-QkcV8vsBTN8i9pC-MV6Ycff_j6iVgLZ_+6YHVQ@mail.gmail.com>
From: Derek Straka <derek@asterius.io>
Date: Mon, 19 Mar 2018 09:56:43 -0400
X-Gmail-Original-Message-ID: <CADNbA1o5minKhZgwfG6kisd06S9t2hgJ8AmfphThdwSD-Y6FYg@mail.gmail.com>
Message-ID: <CADNbA1o5minKhZgwfG6kisd06S9t2hgJ8AmfphThdwSD-Y6FYg@mail.gmail.com>
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
X-List-Received-Date: Mon, 19 Mar 2018 13:56:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yeah.  The python3 version wasn't there in rocko.  I'll send out a patch.
Thanks for catching this.

On Mon, Mar 19, 2018 at 9:55 AM, Derek Straka <derek@asterius.io> wrote:

> Ah, you wanted the python3 version.  I just noticed that.  Stand by
>
> On Mon, Mar 19, 2018 at 9:54 AM, Derek Straka <derek@asterius.io> wrote:
>
>>
>>
>> On Mon, Mar 19, 2018 at 9:45 AM, Mirza Krak <mirza.krak@gmail.com> wrote=
:
>>
>>> Hi.
>>>
>>> I came across some break-age in meta-python/rocko. More specifically
>>> that there is no python3-asn1crypto recipe though several packages
>>> depend on it.  I can trigger this by building python3-requests.
>>>
>>
>> I see the commit adding python-asn1cryto in the rocko branch.  Are you
>> using an outdated rocko branch?  What commit is HEAD in your rocko branc=
h?
>>
>>
>>> I was reading the archives of the mailing list that indicated that
>>> there some some instability regarding meta-python recently but nothing
>>> covering this.
>>>
>>> I noticed the following commit [1], which mentions that it should be
>>> merged together with another commit to actually add the
>>> python3-asn1crypto. Which seems did not actually happen when the merge
>>> was done.
>>>
>>> python3-asn1crypto was actually added in this commit [1] on master and
>>> I can not seen that it has been back-ported. Note the somewhat commit
>>> cryptic commit message in [2] where it does not actually say that it
>>> added a python3-asn1crypto package.
>>>
>>
>> To see the full history of a file, you'll need to tell git to follow, an=
d
>> you can see it was added in commit 8ceeb8b[1] not 80b6e6; however, both =
are
>> in rocko.
>>
>> `git log --follow ./meta-python/recipes-devtools/python/python3-
>> asn1crypto_0.24.0.bb`
>>
>> [1] - http://cgit.openembedded.org/meta-openembedded/commit/meta
>> -python?h=3Drocko&id=3D8ceeb8b512a265b03b2175943a01d9318ebb8634
>>
>>
>> -Derek
>>
>>>
>>>
>>> [1]. http://cgit.openembedded.org/meta-openembedded/commit/meta-p
>>> ython?h=3Drocko&id=3D187f959fbd220678595c2aa1fe1e17b00a0b2d92
>>>
>>> [2]. http://cgit.openembedded.org/meta-openembedded/commit/meta-p
>>> ython/recipes-devtools/python/python3-asn1crypto_0.24.0.bb?i
>>> d=3D80b6e6f151588765000cf17d2b86d0ded762def1
>>>
>>> --
>>> Med V=C3=A4nliga H=C3=A4lsningar / Best Regards
>>>
>>> Mirza Krak
>>> --
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>>
>>
>>
>

