Return-Path: <eduardo@monkey.io>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id 884C46AC69
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Jul 2014 18:19:29 +0000 (UTC)
Received: by mail-wi0-f174.google.com with SMTP id d1so1305340wiv.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Jul 2014 11:19:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=Fxeb81OLR8w9IwEJagg+JykxWWeMHLB3h3vB3cXTbFc=;
	b=akO84ytEki+jIAXbeu828YmrXx/JF6P5D5bo/6m7TMGN27e7SA++OPpyvIx4w2pSJp
	/5l+3PEbyh99vwa8/LmBN56R2WJPyDnzOFy1KTdGVjrSUeJinckoVDJbzkp88pywyTZm
	X99W6IbLHidgnaO7eNbrkYW9N1Gq18I4ruSxtA+3QyhHxKHXrgxJdY8Hsd7CKv8+DXVN
	ztsu4GmZ02vJ9qCHwkvikJ26fKyyI5K9ZKPXw36/lStuweJ2OJSvzu3EHT19D5ACJ9Y3
	u2LsJ2o+4o9vuZGlGPle4fS28qbOecv+95xQIVwQVkT0eRtWhPXrzu4fLoYYm4FpSFxR
	rsdg==
X-Gm-Message-State: ALoCoQk2OU1YVSYioCXo53ztEynyfXyvzfCkbwY4EA6r4VDJiBtdVblKZkd9UC4hCUhlUd4sfiAB
MIME-Version: 1.0
X-Received: by 10.194.133.1 with SMTP id oy1mr9289955wjb.87.1405707569283;
	Fri, 18 Jul 2014 11:19:29 -0700 (PDT)
Received: by 10.194.88.135 with HTTP; Fri, 18 Jul 2014 11:19:29 -0700 (PDT)
In-Reply-To: <20140718181535.GQ2433@jama>
References: <1405147077-22498-1-git-send-email-eduardo@monkey.io>
	<20140718181535.GQ2433@jama>
Date: Fri, 18 Jul 2014 12:19:29 -0600
Message-ID: <CAEaCVQj60r8pmT4RwLWZ3RO5NvkKzbQPHbkdhOqhoX3zbO2mRw@mail.gmail.com>
From: Eduardo Silva <eduardo@monkey.io>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-webserver][PATCHv4] monkey: new v1.5.1 release.
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
X-List-Received-Date: Fri, 18 Jul 2014 18:19:32 -0000
Content-Type: text/plain; charset=UTF-8

>
> Now it failed with:
>
> | NOTE: Not creating empty archive for monkey-locale-1.5.1-r0.2
> | *** Error: CONTROL/conffiles mentions conffile /etc/monkey/ which does
> not exist
> |
> | opkg-build: Please fix the above errors and try again.
>
> I guess it's because sysvinit script was removed by update-rc.d.bbclass and
> then nothing was left in /etc/monkey
>
>
thanks for the report. Which specific build options did you use (and image)
?, i would like to be able to reproduce that problem locally, not sure why
my tests passed.

best


-- 
Eduardo Silva
Monkey Software

