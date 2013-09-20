Return-Path: <eu@felipetonello.com>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id 5E2656BEA6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Sep 2013 00:26:51 +0000 (UTC)
Received: by mail-wi0-f174.google.com with SMTP id hj3so8743061wib.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Sep 2013 17:26:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=3mnUyszz6IYiX7ikWX1er+Z+Pv3tIGKRttj7eY5VdTc=;
	b=ATTKzrvfm/27u3jnBz7jwB2blcPsAckWI//6Wh6cIL/+zFjLvsHiFp0DN2bcy1hTp4
	wtmmjDRoP5HiuR+CReauhhdta1jLOd9eMZuVbLXqVkoK1w/pSw69b0sRoA8RbOqq7rxY
	3B5CK0Tt3SWnEhE7dTSNwZ/H15WSRku6Z3aIbWaFkbELzmxJxBbAvFofvKilG+AZntNT
	OdvHZ2wHlILnohMlrO86/NWBRRDVydp6SgV8bLfwGt8mnsCDE52mJnI9ocFeKgpEoSqW
	fgtVFsrqE8flzwbpUDoV9vyhzDdO+k+MEjVWWaBHLoAU59CwwYV1AATg2Bkjeyha9jDX
	y0Tw==
X-Gm-Message-State: ALoCoQlsf9I2YDm1LOcQR8YQQ8DthwFk74vXEwEV9aWBvn8iI4/vImMVZCAPHZ3UG965gtSxSv4d
MIME-Version: 1.0
X-Received: by 10.180.100.202 with SMTP id fa10mr567857wib.8.1379636812767;
	Thu, 19 Sep 2013 17:26:52 -0700 (PDT)
Received: by 10.194.20.195 with HTTP; Thu, 19 Sep 2013 17:26:52 -0700 (PDT)
In-Reply-To: <1379617754-6342-3-git-send-email-eu@felipetonello.com>
References: <1379617754-6342-1-git-send-email-eu@felipetonello.com>
	<1379617754-6342-3-git-send-email-eu@felipetonello.com>
Date: Thu, 19 Sep 2013 17:26:52 -0700
Message-ID: <CAGrhNMz51bGuRHJ5bCZ=0ECoUmxQok9uri9YhdMr1oJxLzu5LQ@mail.gmail.com>
From: Felipe Tonello <eu@felipetonello.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 2/2] gypsy: Added init script
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
X-List-Received-Date: Fri, 20 Sep 2013 00:26:52 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Sep 19, 2013 at 12:09 PM, Felipe F. Tonello
<eu@felipetonello.com> wrote:
> From: "Felipe F. Tonello" <eu@felipetonello.com>
>
> Added a modified version of the example init script, gypsy-example-initscript,
> from the gypsy repository to be compatible with OE based distros.
>

Actually I just realized that the daemon is called by dbus when
clients connect to it. So I believe this patch is not necessary,
unless we separate in a different package.

Felipe Tonello

