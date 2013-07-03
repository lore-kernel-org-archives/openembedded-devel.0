Return-Path: <ross.burton@intel.com>
Received: from mail-vc0-f173.google.com (mail-vc0-f173.google.com
	[209.85.220.173])
	by mail.openembedded.org (Postfix) with ESMTP id 5D0BF6AF56
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Jul 2013 15:45:38 +0000 (UTC)
Received: by mail-vc0-f173.google.com with SMTP id ht10so215307vcb.32
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Jul 2013 08:45:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=Yy0tfYgKQ5Zjejerxy6PU4Sv2tuG1bIclayi4jVdszs=;
	b=mCW3F12P/SIgF3pPAFP9MZyMuRGvVvEd8V+a3TJO6hmI38Ba1Kyj9XLja7N5l2XM2G
	y5Fk7+1bjOoc+4MZvEJ2ofb9kL2rWh9yNXXTzUHv7bdJKRPw8QMXqTgA7WN4zPcmFHyH
	2Ne6O7eYUpWodzSGxF3tV8Vpz8zgikrO9w9UMGD2PDhqMHwVJrF95wnPDRhzGlG4gZ0Z
	dbx5l6bOq7634+aEy/AIIegGhQd+A7FvzZBZsBTfGovnmGl/MlO/UmEvAFrCMPeHabRh
	TO7ZACPe7RJ6XrKFM+1wGAlOz/Uxfq8xgkEBb3xjulm79mKpqNuF/UpKJzCCWOtIzjJq
	sHXw==
X-Received: by 10.58.118.70 with SMTP id kk6mr494283veb.1.1372866339115; Wed,
	03 Jul 2013 08:45:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.13.144 with HTTP; Wed, 3 Jul 2013 08:45:19 -0700 (PDT)
In-Reply-To: <1372864933-17240-1-git-send-email-otavio@ossystems.com.br>
References: <1372864933-17240-1-git-send-email-otavio@ossystems.com.br>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 3 Jul 2013 16:45:19 +0100
Message-ID: <CAJTo0LbQA+r7B0RVDy_0CJivi8H+3yktHUZqCFzz1=AcTkXDiw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQkMPMPU3kEUxV3cktVJkahjwQn7g29t6ZiMMpC71/coJbK+qpbNsk00YckG/ksme708KYSA
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [meta-oe PATCH] lmbench: Add /run onto package
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
X-List-Received-Date: Wed, 03 Jul 2013 15:45:38 -0000
Content-Type: text/plain; charset=UTF-8

On 3 July 2013 16:22, Otavio Salvador <otavio@ossystems.com.br> wrote:
> +FILES_${PN} += "${datadir}/lmbench ${libdir}/lmbench /run"

This is part of base-files in oe-core master, so you shouldn't need
this to create the /run directory.  Obviously any attempt at packaging
files inside /run is doomed.

Ross

