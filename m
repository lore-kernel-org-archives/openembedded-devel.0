Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1QRvwO-0004JD-DC
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Jun 2011 02:39:12 +0200
Received: by bwz5 with SMTP id 5so627024bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Jun 2011 17:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:from
	:date:x-google-sender-auth:message-id:subject:to:content-type;
	bh=1DrwMpXsIiJ6lap47unGSu+wEpEyyqGi3pnGUDnWyNQ=;
	b=aovRYREW41HK00bK4mv8my03nghDiM9cSRyQ9LLyVj1A+PM5Ih/NlTK8LFjv+f4d7b
	pK8x9eTYjv5v/0h9Q4VjPQFIv20/g/nzjTo+eeGhJwI+D3XuZFRY3A+kMFZwAl3HsvHn
	zXqPYyEKPP7G5lWVmt/i2RM3eA50kn8S0Dceg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=V3uwGr0q9nw2nUsB53aW048bPUyBDGT8Au2T9UYAMC1V5Gy6fxatYWjrGGLXtCBFfR
	jF/5/P9y/eoTZCepw9xFUt4+8MZkYwlH1Vdyw24ngjba9fO6U+r2E60fgRy30qeaChCY
	wB0OHqHYYVgte6uHGcyyS9GTJnw7FHuiZ7dIY=
Received: by 10.204.19.18 with SMTP id y18mr90826bka.179.1306974937115; Wed,
	01 Jun 2011 17:35:37 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.204.38.7 with HTTP; Wed, 1 Jun 2011 17:35:17 -0700 (PDT)
In-Reply-To: <4DE6D95E.5080205@mentor.com>
References: <1306782450.4106.481.camel@mattotaupa>
	<4DE6D95E.5080205@mentor.com>
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 1 Jun 2011 17:35:17 -0700
X-Google-Sender-Auth: jGvNvNZdYYkan53nEs6Fu1V0CZ8
Message-ID: <BANLkTi=m9O5AJv+FWsJmn+FrCQh55dUgpg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: base.bbclass: Why is `oe_runmake install` not the default for `do_install()`?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 02 Jun 2011 00:39:12 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jun 1, 2011 at 5:29 PM, Tom Rini <tom_rini@mentor.com> wrote:
> There's not a common enough way to make sure it tries to write to ${D}
> when we don't know what the build system is, other than someones Makefile.

Yeah, like Tom says -- with autoconf, we know we can use DESTDIR, but
there's no standard mechanism for custom make-based buildsystems, and
some don't have such a variable at all (until we patch them in).
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


