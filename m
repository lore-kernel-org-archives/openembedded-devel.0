Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 410D577AA9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Mar 2017 23:14:56 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id o81so10005879wmb.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Mar 2017 16:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=X0MRWtoc+mK5Sqi5al3oJ1HM2Q3X5NaNAtxbLdgYPvE=;
	b=rmFhPPcWCBvipy4yCQG1cOWqG55BQARDJQC8qc1CKoK5V+thCPr1vdfVRHeG0BhyA0
	WHvk3sEpKz9NZ1pbnzH3ulyL8dFn9U6heiSpWuPuopja1n5A29OFZKd4CfpzAV+RAmkk
	7HMnYLWVkEtmYy2KwncYM0Ifl53KGWRqnMO9y0CbK0njFBE59sTVsNei4wG2hJNJPK8R
	zNSXG7JsI1UDqucL5BSCJgfnt05K4thg5uQq5w9pOjLIe78RIxk/h9ggBSSbEwC29+50
	/4sxSZvJTbHenZ0fS8IflKQtdPTPM5l88mn1zFbRB/UF3U1NVmorm4IBVGbhAK7YDVOV
	2hYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=X0MRWtoc+mK5Sqi5al3oJ1HM2Q3X5NaNAtxbLdgYPvE=;
	b=XHZp4+d1pHswmmoI1vKWJgvCwJe7g11dqiH7w7UhSQEwArn6MmlXajvdQKrXIY38XP
	7sWeUZHqfJB9J5bOLX1ap3cedObG3X4tLsANwO4d73rp12BYw/fe3nc1lvWWFiec+mat
	ImGtTW2K53G90yag1UfWRJk7MasbKNuWw80u3d+evBhp81/43Pv0YosMmJ907zJJHEc9
	ytXFC9DElDid4r6Pacs55kBAv+Lo5Oxug/YpcPNCnzGW8whtrkoaWA7uhpjNVP0LOays
	Pr4FK03WJ1oxLWXfmafWnrSLILVh+Hu+YB6mZpdgpaRjR8cbHqwkeG9OI+waLQp7dno+
	TnyQ==
X-Gm-Message-State: AFeK/H29XneHtjn0k8eVsyrayXByeyvgO4LcSqNnhWMFJXMX4zjpXZ0PdfIyzw3pHlDk33+y7KoROywLTjPgwA==
X-Received: by 10.28.71.87 with SMTP id u84mr16580667wma.101.1490742897622;
	Tue, 28 Mar 2017 16:14:57 -0700 (PDT)
MIME-Version: 1.0
References: <1490729609-25245-1-git-send-email-martin@xevo.com>
	<CAJ86T=UiAqfpiHBo5hif2kd_=2Vag1KkaUJGsT=eXd3dTR22Cw@mail.gmail.com>
	<1649ceb2-fd84-33cd-d619-b9b4e64abb0f@gmail.com>
	<68787e73-74eb-9389-c397-139bfa696f49@xevo.com>
	<CAJ86T=Uj+xCZT29k4ti9K4_Eaa3L9=CeCuqMbqqWRKiWbnJHZA@mail.gmail.com>
	<8c827e6f-f739-0913-f38c-fa2ffcea62e2@xevo.com>
	<CAJ86T=U2f7ZhM0hbd4x2-qwPwHB=crJd4QtP2Oh1WcWgdTagkw@mail.gmail.com>
	<2eef3d1c-7180-c75f-e3a6-74fb485d8f7e@xevo.com>
In-Reply-To: <2eef3d1c-7180-c75f-e3a6-74fb485d8f7e@xevo.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 28 Mar 2017 23:14:46 +0000
Message-ID: <CAMKF1sr-PJeiDoL1_m2X9=k6KNFx16XuZ7UdYC4R3xxjpEt6oA@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>, Martin Kelly <mkelly@xevo.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Martin Kelly <martin@xevo.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] gtest: add -fPIC
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
X-List-Received-Date: Tue, 28 Mar 2017 23:14:57 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Mar 28, 2017 at 3:14 PM Martin Kelly <mkelly@xevo.com> wrote:

> On 03/28/2017 02:32 PM, Andre McCurdy wrote:
> >
> > Right. So the question is if security flags are enabled (and therefore
> > -fpie is passed into the gtest build via CFLAGS) then why do you see
> > an issue?
> >
>
> Looking at this more, I see that I hit the issue in dlt-daemon because
> it was trying to compile a shared version of gtest, resulting in this
> error:
>
> command:
> [snip]-g++  -fPIC [snip] -shared -o libgtest.so [snip]
>
> out:
> [snip]/ld: CMakeFiles/gtest.dir/src/gtest-all.cc.o: relocation
> R_X86_64_PC32 against symbol
> `_ZTVN7testing8internal17TestEventRepeaterE' can not be used when making
> a shared object; recompile with -fPIC
>
> However, looking at the gtest version in meta-oe, I see only static
> libraries, as you say. Thus unless we start building shared versions of
> gtest, it looks like this patch is applicable to dlt-daemon but not
> gtest, so we can drop it. Thanks!


Is there any reason not to build shared version though ?

>
>

