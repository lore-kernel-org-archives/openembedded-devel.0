Return-Path: <schnitzeltony@gmail.com>
Received: from mail-oi0-f68.google.com (mail-oi0-f68.google.com
	[209.85.218.68])
	by mail.openembedded.org (Postfix) with ESMTP id 126F472EF7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Apr 2018 08:29:38 +0000 (UTC)
Received: by mail-oi0-f68.google.com with SMTP id f63-v6so13737667oic.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Apr 2018 01:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=CFoVbuX+fzPuCVtXuwbal2v3vjRS+D4o3YbpTwa6xNk=;
	b=B9ETxpSFT7mQ+YDdcGt0AXt6Y5rJt7XWo0xQ7TtJ520BVPT2BHKXTVwYsTgGxZpwZK
	ud2dJFe3feeRxxLjYSCJciTLnsolUnb16vXg84Cb8E090qn30jxYNIMs/kNNMCi9J3sM
	pmz9fgFjatmS59YW8ALHSWovRXguCDcFyU3iUeeTrpzfn7Wl7XhJXaWvO6Mw+nZ+fMi9
	PSl2tp4vf1cvaRRCHXh9UYNkodBxpCmL0v1/xnNd1sD7lvMmfzwQBQtDKY1g58W3SOZc
	QPiqXidTJcmq1xMgX7xfZyRdGz8c6ipkz4i8v1buCysjK+CEVlmrAhjm0LMKH3pPwvuN
	v6OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=CFoVbuX+fzPuCVtXuwbal2v3vjRS+D4o3YbpTwa6xNk=;
	b=iI8N4HuImPSFO7Hip6mkpShiF6c/t9TvOK6P/21pBe/KECHBUN6Y8chMj6Sz/4WUze
	1T/GPAJkzZq6TUcsgEgBSr2cCoBGcw18zJou/pzPuIuQp6qTdEOhBhv5we7XgK6VTdUC
	e66p9RIupcM0SAHsb4bqaJwkp5gDi2O1gjjhtA9CiCZGu0CH5Y+rihYGoaSv3+1Jz39I
	ZNv8dFn3UfpYWsTOjl1giqr/8Chk2ITAcK/oX+IiD3DXFIzwd4MAo6kIH5gRb9Hf1s0a
	RRTeukS0icwWLrVBq5wpIvaIyKHCow19eoBFoTh2wOKoS16DsxYhkVDQ0fHyTk4lJaYn
	nnuw==
X-Gm-Message-State: ALQs6tDAQrVsp401UXm8A3Jf0pjMXuAbIvQS5s9I5GuYNMs93n0Ac1pz
	G+FVRh7JrEFbqwliTLIkBTwemE7FzH2qPmlCpx8=
X-Google-Smtp-Source: AIpwx4/tkWoN/AS6Xb1Nywbx0s5EuzIzdQe+CXeKQxcskhQ/q+QN5fILo1PUziUnXKPco6qCP9mvnSBUJNvZRnCZ2ak=
X-Received: by 2002:aca:1902:: with SMTP id l2-v6mr696648oii.285.1523867379850;
	Mon, 16 Apr 2018 01:29:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.201.25.81 with HTTP; Mon, 16 Apr 2018 01:29:38 -0700 (PDT)
In-Reply-To: <CALbNGRTJF5vpgvoY71ag7kcF-+-qSvsgw8JaRU-GnOMokpUHsg@mail.gmail.com>
References: <20180409220249.11796-1-schnitzeltony@gmail.com>
	<20180409220249.11796-2-schnitzeltony@gmail.com>
	<4bc04e65-e5c8-7a7a-5731-72afd624b0c3@gmail.com>
	<CALbNGRTJF5vpgvoY71ag7kcF-+-qSvsgw8JaRU-GnOMokpUHsg@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Mon, 16 Apr 2018 10:29:38 +0200
Message-ID: <CALbNGRR2HkpSaXymOXGqxde=_+ni4pm6mD_NAU15KYuD75bzbA@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 1/9] networkmanager: fix gobject-introspection/musl and cleanup
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
X-List-Received-Date: Mon, 16 Apr 2018 08:29:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 10, 2018 at 5:02 PM, Andreas M=C3=BCller <schnitzeltony@gmail.c=
om> wrote:
> On Tue, Apr 10, 2018 at 4:53 PM, akuster808 <akuster808@gmail.com> wrote:
>>
>>
>> On 04/09/2018 03:02 PM, Andreas M=C3=BCller wrote:
>>> This adresses the comments for recent patch which updated nm to 1.10.6 =
and is a
>>> follow-up for [1].
>>
>> There is a form of this  already in my stagging/master-next. Should it
>> be removed and replaced by this one?
> Please replace - with the first version I introduced a parse error!
>
> Andreas
Hi Armin,

Just checked master-next: There is still V1
(30b50a479c496e722d8ca590e60d3b34bcda2d67) of this patch which causes
parse errors. Your follow-up
(45cd132ff9d64902eb0152b5a3ee4c1a1c9504f5) patch fixes parsing but
breaks the logic.

Sorry that I have to say this: Our collaboration is far from working:
I wrote this several times that V1 breaks parsing / you asked in in
this thread which patch to take but still I see you have taken the
wrong version.

Don't misunderstand me: I don't want to criticise your work because I
know you very busy and take care of many issues - there is lots more
than checking my patches :)

Current situation causes extra efforts for both of us so what can we
do to improve the situation?

For networkmanager: I had to learn that musl is not fixed. Although I
don't plan to use musl I suggest to send V3 with fixed musl because I
really want to get this closed.

Andreas

