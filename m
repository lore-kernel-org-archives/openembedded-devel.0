Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com
	[209.85.166.51])
	by mail.openembedded.org (Postfix) with ESMTP id 49AF36BCA9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 May 2019 20:33:24 +0000 (UTC)
Received: by mail-io1-f51.google.com with SMTP id b3so6467602iob.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 May 2019 13:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=gZJu3U6d0MHtMXH4R7NF/sblJ6jkQUXmqAihi8llPvE=;
	b=EfcR5Pw+WENXqaJac+Vv2JvfXJO+SJs5HEnUGz8hZNAlJlOVknm8nKVBXqzQ/TBi2h
	pdR6inrj/YqCy/QmctYzUYyo9vZrvhp0GFd8guAB4uakS4dS0pclO4bdTTeWmPJVW5VV
	q0nIgcvP1u4P2OI6yJwmyQAJTgxjd7cFNLLaOqt94af7r5ZLJd98zGO6Z5gmDJ6lZu51
	bkL5mzGcKW6QVrGO+1mwtQn14xU/pAdWAL+eYxqrQLk2Jh4UPRx1l1cYg2+Hadt9uN1U
	FhJI2/MG/gLtdjjxyoWIcYBvgBlK4pmRDdSxOxH4P7zu/QvAvMBgNrll3CvUaVy7UyMg
	U0TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=gZJu3U6d0MHtMXH4R7NF/sblJ6jkQUXmqAihi8llPvE=;
	b=nZt1u23BfZmdwV9iVigkh0ckuWDNGqZ6Q0gSMan5dFvSz0nQqWmrWBsbnQcoUST8sD
	6vf5tdeCPEASuT4TvCxKp0zgsEykXoKXSrTJ/PdoTjGCt9Vg7LoqSIC66htIL+AStOx9
	Umi7h4lvTUCkbs4la1rjIPlOpvphAdRcLES/k5b5SiiBSkZ//V659IMnfdG1GJxj0ELD
	cjw7DzK/jER6PTGZ1ch0sSexWfebzoloGMTeEsDPOHQ95dMWa7vPjkpuusvhVUgd1IL6
	SEgptPFARJ1lskdyI9Pd9t77djgefxRXiAACskgbqpnlnQpLO/T16b2MQQZ07aTAuINa
	E0tQ==
X-Gm-Message-State: APjAAAW7Gptjl0T7VwT5ptXWi9TBq5wX6ZBx1L9nDwyiBPamnqTloF3q
	swlkZYHFQKIDTquTA+yOF9SkoceQvrTOh/YpSkm9Jg==
X-Google-Smtp-Source: APXvYqzlZ6dweUk2QyN6+PU/JkflpwE0yGcsEvyAGLI0ym0zVrF4w/VvnLIn8rz0n0ElI8o+YIOzJuXTJGcVQ5AkA1A=
X-Received: by 2002:a5d:8a0b:: with SMTP id w11mr31194895iod.261.1558125206145;
	Fri, 17 May 2019 13:33:26 -0700 (PDT)
MIME-Version: 1.0
References: <20190517094351.GA1594@jama>
In-Reply-To: <20190517094351.GA1594@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 17 May 2019 13:33:14 -0700
Message-ID: <CAJTo0Lan9CgM1VZ-00dAhc=ZdNT_nTZPLfUZQWKx9x7J-iJ12w@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: github archives in the recipes
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
X-List-Received-Date: Fri, 17 May 2019 20:33:25 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, 17 May 2019 at 02:44, Martin Jansa <martin.jansa@gmail.com> wrote:
> Don't use github archives, because they are regenerated from time to time with different
> checksums.

I *really* need to get around to merging
https://github.com/rossburton/meta-ross/blob/master/classes/insanitier.bbclass#L93
into oe-core.  I'l try and do that today.

Ross

