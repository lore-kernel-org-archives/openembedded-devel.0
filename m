Return-Path: <trevor.woerner@linaro.org>
Received: from mail-ee0-f47.google.com (mail-ee0-f47.google.com [74.125.83.47])
	by mail.openembedded.org (Postfix) with ESMTP id 386FF61626
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Sep 2013 00:52:56 +0000 (UTC)
Received: by mail-ee0-f47.google.com with SMTP id d49so2079000eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Sep 2013 17:52:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=9o+z15hUJmwFj7b3aphYwHFno0wP9Ucp/bwW5k1HGkg=;
	b=e2RmQMX8YfBuKavJEejkctl2l+KpnWDImWSqnrbGkKFSoHShx+kVLmkFiLcVDrPydA
	mc0If6ZPTdvkecpZ1K84vevULA7lldz5BdEiK3DL2lR7WTIC2dDFzy6l8EXIWX/Yk/Ib
	vObu+QFJBu0n1WoLN5Up3RS8X+uE4e5RorjlpnpB2282ugiUiwqchclpEeoQuZyTH2lO
	cX1f85LKRhuIUDhYzIG+9GIAM8C+H24aJKdBD0A9A/pmJXZ+RaNa54xscrklsab3CyJI
	opGxGOecCZQ0in7fm1oOd6/1hNbJ9s4pK1+gi6fvfrka2FrzTUSX7csa6+zOOPiOUv+q
	iC4Q==
X-Gm-Message-State: ALoCoQkorkadkv3Q2EqRln7TsdUR32V21x5tLBEbcKsl9uvRXZ5yNpz4maSQTgKkGlBE+ukoVf81
MIME-Version: 1.0
X-Received: by 10.14.214.136 with SMTP id c8mr41070222eep.6.1379983977172;
	Mon, 23 Sep 2013 17:52:57 -0700 (PDT)
Received: by 10.14.117.67 with HTTP; Mon, 23 Sep 2013 17:52:57 -0700 (PDT)
In-Reply-To: <CALmOhg=kyH63jn+pi=apo+frUwH8pTneHss+Z7MnMMJiLR+NUg@mail.gmail.com>
References: <1379910576-24363-1-git-send-email-trevor.woerner@linaro.org>
	<20130923080651.GB3631@jama>
	<CALmOhgkonsraDVY6TUeE77XscRisOmJkQhw0i3Ymk_aA3pBFbA@mail.gmail.com>
	<CALmOhg=kyH63jn+pi=apo+frUwH8pTneHss+Z7MnMMJiLR+NUg@mail.gmail.com>
Date: Mon, 23 Sep 2013 20:52:57 -0400
Message-ID: <CALmOhg=jo-cuRJnEBz4BqvnjoPod9iASnA7_sbom_kturoePfg@mail.gmail.com>
From: Trevor Woerner <trevor.woerner@linaro.org>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-qt5][dylan][PATCH] qtwebkit 5.0.2: fix QA issue (bad RPATH)
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
X-List-Received-Date: Tue, 24 Sep 2013 00:52:57 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 23 September 2013 18:04, Trevor Woerner <trevor.woerner@linaro.org> wrote:
> Sadly now that I have enabled ICU in qtbase, my build of qtwebkit on
> meta-qt5 master branch is failing. I'll have to look into it some
> more. Is anyone else seeing this?


It must have been an sstate or tmp issue. A fresh build with
completely new sstate and tmp compiles fine and only produces the QA
error as with the dylan branch.

Patch to follow.

