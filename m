Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f178.google.com (mail-pd0-f178.google.com
	[209.85.192.178])
	by mail.openembedded.org (Postfix) with ESMTP id DA9B76E901
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Feb 2014 03:59:32 +0000 (UTC)
Received: by mail-pd0-f178.google.com with SMTP id y13so6960004pdi.23
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Feb 2014 19:59:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=JQPt23vHkurklUZeq9SpNFRS72H1blPlBDuUcMEtuZ4=;
	b=HxpylCYqswp7QF0Lev75VQzTUtCasg6cm5Q+VPE9QZe5+zpxD+2PoNNrIPTnT/AJhu
	bD0DcYbnwr89Vn3+8Ztq/GZemUWwgMu7ibZ9dmJ8qtUIgZMrEHH7MlpKlds6g6UoAhBH
	h3D75RU+QHFA5OZGz8RDIT+0CcPkLkGHvHqZchjNCUs6STCyq3fO200dQ6Y5fSL10ve4
	oLG5ArsT4GjxdR/00tApy1P0oUB169Y4rw8d/Hw8r567yWu9sXsFzIl93APFRsKNic+F
	mu6yXHak/b1eos+aXHsBbKajRs4SbytsmyULq+vzEG6TLwmeZ+twloI5euVMsZGhPJAy
	zZFQ==
X-Received: by 10.66.149.231 with SMTP id ud7mr30198549pab.8.1392091173670;
	Mon, 10 Feb 2014 19:59:33 -0800 (PST)
Received: from [192.168.0.33] (99-57-140-30.lightspeed.sntcca.sbcglobal.net.
	[99.57.140.30]) by mx.google.com with ESMTPSA id
	sy10sm125956527pac.15.2014.02.10.19.59.32 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 10 Feb 2014 19:59:32 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 7.1 \(1827\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1384363435-25984-1-git-send-email-ml@communistcode.co.uk>
Date: Mon, 10 Feb 2014 19:59:30 -0800
Message-Id: <54F7CC09-2FEA-43F9-82C5-0FF75945714D@gmail.com>
References: <1384363435-25984-1-git-send-email-ml@communistcode.co.uk>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.1827)
Cc: Jack Mitchell <jmitchell@cbnl.com>
Subject: Re: [meta-oe][PATCH 1/2] libgc: initial add 7.2
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
X-List-Received-Date: Tue, 11 Feb 2014 03:59:33 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


On Nov 13, 2013, at 9:23 AM, Jack Mitchell <ml@communistcode.co.uk> wrote:

> +FILES_${PN}-docs = "/usr/share/gc"

its too late but whenever you update it, change that to ${datadir}/gc

