Return-Path: <andre.draszik@gmail.com>
Received: from mail-yw1-f66.google.com (mail-yw1-f66.google.com
	[209.85.161.66])
	by mail.openembedded.org (Postfix) with ESMTP id CACBC78E39
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Aug 2018 12:02:39 +0000 (UTC)
Received: by mail-yw1-f66.google.com with SMTP id 139-v6so15952397ywg.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Aug 2018 05:02:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=3MjEDtUMtqPWpIiwFN1Ym8ak6Os4g3clKTA5qc8JEhk=;
	b=JQIEBojZxhq/DSjMKgtDNOX8Q3c89OjEzYNClUhFLfX8h0Nay2Bs2tey51hSgfWNJU
	9qcD80LCUoCMD3iDWuU5wy9I/4bzJD5DiM+TvC4IHnFD52YfhX1Hk+pbtux6bNnCV06e
	gSBXkg5bEOVuo1C5qpNpvBxWaS8Ya6tbnLX+hZxsz4NN2JZgvyTPEIXL5Yev9dd0lBi9
	PK2QgR0cD3LdA9ZvAr4+K56iRSCWInwJzRwgX7vsswfAFh8M/bcjItzECZFCl3LSraka
	H0dSmxbTfHmii4vgnhKDYLPxwdlbu+k7EnuMTSQ1GOa/wStVJ4AYAIXRoX3a4PhfdfA6
	6J+A==
X-Gm-Message-State: AOUpUlFsl0P1wQf/7f3pp6P2n1tsLY+sdOyAEGpp4+yGMjYD8ED28Mpo
	jaKvLrzw6VNvQZFFDF2sxuiItQaL
X-Google-Smtp-Source: AA+uWPyy9yQrQA+2e7sa6gtrVlI7U5czk+p/31mjZOKmEwPFxcGMH0MsMV734PBlrHZy0OIqP/QsFg==
X-Received: by 2002:a25:e482:: with SMTP id
	b124-v6mr9332942ybh.127.1534248160411; 
	Tue, 14 Aug 2018 05:02:40 -0700 (PDT)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	x7-v6sm17735872ywd.43.2018.08.14.05.02.39
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 14 Aug 2018 05:02:39 -0700 (PDT)
Message-ID: <4a823df1ee3f4df8dd51ccd99f3a206b09f9434d.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 14 Aug 2018 13:02:37 +0100
In-Reply-To: <cc05a931-904e-b9f6-d56c-c4392da29ed8@skidata.com>
References: <20180813193251.4079-1-git@andred.net>
	<20180814104236.30076-1-git@andred.net>
	<cc05a931-904e-b9f6-d56c-c4392da29ed8@skidata.com>
X-Mailer: Evolution 3.28.2-1 
Mime-Version: 1.0
Subject: Re: [meta-java][PATCH v2] openjdk-8: gcc-8 fix #4: undefined behaviour (hotspot)
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
X-List-Received-Date: Tue, 14 Aug 2018 12:02:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2018-08-14 at 13:08 +0200, Richard Leitner wrote:
> Hi André,
> 
> this v2 isn't applying to the current master-next... could you please
> check?
> 
> 
> Applying: openjdk-8: gcc-8 fix #4: undefined behaviour (hotspot)
> .git/rebase-apply/patch:101: trailing whitespace.
>  
> .git/rebase-apply/patch:106: trailing whitespace.
>  
> .git/rebase-apply/patch:108: trailing whitespace.
> -- 
> .git/rebase-apply/patch:150: trailing whitespace.
>  
> .git/rebase-apply/patch:152: trailing whitespace.
> -- 
> error: patch failed: recipes-core/openjdk/openjdk-8-common.inc:216
> error: recipes-core/openjdk/openjdk-8-common.inc: patch does not apply
> Patch failed at 0001 openjdk-8: gcc-8 fix #4: undefined behaviour
> (hotspot)

OK. I'm still a bit dubious about just silencing the compiler rather than
fixing the warnings, given all the problems this has caused so far, so this
version #2 actually sits on top of d359ad5ad46c.

Cheers,
Andre'


