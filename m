Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ig0-f182.google.com (mail-ig0-f182.google.com
	[209.85.213.182])
	by mail.openembedded.org (Postfix) with ESMTP id 88B0D76F8A
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 Sep 2015 17:08:41 +0000 (UTC)
Received: by igbni9 with SMTP id ni9so19168725igb.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 Sep 2015 10:08:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:content-type;
	bh=SMMcQhfzKNe0f+A+ErCFc6FjPhSifGWAzicjb/QajD8=;
	b=TmvWkAM3LxH0F13b5Tegnx1LZusBB7dnKqK0u5fZJSiaUe90FXezbL0W4KGxMqJByG
	oTAdh+lecjWqlsyU89h1jShrY3ICQjDzcqM3w8j7VKVWblJbsiB8W+dxGhsRXbH/VGNO
	CApRYfmsJSEe7OCQSg9NWKiG7c9vWPTGOL10SMO4NEDQSfrEcoynpZAuEdONV5qzwE8B
	scmUx7FXXsDLtJnprOMDE+5w5cdgFIU/uPS9W6qBaOLQvV2pT0AyLVMBa6m5SWQnt6KR
	nv4MtpwybTtxIZL3qi4yS+hZcLF+ZzzXDyZRJ98fXZORk8bSstjkv5eNahbt3uhs2Xhw
	7k7g==
X-Gm-Message-State: ALoCoQnftLBcH26CnH9rK0wMEDDowsmE6THTSCYx6dh41A+B/aFFyBTlE2FZhHDecBlTRW/yUCbb
X-Received: by 10.50.164.138 with SMTP id yq10mr4810245igb.4.1441213721402;
	Wed, 02 Sep 2015 10:08:41 -0700 (PDT)
Received: from mail-ig0-f180.google.com (mail-ig0-f180.google.com.
	[209.85.213.180]) by smtp.gmail.com with ESMTPSA id
	129sm19646934ioo.5.2015.09.02.10.08.40
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 02 Sep 2015 10:08:40 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by igbkq10 with SMTP id kq10so29821274igb.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 Sep 2015 10:08:39 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.50.66.164 with SMTP id g4mr4268018igt.19.1441213719971; Wed,
	02 Sep 2015 10:08:39 -0700 (PDT)
Received: by 10.36.218.7 with HTTP; Wed, 2 Sep 2015 10:08:39 -0700 (PDT)
In-Reply-To: <a3f9a448b2d41d4f6e0b27a3365e72d7891995ce.1440502860.git.samuli.piippo@theqtcompany.com>
References: <cover.1440502860.git.samuli.piippo@theqtcompany.com>
	<a3f9a448b2d41d4f6e0b27a3365e72d7891995ce.1440502860.git.samuli.piippo@theqtcompany.com>
Date: Wed, 2 Sep 2015 14:08:39 -0300
Message-ID: <CAP9ODKrFbMBqsQyVJohqL1ugKnv32LNMps5MbTELswto3fa-Fg@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH v2 08/11] qtbase: remove dependency to sqlite
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
X-List-Received-Date: Wed, 02 Sep 2015 17:08:41 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Aug 25, 2015 at 8:43 AM, Samuli Piippo
<samuli.piippo@theqtcompany.com> wrote:
> Qt defaults to bundled version of sqlite, so there is no need
> to have dependency to sqlite3.
>
> Signed-off-by: Samuli Piippo <samuli.piippo@theqtcompany.com>

We should use system sqlite3; so instead we need to make it to use the
system one, not to drop the dependency.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

