Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f181.google.com (mail-ig0-f181.google.com
	[209.85.213.181])
	by mail.openembedded.org (Postfix) with ESMTP id 2D4FB62252
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Apr 2014 08:02:55 +0000 (UTC)
Received: by mail-ig0-f181.google.com with SMTP id h18so750013igc.14
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Apr 2014 01:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=RrOUQkwZvjrQ5qmB4tT+p7INRaU9oS2x/NAi+LFnM74=;
	b=PhdwjArdEb7j3KQofPoTAoJQafbYyBMJx3TbmaVh+fraA4QZBoq4nhugUeRZRRTiP4
	bAmgALD6gWV38Dy4ZPoOSK4thpkWdMJ7NBc+yr7tJSTzhFl/nRUTfreBeTFJfXJUI+6+
	xCmw5ZuuDxG7G76aVtE0MuXOJIH6lmF7D2K9koiRBePNte9SfufE6bS2AMLYZXPh9JCj
	kwwGxIjEonFGNnswracxF/bhfOA14gcH3NJgULO1XGg2Sw1zzvU1tP6zqp/y4jw8cO1N
	kIezn7JL/UIdA7oRAAShJPVp6kxqXwF1KzbMpB+o6ntp5jqNHEmkeoh+DSfjErI409+u
	Ybvg==
X-Received: by 10.50.143.76 with SMTP id sc12mr3143352igb.2.1397635376541;
	Wed, 16 Apr 2014 01:02:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.229.14 with HTTP; Wed, 16 Apr 2014 01:02:26 -0700 (PDT)
In-Reply-To: <00d101cf5942$91feeb30$b5fcc190$@lge.com>
References: <00d101cf5942$91feeb30$b5fcc190$@lge.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 16 Apr 2014 01:02:26 -0700
Message-ID: <CAMKF1srO8NBNuYbMhbwUO3df8+Q3aDoUmzHUinDy9V_WKuBsRA@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: How can I get the toolchain?
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
X-List-Received-Date: Wed, 16 Apr 2014 08:02:56 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Apr 16, 2014 at 12:07 AM, Changhyeok Bae <changhyeok.bae@lge.com> wrote:
> Hi,
>
> How can I extract the toolchain in my oe build result?
>

bitbake -cpopulate_sdk <yourimage>
should generate a self-installer .sh script which then you can run and
install it

> Regards,
> Changhyeok
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

