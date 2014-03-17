Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f48.google.com (mail-yh0-f48.google.com
	[209.85.213.48])
	by mail.openembedded.org (Postfix) with ESMTP id 8E8036F6F3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Mar 2014 15:21:32 +0000 (UTC)
Received: by mail-yh0-f48.google.com with SMTP id z6so5390276yhz.35
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Mar 2014 08:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=yvNSVHVNY/2JugbloFxxwsaq8FOS+QTWvV36ni7FnCw=;
	b=BZQADS1aETHAbtwRgTUWe+ci1qrEMVkQETE6Wtq20XQsnbwTB1lDjm4c6moASuZbkH
	KUWKtat3zwe4lDHyUz3OFv3QQ9iPN04nI5jnG7k6BHJ0BB/9gGaSnYakxFwdqpFW5a5w
	8vBWs8VZq3CrKY/djwQPI0FUEKoTnZcFEydImOhm9iOiZ8zLucqNHJZD5JLPkH7W6vFm
	ZQbP9UuWgQI/YR1Ij6dEdcMwNlZIxunN09HXqAL4kXknHGrmqz/hCoMfZuteuhulmhqP
	NTM/Z7CgPtMJBwA0oS1vbM0st9Xkbx5j4q2iu3lcqXosohdv5XWLe4js5JKXREv1iujm
	yZmA==
MIME-Version: 1.0
X-Received: by 10.236.198.197 with SMTP id v45mr10268972yhn.87.1395069693462; 
	Mon, 17 Mar 2014 08:21:33 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.124.72 with HTTP; Mon, 17 Mar 2014 08:21:33 -0700 (PDT)
In-Reply-To: <1394820299-22792-1-git-send-email-raj.khem@gmail.com>
References: <1394820299-22792-1-git-send-email-raj.khem@gmail.com>
Date: Mon, 17 Mar 2014 12:21:33 -0300
X-Google-Sender-Auth: bAV9QE7s74lL7CCdv8uwyrJEYv8
Message-ID: <CAP9ODKqKx_RKqYZ7RArDG-bJPo4wUR8vvgSP4AQ3ym=tjv-VCQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: Gary Thomas <gary@mlbassoc.com>
Subject: Re: [meta-browser][PATCH V2] chromium: Upgrade 29 -> 35
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 17 Mar 2014 15:21:34 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Mar 14, 2014 at 3:04 PM, Khem Raj <raj.khem@gmail.com> wrote:
> Removed already applied patches
>
> License year changed thats why there is change in checksum
>
> -// Copyright 2014 The Chromium Authors. All rights reserved.
> +// Copyright (c) 2013 The Chromium Authors. All rights reserved.
>
> we see
>
> rpm/bin/debugedit: canonicalization unexpectedly shrank by one character
>
> so we add PACKAGE_DEBUG_SPLIT_STYLE = "debug-without-src"
>
> Enable SUID sandbox
>
> Install ICU configuration file which is required
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

Applied to master.


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

