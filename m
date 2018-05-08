Return-Path: <andrea.adami@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0096374E09
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 May 2018 21:24:04 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id a67so20981286wmf.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 May 2018 14:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=vrAOSAfF7jcji7X9K+6QUWNpObRSLref2s2Djc+xvkQ=;
	b=dJuGTS7YowPXcGnrEnd6BU9bV/88gjfbhOb9Dg1GCDFHx9x1hrdUAYPuyd1kB4sc6J
	KGj2YNBE9n8vvke5VFAd0QCaIhLnx9H4txxuV81TniNnO5FS/eEljrIalWGvQNULhyng
	VnKxibPwV4zyJ0dSipbJ1FZiWXabd4nIw6Vz/lIaiugvD9+vZqVyyz4JEAsalcRlI6Px
	SG3+erPS6idsbzAFkYWf1/BY4L/aliA58u58k9pOPmIVtSfJuJ8GPGQOQ1GAVsCMVe07
	HqiUUIoHY5JlZnwyhJEli/tJBCmuf6Fq0AvSvYX4oLtCurB+OLdmjIae189+7cjiNTOZ
	OimA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=vrAOSAfF7jcji7X9K+6QUWNpObRSLref2s2Djc+xvkQ=;
	b=K2gJJP9v3txmZpCirsPw97hXRU41OlvAzC3ORK0tVzmEtrw7mzWXL6X/JakKn8S14O
	iHwUBqw+IY0BSEi/SEISOyjrwJrzA3ZTnH6PfTv/YKs6vmYA6O6FKryqlV7e6M6swc7d
	yBzlmqUJ2nnHZlWCHIALpQiazHm2tfIS3AvPCvKjHAmhjn4dFfxlMhXVe1ETW+ogPPtx
	svAANfWV56TA34cAYCjD58lXfgwK9O7qYRIHc+fWqEhrWTG0V/DtP839ulIi9UdBZDwg
	NmmrtR+yrPU3HCGWnlvxW/cK3FZXt3flpk6Jekv1WnvAjGYRKEnOl4wCWaO3/dU4y0Xv
	kG4g==
X-Gm-Message-State: ALQs6tCTjZ5mQbTZEonZ18RlHmVLYxYAOHwLroR9Ly5UInr6KhN0jWeG
	FIf15UWOLrDVfiwfD90CuppzT+l0Q20+5ztQcwA=
X-Google-Smtp-Source: AB8JxZpyNlAt+K7IqCbZ6nTEGyoN+qRc2RtV2Bi3LLwWcPS6hpLOYMg/68YWmOE9zJkGKn74Q3YbF4cQRB1GIVBaD88=
X-Received: by 2002:a50:a1a5:: with SMTP id
	34-v6mr58010906edk.273.1525814645442; 
	Tue, 08 May 2018 14:24:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.157.72 with HTTP; Tue, 8 May 2018 14:24:05 -0700 (PDT)
In-Reply-To: <1525475357-8521-1-git-send-email-armccurdy@gmail.com>
References: <1525475357-8521-1-git-send-email-armccurdy@gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
Date: Tue, 8 May 2018 23:24:05 +0200
Message-ID: <CAAQYJAsPMCY8q3yJq9uPwRgT+b3Feop8E8xXtV955j9RZqm96g@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] openobex: explicitly set ASNEEDED from openobex recipe
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
X-List-Received-Date: Tue, 08 May 2018 21:24:05 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, May 5, 2018 at 1:09 AM, Andre McCurdy <armccurdy@gmail.com> wrote:
> Up to now, an openobex specific over-ride for ASNEEDED has been
> provided by oe-core (from as-needed.inc). If ASNEEDED does need to be
> over-ridden in order to build openobex it's not ideal that the
> over-ride comes from a different layer so define it directly in the
> meta-oe recipe.
>
Hi,

don't we have a special include for this purpose?
 /meta/conf/distro/include/as-needed.inc
What want we do? ASNEEDED in the recipe or include the as_needed.inc?

For me, patch is ok, all in the recipe (there are just few cases).

Cheers
Andrea

> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ---
>  meta-oe/recipes-connectivity/obex/openobex_1.7.2.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta-oe/recipes-connectivity/obex/openobex_1.7.2.bb b/meta-oe/recipes-connectivity/obex/openobex_1.7.2.bb
> index 2db48f3..1b56685 100644
> --- a/meta-oe/recipes-connectivity/obex/openobex_1.7.2.bb
> +++ b/meta-oe/recipes-connectivity/obex/openobex_1.7.2.bb
> @@ -25,6 +25,8 @@ EXTRA_OECMAKE += "-DBUILD_DOCUMENTATION=OFF"
>
>  #--enable-apps --enable-syslog
>
> +ASNEEDED = ""
> +
>  do_install_append () {
>      rmdir ${D}${bindir}
>  }
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

