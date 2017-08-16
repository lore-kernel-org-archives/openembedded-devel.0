Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ua0-f175.google.com (mail-ua0-f175.google.com
	[209.85.217.175])
	by mail.openembedded.org (Postfix) with ESMTP id 57779782F2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Aug 2017 16:18:19 +0000 (UTC)
Received: by mail-ua0-f175.google.com with SMTP id f9so15676582uaf.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Aug 2017 09:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=G4D8YFuwqoOUGQLjBWYmB0p+SSB0YT2FJa3eAg/xP3s=;
	b=PJffr+KlkjDApKpNWYMN+GKdjw4z6suDAbMqQBFH7NMZzGdrvYjFLl1JO1FC+DoUt7
	SVxuoMWsdpd5v74X+qnpPcrPhIBX/KGGZkzJlwynUa/0EOwV6zEu/ouLk5tGfG4R8d4c
	ol4NJnxq6fqy7FkmK6IMURKGlGEv23eGMuqp85NbAgffO6eKHBHRJU/YD4corbJrddHO
	rP10ZsWuBxUNXOzADhK958X9bPftMB9PWAQ3b6G4/QKKHEemDQWP/cIycz9F6NqpMXYU
	GFs58PTszWXoqPhUj0vJNYOGn6HON1tm+iTQivNgtBgyB7SKAaLsK0gxd6WnDAj0leA5
	caJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=G4D8YFuwqoOUGQLjBWYmB0p+SSB0YT2FJa3eAg/xP3s=;
	b=WIKmAg7sB+oVc4ZCOvRKykjBGI8nieJun4bTssmil7PoeF/FfKPClWIXixTI0v7apb
	8FpJS65E0xXyruhHNldz2lFjTCjcXqSIvjC7dPpB+LTJAX0E063/KIcrS4OhR9JMHa26
	Sbr4XuprGontmc9uvolIx68OB5YJG58OlpqP6ndb1Wy80o+L50pqC2qYQgacYTm7/lfg
	jQCpbS33rKB/lZ3fKPGcwnYjJIqVLKGgGY2QgEE+qaWPt80WkfaK5U9+cA5OtYgvCgi/
	HYCmiWIsOxV3cc6StacClxWDgpzmZ6YD50x1ub8LyEDeoyI6njehkdJXF7AV03HXM+FZ
	Qphg==
X-Gm-Message-State: AHYfb5iv1z2SgOFu5cBZN9qOyDnoSiGgdKzbdg4IChYRej/FkFQumpUF
	aIfhY8qU7b1JoqO/uNe8jQWGZaKFIQ==
X-Received: by 10.176.26.12 with SMTP id a12mr1472870uai.110.1502900301192;
	Wed, 16 Aug 2017 09:18:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.159.51.10 with HTTP; Wed, 16 Aug 2017 09:18:20 -0700 (PDT)
In-Reply-To: <CA+chaQdPFsk3yJzCO7e=L+=OW=SP8hdg3kUytdj36daOpwqjww@mail.gmail.com>
References: <CALbNGRQWNNvf5kLxcWz7EvUK6CO5VMX43vMrPx28yOzCq5NV8g@mail.gmail.com>
	<CAHiDW_GuabOEPc6rgh-vV+f502A5dYi8wFVYhRzqcZBGYHzz9g@mail.gmail.com>
	<CAHiDW_HFgnLbvd64hR8yE107BLtkWcp3eb=mA8towH73pMbUZQ@mail.gmail.com>
	<CALbNGRQBRFeCuz5R10qhBHQGQ3hn7WO9i1SAZ5fV=4BqGepjrQ@mail.gmail.com>
	<CALbNGRT6v530xCdqLp3CRHKOtBZpg8JqYreOsUhFL5u-eV2O2A@mail.gmail.com>
	<CAP9ODKrwUkwdESj-qKrPjsKMN2=W-ZsYBb_+OYhbvrfgcoht2w@mail.gmail.com>
	<87wp65rnfk.fsf@rkubodac-desk.ger.corp.intel.com>
	<8d04fa9f-3049-45cf-4255-bd0159b84751@gmail.com>
	<87r2wcajh6.fsf@rkubodac-desk.ger.corp.intel.com>
	<CALbNGRS1ywFbSNAoY976cPgJ4STQLqUEqzwq34XGaMH_CYhAaw@mail.gmail.com>
	<20170816160609.GA29490@linux-uys3>
	<CA+chaQdPFsk3yJzCO7e=L+=OW=SP8hdg3kUytdj36daOpwqjww@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Wed, 16 Aug 2017 18:18:20 +0200
Message-ID: <CALbNGRSMbrpZ+LMdRx1ZGAGbJHM3z8E8fT7oW2cNAE9+Sg-82A@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: chromium detected as stripped
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
X-List-Received-Date: Wed, 16 Aug 2017 16:18:20 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 16, 2017 at 6:12 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> I think nodejs fails because of openssl-1.1 like most of the failures from
> last report.
> http://errors.yoctoproject.org/Errors/Details/150582/
>
> it was building fine with gcc7 before openssl upgrade.
>
> Regards,
>
^^Maybe I am wrong but isn't this the wrong thread?

Andreas

