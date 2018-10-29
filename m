Return-Path: <schnitzeltony@gmail.com>
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
	[209.85.167.196])
	by mail.openembedded.org (Postfix) with ESMTP id B0B527965D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Oct 2018 22:34:23 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id k64-v6so8644512oia.13
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Oct 2018 15:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=40NwGNAukyA2yP0LhH764DeqT7QFkRNgyJZn0WCU47s=;
	b=TP/O1RxLI17AFkpxBDP81RSFCp1GmKUeYFMbTzo5nEEXfBjaFlHZt1W4lPKTAxC330
	7RUH7k916+NrOIqypFAJnubnidEI2DqUojnQnotMQZcpR6rw9UDPsneiiG2upBKhIQxP
	/OYe3ZKl4uLPUnrxA9BzWBykBbr7bBALYvcGsjtTTAPODPXihqC9Jx1AipvDDRbhrZFQ
	scR0C0sW7VjQ0GoQ3XK2mIxwNb5aqmjwmj3qE2CLZTiLyvT0RxkkArnfmExxf89UTQ85
	Y4oJPZ1HiD8mdAfFIpNJl9xSf3UW71/T3SBDSZppFAv4HdDdVm0stDHq6/ZXhMRFBYuG
	QBjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=40NwGNAukyA2yP0LhH764DeqT7QFkRNgyJZn0WCU47s=;
	b=YsulqTAPerkyVGnFw/nBWXXaqH7JAeDPngb84riNho5rUJjihBbRs9ICtLyJ45dJer
	6cfSUidO2Wj8f/+ktpqgiVQZ5NdFJ9bRbeb5ZXw42cCK4/5HLX/uyBy9drBBPA8UOp2A
	aFQv+QxkZpox23ULTMLuDn7ranKT8tLZ2wANGfsJmvyXufnLkgCQsEhOFfNsBpsJQuph
	FC2Qvv3HWrH/8+CTOLf+AYmokq9fHRNGPDYSTG2/AIWJNGiLrzZEfg/0MhsvGUm/Owji
	6+YV8H1PdGjNIiYmi8+TDqOnSnQksD5v5MtnRhd9n9tMpg/zK+aHaD5KgMJbIr0JEXqL
	J98A==
X-Gm-Message-State: AGRZ1gIDXdNqMOAmWO8T8szbOOmlxsaojbrWTzsJYDvVpIsdVHDYWw/f
	dLwGziv8xjKbt86YLGlfU+8H0IgVIJWMYqqaUsw=
X-Google-Smtp-Source: AJdET5e9Fc3n2UACLlzD38KbCM1BqbHe50YTdsQpkLhwalq/+i4Hpuwbe6XPG1K20335qlcDJfAF6PlkheAt86kgKWU=
X-Received: by 2002:aca:368a:: with SMTP id
	d132-v6mr10028361oia.276.1540852464643; 
	Mon, 29 Oct 2018 15:34:24 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1540830650.git.brendank310@gmail.com>
In-Reply-To: <cover.1540830650.git.brendank310@gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Mon, 29 Oct 2018 23:34:11 +0100
Message-ID: <CALbNGRRO-qQFvXDJODFn28e9AGr-AgUgDY1D52-2TdDcViYcYg@mail.gmail.com>
To: brendank310@gmail.com
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [RFC meta-gnome][PATCH 00/16] Add gnome-shell support
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
X-List-Received-Date: Mon, 29 Oct 2018 22:34:23 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 29, 2018 at 5:41 PM brendank310 <brendank310@gmail.com> wrote:
>
> This adds gnome3/gnome-shell support (and required dependencies)
> to meta-gnome.
>
> Please review the following changes for suitability for inclusion. If you have
> any objections or suggestions for improvement, please respond to the patches. If
> you agree with the changes, please provide your Acked-by.
>
> The following changes since commit f1511d254632a34c1deb51f4bf8b8c21e7423f51:
>
Thanks for doing this! Hope to get it build/run-tested soon -
currently I am shaping my layers for thud and poky-users.

Did not look much into details but I have one question: Many recipes
still use autotools and GNOME's target will be meson. Is there a
reason that most of the recipes use autotools?

Regards

Andreas

