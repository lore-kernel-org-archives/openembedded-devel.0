Return-Path: <kergoth@gmail.com>
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id 2D4DD76BD7
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Nov 2015 19:42:28 +0000 (UTC)
Received: by ioc74 with SMTP id 74so320693ioc.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Nov 2015 11:42:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:content-type;
	bh=syPPmNhiQo88tAIX1YjN94wWc2MlgILJ8afIqWbge7c=;
	b=vh6L+BMRRGdziv4niIQkl0GAXcdX4z88bPKC6K8dEqRieh7raYcYcYbPCGngvn9HVr
	GJizhIcqQMCbqKzMli/TqLYPwcrGKh8IA90tdYczjP+OxYN3bTxLJuR7aHUNOwtW1QG7
	oQULc5Akx9ihtpGY6rGsn0F8ypiemApGhHGaaeSeKcd1Wr/gcZRXS5xwkPGqDx/UzFqT
	RnEYboOgMu5EvHPtmfzoslcH1cIMYsCmcls4aFkK8ynv4V99KR9tjzBZmKAp8cd2B4NO
	vyxVb9HzwWxAktsFrkHFIKYNFXSKv6lmd513QBTIiW7/WIFRvuL0N9JOPiOqWSUu2yX6
	JPvw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kergoth_com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:content-type;
	bh=syPPmNhiQo88tAIX1YjN94wWc2MlgILJ8afIqWbge7c=;
	b=XDrJ1zczc9c4ZgKdDk599ZNjX7i08SSbTZEERguEb2j6XH7CGSOkUGMsUZtharLNHL
	izOBHmUi5C6Xu3V04GHstu2HeYkFiRXfzOZpp2oK/QmsF2xIPquAjpHIPsRPb4jDf877
	KiBmPujDXH53rYTTSpyUH3niCNKSuK4ygqfRTIxTVyI7XutphhGeY4PKDV1QcbIcjJOA
	b/e1U5ZJHmSSnVrCaSSYU/NifG00UNLRWs8JByHcRDQ/XMLd0NKT4iPHDGZLK9y3vDSk
	eCO+wOI8++7YABzNSrEV8dtmw+DvbSAOqvHzQEe4kpTK7sFZK8Xnb1AUvyCcWQO0Pzhj
	lxKA==
X-Received: by 10.107.38.70 with SMTP id m67mr5806105iom.98.1446666148422;
	Wed, 04 Nov 2015 11:42:28 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.93.7 with HTTP; Wed, 4 Nov 2015 11:42:08 -0800 (PST)
In-Reply-To: <FD578A39-55EB-46F0-8AB8-85C7F9B8CC2C@gmail.com>
References: <FD578A39-55EB-46F0-8AB8-85C7F9B8CC2C@gmail.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Wed, 4 Nov 2015 12:42:08 -0700
X-Google-Sender-Auth: jEeL3XmCnpnL4jD96-Y_0FaepG4
Message-ID: <CABcZANnLjb5mF1SLYA+2x0er=RefobM-Dv81wYvi3OOKhoB74Q@mail.gmail.com>
To: Openembedded Discussion <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH] samba: systemv-init script must be executable
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
X-List-Received-Date: Wed, 04 Nov 2015 19:42:29 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Nov 4, 2015 at 11:09 AM, Jens Rehsack <rehsack@gmail.com> wrote:

> Fix insane permissions installing SystemV init-script for samba4 to allow
> executing it correctly.
>
> Signed-off-by: Jens Rehsack <sno@netbsd.org>
>

The /etc/rc our sysvinit package provides will source the startup script
rather than executing it if its name ends in .sh, so I don't really see why
this would be necessary.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

