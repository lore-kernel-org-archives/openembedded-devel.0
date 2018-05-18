Return-Path: <armccurdy@gmail.com>
Received: from mail-vk0-f66.google.com (mail-vk0-f66.google.com
	[209.85.213.66])
	by mail.openembedded.org (Postfix) with ESMTP id A8B8174FD0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 May 2018 18:46:19 +0000 (UTC)
Received: by mail-vk0-f66.google.com with SMTP id x191-v6so5426392vke.10
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 May 2018 11:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=9NMPf8Fctq4Ier8BhrTquSZgeQwzkhRn7RAOjcJuFXI=;
	b=hKhDqtiBpOKYRETLp28AsQB3fo6DM5YkSihSgJg897lxFG2Ll6qD1u459ppDtwiDxV
	HSyips1A2Al57pJDIMJ409YNdNYHm1KCV8elCK7RVuWxeQQ2RpgW759+EXNPS6WRm9Ln
	ja9zj4HdpTVQr8t7x8r3+6rBbDFbOjeYknehJb/lRj9BWouQTQzsGbbW7n4W/ntZ4nGn
	URO9QU1JmIsg7xLXPz96RUZKPoyL/QPOZRxx+oJsUUj8Am6iAqEGbXVOVWXn9GYFgO50
	YViTOZtB1NKBjNlQld1k69bWia5bsC1HtLnYy9seSIheMM4WzndbZ/sgnLR2ngDOu2T6
	OdNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=9NMPf8Fctq4Ier8BhrTquSZgeQwzkhRn7RAOjcJuFXI=;
	b=OJ0Pa+UoBNJQ3iOY4IidtlxfvAhpRRdPnvoOMoPxafWR7FsUM+VZciGZm4j17BtKNT
	j4/zn464BmKmMdeOmCbywdLfeJZVMWXCqmgo/joqQSZOzo9NOd8UWPG3+aGyNi44u8PT
	ImpiEGmzaJmMKEdtcfNRmNmNOL75mwcIP+9Pft68GSBBONZkV287dn5pJAdQpzp2+xe9
	gkcv7MkJTeYLLXxrOV6JgVR3ZreXzdkzrhDv1XVneSOpXHGkrslvTGP5Vo6Y0JAyRFIJ
	su4+mNkqpJjP9v1MbsTMwxI+n2LzV6t633ZDcFrpmtET/+nxuTrKu5sv8TQCbRyDlfWf
	bOxA==
X-Gm-Message-State: ALKqPwc+I0oHDHyZgh71pYG937cgloqOAMsvDBLMz6tdaj65grQ9fX7Q
	544bQE5EAJmtVf7Xq+Rlp1g9wKLUGRi83NBf37wH+w==
X-Google-Smtp-Source: AB8JxZpYwsYHgnAY464V1HQ9cicTWFtsuj3RIlF33wIw5g/Ci1acgKN3ImNiPRZZe21JwvHTCQ9KTAsZlb1jwwV+2cM=
X-Received: by 2002:a1f:b254:: with SMTP id
	b81-v6mr7713222vkf.20.1526669180162; 
	Fri, 18 May 2018 11:46:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:3094:0:0:0:0:0 with HTTP; Fri, 18 May 2018 11:46:19
	-0700 (PDT)
In-Reply-To: <5e41dd1d-0a05-39a4-888c-948be3cc8714@igalia.com>
References: <20180512030758.31409-1-raj.khem@gmail.com>
	<20180512030758.31409-5-raj.khem@gmail.com>
	<8c2ae33c-fbde-11de-6fd7-d220c0b55d57@igalia.com>
	<b55b0545-7867-a168-a853-903313da12de@gmail.com>
	<5e41dd1d-0a05-39a4-888c-948be3cc8714@igalia.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Fri, 18 May 2018 11:46:19 -0700
Message-ID: <CAJ86T=VXbwsL=2gUqin0-2jdBB1tbbxgwP7+76AToZdO16Jtiw@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 5/8] luajit: Dont use BUILD_LDFLAGS when compiling host binaries
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
X-List-Received-Date: Fri, 18 May 2018 18:46:20 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, May 18, 2018 at 6:27 AM, Carlos Alberto Lopez Perez
<clopez@igalia.com> wrote:
> On 18/05/18 06:44, Khem Raj wrote:
>>> I suggest adding something like this:
>>>
>>> EXTRA_OEMAKE_remove_class-target = "'HOST_LDFLAGS=${BUILD_LDFLAGS}'"
>>>

This idea looks right, but be aware that ${BUILD_LDFLAGS} will be
expanded before being processed by _remove. Therefore any individual
string within ${BUILD_LDFLAGS} will be removed from the final value of
EXTRA_OEMAKE, even if it occurs somewhere other than in the value of
HOST_LDFLAGS. For example:

  BUILD_CFLAGS = "one two three"
  BUILD_LDFLAGS = "one two three"

  FOO = " \
    'HOST_CFLAGS=${BUILD_CFLAGS}' \
    'HOST_LDFLAGS=${BUILD_LDFLAGS}' \
  "

  FOO_remove_class-target = "'HOST_LDFLAGS=${BUILD_LDFLAGS}'"

  $ bitbake recipe -e | grep ^FOO=

  FOO="'HOST_CFLAGS=one three'"

Notice how "two" has been removed from the final value of HOST_CFLAGS
set within FOO.

In this case, if you want to have a HOST_LDFLAGS='...' only for native
builds, it's better to use _append_class-native as required.

In general, it's usually a bug (or at least bad form) to use _remove
in a recipe. It's usually reserved for custom changes in a .bbappend
etc.

