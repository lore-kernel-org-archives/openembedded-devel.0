Return-Path: <pbasista@gmail.com>
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com
	[209.85.210.50])
	by mail.openembedded.org (Postfix) with ESMTP id 1EE4C6C100
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Nov 2018 17:03:45 +0000 (UTC)
Received: by mail-ot1-f50.google.com with SMTP id k98so25623027otk.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Nov 2018 09:03:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=XCvZRPmMjfLTWyD5eSV9BAgkhceIQIMHTTFkAhRoPUY=;
	b=eVUy1yZ5QQF1o4L3QGJBD2OMdXoDKs6grA8kIyleTujROdglIchCPCNOPMkODmtbOi
	RrqUdVNwBQV4IAdWv9Yfkk/wQokdpzenfjM3ZPrazzhzgjXufXaact1uWVNpzkMVzSJC
	eBDWcn1T2AqCUaWWeNP4dKWtyVB9EA3xM5u/V4owHy/1tJN6fJGCsenNGQWMb/4FPNC6
	o3WrY1WEJAEdUZz1ilUqA5eNgV+xvKRNniByh3PhdADmaDvMwGuqRapQ7c1jI2QKliHJ
	TAaxI1I9RUCB+vDH3sN3NT78K4a34Dj0NuhCnhsCqsVK2f02qVUpgrGOiITqSugDneYP
	1+Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=XCvZRPmMjfLTWyD5eSV9BAgkhceIQIMHTTFkAhRoPUY=;
	b=jAYqvXcUBvRpEOgYxuTMMbCdSWt8BB6opcuFK6RmvTQPUu2VE6gVMA+N5o4ZhLJtYR
	i4GhngEsWJfaKuXMuTgAujNaB+JdiaasTwMxtHRHWGWRZnEchjza4jaefFO0LtbB3iqa
	Fc8hO+iy+mB/v5nFwV5DAMoDPxpPYvb3L0InGpqisqcHut/28uUBgN48ER3HPgdcV6WQ
	NIlmA2X7iRkqSv3LPae5X//TsOBWpXC7U5QnrbvKr2rj9tkwdxN+yp/MoAvmGlyITFtb
	aqVIuy2t/hXz1h8Z5c8xFHcMCldH8OYrd03aredbqc0BYCzMxrRkgAbx2B/MlS89zUQM
	7Wyw==
X-Gm-Message-State: AGRZ1gIa2Jb1Xp+E8Mj3S/BlxkvWBjy7AFuPsErPpSfP8mp1XoWoEYnF
	Rzjk2/oY4NfxCHlV9o9e5YPKiaINvyr9X1QTW+Q=
X-Google-Smtp-Source: AJdET5ewUxJ9ZhojLjLHpq9qyrQrP/BgCQZL6UjACH42gAde8lLzwKipv4wr8K26xGJTxSuNIeRQk/Xnng1u6iur/ys=
X-Received: by 2002:a9d:4355:: with SMTP id y21mr11660824oti.290.1542560626137;
	Sun, 18 Nov 2018 09:03:46 -0800 (PST)
MIME-Version: 1.0
References: <CA+2FH0+dA+YDr6cU-WbXAXX5EmH7CnO4CDxWgtXy-680KF5FyA@mail.gmail.com>
	<CA+2FH0K_gV1i-kXHYAEdEemcE6NaqXhci-fd0eeB6cirL0Yjrg@mail.gmail.com>
	<CAMKF1sqCx2Zgteicu9XmQ=qE+_vtc6MgG-Np1JnvT_MtYVMgoQ@mail.gmail.com>
In-Reply-To: <CAMKF1sqCx2Zgteicu9XmQ=qE+_vtc6MgG-Np1JnvT_MtYVMgoQ@mail.gmail.com>
From: =?UTF-8?Q?Peter_Ba=C5=A1ista?= <pbasista@gmail.com>
Date: Sun, 18 Nov 2018 18:03:34 +0100
Message-ID: <CA+2FH0+rwUpjTOeGxWn+_3dfQpEcbe8vkU9TfbqMOVP-1ZrDuQ@mail.gmail.com>
To: raj.khem@gmail.com
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-multimedia] Add a working Tvheadend recipe
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
X-List-Received-Date: Sun, 18 Nov 2018 17:03:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the information, I will send the patch then.

On Sun, Nov 18, 2018 at 6:18 AM Khem Raj <raj.khem@gmail.com> wrote:

>
>
> On Sat, Nov 17, 2018 at 1:44 PM Peter Ba=C5=A1ista <pbasista@gmail.com> w=
rote:
>
>> Hi,
>>
>> a few months ago, I have created a PR on GitHub about adding a working
>> Tvheadend recipe:
>>
>> https://github.com/openembedded/meta-openembedded/pull/91
>>
>> I would like to have it merged, because I believe that Tvheadend can be
>> very helpful with setting up a TV streaming server on linux-based DVB
>> receivers.
>>
>> But it seems like no one has looked into it yet. Therefore, I would like
>> to
>> ask here how the process works.
>>
>
> Thanks for asking here usual process is to submit patches to
> openembedded-devel mailing list
>
> GitHub repos are primarily for mirroring we do not use it to run
> contributions yet
>
> https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded
>
>
>
>> Thank you.
>>
>> Regards
>> Peter Ba=C5=A1ista
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
>

