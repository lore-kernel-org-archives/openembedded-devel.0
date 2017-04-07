Return-Path: <raj.khem@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 4170177E51
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Apr 2017 23:43:29 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id g19so22063593wrb.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 Apr 2017 16:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=oBX72L31xIZAOAPe59dNkdlKLa3Q4+Sk8X6cjNKm140=;
	b=ZUy2x/TEpI5yLVmg3np3Hi3hQLAvyk1PMqBMSwjT4LMW7qgwmjMaFYxsXzOivf1JUp
	0akuLm4yie11QbeJdpUtvbf0vZWAVWfIvSk1zvl2dE0dPwg9m/4Sl413yUNyN0TVZ0Gr
	xLUj1OSQsZX4NP0L3mQSIQG1y5RvvZ9wZQSGthdEW1ISsgIG5W0BxGk5I++9muRo/74p
	0i6/2oQ+7frnSMnkCmVdGjBtMJIerG78geluyBNczyhzAxyjELTFFFDcdQUO72olgZGZ
	zgwiDw3cGcXIi/e2ozB18IV5Y8eaNOvoJhHhSLY/x4Lc/tmQSdRYOLf1aNyJQx+zZgcK
	OFtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=oBX72L31xIZAOAPe59dNkdlKLa3Q4+Sk8X6cjNKm140=;
	b=Z4Rg3Yl04r6XsPInh+dCEZBk/XkqQu57/sV101JzHT+8PfrulrCtCH0+kcNJ8qjZG9
	hoeoxtfrYVKbqvD+sQeGMo2n6dpVxx1UnrCIj9tW/FoOsr+r8Eq7r3a8a7dy5XwRK/vm
	m0J+1bWfkVOWiiLYIf/DrcO3nt1qBMqUyrSvzxPcC9Oq2EpKFnU59W63qoYiiICfPs06
	1Fv27v438NKVqO30IcCxn1DSxwFMrY/bOXqYUfhNkD3/htTatHaEHWCKDMoTY2YNRfYw
	BHAdJM9BYQqnM226k8hbmqBY1zTge9x4Iszj+XIb4TmylXFs3RV8QZkBUfcVdWUh25AS
	hIeg==
X-Gm-Message-State: AFeK/H23RbWvDdCNrbQ9+oX1OTU52pPTCd5HzRE0PncdCqF0PzMO3uhS6KxcY0vttb/67OF7SMiTYP/MeL5qcw==
X-Received: by 10.223.128.194 with SMTP id 60mr29467645wrl.175.1491608611003; 
	Fri, 07 Apr 2017 16:43:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.180.162 with HTTP; Fri, 7 Apr 2017 16:43:00 -0700 (PDT)
In-Reply-To: <CAMKF1sqxFob2R_2HAYTi=zE2k+HzyiUW7P7CP72mFOmO1Cnuqg@mail.gmail.com>
References: <20170331164247.5052-1-raj.khem@gmail.com>
	<20170331164247.5052-13-raj.khem@gmail.com>
	<20170407174249.GC3022@jama>
	<CAMKF1sqxFob2R_2HAYTi=zE2k+HzyiUW7P7CP72mFOmO1Cnuqg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 7 Apr 2017 16:43:00 -0700
Message-ID: <CAMKF1srj1Fchi4-MShD_NpL6WpP7vz_C=oq16CEXdejiQxytuQ@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 13/43] poco: Upgrade to 1.7.8
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
X-List-Received-Date: Fri, 07 Apr 2017 23:43:30 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Apr 7, 2017 at 3:21 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Fri, Apr 7, 2017 at 10:42 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
>> WARNING: poco-1.7.8-r0 do_package: poco-1.7.8 was registered as shlib
>> provider for libCppUnit.so.1, changing it to poco-cppunit-1.7.8 because
>> it was built later
>
> actually poco should not build a shared object at all since that
> should come from cppunit recipe.

actually the library names are different. And move to make it part of
poco--cppunit is the right thing. What problems do you see ? package
upgrade ?

