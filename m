Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SPeE7-0003oE-6f
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 May 2012 20:24:35 +0200
Received: by lbol5 with SMTP id l5so497804lbo.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 May 2012 11:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=kjcA5wycHuK1/Ae/UXov7EuAE5ScWAek6FEELYzuYzs=;
	b=bRMgFuWqiFDHDtQtZOwDU9/HbJZH6fT5/uFvXWFksYgQ6v1k5yQeIwdnXtzW8SHf+u
	EeXozKXXeL4R0z1lBaZrp4bpayJtNMay8jQV0Xo/SXnIgvyWupNaD/dkWaiL1RodcBzq
	V5wtMGFDgent11OvQLAw2lJxslS/+f4/QQA/7aDexr8RB1/a+Z3tuh/t/+lqxT4aH2iz
	6M1N8AgXrmDFRyaTKP217C7Jd3B0BJgN1cp2NUO6OFIjR2EK+CrRarDLpS+E0rhRgCeo
	28ksU9oGbGZu5iHnkJ1AVXj8TUk+iK42FJfshc4iMCu1fDu5XMmGRWjtgZjuJsUupMeH
	8jJg==
Received: by 10.112.86.101 with SMTP id o5mr14010894lbz.1.1335982490659; Wed,
	02 May 2012 11:14:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.152.129.134 with HTTP; Wed, 2 May 2012 11:14:20 -0700 (PDT)
In-Reply-To: <20120502095150.GA3682@jama.jama.net>
References: <1335951932-6143-1-git-send-email-koen@dominion.thruhere.net>
	<1335951932-6143-4-git-send-email-koen@dominion.thruhere.net>
	<20120502095150.GA3682@jama.jama.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 2 May 2012 11:14:20 -0700
Message-ID: <CAMKF1spM9urWo1VBXG=qdWOcC_5_2kw-vBGqWv3Lg0xBPWiADA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [meta-oe/denzil][PATCH 4/6] gcc-4.5: Match with OE-Core on building procedure for libgcc and gcc-runtime
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
X-List-Received-Date: Wed, 02 May 2012 18:24:35 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, May 2, 2012 at 2:51 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
>
> I'm not using gcc-4.5, but aren't those 3 patches only for master? As
> gcc-4.7 and other gcc changes were in oe-core only after release AFAIK.
>

Yes they are strictly for master to accomodate basic changes in build sequence
we did for gcc 4.7 that said, I think now that denzil has released we should
reconsider maintaining gcc 4.5 in toolchain-layer and same goes for other
recipes in the layer. Infact I feel the whole layer can be dropped.


