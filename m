Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f44.google.com (mail-qg0-f44.google.com
	[209.85.192.44])
	by mail.openembedded.org (Postfix) with ESMTP id 8DE4160017
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Jun 2015 19:10:39 +0000 (UTC)
Received: by qget71 with SMTP id t71so8646771qge.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Jun 2015 12:10:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=sqPjs2T+8E2zfeMTLb9EQpGCNmWJtSbNex1LYTibHxE=;
	b=fGcRCrR8DR7L1xwPg5QAKXVMmTpK3XQ5LlNd3FX/FDDiA71tE+L+BouGlZt58sTzPc
	mZx+i8flXjfg8lPwFOxopG/VbDFLdXUjbJvmai9OA91wlj+Nb55QTtbrVk+pAYAIQ+ID
	Sd99AiKSwh8CEclX4l4LL1oO03C1wajDleJkq1cB+KLNGcFLh6xe1YckMNPH9jcn4b0D
	NJi7lKoX4mKjm6n4k0nzTLOAW+WW6UwLUonovLkMJjmv+xnD+bWEo9gX9+BIhmb0qpeu
	NRlrwUCKor9M1U/35NIkncaza0VQyglpSAZROutRGWisXq9EPXCjvR/Zlb6GWSKgsmgN
	iKPQ==
X-Gm-Message-State: ALoCoQnl8OaACkHm7Brp6fhLXf6/LauW1qL60qrB4jpbhYAJ1fjfvYNbZVOlsM7541vRhS80IXNR
X-Received: by 10.55.23.149 with SMTP id 21mr47111978qkx.67.1435691440023;
	Tue, 30 Jun 2015 12:10:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Tue, 30 Jun 2015 12:10:20 -0700 (PDT)
In-Reply-To: <5592B9E5.5000402@mlbassoc.com>
References: <5592B122.4020208@mlbassoc.com>
	<CAJTo0LamNSDWoNX8YZ7ytqUcMd=yP4Dx=smkfcBU9jf3hnUGpA@mail.gmail.com>
	<5592B9E5.5000402@mlbassoc.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 30 Jun 2015 20:10:20 +0100
Message-ID: <CAJTo0LYWCvG9oog=GwVMjqEB2RM_zAT_Vr8zO2tX=9WeKbdPXQ@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-browser] New chromium warnings
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
X-List-Received-Date: Tue, 30 Jun 2015 19:10:39 -0000
Content-Type: text/plain; charset=UTF-8

On 30 June 2015 at 16:46, Gary Thomas <gary@mlbassoc.com> wrote:

> They are coming from
> meta-fsl-arm/browser-layer/recipes-browser/chromium/chromium-imx.inc
> and my local.conf.  The chromium recipe checks the PACKAGECONFIG variable
> for these settings, but is not using PACKAGECONFIG the normal way.  It's
> just the warnings that are new.
>
> I suspect the chromium recipe(s) need to be rewritten to play nice
> with PACKAGECONFIG...
>

I'm pleased we've got the warning, but recipes that are using a
PACKAGECONFIG variable to configure stuff but then not actually using the
PACKAGECONFIG machinery now need to add stub definitions for each of the
flags they're using:

PACKAGECONFIG[use-gl] = ""
etc

Ross

