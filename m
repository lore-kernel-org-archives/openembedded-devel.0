Return-Path: <kergoth@gmail.com>
Received: from mail-la0-f49.google.com (mail-la0-f49.google.com
	[209.85.215.49])
	by mail.openembedded.org (Postfix) with ESMTP id 25F22609C1
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 May 2014 00:37:21 +0000 (UTC)
Received: by mail-la0-f49.google.com with SMTP id hr17so5191575lab.8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 May 2014 17:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:content-type;
	bh=u2i4KcQFzX4+TOd2SjkjQGtvZGlpOIWWcLeomFnuTWc=;
	b=ZpPR1FzSl+NAVVnZ/ypSlE06kApYyECZXE1Za5h9ZFIxYRMUGxoti5XT9dUXCvTNYU
	lDKP0zD70BFZc/l62tVfonN/qHS3aOR7SU4piu3mXU8Z6HNdn0S6d6OPVr9zTiXptZ0o
	z8QymV/02PptznDU9wPqIvdRH1RzfF3tGEdKy9kd1vBh9aeXaKMebM7QrbEoXWw5+cI5
	479Ug0XsXLuB+MLutCxGR3E/IxtEYBUh1L6Wy64Uz0nr0/cEJmz8VvayH7jYGNlO+DBG
	sAYHX7f9cG/oedlGGqSyOp17JbvNIpG7P+4cZOECnQB+TN36CDwVaJmRMcCtTvXARbI3
	yijg==
X-Received: by 10.112.132.2 with SMTP id oq2mr4157970lbb.33.1399336641956;
	Mon, 05 May 2014 17:37:21 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.148.170 with HTTP; Mon, 5 May 2014 17:37:01 -0700 (PDT)
In-Reply-To: <CAFeBWL52YdcY9KaLW3BuUQBKrSkbkAN4+h=PcxFM9nfXn5Znhg@mail.gmail.com>
References: <CAFeBWL52YdcY9KaLW3BuUQBKrSkbkAN4+h=PcxFM9nfXn5Znhg@mail.gmail.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Mon, 5 May 2014 17:37:01 -0700
X-Google-Sender-Auth: IaBRPJszoshxlx-4sjdbkXJHreQ
Message-ID: <CABcZANmF+fmDwEU3zMHCRqsF+Mxkysk8Ks62xKhv9EKSHK=ohg@mail.gmail.com>
To: Openembedded Discussion <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: systemd networking.service masked?
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
X-List-Received-Date: Tue, 06 May 2014 00:37:25 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, May 5, 2014 at 5:31 PM, Adam Lee <adam.yh.lee@gmail.com> wrote:

> I noticed networking.service is masked by default -
>
> http://cgit.openembedded.org/cgit.cgi/openembedded-core/tree/meta/recipes-core/systemd/systemd-compat-units.bb?h=master
> .
>
> I guess I can use the Network Manager to bring up eth0 on boot, but I
> rather not.
>
> What's the harm in networking.service?
>

Is it really needed? Does systemctl enable dhcpcd@eth0 not do the job, or
am I missing something?
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

