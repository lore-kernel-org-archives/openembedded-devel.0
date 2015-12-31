Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f171.google.com (mail-ig0-f171.google.com
	[209.85.213.171])
	by mail.openembedded.org (Postfix) with ESMTP id 1FB236FF76
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Dec 2015 06:17:32 +0000 (UTC)
Received: by mail-ig0-f171.google.com with SMTP id ik10so36311270igb.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Dec 2015 22:17:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=3Piep7PZXwh41C194T2C292keyX0U8wB6Tw40fhn8+g=;
	b=estGunIzft6FvVcNN9eZ6vOeJXgl0xeS1+p9wWD7gI5rhTs0iTlfd8VhLMSDMLSSqg
	/UL07qmYenj+pdFDbOv5pKTpJCUTrvB8XHxhTq5FsA/+X1hIugFa8z5BJJpdQWeJuG5f
	bdkArU1jyjQX2KzxUJWIhokJ0oGK9HBUYtAjL9tmwuYgTFq2qwDhILtmTIGEDiNwrmRz
	gycrHoO2a9r2XSLqXanm4fJfu7PrV89w8sPWXwIpe9iv6grEq1Xep4LCSl8pc7h8SsPG
	jFqDM5AcE7yiuwpv2ai7KtIQ5EvP40gFqNmGW3+sCEiwGH2QtI0kMFR8epjSDbEIyWoP
	+1NA==
X-Received: by 10.50.138.232 with SMTP id qt8mr59382986igb.75.1451542653519;
	Wed, 30 Dec 2015 22:17:33 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.16.74 with HTTP; Wed, 30 Dec 2015 22:17:04 -0800 (PST)
In-Reply-To: <1451525180-15429-1-git-send-email-rongqing.li@windriver.com>
References: <1451525180-15429-1-git-send-email-rongqing.li@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 30 Dec 2015 22:17:04 -0800
Message-ID: <CAMKF1srP1Mx9GWzfJzaMFpCtTyMbF0wKcpLnWVKedk99+0nMNg@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH 1/1] net-snmp: fix the replacement in net-snmp-config
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
X-List-Received-Date: Thu, 31 Dec 2015 06:17:33 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Dec 30, 2015 at 5:26 PM,  <rongqing.li@windriver.com> wrote:
> -    sed -e "s@-I/usr/include@@g" \
> +    sed -e "s@-I/usr/include@-I=/usr/include@g" \

Can you rather replace it with ${STAGING_INCDIR} -I= is too gcc
specific, wont work with Clang e.g.

