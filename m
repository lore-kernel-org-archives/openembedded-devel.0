Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-yb0-f172.google.com (mail-yb0-f172.google.com
	[209.85.213.172])
	by mail.openembedded.org (Postfix) with ESMTP id D1AC760111
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Sep 2016 21:30:29 +0000 (UTC)
Received: by mail-yb0-f172.google.com with SMTP id x93so45220028ybh.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Sep 2016 14:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=4DbVSYQywxue9s4u4ssDFM36pgar2NDXflQhLQCRT4w=;
	b=BsWhrWmL54F2RyDSSd3IaPjd9Jf+h21sEBDdbvXgYrMQwfgqs3UtvbTri1fKnpL+aG
	4XYPbBYUtEDFlIabhZpSH7OXYeo+DJhzXpLLjVruldcIcKNNK3NuRFAhBm5vnvD/SH4l
	A2WFaRLiZ1OKU/hyzpt1+nhV+GJd7psGXs8tGku8aGo2XGPUR8h4shk9Gql2kKemb9Sr
	+6lSQN9aLK6foeYvJyxOWUp4ZVUPblAcZFuClKjFjlGVtQGAyOhZGjCfuN+cmEuz7jSn
	58k2LMmPQVTOXW/vgN3T+ICLk9GBRcEqT+EAwGPYbJX14gc1zCKJ58DCm/CqD1aZiH8B
	2rTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-transfer-encoding;
	bh=4DbVSYQywxue9s4u4ssDFM36pgar2NDXflQhLQCRT4w=;
	b=LgnALXjSEQmwTEcarLo7KTfiXW9C6thzlBPCr4Bgr5CvkpwgRaaJPS6AwBnZYbG6IM
	n8hjAJ/CLDMT8bLv/bb7A2WXqvYe+R33GjIftc+ZDLRAmDts80cdyGdOgY38eT2RJjvP
	tuuEpEc2yG+PlLrFietdQuQND7ZDYC5ZfGwq3SsRRm0C+jTsWOZ6CMlRjtOiazP0Hs8q
	roumGXlUGStKe5FWB2W7uGF2jHQdQzFPRYCyNpYrENbZEwAySxsLJi4V6/Pm3ZaaG7po
	vJmaSYTBHM/PyRQqOG4RnS7Lz+d1vtHktfTGRxW68q8CTCSI2b5OR9v/JSBvCD+WQsxm
	rEhA==
X-Gm-Message-State: AE9vXwPHgS1CFglXCfnwKGVVKZxnwDNZAPPaHgUOna2IUhD8gBO1xnBHo+zHXjveGaQqKXCZiJrWFw1yxg069Q==
X-Received: by 10.31.58.200 with SMTP id h191mr59657vka.51.1473975029472; Thu,
	15 Sep 2016 14:30:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.65.130 with HTTP; Thu, 15 Sep 2016 14:30:28 -0700 (PDT)
In-Reply-To: <CALbNGRQTv3L7hx0r1CE1fTn=Jb9n1aWWQor6v+85HSrm9nDsBg@mail.gmail.com>
References: <1473884049-27152-1-git-send-email-schnitzeltony@googlemail.com>
	<1473884049-27152-2-git-send-email-schnitzeltony@googlemail.com>
	<CA+chaQdQZLYvVssqqR0-0JPBPHzWSYPTZb1ROro+QKqx3vKMRg@mail.gmail.com>
	<CALbNGRTg=j3JGSN4CZm9uSEGXy1-1OWX9i3sP9UHefdiiZQOwA@mail.gmail.com>
	<CA+chaQcd6S4wmUNWvqVfiRV_6f1KV4=+7VHoMtUJ5KkTdJJ8ag@mail.gmail.com>
	<CALbNGRQ92cGVmUY5Af5qGBFCzsi_kLsKB6cYgVzhtMhyxjV4kQ@mail.gmail.com>
	<CA+chaQc1ts6XJvoCUeyDQt37_C9Bk62e6-3vXXioqm6n0UL-_A@mail.gmail.com>
	<CA+chaQf+VabfADqTaP0N5ZqwZ9xiP1rP9bj7k4HL2KE62wkgPQ@mail.gmail.com>
	<CALbNGRQV1ttB8zyX+MPp4eLOKE4nezA9cQ4Js5rPjfVgRQ4nGA@mail.gmail.com>
	<20160915193118.GE2641@jama>
	<CALbNGRQTv3L7hx0r1CE1fTn=Jb9n1aWWQor6v+85HSrm9nDsBg@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Thu, 15 Sep 2016 23:30:28 +0200
Message-ID: <CALbNGRR6hMGaGc+Li6C1dypn6V1BYNW=PV=OD2+4rh0eW9dSYw@mail.gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Thu, 15 Sep 2016 21:30:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 15, 2016 at 10:23 PM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> Apart from this mystery: I found [1] and will play around with it.
>
> [1] https://lists.samba.org/archive/samba-technical/2011-May/077532.html
>
Would have been too easy :(

Andreas

