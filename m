Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f68.google.com (mail-pl0-f68.google.com
	[209.85.160.68])
	by mail.openembedded.org (Postfix) with ESMTP id 73CFE7888F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Mar 2018 21:51:49 +0000 (UTC)
Received: by mail-pl0-f68.google.com with SMTP id x4-v6so6174351pln.7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Mar 2018 14:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=eqMlAt720mYGBOtAoCIC8HCDAtO11UkVLt1l/Wh27bc=;
	b=szb2eJjgUc7IC4jCCPaqbwabuioonMzPiNwaoX2+tlarsn8y5X01b7F0dZ/F16x5jy
	98LMcvysgS8MWr1pMdyP+vtC/tuxRUiZqEwfGgVvpHN/OXGGThem+ZpjzI/gNY09K+JG
	X6OBWfp5OodFvVSdLLpJZcKHxtESo9nflrsOztmlwna7Ypsg5oddCh4zeUxLWC2rLvJT
	Ow9mi/zWFBSEo2X+Rl2cg9LzI+9p+ZHF2GNqVSW0NdAxWi9wkwy+aSmQCkG+DHNeDu1M
	2wR2UxWSaVan8vlgbd34JwqtqmXeDQknjl2JwB6NeYLkXL33HYd7fzqGnJOlBeXhA9GU
	DgGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=eqMlAt720mYGBOtAoCIC8HCDAtO11UkVLt1l/Wh27bc=;
	b=JRFKwIcVR7cIrSxMG+ulpkdDZVe71TV86Y5Sy/tf1JbWbq4IU7hr9qYnzCfjCpC4Lc
	ncpeXMShoXNCgYP+kN7A54IRaXO2A0HOt7+Z90TVvxF1QD8mZ2QMkNGBjgQ0Qcs2LsFj
	GB+/jjaakvcwnt/NuASyOwVgiWd70+YIOduPUEGYzniHr9IQkVupCYDNTpzmW8qkimEx
	nH+70Vd+BKCdNWblMb1obdCMdce1gH6B/NOqVu0OT65dBrN+c0zuhyLw1SMdPwEfQ0n2
	e2oVJzvsVft1cupksv92kTcwiZzQypEGSSapMwmpzPC9z8GJtHDnagrO3YrMZdlV81s+
	0TeQ==
X-Gm-Message-State: AElRT7G2m7cXHNutcl3WvcEbfzhA3sxQZgE/+3rY7IVG0F+dQRjiHztn
	vuc1TFphByqrEt8oxUIHQFGPqgBhPtPh4pPFuOM=
X-Google-Smtp-Source: AG47ELvZOa2pbJsUT/y7pHaoRptIG6GFhwIasnV39CleDB7XV3HGUx/D5/nBzOXyng7cCnRoL9nX6HWyIbXLWU+8eoI=
X-Received: by 2002:a17:902:6e01:: with SMTP id
	u1-v6mr16654323plk.96.1521755510514; 
	Thu, 22 Mar 2018 14:51:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.241.68 with HTTP; Thu, 22 Mar 2018 14:51:20 -0700 (PDT)
In-Reply-To: <CALbNGRTpiqyWxrZqwevg5qpbLOLzyAWmTtWbq26n6o1k0QVEag@mail.gmail.com>
References: <20180322213741.29876-1-schnitzeltony@gmail.com>
	<CALbNGRTpiqyWxrZqwevg5qpbLOLzyAWmTtWbq26n6o1k0QVEag@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 22 Mar 2018 14:51:20 -0700
Message-ID: <CAMKF1sq9B04-As85yRQvtrLBoWYZvqsYN989QiGdJ8x8bfe7iQ@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 1/4] networkmanager: fix gobject-introspection/musl and cleanup
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
X-List-Received-Date: Thu, 22 Mar 2018 21:51:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 22, 2018 at 2:44 PM, Andreas M=C3=BCller <schnitzeltony@gmail.c=
om> wrote:
> On Thu, Mar 22, 2018 at 10:37 PM, Andreas M=C3=BCller
> <schnitzeltony@gmail.com> wrote:
>> This adresses the comments for recent patch which updated nm to 1.10.6 a=
nd is a
>> follow-up for [1].
>>
>> * Make gobject-introspection work by skipping creation of gobject-intros=
pection
>>   specific documentation. This fixes networkmanager-applet regression.
>> * Cleanup patches: Remove current musl patches completely and re-use tho=
se
>>   found in void-linux because they do look much cleaner and don't touch =
glibc
>>   build. One nice side effect: In the future when nm is updated we can s=
teal
>>   again and don't need to reenvent here. Usually they are much faster th=
an we
>>   are (and I know one major contibutor personally from the good old Z80 =
times..)
>> * Fix typo in PACKAGECONFIG
>>
>> [1] https://patchwork.openembedded.org/patch/149244/
>>
> Khem: can you give these a musl test? I do not have enough time and
> build resources (and am not using musl).

I will try it out hopefully by weekend. What you dont use musl !!!! my god =
:)

