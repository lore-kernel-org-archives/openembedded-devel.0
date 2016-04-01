Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id E982A71957
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Apr 2016 12:54:15 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id 191so19065729wmq.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Apr 2016 05:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=Xql8ek0+biSvsP/W9HeeMA72JARjqp00arKfP2dSSbY=;
	b=Na34PocmHUB6J6EuBwA4cI0D9bWsznxs4musPl0cz0NBqeQtw9K5QzShGRM3CZQJFv
	DZOJeDv3dlZZkunZej7E/98aNdEOXh6x61zvDcfgOj6RWbfm8ykJXksJhtqejB11jqpH
	J90YkH8TcB8aY/OCn4vGc9NLCnmJGUML/en1o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=Xql8ek0+biSvsP/W9HeeMA72JARjqp00arKfP2dSSbY=;
	b=it+m9Dh5/f0tU92EC4qc38O3oxxIxM4wNhkOGcY4jyIl6+oyeEClWhoE+2vKbnZJrK
	M3KUXNc+6C4Ru80cKc91NlOb0ycP2A4h6MeiA+wqkR76TT0kWsHuPKy+Hk8XusDVbDpH
	09MKu2xxDbx3QWfJzgjMcWLaevHDOiSf+2laEbUCgDxj+oSTNMDAnuCQUPkx2e2pFVlX
	pHTsrCEcmd0JN3zug6DdaIb6gyelxHT+3tEfCYzzDM3VxGFphPUhTLW9g7jN2GUgpEcP
	zpaKeHNV+e61LqD/PcGiEcx5CQAKicFeAMsuWU15DvkOj/b9VUyBjUMaFjj1UAFB/aPh
	wmXA==
X-Gm-Message-State: AD7BkJKcOudzkf4PGlt9PYb8NQRRht242/eI1BJ8/9astUYEJIeKBrRsCUvQ+dVFMjn8J50uDyF0NjW0qcnk/7u8
X-Received: by 10.28.227.69 with SMTP id a66mr3661439wmh.57.1459515255946;
	Fri, 01 Apr 2016 05:54:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.194.206.33 with HTTP; Fri, 1 Apr 2016 05:53:56 -0700 (PDT)
In-Reply-To: <1BA327FE-7861-41A7-AB53-A5DBB8EF3FEA@gmail.com>
References: <CAP71WjzNNeYY2pA5-YxtXFZJ01iPR=dgORMoYfCgWDPAA7_RsA@mail.gmail.com>
	<1BA327FE-7861-41A7-AB53-A5DBB8EF3FEA@gmail.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Fri, 1 Apr 2016 14:53:56 +0200
Message-ID: <CAP71Wjweh17pbzsvA0EA9i4nZe+bWEJYSPZp3yhV90FLyh8L0g@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: openbox themes
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
X-List-Received-Date: Fri, 01 Apr 2016 12:54:17 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Mar 30, 2016 at 8:19 PM, Khem Raj <raj.khem@gmail.com> wrote:
>
> Do you have XDG_DATA_DIRS variable set to include /usr/share, try something like
>
> export XDG_DATA_DIRS=$XDG_DATA_DIRS:/usr/share
>
> before launching openbox, if that works then may be you should add it to /etc/profile
> via a post processing hook or some such.

that doesn't change anything. without any openbox-theme installed , it
fails to start. I can briefly see the mouse pointer on the screen,
before it dies.

nico

