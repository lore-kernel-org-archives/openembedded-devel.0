Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f177.google.com (mail-ig0-f177.google.com
	[209.85.213.177])
	by mail.openembedded.org (Postfix) with ESMTP id B348272A85
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Apr 2015 14:44:28 +0000 (UTC)
Received: by igblo3 with SMTP id lo3so91398539igb.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Apr 2015 07:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=rcvc8kQpZj71aZRepiv4NBkxOq8q3fYMwLx+ke+dBak=;
	b=ItqyUnid93wISdRGJCS5o0MLW6BOSC6hzjjiui7VDeA94r870NVxBKHsVuQWfWvEOZ
	BSo9+vve8pSNA/LUt4cQ4Iah49aRjE58N4j6Poj07BR3Ez0cNuBc1jLm5ogjAqMQQ+DV
	fgS34JNCbDmdncUzVdN6PAxbUagbc+EqQ3UkdNEIX3rG5GJ3CjA3UioerO1u9kawIG1w
	i2/n7HDwlVobEtOv4PR5lhra14aP/d60Qu0K7EGaxKPngAEn20ZJVee4nm5JbY7GzdYL
	FiDLdCR7iMJ/18K9hZLsfaM6FxMIaflwh/Zu9XQSQhkfodHDDS9n5Q/EuHzv6Paed4Nd
	fy7A==
X-Received: by 10.50.80.19 with SMTP id n19mr18495847igx.30.1430232269462;
	Tue, 28 Apr 2015 07:44:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.230.178 with HTTP; Tue, 28 Apr 2015 07:43:59 -0700 (PDT)
In-Reply-To: <1430225107-10530-1-git-send-email-Martin.Jansa@gmail.com>
References: <1430225107-10530-1-git-send-email-Martin.Jansa@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 28 Apr 2015 07:43:59 -0700
Message-ID: <CAMKF1sr1riQH+iB63MYYD2wNM6E2rDKnAZKQtaZamifrO64cWw@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] nodejs: fix qemuarm build without thumb and drop unused patch
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
X-List-Received-Date: Tue, 28 Apr 2015 14:44:28 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Apr 28, 2015 at 5:45 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> +-      defined(__ARM_ARCH_5TE__) || defined(__ARM_ARCH_5TEJ__)
> ++      defined(__ARM_ARCH_5E__) || defined(__ARM_ARCH_5TE__) || defined(__ARM_ARCH_5TEJ__)

this fix is ok. but I wonder why qemuarm is defaulting to v5e and not
v5te did you look at that

