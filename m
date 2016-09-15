Return-Path: <martin.jansa@gmail.com>
Received: from mail-lf0-f67.google.com (mail-lf0-f67.google.com
	[209.85.215.67])
	by mail.openembedded.org (Postfix) with ESMTP id C162860290
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Sep 2016 17:38:51 +0000 (UTC)
Received: by mail-lf0-f67.google.com with SMTP id k12so3750247lfb.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Sep 2016 10:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=s1vUooTmNQ7nr/dAeCgoBI5npggiKDMx3AYIqicofqI=;
	b=Z/6sp8bLuz8DHykqYWRJ2YnM1D8PXOjg0VeUTx6tbbpnLv+Is4XJgiuChtG9YJdTRN
	+SlPes5TC1NQYyIdCEeTSQ1KXZGuzdrfUWAb3b1OpiaihfhIZXqF+gqq4MOJIEv8O+Vj
	K32/I1aDmxRFJaaHA7Qc9+zxP8Ek7K9ZJLYT/1eaWRZZmgrUPdK5udb0Hp+O8dEU9vFv
	xBIMSgxrJz3C6W18xbR9Fl6L49QEJVTnvUb12n9vJvDSCFp3YEHAfwe3DTLLbZcQ0x/v
	J9TS8huC35t8pYLsfNmQol5JICqBJCdvPlMDhSbUhHNN26Nf9nuMna7mojqdRZC3jAj6
	bJEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=s1vUooTmNQ7nr/dAeCgoBI5npggiKDMx3AYIqicofqI=;
	b=V+dFAedXdC6yILYlAyv+B/pGmhhxCKN4LrJpTJNwYoYsh2UV6wngUTkaDn83h8r16Q
	8iKagDt6nXcWJREohicXgWYybthOn9pmlds7lFtQ1J6DTTFGAe65ZUJoqVjBtzSfNnZ9
	CGTLJqRyjkz3zHrsbD6XYyenqzrNXCB6Gs+/EvvuVo3WL00wE69D/4LhCqcG6bc2XmPN
	XYmC5OfVo7TpSuJkJIwQDlLvz9UogvNtlHr2vsbIUkk32OfT7jNF3qR909czclkcw2xa
	owQQUfGqZUOOWJIxJn6a17AZQGbuzGAMLS/ZRFtVjxpHT6/viVOHJSzrkmoWqVfoI8H8
	z7IA==
X-Gm-Message-State: AE9vXwMcBPMP52ZxnIggjwSn8AdE9f80IReMrwavsHk9s92v0d5zzhEYIR5NpjUcvKZTZkN/a/OKv5g/QmP1gQ==
X-Received: by 10.194.33.4 with SMTP id n4mr6306177wji.24.1473961131082; Thu,
	15 Sep 2016 10:38:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.137.202 with HTTP; Thu, 15 Sep 2016 10:38:50 -0700 (PDT)
In-Reply-To: <CALbNGRQ92cGVmUY5Af5qGBFCzsi_kLsKB6cYgVzhtMhyxjV4kQ@mail.gmail.com>
References: <1473884049-27152-1-git-send-email-schnitzeltony@googlemail.com>
	<1473884049-27152-2-git-send-email-schnitzeltony@googlemail.com>
	<CA+chaQdQZLYvVssqqR0-0JPBPHzWSYPTZb1ROro+QKqx3vKMRg@mail.gmail.com>
	<CALbNGRTg=j3JGSN4CZm9uSEGXy1-1OWX9i3sP9UHefdiiZQOwA@mail.gmail.com>
	<CA+chaQcd6S4wmUNWvqVfiRV_6f1KV4=+7VHoMtUJ5KkTdJJ8ag@mail.gmail.com>
	<CALbNGRQ92cGVmUY5Af5qGBFCzsi_kLsKB6cYgVzhtMhyxjV4kQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 15 Sep 2016 19:38:50 +0200
Message-ID: <CA+chaQc1ts6XJvoCUeyDQt37_C9Bk62e6-3vXXioqm6n0UL-_A@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [PATCH] samba: unblacklist and link with bfd on arm only
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
X-List-Received-Date: Thu, 15 Sep 2016 17:38:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Does your log.do_package show that it was actually linked with libpam?

more details in:
http://lists.openembedded.org/pipermail/openembedded-devel/2016-March/10658=
3.html

On Thu, Sep 15, 2016 at 6:57 PM, Andreas M=C3=BCller <
schnitzeltony@googlemail.com> wrote:

> On Thu, Sep 15, 2016 at 10:03 AM, Martin Jansa <martin.jansa@gmail.com>
> wrote:
> > WARN: samba: samba rdepends on libpam, but it isn't a build dependency?
> >
> > is reported in every report (where samba was successfully built)
> > http://www.openembedded.org/wiki/Bitbake_World_Status for more than a
> year
> > - pam isn't in typical 'crowded' sysroot unless you have pam in
> > DISTRO_FEATURES and it might be always detected when you have pam in
> > DISTRO_FEATURES.
> >
> Just checked: libpam was in my sysroot and I received no warnings.
>
> Andreas
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

