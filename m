Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1TW8zF-0006NQ-2L
	for openembedded-devel@lists.openembedded.org;
	Wed, 07 Nov 2012 18:00:21 +0100
Received: by mail-lb0-f175.google.com with SMTP id y2so1360339lbk.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Nov 2012 08:46:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	bh=7dG4LreJbjS4mvxDSlORjODmJBZ6Rrn4Jkjn6sRLXTw=;
	b=lmhzMs6oObCnwTn/J87SRHyU/x+HexFnWPrWtw7D6nA/RJCw7dZr1YiXvCfd+PqANs
	SdrRugnqg9o2hbQt/yDyybFo+boZtptcCtCRfVyrQOo1aqEX9jZeP0++aIQAKRtnXYiJ
	FNmcabLKaTghI63tSbOY4X6CPlkpHPM1Gttg2CRZmsiEajzjohjgOfNSLjBf+mY4sE8l
	+BTffJDqxeLKrMT2E5IhbNPuZYy3Jf85oFoa61NKJAlqkwwLCs9SPWBhxUahMq2rYW4a
	/H1tx6fRHHGKRGwI6K+7aaJbfr2wxulZ3VTzgVgtuDuLpQhCqXbenqReRhRg3VlzJCmz
	sLfQ==
Received: by 10.112.24.6 with SMTP id q6mr2204189lbf.24.1352306792423; Wed, 07
	Nov 2012 08:46:32 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.114.1.49 with HTTP; Wed, 7 Nov 2012 08:46:12 -0800 (PST)
In-Reply-To: <1352267865-3534-1-git-send-email-rongqing.li@windriver.com>
References: <1352267865-3534-1-git-send-email-rongqing.li@windriver.com>
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 7 Nov 2012 09:46:12 -0700
X-Google-Sender-Auth: NDGhv6Iy9X-7Mq9Hs90UTzRgVTE
Message-ID: <CABcZANkL_-7p38JMu4wQJBXwmYpYL0FWUKBAn3MyBzmzpg3BhA@mail.gmail.com>
To: Openembedded Discussion <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH] Apache2: Add libselinux dependency and Disable parallel install
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 07 Nov 2012 17:00:21 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Nov 6, 2012 at 10:57 PM, <rongqing.li@windriver.com> wrote:

> 2. Disable parallel make install
> apache2 supports parallel make install, before installation,
> it will firstly call build/mkdir.sh to create needed directories.
> build/mkdir.sh first checks if a directory exists or not, if not,
> it will create this directory, when mkdir.sh is called by many
> instances parallel, it will introduce race, namely the result of
> checking says one directory does not exist, but when it tries to
> mkdir, this directory has been created by other instance.
>

How much work would it be to change it to run 'mkdir -p' rather than
build/mkdir.sh, e.g. via a variable in EXTRA_OEMAKE?
-- 
Christopher Larson

