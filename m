Return-Path: <kergoth@gmail.com>
Received: from mail-lb0-f175.google.com (mail-lb0-f175.google.com
	[209.85.217.175])
	by mail.openembedded.org (Postfix) with ESMTP id 1F88765E16
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Apr 2014 14:54:28 +0000 (UTC)
Received: by mail-lb0-f175.google.com with SMTP id w7so8117880lbi.20
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Apr 2014 07:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=wucv1q22ib4PfjqeWzXwhwmsWegzUohB6nQ52pxPGv0=;
	b=HqKWiityA4Nl8NqbWweKNoC3+Ow9DrRxig9PlBxDqEdtZJT3jEjMem7s8Wa4Kzlzd7
	wIqlbCjlNg1l1hKhtI8dpwmX0ExQQdwjZSn43ILJSQ3zcQ2epvdQP2HeugAOXjxrk4vx
	Uhd6AsJJ6kjiaYPGPTpDyExOgYIJ/iAIFMUcv2u6u9OYZYHbmlC/hWRbXUJX00DamRHB
	nAotPT8iXw4+L3c21D/FqwzeYemCgHj/G1ZB+wJQVx6lwjGbAakUw5PBChrECIOiOb8a
	Tb3M+FS+V0nK/7tzvP7ndCfTL882p4e+pXR49BM33euFlMz1xCxXalovYomp6s6f18Mj
	w5MQ==
X-Received: by 10.112.147.36 with SMTP id th4mr3094517lbb.32.1397660068546;
	Wed, 16 Apr 2014 07:54:28 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.35.194 with HTTP; Wed, 16 Apr 2014 07:54:08 -0700 (PDT)
In-Reply-To: <FFAD474B-E640-4B12-9ABE-F6FBAF8ADFA4@dominion.thruhere.net>
References: <1397631065-13521-1-git-send-email-Chong.Lu@windriver.com>
	<lilan2$1cs$1@ger.gmane.org>
	<2550139.OruyIUflk8@peggleto-mobl5.ger.corp.intel.com>
	<FFAD474B-E640-4B12-9ABE-F6FBAF8ADFA4@dominion.thruhere.net>
From: Christopher Larson <chris_larson@mentor.com>
Date: Wed, 16 Apr 2014 07:54:08 -0700
X-Google-Sender-Auth: SRMDE7pwj79ZNzqsSMO2GC6Ej5A
Message-ID: <CABcZANn7doiigEU5UUHRpuUg+dpV9VXbhhRkZzs65OYWrKc4mA@mail.gmail.com>
To: Openembedded Discussion <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: Re: [PATCH] rrdtool: enable libwrap, perl and python bindings
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
X-List-Received-Date: Wed, 16 Apr 2014 14:54:30 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Apr 16, 2014 at 3:40 AM, Koen Kooi <koen@dominion.thruhere.net>wrote:

> Op 16 apr. 2014, om 12:02 heeft Paul Eggleton <
> paul.eggleton@linux.intel.com> het volgende geschreven:
>
> > On Wednesday 16 April 2014 09:15:47 Koen Kooi wrote:
> >> Chong Lu schreef op 16-04-14 08:51:
> >>> 1. default enable libwrap, perl and python bindings
> >>
> >> A number of big distros are moving away from tcpwrappers, Arch has
> removed
> >> it years ago and fedora looked into it a while ago. Since tcpwrappershasn't
> >> seen a release (or development) in years I think we should default it to
> >> off.
> >
> > Chris added a tcp-wrappers PACKAGECONFIG to a number of recipes about a
> year
> > ago; I wonder if we ought to promote it to a DISTRO_FEATURES item and if
> > appropriate just not enable that by default.
>
> I think that makes the most sense in this situation.
>

Agreed, I'd be all for that.

