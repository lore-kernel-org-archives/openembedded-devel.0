Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ig0-f178.google.com (mail-ig0-f178.google.com
	[209.85.213.178])
	by mail.openembedded.org (Postfix) with ESMTP id 673CD7570D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Oct 2015 10:47:21 +0000 (UTC)
Received: by igbkq10 with SMTP id kq10so91962443igb.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Oct 2015 03:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems_com_br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:content-type; bh=sCVKBd08h1amye7Cvop36G9DIlDAFFp5kv9weIz5jZs=;
	b=Dy55/EjrT196Z+kNbj72dMBk88lCsbZCvnfTuyur28JwIQKNNcx2DKbl6qKd+zUXb5
	1LQ4qHTESYA9F6IB0xyU9QzXlYIZRWbdatq4+9Ja3NiL0p2isFac+/M+imrx40QqUZgY
	Li7vlo9/U2hxDT625KYphvxuaB73upusKuEAYkI3dFTgM2pOgHRBvZAQUOO+kIWVvaoQ
	aOwZsxpwai5LzZ+Qht/TuZSMcm1aycDOtZ3x5wdOuLsxCK9iiCpt9Q18ZoeWYhqiUjCD
	21KXou+wLk3T4RGolRUqNRVE54hfpxSe2t2274/kdjo/tRDAjJ9tN6RtsMnHE9BL1R1d
	RBVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:content-type;
	bh=sCVKBd08h1amye7Cvop36G9DIlDAFFp5kv9weIz5jZs=;
	b=HggsRf7yv14RKcXNQ4GUe8868NDp9N+Hvsc9t4uviX0OkU0Gt0F8GJvQDGOC3rdWif
	At6AuUoxgzZRq9BxvrC2PI/6WHgg7MjWX1604oTbMoXRpa0rtNYa6Oawfe06KBaVeP2o
	cUK4C2tPlzUX1ftPAAAC+U1WC8KfqUn1CsD0GBrsjrkwNy5OQZXN4S2ajdLsF+ymBPuv
	62xdhv6NWmltoqDdhqV7vWdnxMQ0Wa6V3+94wAhQQzGgIAJpmdVsEx00f48oVSGm/AJ4
	JECbsT3Chg716b7K+5Mjf0BhtWS6Byo+iKWZW4WvMaCntan6mjzkUejpKGfG8k7KrFsv
	gyWA==
X-Gm-Message-State: ALoCoQk+1kb85U5hT0MjsAuw0w1EVXkRvjHYEQxRhX214m+DygWYuDgoCowcjuBd9EVUzh7gF5E5
X-Received: by 10.50.66.202 with SMTP id h10mr22891542igt.67.1445942841317;
	Tue, 27 Oct 2015 03:47:21 -0700 (PDT)
Received: from mail-ig0-f181.google.com (mail-ig0-f181.google.com.
	[209.85.213.181]) by smtp.gmail.com with ESMTPSA id
	in9sm8055485igb.18.2015.10.27.03.47.19
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 27 Oct 2015 03:47:20 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by igbkq10 with SMTP id kq10so79211480igb.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Oct 2015 03:47:19 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.50.30.233 with SMTP id v9mr25270904igh.5.1445942839606; Tue,
	27 Oct 2015 03:47:19 -0700 (PDT)
Received: by 10.36.218.7 with HTTP; Tue, 27 Oct 2015 03:47:19 -0700 (PDT)
In-Reply-To: <562F54BA.2070905@webthatworks.it>
References: <562EB36A.1010109@webthatworks.it>
	<CAP71WjyyrqEGtdfN1mzrwaH=YGAC4zdz5QwFH-aSxNzgXr=4JA@mail.gmail.com>
	<562F54BA.2070905@webthatworks.it>
Date: Tue, 27 Oct 2015 08:47:19 -0200
Message-ID: <CAP9ODKqwMWnDuPxo9LcMsR7TqYw9p0N8CnuSMLh==wrm0tbKGQ@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: checking if a patch was approved
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 27 Oct 2015 10:47:21 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Oct 27, 2015 at 8:40 AM, Ivan Sergio Borgonovo
<mail@webthatworks.it> wrote:
> On 10/27/2015 08:12 AM, Nicolas Dechesne wrote:
>>
>> On Tue, Oct 27, 2015 at 12:12 AM, Ivan Sergio Borgonovo
>> <mail@webthatworks.it> wrote:
>>>
>>> I saw many patch passing by and I submitted a couple about
>>> meta-toolchain-qt5.
>>> I didn't see any message from Otavio or Martin "approving" a patches.
>>>
>>> How can I check if it was approved other than pulling from the
>>> repo/checking
>>> github?
>>>
>>> Or if there is no place to check... consider this a ping ;)
>
>
>> all commits are published on
>> openembedded-commits@lists.openembedded.org mailing list, and in
>
>
> thanks, actually my commit was for meta-qt5.
> But still I haven't seen any feedback on this mailing list to guess if the
> commit was actually approved or not.
>
> I haven't seen any "approval" feedback even for other commits. Maybe because
> the patches submitted were coming from known developers and the assumption
> is that if there is no request to fix something the patches are going to be
> queued to be committed by default.
>
> I'm really not asking for any special attention, I just would like to know
> what I've to expect and check if I did the right thing and if I've to do
> anything else to see my patch committed.
>
> Martin Jansa actually noticed a first revision of my patch and gave some
> feedback to fix stuff and things have been fixed (hopefully) and I submitted
> a second release.

This is indeed a common issue and there are different answers for it.

For the layers I am actively acting as commited (meta-fsl-*,
meta-java, meta-browser) I send the email when I do merges. For
meta-qt5 Martin merges the patches for test in the -next branches. If
it is inside it, it is a good chance of it being applied in next
merge, or feedback will be given.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

