Return-Path: <bill.randle@gmail.com>
Received: from mail-io0-f182.google.com (mail-io0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id 2E9FC74641
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Apr 2018 04:51:37 +0000 (UTC)
Received: by mail-io0-f182.google.com with SMTP id p139so658776iod.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Apr 2018 21:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=3pycdpgJrDTEKp7QvMZgraWMy2HGLBQaR+m1u7Nt4Cw=;
	b=OmYwLzmAwa2i8DfZdcui5GemGo3wTgoAMmJD78aU4B48HM9e8OSN3RYH8dJ1WNPf4+
	qeakDqGmMbl0HzINrkbWilzQ0X2NlFqc7R4cHE7+hImPe7oI/2o7+bj8U3Tb7F73PmLs
	nw4Zw18Y3N9Tv3J+vv6lf7ULLXSVqkyBBppoinewwfatTQV/MFhk0VNQ/2SugYGdfbmn
	6/Z7u72IzdK92oYoxcYLt/cacAjQ4CNII98X/eiCa6qV2xzqOJdxx2U7N24kQ0AhcMVO
	GLAYGOpxCu2+nYuJqDwd8Sp44jI95vZidq6fbTOi4QXSSHsBsEz3um3caJfcuXZCVIQ/
	Ldug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=3pycdpgJrDTEKp7QvMZgraWMy2HGLBQaR+m1u7Nt4Cw=;
	b=szyuS36/zOMajYE3DLQb6cQE0o0MxVyUBIlx2UX76m8SKT+jRKLsHj9R+U4kDTE0A3
	xogmKfkkGv8Aqv17oXLoJJQaEgX750fiPKdIH3/Crz20EK8Iiggn8VT2ASzdXnb3B4zo
	GuJzmvEBxZ0hojFdLgdjGA0stcPp/Qv6vqoI5HmnxYp4r4tiYj1G+tgbSxR1oDoqGjMt
	31zYD14DTmQc1qxJ3LWVtoqJGbvjKR98+ogTDPSnVc84LQYWGU+ZqWgtGuu0qsmiH3Yw
	1JgWC3kDtC91PGIANTfkm3EjkakCLciIO4z8LvzFV7Egup/U2vo/8ldmazsokZeQXc97
	e+4A==
X-Gm-Message-State: ALQs6tA3VyS2yrSrZiXs0KcpCVbK/vq0H/wC7gFnCYoWOQPGzvuIbPql
	f3AvUnw4ZzK3JTG9mI+EZU2IvDPSrYgDjMpIQPo=
X-Google-Smtp-Source: AIpwx48VfTMbsIbdhlrpjn3NQ1GCxT0bOmygocq9lq0JBmBMGXTrxt47Zjvlojz+BMJeEDrVvU/9dQD7iux76WKDmBs=
X-Received: by 10.107.198.134 with SMTP id w128mr14340465iof.50.1522817498857; 
	Tue, 03 Apr 2018 21:51:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.79.123.210 with HTTP; Tue, 3 Apr 2018 21:51:38 -0700 (PDT)
In-Reply-To: <CALbNGRTMzpTUAYsjv-EuJAB7aGd=TiJ83-GFGreG09TsxyHZiQ@mail.gmail.com>
References: <20180403231601.5329-1-schnitzeltony@gmail.com>
	<1a96ea45-d89b-a5f8-ff6c-23abcbb96303@gmail.com>
	<CALbNGRTMzpTUAYsjv-EuJAB7aGd=TiJ83-GFGreG09TsxyHZiQ@mail.gmail.com>
From: Bill Randle <bill.randle@gmail.com>
Date: Tue, 3 Apr 2018 21:51:38 -0700
Message-ID: <CA+n--H9LKuLH4frCgjVtz6yUrwZ83HOEsc4ob0gxzVY1Sy7=yw@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 0/2] poppler nightmare
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
X-List-Received-Date: Wed, 04 Apr 2018 04:51:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I recently tried to cross build the current version of poppler for an
embedded ARM system. This was not under the Yocto/OE build
environment, but I never could get quite the right cmake config file
to get the thing to build. Since I just needed it for the pdftoraster
cups filter, I punted and built ghostscript instead. cmake may be fine
for native builds, but at least in this case, it was a pain to use for
cross-compilation.

    -Bill

On Tue, Apr 3, 2018 at 8:28 PM, Andreas M=C3=BCller <schnitzeltony@gmail.co=
m> wrote:
> On Wed, Apr 4, 2018 at 3:32 AM, akuster808 <akuster808@gmail.com> wrote:
>> Andreas,
>>
>>
>>
>> On 04/03/2018 04:15 PM, Andreas M=C3=BCller wrote:
>>> Not convinced that I'll get support at poppler project. Let's see what
>>> autobuilder says. If it fails, please unroll back to 0.57.0 - I am sure
>>> that disable glib causes trouble for evince.
>>
>> this didn't make it into the current world build. I built it @ home a
>> getting the same errors:
>>
>> |
>> /build/build_artifacts/master/tmp-glibc/work/core2-64-oe-linux/poppler/0=
.63.0-r0/recipe-sysroot-native/usr/bin/x86_64-oe-linux/../../libexec/x86_64=
-oe-linux/gcc/x86_64-oe-linux/7.3.0/ld:
>> warning: libpoppler.so.74, needed by ./libpoppler-glib.so, not found
>> (try using -rpath or -rpath-link)
>>
>> - armin
> Thanks Armin for quick response. As written - I suggest to keep
> poppler at 0.57.0 and forget the updates for a while.
>
> Sigh - from the moment I saw the announcement that poppler changes
> from autotools to cmake I thought there might be trouble is ahead. Now
> I know.
>
> Andreas
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

