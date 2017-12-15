Return-Path: <asselsm@gmail.com>
Received: from mail-yb0-f195.google.com (mail-yb0-f195.google.com
	[209.85.213.195])
	by mail.openembedded.org (Postfix) with ESMTP id 541627882D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Dec 2017 20:31:36 +0000 (UTC)
Received: by mail-yb0-f195.google.com with SMTP id b15so3389845ybn.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Dec 2017 12:31:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:reply-to:sender:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=HlbokxStSAbP0KYyNCFJ1OavK3MeSA+1+KfYjsKa+Rw=;
	b=A6mKqmuPv+gWAo1lGU/29iq24hKQ3yRC2963/qCxR4NDeI9c/bx3/9iU07At5WoPLn
	Z6yKC8QFFsDM3KPm/+9/NPbgk6T/kCwByEtvwZxqqWnvdyNC+HZzxpakqr572rSTajbM
	TDnFirCppyJediqLESRq4Zhd9+vcTPg2TECLpWn17DbXMZguJnNxeNApksG97pMsgCSX
	Y1NWWNruDeXuNI7yhH7DnA4mG1bUPNND1iZBLE0nxqBiTfo9gXuC0jTQ+k1oiL/nighk
	J4itglC5Rp/gDMT0L0GznQmKHqBY5v71wRG7CvrciYoDWX8KkHRA1txai9OxL00EFJ1U
	NKyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:reply-to:sender:in-reply-to
	:references:from:date:message-id:subject:to;
	bh=HlbokxStSAbP0KYyNCFJ1OavK3MeSA+1+KfYjsKa+Rw=;
	b=J398GsL9jTIbLsYwyAhRF/nr7nKxa/Vx4MYEnZmzAYzjx+sRqzB9db6YvdrgKxE4Zw
	JR5Q4sxJUsFNeVKivxQLu0FtNzpYNCs+0GpSJYqB9koXIUhykjVkH/aobtgjPxn198/V
	YOyBuooP3rjxIxuhn4n/ptAC+1S5ekgcWdelUbZIibSIU8M9ATxZximUnR98bAgZOdfL
	IQM/huXKsDi2Qq9YsiyiPeuYGHDzlKDz9sMPJDeeVfGvlN67Jm0Fdy5yZMzsFDri7viL
	nIxM5oHTUzAXspBuHm5m9nt2GX4cV+SkBLWs0qCQZvQOcZrYtoA0pTEhnudj3YKXxIF1
	qzFg==
X-Gm-Message-State: AKGB3mJWPXw8G1K1CMSfd8W8egicaabuU4s3UjfcaKLwxIxwBLjDBtch
	VoHXWRC2BtxtKo3hL3cxRFdJALRL0AxwQCnXAf7NZQ==
X-Google-Smtp-Source: ACJfBotTCfSeMhwkCMJ/79i05g2/B9NfsVlBkjeaJyw3XZGaB/X0vklFBz/z5v66PA5nvYxwfIRKehjOOj699bVuhnk=
X-Received: by 10.13.236.203 with SMTP id v194mr7649154ywe.339.1513369898017; 
	Fri, 15 Dec 2017 12:31:38 -0800 (PST)
MIME-Version: 1.0
Reply-To: mark.asselstine@windriver.com
Sender: asselsm@gmail.com
Received: by 10.37.56.83 with HTTP; Fri, 15 Dec 2017 12:31:37 -0800 (PST)
In-Reply-To: <1513369321-18274-1-git-send-email-mark.asselstine@windriver.com>
References: <1513369321-18274-1-git-send-email-mark.asselstine@windriver.com>
From: Mark Asselstine <mark.asselstine@windriver.com>
Date: Fri, 15 Dec 2017 15:31:37 -0500
X-Google-Sender-Auth: b03csaEJ2hV8hGHdmHVnhL02z34
Message-ID: <CAPuovEJxuOSAOFRDHb9WvgYbvy9MRO7GsHy0mTp2dRdSaZBFAQ@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][v2][rocko][PATCH 1/8] python-twisted: restore RDEPENDS on -news for py2
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
X-List-Received-Date: Fri, 15 Dec 2017 20:31:37 -0000
Content-Type: text/plain; charset="UTF-8"

Sorry, this should be 0/8. And apologies for anyone viewing these on
gmail, it seems to have merged things with my V1 series. Patches 1 and
2 from the V1 are the same here if you are trying to decipher the
gmail mess.

Mark

On Fri, Dec 15, 2017 at 3:21 PM, Mark Asselstine
<mark.asselstine@windriver.com> wrote:
>
> V1 of this series was incomplete. Thus following up with a V2 which
> includes additional cherry-picks from master. Cherry-pick commit IDs
> are listed in the temporary comment section of the individual commits.
>
> When building images using rocko that include python-twisted you will
> get an error:
> nothing provides python3-twisted-news needed by python3-twisted-17.9.0-r0.corei7_64
>
> Basically upstream marked the -news plugin as unavailable in py3 (See
> src/twisted/python/_setup.py -- notPortedModules). This leaves the
> -news package empty, thus no RPM or similar is built and the
> dependency can't be satisfied. Backporting patches 1,3-8 fix this
> issue. Patch 1 is the main fix but also introduces missing
> dependencies, which are added in patches 3-8. However, the -news
> package is still available in py2 thus patch 2 re-adds this to the
> RDEPENDS of ${PN} (the super package which can be used if you don't
> want to select individual component packages).
>
> Patch 2 should also be applied to master.
>
> Mark
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

