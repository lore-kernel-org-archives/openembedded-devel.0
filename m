Return-Path: <anders@chargestorm.se>
Received: from mail-wi0-f199.google.com (mail-wi0-f199.google.com
	[209.85.212.199])
	by mail.openembedded.org (Postfix) with ESMTP id C4520605B3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Feb 2015 21:39:18 +0000 (UTC)
Received: by mail-wi0-f199.google.com with SMTP id bs8so5451789wib.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Feb 2015 13:39:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=vVhVEBGMep7Ak5leN8LFAuBXXFYdkCjo7XewF/HHrHY=;
	b=kb3B8rhw5Ok3Bwy88KjkHcjlsIr9+w/NeGI+xdvuGAmifVdrlSl1diWB7NjtI2j4bA
	yOeQ3Fhe3LjiFhUSGZFqgw8fwC5wTrq5KQt4mAuJLOKtx9tsudekMC3LQsAMxnc/AI5m
	+ZLC0AzsXVyHK8l/wOYQ2l7T9wm0GisMtvQQ49PjGwkifzDzRxRyvcewzOuHauImpOr+
	CSOno6uYDFEUVemrggusAka64teV4f5+bFJ37bo+RWjp86Rx8Mgfz1kxT5i0blxvoxDh
	V489GiIgbr1IizyHZGr356GQcjEXj2Twe5UWeJcAywO5j9B4KdzD6V9e9z7oTwuhHgsw
	yarg==
X-Gm-Message-State: ALoCoQkOs8DM4CuE7sOQLfCQI5LTdDdb7dP2dqJWK5NRhe28Zs84BA//lEpYpRy6jwkYIpbH6t8v
MIME-Version: 1.0
X-Received: by 10.152.5.6 with SMTP id o6mr4764317lao.59.1424900359098; Wed,
	25 Feb 2015 13:39:19 -0800 (PST)
Received: by 10.25.148.2 with HTTP; Wed, 25 Feb 2015 13:39:18 -0800 (PST)
Received: by 10.25.148.2 with HTTP; Wed, 25 Feb 2015 13:39:18 -0800 (PST)
In-Reply-To: <1424783606-8936-1-git-send-email-daniel.markus@leica-geosystems.com>
References: <1424783606-8936-1-git-send-email-daniel.markus@leica-geosystems.com>
Date: Wed, 25 Feb 2015 22:39:18 +0100
Message-ID: <CADt1enOOO21Vnz5qNk_WGjTKiY8OT7gdzNSUBK-1CErijEoxBg@mail.gmail.com>
From: Anders Darander <anders@chargestorm.se>
To: OpenEmbedded -- Devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH] socorro-syms: Add Breakpad symbol generation adapted for Socorro
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
X-List-Received-Date: Wed, 25 Feb 2015 21:39:22 -0000
Content-Type: text/plain; charset=UTF-8

Just a small nitpick or comment.

On 24 Feb 2015 14:25, "Daniel Markus" <daniel.markus@leica-geosystems.com>
wrote:
.
> +#
> +# Use example:
> +#
> +# inherit breakpad
> +# inherit socorro-syms
> +# BREAKPAD_BIN = "YourBinary"
> +#
> +
> +# We depend on Breakpad creating the original symbol file.
> +DEPENDS += "breakpad"

Is this necessary? If the recipe using this class files your instructions
and inherits breakpad, this is already added to DEPENDS. And of the recipe
doesn't inherit breakpad, it won't work anyway...

Maybe you should have your class inherit breakpad directly, and only
instruct the recipe author top add BREAKPAD_BIN to the recipes using this
class?

Cheers,
Anders

