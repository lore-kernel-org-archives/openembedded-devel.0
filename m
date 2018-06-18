Return-Path: <schnitzeltony@gmail.com>
Received: from mail-oi0-f67.google.com (mail-oi0-f67.google.com
	[209.85.218.67])
	by mail.openembedded.org (Postfix) with ESMTP id 35FF57523B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jun 2018 20:10:12 +0000 (UTC)
Received: by mail-oi0-f67.google.com with SMTP id t133-v6so16027203oif.10
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jun 2018 13:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=C1iLTqS1TXLeQeekMJY6EB0dNRkCClrSp+RBTaaZgiI=;
	b=noukzSoZCi5CyCLfmGbw86QoVNGldzc9YS8Jz4+aKzaO7Xp9O2bARsQhST4zcMODet
	AnyUI6UUOYY8Tef8LodKgYj6iaaLzfJgbUNfsewm0NbI3GtHee+CVgHncrf1upOXsqV1
	Jyn1BTPZFU9DVtcrxd65ze+LP/ZUBYw6YwMZ9PiJJ6EwSExtjDqv9JRMk5jL1WLTAJMz
	OfbTPwWq39sS7gyrhC8mWMazjGdlGNmIRfie5z41j1XHQx1DGbQsrulK/fzkUrbWGjPb
	9c5L/ANSlwUfsR6oj4B/kCUtqjte6cFYJRDntPuvCLJlrJK6oJcAkXx1WtpUnMviNVHX
	5ORA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=C1iLTqS1TXLeQeekMJY6EB0dNRkCClrSp+RBTaaZgiI=;
	b=O0StToxfGULQLiqKPw1lka0jRE0YyXAsGf8c1L0Md0/4KBbY/YCBJ5DAeGNTIQRtq4
	/9GI9L2U4l1GoFfbJRtBPHdwoJq1VDZYPE4kF2D/EyySb4mZ+RqDQaapWoSwDVqBs6w/
	p80DZxmNHLzE/xHeriBeVCacrTBtxZxCI9oOd1hI0QiNmC806P6s75cgLLzWEiCqhUND
	0mmNI/rowj/VVufkLVyvcWm9GEkCotKqharunBGkCQT9zrVbF4ike5Dw/RTCsrEEm9w1
	vW4M0LxqkusUVZ2xDr1yYWkHw48x4jf3PtAAAvi8mvc4hc1NhONI0uwPXFB2qRuaWasc
	uimg==
X-Gm-Message-State: APt69E1TVBBOb14w1bqiBQDhoRDpmUc+l/mDX5pAYA/Cq0IqxgXp2ZxJ
	T57IlgabT8YjNoUGSrR6gecviiXx9/jwH+SmoYM=
X-Google-Smtp-Source: ADUXVKLI6KV/bNp0YxtTm8DN38othRZiGyapWROPohAeNCopj0d6eEqaFTYXO5rdQqZ5zRe2Xs1fC134xWg8G7JVeUo=
X-Received: by 2002:aca:4b0d:: with SMTP id
	y13-v6mr7137284oia.251.1529352613198; 
	Mon, 18 Jun 2018 13:10:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:4916:0:0:0:0:0 with HTTP; Mon, 18 Jun 2018 13:10:12
	-0700 (PDT)
In-Reply-To: <d42b7242-3e89-796d-091a-fa3eb8ddd44d@windriver.com>
References: <1529333146-6459-1-git-send-email-mark.asselstine@windriver.com>
	<CALbNGRTtOYpc9QWEAttxjgeD4Xog4U_4btnuy_v3m7PW-JKJfw@mail.gmail.com>
	<1883916.pZAjriCjz1@yow-masselst-lx1>
	<CAPuovELwUxFTuowgPwN_oBJGMNxxY6XK9QNmgYygyJ6yKdQQgg@mail.gmail.com>
	<CAPuovE+dZu=VX3n_rU6zRQjXnu=XnPpZpQOwPHu6qb7BhWDKJw@mail.gmail.com>
	<CAMKF1srMCX6u3TC2Ybi_aj4w7WLDW-AuVVhKptF+kzJz=P=6JQ@mail.gmail.com>
	<c41dc3e4-7ded-f47c-5120-321dd66e9334@windriver.com>
	<CAMKF1soijupp06kVYOurZv428nNmEYo8WpkuP04m_oxV2CnGow@mail.gmail.com>
	<CAPuovEJx-ghUsXH0NFR8Vc1DJL8AyHXJAbL38oqkrtqbQiAOTw@mail.gmail.com>
	<CAMKF1spbkMcboLaBfw0bv_bf_v5_d=qDHB3ag7pCEL1E5Ni3sA@mail.gmail.com>
	<d42b7242-3e89-796d-091a-fa3eb8ddd44d@windriver.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Mon, 18 Jun 2018 22:10:12 +0200
Message-ID: <CALbNGRQR6OPvXyoTmfXm9Yh5PmADNb=CNamyo7T-PebQ4-nrXA@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: Mark Asselstine <mark.asselstine@windriver.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-xfce][PATCH] xfce4-panel: fix QA issue 'installed-vs-shipped'
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
X-List-Received-Date: Mon, 18 Jun 2018 20:10:12 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 18, 2018 at 8:55 PM, Mark Hatle <mark.hatle@windriver.com> wrote:
> On 6/18/18 1:47 PM, Khem Raj wrote:
>> On Mon, Jun 18, 2018 at 11:09 AM Mark Asselstine
>> <mark.asselstine@windriver.com> wrote:
>>>
>>> On Mon, Jun 18, 2018 at 1:57 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>>> On Mon, Jun 18, 2018 at 10:54 AM Mark Hatle <mark.hatle@windriver.com> wrote:
>>>>>
>>>>> On 6/18/18 12:50 PM, Khem Raj wrote:
>>>>>> Hi Mark
>>>>>>
>>>>>> It seems your distro is not inheriting it globally. Here I have
>>>>>> INHERIT_DISTRO ?=  "debian devshell sstate license remove-libtool"
>>>>>
>>>>> So is remove-libtool a recipe or a distro option?
>>>>>
>>>>> I'm asking because doing this half-way is causing a lot of confusion.
>>>>>
>>>>> If it's a distro option, then the recipes should work without it being set.  If
>>>>> it's a recipe option, then the recipes that need it should use it.
>>>>>
>>>>> Right now it doesn't seem to be working with these recipes because they don't
>>>>> package the .la files UNLESS it's enabled.  So the fix is either to package them
>>>>> (by default) or inherit the remove-libtool.
>>>>>
>>>>
>>>> since we make it as part of meta/conf/distro/defaultsetup.conf
>>>> its a default policy,  its perfectly fine for a distro to disregard that
>>>> however, then you fall into a non-default case. I am willing to accept
>>>> per recipe patches but I would recommend to consider it as a distro
>>>> feature for your distro.
>>>>
>>>
>>> Andreas,
>>>
>>> Can you revert your "various classes recipes: Remove FILES entries for
>>> dbg/dev packages" then? If this is a distro feature then these recipes
>>> need to build without the QA issue and without the remove-libtool
>>> distro feature being set.
I prefer not to apply the patch (Or Khem shall I send a revert?). It
is not a good idea to break builds for distros not following a
recommendation. Anyway the mentioned patch was a cleanup: It is not
worth to break things by a minor cleanup.

Andreas

