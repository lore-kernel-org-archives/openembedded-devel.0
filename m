Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
	[209.85.167.66])
	by mail.openembedded.org (Postfix) with ESMTP id E2DA57C94C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Feb 2019 15:51:19 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id l10so15257239lfh.9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Feb 2019 07:51:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=fiA9lfWahjsw14ASYNZX5ejybkcfe1jw5yIfJym4+kk=;
	b=YrHedlRXaESQFwn3YllyLJhNzTRIlsh7fJpJr4+uP0POjapSJnNtee43bq22AOMyJB
	2SqO5KVwAX2EGIJCjeIvvzH1VcssN7kbP8++BNVLMBDGcBDLfEergHhuS0nXEqxlVo1l
	XnkWhFqzGqC2VrS3h+G0yH5UsIonMlsaaozsxNIjkC07HoUo2u5wepVWFLDIlnsg0+Jn
	ezxNF+Ox0UEXeRj1tveJ9437SKRt4oU6nIcSovPbUxo12wHKRCvEGcrCInOR50j2+1BU
	9RpCaqLF95V0Ux7/2+7Ej7ZT/94qbSop9NmqK9OUv6hIwzD9araIVaPtdsY4KmBiYWDS
	/nAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=fiA9lfWahjsw14ASYNZX5ejybkcfe1jw5yIfJym4+kk=;
	b=pHYDsR8+DuXSNqTdhRvd0pBEh7ZavZ1oPKaQwctdmB/mgUo9sA0VTl+xwpUADCAsY9
	8PilOT9+hVatkl4DQ4d89p2JLRB/84ZneeC5V0tjPB6XV7xpOVCtn36sJ3GtE2HaTLCJ
	MOkzWgi2k1R1RDjKhaxMjyTthBFpG7IYlMDCWp/ryo2ku2vlMVzrlnZqk6K/Dv89tZFJ
	Rax8XEIYbWdC3bwuEkqoyL5YXTGHzuI0ZXJfrPARHflSnrJtuhbG9nWEaWAJIYNFLlB+
	0s+kMwtBrWCNp8S9jV9lhrorziNY3I0gDv+eiyNmKa7cwPIMLkUjuP25aArmPncgRWDK
	wWaA==
X-Gm-Message-State: AHQUAubaeF3Bv0ARIIqxauwNcwDbFogCFI8eo+0v25uyZNQpcAs+iYaA
	aflbktY4XmifoQRsAMkMhCAWBFqflFygIayfMT4bqw==
X-Google-Smtp-Source: AHgI3IbIetB7WHGo7n3x01KUFL69yMOnXVparLTr79b7Kp9G926KO9+V5v2qbOsmkTdubJwzf6XxVmdcIiHOI3UOEKk=
X-Received: by 2002:ac2:53b1:: with SMTP id j17mr17004797lfh.143.1550591480075;
	Tue, 19 Feb 2019 07:51:20 -0800 (PST)
MIME-Version: 1.0
References: <20190219135006.20859-1-nicolas.dechesne@linaro.org>
	<CAP71WjwybzzDJ=wbZN-RitHmDC5DNEv4b7L_WYp_t8FHnWULfg@mail.gmail.com>
	<9eb3ac67-056f-7c47-f474-0e5023fb3bd1@gmail.com>
In-Reply-To: <9eb3ac67-056f-7c47-f474-0e5023fb3bd1@gmail.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Tue, 19 Feb 2019 16:51:08 +0100
Message-ID: <CAP71Wjy9n1ryGVgEB6hvXVdGqgjf_bNzW7TAhOjEDf5+eUEJQA@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][thud][PATCH] packagegroup-meta-oe: drop ptest packages that do not exist
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
X-List-Received-Date: Tue, 19 Feb 2019 15:51:20 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 19, 2019 at 4:13 PM akuster808 <akuster808@gmail.com> wrote:
>
>
>
> On 2/19/19 6:28 AM, Nicolas Dechesne wrote:
> > On Tue, Feb 19, 2019 at 2:50 PM Nicolas Dechesne
> > <nicolas.dechesne@linaro.org> wrote:
> >> From: Alexander Kanavin <alex.kanavin@gmail.com>
> >>
> >> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> >> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> (cherry picked from commit bbde0a3d3012da1d6be824959b0ad0a930573650)
> >> Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
> >> ---
> >>  meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb | 4 ----
> >>  1 file changed, 4 deletions(-)
> > please ignore for now. I need to backport more than this one,
> > actually. i will send a series instead.
>
> are they in stable/thud-next ?
>
> https://git.openembedded.org/meta-openembedded-contrib/log/?h=stable/thud-next

nice! they all are ;) looking forward to the update in thud then!

> >
> >> diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> >> index 08b4bbfc4..2a23a6170 100644
> >> --- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> >> +++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> >> @@ -234,19 +234,15 @@ RDEPENDS_packagegroup-meta-oe-test ="\
> >>
> >>  RDEPENDS_packagegroup-meta-oe-ptest = "\
> >>      zeromq-ptest \
> >> -    libxml-ptest \
> >> -    soci-ptest \
> >>      leveldb-ptest \
> >>      psqlodbc-ptest \
> >>      lua-ptest \
> >>      protobuf-ptest \
> >> -    libdbi-ptest \
> >>      rsyslog-ptest \
> >>      oprofile-ptest \
> >>      libteam-ptest \
> >>      uthash-ptest \
> >>      mcelog-ptest \
> >> -    openldap-ptest \
> >>      libee-ptest \
> >>      numactl-ptest \
> >>      poco-ptest \
> >> --
> >> 2.20.1
> >>
>

