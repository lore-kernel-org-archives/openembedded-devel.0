Return-Path: <sragolu@mvista.com>
Received: from mail-lf0-f45.google.com (mail-lf0-f45.google.com
	[209.85.215.45])
	by mail.openembedded.org (Postfix) with ESMTP id 1D93272F85
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Feb 2017 09:04:57 +0000 (UTC)
Received: by mail-lf0-f45.google.com with SMTP id a6so2658267lfa.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Feb 2017 01:04:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=PFKWhCmYpOPm4QIvwTqevEyXA+GQ5OCnVklRRECkHQU=;
	b=R+XORmKotHCtYIQX/vu8srGILxJhUcREdzaATPt9EIW3kN+48OjNPmSPKzbsbx75EV
	3QvjOsc0uiNEW5QUubspadycTFPdCu1odhMbPxaST4QwiSZhZqBWkS/eu1uuOTU6kq/1
	8CCRB9U8EyFiLS785YZ3O2bQBMmryMdHzObpBTKoHiQGH6hAUhYlYUfEnAXZb7+8xgLt
	wvVYR7F+It0z+V5KZc4TAqqaa2hpbx6aw2ehmHupo1ux/jk8D+RuqKM4NilRPB/1hTNY
	dStVI+9aUcDG/3NynAWfJ8C3mqtEqhA4SY9dkcidX0gOU13e/Mo4q6YAd+37p3GXOaUu
	8S0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=PFKWhCmYpOPm4QIvwTqevEyXA+GQ5OCnVklRRECkHQU=;
	b=kGuv9ZOUoJCaXb1CAoUvJv1/GLdr/BXBgKZBS3yvkm/meuhabLLzHK57mB1qwpxMxN
	W/3Qj5yZvjUMAiySqwvGYSmzerzRreQ/v2TBQIdc0ClmBKEkBEV2ZMXGwn7t1tqbo/Ns
	hK2olPZ9oOkSVNHi4z2ujEw7p5q31R3TWuhXnvYy6YvXXULNMIsN86hfhb2LYiX+t12w
	dV4tnYMnPSrfrepQI8Grv8EU6XfZKZUkyFIb7w/A2StUomnpofkyP9H9cYsVzevi9RnZ
	K1oxvt0NQf6ehEkr5JUfzGNSLT6Nj0Sj5gWeU7I/89tTevnD1dYE7Z6j9f14XQlH+pfo
	XZiw==
X-Gm-Message-State: AMke39lL+rsc0azh7qjjofb7qF4CPS9QiIkt/0gkb7LtvjnEIDcOlSKszLj5UMuODCk1loZDg8/Wdu6D2TmTpAQi
X-Received: by 10.25.26.2 with SMTP id a2mr422569lfa.154.1488272698717; Tue,
	28 Feb 2017 01:04:58 -0800 (PST)
MIME-Version: 1.0
Received: by 10.25.208.69 with HTTP; Tue, 28 Feb 2017 01:04:58 -0800 (PST)
In-Reply-To: <20170227103832.GA25852@mail.itconsulting-heinold.de>
References: <1487759783-10455-1-git-send-email-guy.shapiro@mobi-wize.com>
	<CAH4+OFrHDbj1ZmYRRN+mSAHEHCvnBDiTou0JUQTmiyCmyr-Sig@mail.gmail.com>
	<7b26a808-c448-706f-c595-393e55451c3b@mobi-wize.com>
	<CAH4+OFq=aZeeEayB2TSAiGGiVhwp01EfBdqNavYEwo2kuJ+d+Q@mail.gmail.com>
	<CAH4+OFoigK1HxZYPW-zFcs+dqTt_0yvdTjogzzeMHfXdGnwRRw@mail.gmail.com>
	<20170227103832.GA25852@mail.itconsulting-heinold.de>
From: Srinivasa Rao Ragolu <sragolu@mvista.com>
Date: Tue, 28 Feb 2017 14:34:58 +0530
Message-ID: <CAH4+OFq+oh+Bf2cct1_e00SsNbg-mRs50kxE5zKhZOsWtE_BhQ@mail.gmail.com>
To: Henning Heinold <henning@itconsulting-heinold.de>, 
	Guy Shapiro <guy.shapiro@mobi-wize.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-java] [rfc] openjdk-8: recipe for jdk8u121-b13-aarch32
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
X-List-Received-Date: Tue, 28 Feb 2017 09:04:59 -0000
Content-Type: text/plain; charset=UTF-8

Hi Guy,

Thanks a lot. I could able to resolve all issues. And working fine on
target.

Thanks,
Srinivas.

On Mon, Feb 27, 2017 at 4:08 PM, Henning Heinold <
henning@itconsulting-heinold.de> wrote:

> Hi,
>
> the error log shows "cc1plus: all warnings being treated as errors", so
> you need to change or remove
> the compiler flag "-Werror".
>
> Bye Henning
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

