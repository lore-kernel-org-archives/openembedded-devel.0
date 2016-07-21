Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f177.google.com (mail-qk0-f177.google.com
	[209.85.220.177])
	by mail.openembedded.org (Postfix) with ESMTP id 78A756E667
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jul 2016 13:34:38 +0000 (UTC)
Received: by mail-qk0-f177.google.com with SMTP id x1so73569519qkb.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jul 2016 06:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=hy1pqA4PxD5ViNv4UZsALE1nC8ykm6v11bSSkXBieB8=;
	b=X6E3fX+4nnTTu+E5CfqXL5VTFuovUSeEDhUBqXcsV5o/lq8lj4I3er48V3PaC+Ap60
	v9N5bt9OgEHqSddq7qfDuj4+yus80m6fXT6lyO09gkGgXHydYS4BEzdaWGFPN+GJN+SZ
	xb2UuuMc2Hmb/31nndJs0HtlEE8m7MS8zI7Um305lrqUVIuTbE5b3TxTsQf6uIQL1bPv
	hc16L3PejdlarpnmTDJyFhO6z1TbhunA3HXAb2Es8RO7y39QOx9DNGAf9rUV5KFPEUl6
	Uc4KbpgA/grk8B8bwtl1pwiVNurfT9TxqU4ysS7nS5WuepvPWVga/ZTFUmRz4QPcER0R
	U9UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=hy1pqA4PxD5ViNv4UZsALE1nC8ykm6v11bSSkXBieB8=;
	b=lcVZyvp2W+NwElDq4bAxQ8sgHjk+ju9i64XK1ys0DY8gWYSF9ohQgo9xFP4W08YEjT
	3bazoS04pYK3wlvvFbgMyrsWYkHYSPgVmUBhOkTWVBXfQaBHkswFaps61gIErtW7g2qq
	+qYmdd56qlc8sY3CnJnt79pkXsITg4sjCGwtRyEXt36o4Nc/ByWVYe3UqHQILrMjBjdu
	yK9ekchHV8JQbEFc4rsNOMex39YZBilzK/BOg+k56l9jye7CCYcR6XTCHGPQ0lqkNJ6I
	olRYth+32YW+XM4b/GysPwZJAKMfS2TbqRfYEZjRJFIGUrP11osuevE1TF3dt/xWYkef
	ud2g==
X-Gm-Message-State: ALyK8tIep2XIoo2zRcsX+zL40/ntJTNN0Z3L8H+hULB+1LxDNUKtoG3FSjKLxQUi7N2WaG/4l/xLmnhReixt8g==
X-Received: by 10.55.97.18 with SMTP id v18mr66367010qkb.102.1469108079219;
	Thu, 21 Jul 2016 06:34:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.214.83 with HTTP; Thu, 21 Jul 2016 06:34:09 -0700 (PDT)
In-Reply-To: <1469096700-11775-1-git-send-email-mingli.yu@windriver.com>
References: <1469096700-11775-1-git-send-email-mingli.yu@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 21 Jul 2016 06:34:09 -0700
Message-ID: <CAMKF1sqvsGYWddJTUUe7FkZSqTCK23nPjboDcn4zz_my8EpgTw@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] makedumpfile: add makedumpfile 1.6.0
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
X-List-Received-Date: Thu, 21 Jul 2016 13:34:39 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jul 21, 2016 at 3:25 AM,  <mingli.yu@windriver.com> wrote:
> ++CFLAGS_COMMON = $(CFLAGS_ARCH) \
> ++              -DVERSION='"$(VERSION)"' \
> ++              -DRELEASE_DATE='"$(DATE)"'
> ++

how is DATE calculated ? such things can hamper reproducability if
they use the system date at build time.

