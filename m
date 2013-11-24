Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-oa0-f44.google.com (mail-oa0-f44.google.com
	[209.85.219.44])
	by mail.openembedded.org (Postfix) with ESMTP id 681306D977
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Nov 2013 14:33:04 +0000 (UTC)
Received: by mail-oa0-f44.google.com with SMTP id m1so3332982oag.17
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Nov 2013 06:33:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=aRWr8zGRskQKH2GD2FrT3ZOnkKvbG2kV7oyaWwPRzxA=;
	b=HKftI1iCH4sUi9xtZfEemVJoC+dUXJ9DYuyz/KbK7K3Qs3DuLRpDfor0A6Xcmmc0k1
	9x7qD9G0RIsK90967BeHMxSXnq+bTOaBKkoTu28YQ7Lj0hyfLsKlYwN5M9KGB1Zhki17
	LfWQzlmygyqP6h48VvTD4tJz+wuuycjidL6utmu6FC7UdGaaHzsRUqz5/FrJjTl65ZoT
	dvunvh3hle59JfvYsZ/t9kA2AZv8V8wJ7I0ZDjzdvl/KQbLI/mFg+Wlm5U87EcF8QVrl
	aUCm6QE1BWkxGs/21YGUsaHfg9bHyY7AwNebfsMzz+wTDI91WxqREmk8j0342TE5bJpQ
	r+Qg==
X-Gm-Message-State: ALoCoQlxSw8VtdUYs0gZAyrbZ321WbLo0ZD4x27pPhGfw9lbKWtmoYydAYUK3MYSvYRZjidVjTua
X-Received: by 10.60.44.193 with SMTP id g1mr705838oem.47.1385303583479; Sun,
	24 Nov 2013 06:33:03 -0800 (PST)
MIME-Version: 1.0
Received: by 10.76.0.50 with HTTP; Sun, 24 Nov 2013 06:32:43 -0800 (PST)
In-Reply-To: <alpine.DEB.2.02.1311240834020.2268@oneiric>
References: <alpine.DEB.2.02.1311240834020.2268@oneiric>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Sun, 24 Nov 2013 15:32:43 +0100
Message-ID: <CAP71Wjyf+B_TSTkVRNG7srBxty6fXPNSK7y789EONTHq3rcQAQ@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: missing leading space for EXTRA_OECONF_append?
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
X-List-Received-Date: Sun, 24 Nov 2013 14:33:05 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sun, Nov 24, 2013 at 2:35 PM, Robert P. J. Day <rpjday@crashcourse.ca>wrote:

>   is this correct?
>
> meta/recipes-devtools/gdb/gdb-cross-canadian.inc:EXTRA_OECONF_append =
> "--with-python=${WORKDIR}/python"
>
> does there not need to be a leading space in that string?
>

indeed, you're right.

a quick 'dummy' grep in my layers show there is another instance (at
least... there can be more not caught by my regexp)

$ repo grep '_append.*= *\"--'
meta-openembedded/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb:EXTRA_OECONF_append_armv7a
= "--cpu=cortex-a8"
openembedded-core/meta/recipes-devtools/gdb/gdb-cross-canadian.inc:EXTRA_OECONF_append
= "--with-python=${WORKDIR}/python"

