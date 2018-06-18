Return-Path: <asselsm@gmail.com>
Received: from mail-yb0-f193.google.com (mail-yb0-f193.google.com
	[209.85.213.193])
	by mail.openembedded.org (Postfix) with ESMTP id 6F05771CBD
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jun 2018 23:25:51 +0000 (UTC)
Received: by mail-yb0-f193.google.com with SMTP id v17-v6so6617325ybe.7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jun 2018 16:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:reply-to:sender:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=C3Nihlu8F/MCf+XAOkX9tysvHNhPTWmyT9r2sSBTs5g=;
	b=ZDkbRgB7dPekpFmY0lRG+dMESXfQN32YHlyIgt7G3XkBrkDNpUJ/c903CCz/VKdmdl
	EEoonfQYTDZSl2WqGUHE2Cxq2L9bmtSWpwPQApXRAshT4iRS1xhlbr+2il2MU/AbxGfl
	YXarTS9R2kLhbKWM16cItwzDQaU+xs9HXDHRTeHYXjJCvKXtMXzAK0BChJZZpuL27a+D
	PDdySiK30I+EuXybTUz5Q7i3CEzRlPDfWoZZZN43BmweVvDzbHEh+gmrolzMQVTrwBZ9
	S1Xo9DkODeYpy0NDjcU9oUTHIVQoaoahUmNLqCiXeY0N0orMYPOU7E6Avls00Pm/oTEK
	iwDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:reply-to:sender:in-reply-to
	:references:from:date:message-id:subject:to:cc
	:content-transfer-encoding;
	bh=C3Nihlu8F/MCf+XAOkX9tysvHNhPTWmyT9r2sSBTs5g=;
	b=KTuuzxzHs1SQxbJaV+mIKjZcbqsDjop4o+mvsTdhNnhsI/6zd6IJdprc88ikD2i6Ze
	1p9pZp2i1fncAbhENrLVKtLnBO05EFdM4CyYXYrCCPzWyVI2faWf9Zl9hPeiqR9lnQS/
	cFtwoib6H1EEcEzVEdr/ZppC5cQ8X+X1zFuWYkP4vgA3FxIt2oA9EGJlONLEA6yVGJkI
	OYQknmhrFanhFk7oMpp0kz2YBLqP/IMqIJ8V11+vaXNeQj2+c9F3839TBVCesRyPoyuZ
	Iqo8ig6Izo+Fw2NSnCEX9uRymz3FwDzbnG8BOVSMesKpFsYdos5sdwMhC15KRGq4IXOw
	ak7g==
X-Gm-Message-State: APt69E35fkSLtsy0d4HQ0OBro6KFUVl7kEBdVBizx9ugQGNN02PEFcCY
	0S/7yRKCo0Vz+6edrQvNteGmNDBGFa6XsjBnpo4=
X-Google-Smtp-Source: ADUXVKK9b9KHmrjr6ZVwaTyjIH1WG6QZkguDTC+dNyPyxq/UZEQ+tJvJjPrzmBZSSdZau3SydCRzppgH0HtT0KjWA1Y=
X-Received: by 2002:a25:ce13:: with SMTP id
	x19-v6mr3803448ybe.18.1529364352301; 
	Mon, 18 Jun 2018 16:25:52 -0700 (PDT)
MIME-Version: 1.0
Reply-To: mark.asselstine@windriver.com
Sender: asselsm@gmail.com
Received: by 2002:a25:bfc9:0:0:0:0:0 with HTTP; Mon, 18 Jun 2018 16:25:51
	-0700 (PDT)
In-Reply-To: <CALbNGRRK=096t=CpWX21Sk8aHTFD7Vtbmt2L1pO-A5CVo-8Rng@mail.gmail.com>
References: <1529333146-6459-1-git-send-email-mark.asselstine@windriver.com>
	<CALbNGRTtOYpc9QWEAttxjgeD4Xog4U_4btnuy_v3m7PW-JKJfw@mail.gmail.com>
	<1883916.pZAjriCjz1@yow-masselst-lx1>
	<1f9bbaf400d215f993042b2fd2b24342aff1b29f.camel@linuxfoundation.org>
	<CALbNGRRK=096t=CpWX21Sk8aHTFD7Vtbmt2L1pO-A5CVo-8Rng@mail.gmail.com>
From: Mark Asselstine <mark.asselstine@windriver.com>
Date: Mon, 18 Jun 2018 19:25:51 -0400
X-Google-Sender-Auth: TzVz8lmf7SYiPvEBx0277y96mTo
Message-ID: <CAPuovEL5c3SF6YkRZMiobfAsyV7XLJzJz_E-oYdOzekmfSt1nw@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Mon, 18 Jun 2018 23:25:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 18, 2018 at 6:27 PM, Andreas M=C3=BCller <schnitzeltony@gmail.c=
om> wrote:
> On Mon, Jun 18, 2018 at 11:42 PM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> Off-Topic / FYI for me gmail considered your email spam
>>
>> Removing the libtool files became the project default a while ago (Jan
>> 2017):
>>
>> meta/conf/distro/defaultsetup.conf:INHERIT_DISTRO ?=3D "debian devshell =
sstate license remove-libtool"
>>
>> so I suspect you're in the minority not using that now.
> Maybe true. But breaking builds consumes resources on many sides -
> this thread is a good example
>>
>> http://git.yoctoproject.org/cgit.cgi/poky/commit/meta/conf/distro/defaul=
tsetup.conf?id=3D3e2a47fdfceccd5f8832235b7a2df83076e84a98
>>
> The more I think about this:
>
> * Why is remove-libtool something a distro can override? If causing
> trouble it can be deactivated recipe-wise.


That was my feeling as well as we were having this discussion, without
digging into the history it felt as if this should have been made core
functionality and not optional, especially given the opportunity for
recipes to opt out. At any rate I am about to send a commit to get
things buildable for when the 'remove-libtool' distro feature is
absent and as long as it remains optional I suppose all recipes should
function with and without the feature.

MarkA

>   - or
> * does anybody see a problem with inherit remove-libtool for all xfce
> recipes in xfce.bbclass?
>
> Andreas
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

