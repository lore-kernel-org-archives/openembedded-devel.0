Return-Path: <raj.khem@gmail.com>
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4B37660FA1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Feb 2020 16:53:30 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id z16so12485463iod.11
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Feb 2020 08:53:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=DBmdUop3F1azKXI6aeNTwx6mRDmKyZtZNx+b/c8csyw=;
	b=nbT6IGtXXeNspkGQaaeV7rt2KuXj5eYT527fxFjZwSvt5Z5D0uTl7COrFTiO9CgsRI
	S7RVy9z5l6ElZ7p3j4SgW+S0O+TtCwllWU13x4gaPcGriawTmRqzz1Ps12Y2aP/5Ib5o
	q+64v9n2tk2OmzuvA7IlkLxUIKAJ+Fp3iW9oXb8fZ8aKKczvMwqKHrOWhWyiY29AXLG5
	sAth3PE/J/zDCSPy8+tfMCxoMg5V7npueyRo3iMdvFEeVFqSC134bNoLKK0qQmKXCQ4h
	PgsAWYauCHGRwvEhlOpZurcy34fxA/rAi2idhAZzQBEwYmfoJbSF34PFMwc/gcSzW+u7
	8/tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=DBmdUop3F1azKXI6aeNTwx6mRDmKyZtZNx+b/c8csyw=;
	b=b9Pdp5KX0EJfK70H/AQzZ5CWZr+Or5LuJtSiIRaseksBucirtC+BuFUqG2j5O9ZYKr
	9pVl2ERH59aFIvmUBFlMHMneG2KOvlrHgmIgxz/DbMnl1NP4Yl7lMIsFYAsYZYdh15RK
	YOxpFaa6OjCzObzicEg4b2n+WvQf57kewAeMzGJdPeqQYmjbprQl3xDkf1JdfrROX8jg
	F3qBYHMHcz4z2cPM+FiMgSU/SSwID6hlaD6P65ADSRivSgVwcki67cR5n3RA+PxdlQ1k
	QenVgzscT6j2MSNoIqTtan/7KpNvPBfno3w8ynqigl6rgF2ygU4T1kVEj7OHc+nguAKW
	RTbw==
X-Gm-Message-State: APjAAAWHk5iYTT9+3XPpVy/X9ADdgqZPUQM6kriYrCQ2rONk6rAbil4b
	j3QzxvcwvP39wp0yrQgoIK62+Eqblg8UlUGzo0Y=
X-Google-Smtp-Source: APXvYqwtWqFnnDYwiq3GsnUdNpL1JkqmMvBWG/O5GhOAOn5JtRCbADsjneplC7tkwajIafgOeNX2G3RETSp6M57cqwg=
X-Received: by 2002:a05:6638:a4a:: with SMTP id
	10mr15457663jap.44.1581440011091; 
	Tue, 11 Feb 2020 08:53:31 -0800 (PST)
MIME-Version: 1.0
References: <20200211164101.75963-1-okaya@kernel.org>
	<CAMKF1sqk0ihBNQV_HhtBaqA-a6_VY_7L1QVxQg=SPZtHFSrnig@mail.gmail.com>
	<63d3f5f5-ab3f-4587-b1f9-78aa77fd3560@kernel.org>
In-Reply-To: <63d3f5f5-ab3f-4587-b1f9-78aa77fd3560@kernel.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 11 Feb 2020 08:53:05 -0800
Message-ID: <CAMKF1sp0vMz2VaB1kT+-optz7GY5n+YNCCOsWk4nuBqSS9L8Jg@mail.gmail.com>
To: Sinan Kaya <okaya@kernel.org>
Cc: Sinan Kaya <sinan.kaya@microsoft.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Changyu Li <Changyu.Li@microsoft.com>
Subject: Re: [meta-oe][PATCH v4] abseil-cpp: add recipe for git version
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
X-List-Received-Date: Tue, 11 Feb 2020 16:53:30 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 11, 2020 at 8:48 AM Sinan Kaya <okaya@kernel.org> wrote:
>
> On 2/11/2020 11:46 AM, Khem Raj wrote:
> > Thanks Sinan, this looks good. Although I wonder why do we need to add
> > -fPIC manually.
>
> I searched the library. It is not being set there and I had linker
> errors on both arm64 and x86_64 without it.

right, so I wonder if it should be patches in the makery of the
component separately and sent upstream

