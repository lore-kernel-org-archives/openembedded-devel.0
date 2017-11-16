Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 6C0CA787C0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Nov 2017 18:55:51 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id o88so13317wrb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Nov 2017 10:55:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=YyWYBbEVVzxKA+xD6xY46pxCjp9lMU3o95eEIJimkrg=;
	b=dVPcyqP32rhHafwyu/xR8lwALjT5OQg2kkvc2jlXvF+f7OFEzhrgM+IgKvnWRnXO4X
	VhP4Fz3K0qrmPV7IkMdHs88BRipVeAMaTuyYwoo+GiVIeUCFG/s00s8s2parT0ieyJ9Y
	bsTgonTs56hvGF6MdJurp1hp3e06nKgcpiqq5NJDFhgjvCt56/6whIORnMHiip+0O/b+
	H7hNwNT9a0qvhG0D/BoYwsNyBOPTf4ehq2JZ8o7y7NEaj4jYjAa3Xw9pNjjXueQsXgQ/
	NeKBNSpFJsfLMuEevOqYYogKRw4b/iCGahCdkZirfYhsNIJbv70QMa5iktcCR9p5nQXm
	3R2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=YyWYBbEVVzxKA+xD6xY46pxCjp9lMU3o95eEIJimkrg=;
	b=TOXGZG9yAKR+8apYZpvVFaWauNJJTXQlBlrqHYQDADEUeHDl1QtUd2vTyNirAhpryA
	BAoC0EiYcGJlkjElr6e2QaJVNgVQK+7GYdOvOjcrX24ANCeGzoCOp3WjAow0euEmgu2i
	tdZxW6NVqGBwxPVVGsUhMm4SbHAekD8RL5zMkQ6RU3q17J5K9BXDW/jPCHH+Wj+71wWn
	LKiULY7teRtLERK037ZL+OVjGZ2A+KpuIumFInlRN2CmV2UXSOqWa5sr92LvdBKPMZEi
	CP0zxig2/uRWAiwENp9zQC6ffCO5JPUsgoL174AQLvl409dU92z3Uiv3e0MBgUq2LsjT
	t1Wg==
X-Gm-Message-State: AJaThX5U7Ensv4cag/dHOznjmlYgGOTXJRVgPvQEkE3gZElbQLuAgohg
	eKbAodElRY8ImO+tM07/obaqK0RImSDUWnve3+Q=
X-Google-Smtp-Source: AGs4zMYmd8+bXPoeuFnjLXW8kDFLdYuOC7cOOGE0ZJCxwZqiNir+PDmQ6Zm5TBbz4u9eIjGbzZCEofVnVeK4zShzLDk=
X-Received: by 10.223.196.179 with SMTP id m48mr2478409wrf.67.1510858552520;
	Thu, 16 Nov 2017 10:55:52 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.173.139 with HTTP; Thu, 16 Nov 2017 10:55:51 -0800 (PST)
In-Reply-To: <1510857125-8109-3-git-send-email-akuster808@gmail.com>
References: <1510857125-8109-1-git-send-email-akuster808@gmail.com>
	<1510857125-8109-3-git-send-email-akuster808@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 16 Nov 2017 19:55:51 +0100
Message-ID: <CA+chaQf3+UzZQZNLr7B6XS+2+-GcMQJvjBZx2642Lay-mc4C8A@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "akuster@mvista" <akuster@mvista.com>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][morty 3/3] system-setup-keyboard: fix QA issue
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
X-List-Received-Date: Thu, 16 Nov 2017 18:55:52 -0000
Content-Type: text/plain; charset="UTF-8"

FWIW: this doesn't fix the QA issue, it only hides it.

The same problem existed in master as well before it was removed:
http://lists.openembedded.org/pipermail/openembedded-devel/2017-August/114478.html

On Thu, Nov 16, 2017 at 7:32 PM, Armin Kuster <akuster808@gmail.com> wrote:

> ERROR: system-setup-keyboard-0.8.8-r0 do_package_qa: QA Issue: No GNU_HASH
> in the elf binary: '/build/build_artifacts/morty/tmp/work/i586-poky-linux/
> system-setup-keyboard/0.8.8-r0/packages-split/system-
> setup-keyboard/usr/bin/system-setup-keyboard' [ldflags]
>
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  .../system-setup-keyboard/system-setup-keyboard_0.8.8.bb
> | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta-oe/recipes-support/system-setup-keyboard/system-
> setup-keyboard_0.8.8.bb b/meta-oe/recipes-support/system-setup-keyboard/
> system-setup-keyboard_0.8.8.bb
> index fbbfa3d..3407b73 100644
> --- a/meta-oe/recipes-support/system-setup-keyboard/system-
> setup-keyboard_0.8.8.bb
> +++ b/meta-oe/recipes-support/system-setup-keyboard/system-
> setup-keyboard_0.8.8.bb
> @@ -29,3 +29,5 @@ do_install() {
>  }
>
>  FILES_${PN} += "${systemd_unitdir}/system/${BPN}.service"
> +
> +INSANE_SKIP_${PN} = "ldflags"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

