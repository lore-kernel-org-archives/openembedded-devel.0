Return-Path: <schnitzeltony@gmail.com>
Received: from mail-yb0-f196.google.com (mail-yb0-f196.google.com
	[209.85.213.196])
	by mail.openembedded.org (Postfix) with ESMTP id BEC8E782A0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Mar 2018 23:27:28 +0000 (UTC)
Received: by mail-yb0-f196.google.com with SMTP id o3-v6so1017971ybm.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Mar 2018 16:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=GdIYxIUQ9ZvvDn4MvWlU/mKex2q8GTrpUMAhqe675Ec=;
	b=U6+148LLV/umqrMsRAoZq2x98gm9dGtzVP6hk3x/gubhlvp9YcBck078uglXLWeiWR
	qoYybGWpuXN3bzhVPXAmSSDNL401W6gfTLm9ZrhJrkqGN5S2FDPQB0kmIXJwYP40CZ9j
	sQOilP7rzNKvdjSMafA2l1LD1aNIfKmM1BjsF0p12wvRXMUBJ/R6QlYC0Ofa3jVR472B
	5PUFlqMckkfXdWNPinx9GFmXVwSciom/NIhb4mXvMeTvaEfHP0mFD/Auom/WWDdhqyH7
	q0mq2sLXwnkuBRXqk1mgLNqepTvpXFVscPNVjszjUlL50BCguJ3XQ4KI1FrUnB1LqQda
	bqNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=GdIYxIUQ9ZvvDn4MvWlU/mKex2q8GTrpUMAhqe675Ec=;
	b=TI2FPm+LYUV/ufbOqi9PMkH/XATGWw0Wqf1BPC07XsKeQEzOy/lCGtpAnGP1axdhqA
	/uetjCqsMUJEcHspUxFSMpssDmR5AYS5IJCD7gp8tZ0JOZiUUvzrMDA8a/3RkTpJYdQ2
	pUDiRnRQmEiiOWZ2k1dd9fFZinqZZF5Ml2skOgv4gJQvTulAQ+caWEMERb467T1sqrz0
	m6NkaaLa+y2fHS/cqmTOaixN0sucAbLwBr+HD2otCRMsvF8tIsPH1OazNExn3VKX/uYH
	EmDKMBdUoq7n9AXZzUn2Qh2ibhw84C0fXSpVEjzJ1KhCFf9S5Y5UDbKkLDYPuywU5Vzo
	wh/g==
X-Gm-Message-State: AElRT7ETvFOVSdwerh/DQe0AERbwToThjiSq0hS+ElOj+QHB4KkAnrET
	uGBCZmGSglkv7AOjjwoeS4Gyb4r1g0HT1/mcFx0=
X-Google-Smtp-Source: AG47ELugZcpIEVgisVTCHRSya7/76TW0fVVJ/Zm8phCNv4TPcGQZkEuDvTTZg7iXiEZqwy04ItkyxSQrDKZv9b7X5ho=
X-Received: by 2002:a25:6213:: with SMTP id
	w19-v6mr12870020ybb.237.1521761249824; 
	Thu, 22 Mar 2018 16:27:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a25:d105:0:0:0:0:0 with HTTP; Thu, 22 Mar 2018 16:27:29
	-0700 (PDT)
In-Reply-To: <CAMKF1sq9B04-As85yRQvtrLBoWYZvqsYN989QiGdJ8x8bfe7iQ@mail.gmail.com>
References: <20180322213741.29876-1-schnitzeltony@gmail.com>
	<CALbNGRTpiqyWxrZqwevg5qpbLOLzyAWmTtWbq26n6o1k0QVEag@mail.gmail.com>
	<CAMKF1sq9B04-As85yRQvtrLBoWYZvqsYN989QiGdJ8x8bfe7iQ@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Fri, 23 Mar 2018 00:27:29 +0100
Message-ID: <CALbNGRSN2HLPQ50RN9hE7XHGLLF0oLCgx22aT=DOsAGKqd5p4g@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
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
X-List-Received-Date: Thu, 22 Mar 2018 23:27:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 22, 2018 at 10:51 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Thu, Mar 22, 2018 at 2:44 PM, Andreas M=C3=BCller <schnitzeltony@gmail=
.com> wrote:
>> On Thu, Mar 22, 2018 at 10:37 PM, Andreas M=C3=BCller
>> <schnitzeltony@gmail.com> wrote:
>>> This adresses the comments for recent patch which updated nm to 1.10.6 =
and is a
>>> follow-up for [1].
>>>
>>> * Make gobject-introspection work by skipping creation of gobject-intro=
spection
>>>   specific documentation. This fixes networkmanager-applet regression.
>>> * Cleanup patches: Remove current musl patches completely and re-use th=
ose
>>>   found in void-linux because they do look much cleaner and don't touch=
 glibc
>>>   build. One nice side effect: In the future when nm is updated we can =
steal
>>>   again and don't need to reenvent here. Usually they are much faster t=
han we
>>>   are (and I know one major contibutor personally from the good old Z80=
 times..)
>>> * Fix typo in PACKAGECONFIG
>>>
>>> [1] https://patchwork.openembedded.org/patch/149244/
>>>
>> Khem: can you give these a musl test? I do not have enough time and
>> build resources (and am not using musl).
>
> I will try it out hopefully by weekend. What you dont use musl !!!! my go=
d :)

Teach me: why should I?

Andreas

