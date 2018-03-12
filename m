Return-Path: <twoerner@gmail.com>
Received: from mail-it0-f42.google.com (mail-it0-f42.google.com
	[209.85.214.42])
	by mail.openembedded.org (Postfix) with ESMTP id C02677886F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Mar 2018 18:12:27 +0000 (UTC)
Received: by mail-it0-f42.google.com with SMTP id l187-v6so12698634ith.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Mar 2018 11:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=JNJsBcna8oAgOjSr/yNZV8gPYtB8nrBg2FJ2LyE+9a0=;
	b=ALRfjQDGgCER0JsEYf5eecZ6zrQA712KTptKpbX9CbeRVtJR3fqxXezb8QirIN06iV
	3kt7Rc67RZzBpDipqO4ZNKpCm1PT9mggBR+4UN0R1jNdYNlBLGqnz6/11sGNn5ii7+GR
	9UocKQpZzgGTYcUxHKbvuY1vqEPPsVLFsCMn0+q4kDvGOeS92Gn/bkFAQJDLYzn1o9hV
	tEltJe0dOP5JBIXk4QjQVc8cbDujYf4IRfDVi4VkS5v/0SaLghkzu1sldCcJ3c/XEWJt
	qrD9rYyz0svtYK94WnhLZCXCg5H40Lx/KEAjvedhvYghfYkun2tROqOsmxqA3x7Vws2m
	swXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=JNJsBcna8oAgOjSr/yNZV8gPYtB8nrBg2FJ2LyE+9a0=;
	b=mLFhmXmwdUkafvZzLuk0sXNR+HRGmFPMre1UQSP5f+x1cmJ7P9Klu6SkyDOLv1QT11
	Tq1ddk/ReSSKtQE4Jfza95wr1Tr6FgtIUBEodzuWFLuo4CMoQJ9GZ5O8mJcJ1C7w6YjE
	2q60GbOnzTNvrvot24gsghykSy37peeeS+4skmJ9NW4bK38pSARSkWUSulgUWqXF/GKd
	N4GK6oXA0r99/85pgo1ARHl3MDjuhYRNi2L6k7h3ue6SONs/SAhoFz+NFDTitWKZQBsX
	+merqUYlbB1fGLmSTskarWHsW8jvzJFOqzJ8YuTW/j3TTeW3jXTKPniyloS2oEvxME1f
	mEJA==
X-Gm-Message-State: AElRT7EEcEYhcOW3a2Ox99nSsyUxOUwTKZQgPGTkbasJT71LOaX9dnWR
	UoTuf4q1mXbFffndr2oF8OY=
X-Google-Smtp-Source: AG47ELtgvowj5Z+/ovZQMvmzmNY3o5JsCR5z2uRDvcbDcdJjO9tlm3QEA8Dc73L22lpPxAmknm6X0g==
X-Received: by 10.36.90.5 with SMTP id v5mr9759646ita.138.1520878348834;
	Mon, 12 Mar 2018 11:12:28 -0700 (PDT)
Received: from linux-uys3 ([206.248.190.95])
	by smtp.gmail.com with ESMTPSA id r6sm5482870ioe.85.2018.03.12.11.12.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 12 Mar 2018 11:12:27 -0700 (PDT)
Date: Mon, 12 Mar 2018 14:12:26 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: Andreas =?utf-8?Q?M=C3=BCller?= <schnitzeltony@gmail.com>
Message-ID: <20180312181226.GA28033@linux-uys3>
References: <20180301230148.2284-1-schnitzeltony@gmail.com>
	<CALbNGRSZrac1fEjm-=T19_wUHNcAp=n80KY8hcAWfwgV3QDv4g@mail.gmail.com>
	<CAHUNapT5Cr7LVZsT9c70mtEvGg4tTQeNpqyWyeuDrmxxLL49Qw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHUNapT5Cr7LVZsT9c70mtEvGg4tTQeNpqyWyeuDrmxxLL49Qw@mail.gmail.com>
User-Agent: Mutt/1.6.0 (2016-04-01)
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 00/12] meta-xfce updates + fix
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
X-List-Received-Date: Mon, 12 Mar 2018 18:12:27 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Mon 2018-03-12 @ 02:07:53 PM, Trevor Woerner wrote:
> You can monitor patchwork to see the status of your patches:
> https://patchwork.openembedded.org/project/oe/patches/
> In this case your xfce patchset is listed as "Master Under Test" which
> means it's making the rounds in the various "state of the world" builds. If
> it passes those builds, it likely gets in.
> "State of the world" builds usually take a couple weeks.

PS if a patch doesn't move from New to "MUT", it probably means the
maintainers weren't able to apply it cleanly (which often happens if someone
else has submitted a patch for the same file before you that ends up messing
up your patch, even though your patch might apply cleanly to the current
master)

