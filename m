Return-Path: <eduardo@monkey.io>
Received: from mail-wg0-f50.google.com (mail-wg0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 9B2316FC5F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Jun 2014 23:43:01 +0000 (UTC)
Received: by mail-wg0-f50.google.com with SMTP id x13so1561699wgg.9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Jun 2014 16:43:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=0QYf1HlFnx+x6MnH8IIL3a0kibqcTYN5fBYrdPf2OEg=;
	b=fOOZiMCP85aARGKWhFHoE0eP3B1Sveq//Z6VRpHxfCpes40BC2PzPQkkHItKy4w9Ee
	rkTsymu0OKPpYyLgtVik5xlJrGR7pj95POJV6z9qf0Jkud/4aaMAtKtMiE5LNCQGchvt
	0ngan711Br6zoKHLf96kCcYEd+vv46sMFrSXt/Mgq02t1zzk89S+i+BaAOZrbzRlaaKt
	tfvSIvsJ5nJAgmTLfFrVRvD/yWIkGrofiQfpWzouhtd/32POXicCKjsk7blpbHvPddXb
	LZEwx2tbsYx4LclhL9pS/p4l2QsZQ7mbbhwRWeA9HLvsN87jfLCYz5X2Tv2wv80zx4O1
	M4AQ==
X-Gm-Message-State: ALoCoQmyoMPbMK3I/wnECaCj7vy49hTocYlmxgG9rlhRD3ymg2AGzrm95RYUppRIv3PtS2hob36S
MIME-Version: 1.0
X-Received: by 10.180.86.4 with SMTP id l4mr1237474wiz.61.1403134981917; Wed,
	18 Jun 2014 16:43:01 -0700 (PDT)
Received: by 10.194.88.135 with HTTP; Wed, 18 Jun 2014 16:43:01 -0700 (PDT)
X-Originating-IP: [186.32.221.184]
In-Reply-To: <6717041.FlKhvNlNB6@peggleto-mobl5.ger.corp.intel.com>
References: <1403042333-15020-1-git-send-email-eduardo@monkey.io>
	<20140618081256.GH2117@jama>
	<7089991.I2xES8Z8LK@peggleto-mobl5.ger.corp.intel.com>
	<6717041.FlKhvNlNB6@peggleto-mobl5.ger.corp.intel.com>
Date: Wed, 18 Jun 2014 17:43:01 -0600
Message-ID: <CAEaCVQie4xgLA168qrAf4=HxY7rpCneLfoZBvYsBih1TqRNDhw@mail.gmail.com>
From: Eduardo Silva <eduardo@monkey.io>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] monkey: new v1.5.1 release (v2).
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
X-List-Received-Date: Wed, 18 Jun 2014 23:43:14 -0000
Content-Type: text/plain; charset=UTF-8

hi everybody,

> I suspect it corresponds with the layer that Eduardo is maintaining on
> > github. For meta-webserver I'm not too concerned if these sorts of things
> > are in the commit message if it helps for future reference, so I'm happy
> > for it to stay.
>
> Actually, I just tested this it seems clear that this recipe has not
> actually
> been build-tested - the issue pointed out earlier with the errant space in
> EXTRA_OECONF (between "--datadir=" and "${localstatedir}/www/monkey/" is
> still
> present, so do_configure fails immediately.
>
> Eduardo could you please fix this as part of this upgrade, test it and
> send a
> v3?
>

my apologizes for the problem and noise, i have submitted PATCHv4 with the
proper fix,

best regards,

