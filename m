Return-Path: <kergoth@gmail.com>
Received: from mail-la0-f51.google.com (mail-la0-f51.google.com
	[209.85.215.51])
	by mail.openembedded.org (Postfix) with ESMTP id 03A8C6AC6B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Jul 2014 17:17:00 +0000 (UTC)
Received: by mail-la0-f51.google.com with SMTP id mc6so6522107lab.10
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Jul 2014 10:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:content-type;
	bh=/s2KD6ibt5rI/gjuXqsLhX9zw4KEp5aWKVCEmAI/52U=;
	b=nzGDqjakOrgBfmCteiNquTmZZr83csDCBOvU5I5wLL5zcHELJ6Oa1t+bh9iHyP9sgf
	6i/JrmLNQrvcglO6reISDfE9BYvwXIGS/rfqdnq6/OhHDQbJOBT6dYLN0YsWtzSFhzfF
	UPAKLgFZSmmsek4BubOoZcmT/VoeUPAi57L3OPn1nWCkjK/izOEaHSx/iomUnr0FiV8+
	CZoSeP81RWu8OeXP734ASdBKmT/1ENYj1QFY5CabMnLhCaIM1MiDXtk0eiy1B1IVtdWf
	SOULCbVygCLyT/wtugXZWrf1nfv7LmexlzYwYXpExns2aUqeoBW3i7xhyIixe6BWCeCm
	WRMg==
X-Received: by 10.112.198.161 with SMTP id jd1mr6324170lbc.56.1405012620730;
	Thu, 10 Jul 2014 10:17:00 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.168.66 with HTTP; Thu, 10 Jul 2014 10:16:40 -0700 (PDT)
In-Reply-To: <1404976077-1809-1-git-send-email-rongqing.li@windriver.com>
References: <1404976077-1809-1-git-send-email-rongqing.li@windriver.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Thu, 10 Jul 2014 10:16:40 -0700
X-Google-Sender-Auth: iM7v4tzOpYp2UxXtZ4WE_SIrPS8
Message-ID: <CABcZANktDnJnQTN-mz+1BUx4Bs-m5PeXAMY+nideskOdbSpwog@mail.gmail.com>
To: Openembedded Discussion <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH] sdparm: add recipe file
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
X-List-Received-Date: Thu, 10 Jul 2014 17:17:02 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jul 10, 2014 at 12:07 AM, <rongqing.li@windriver.com> wrote:

> +-INCLUDES = -I/usr/include/scsi
> ++INCLUDES = -I=/usr/include/scsi
>

Also doesn't obey @includedir@, so it'll break on a non-/usr prefix.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

