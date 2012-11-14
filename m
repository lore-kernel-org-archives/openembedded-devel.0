Received: from mail-vb0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1TYjvD-0004g2-14
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Nov 2012 21:50:55 +0100
Received: by mail-vb0-f47.google.com with SMTP id ez10so889567vbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Nov 2012 12:36:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:from:date
	:message-id:subject:to:content-type:x-gm-message-state;
	bh=bopRh6fKyTf7jT1FnAbDXiEtg8FI2b/1gR8UXN9Q+nY=;
	b=IP54z//howWmibDsSqLVEbpLcrTM8cWFSmNYIrJdISHRybJU/8jQW0Y04OGO4QF8Rw
	o1/X8UZa8pLMo0fRF12/kSxfVVtQB1lXZrbQHdvXyw9EXG6V6FTnEKFYzeGjJoYf4l7J
	PUDEfCK/gV/zBxFYH9vKjqlJhC9SLlq8VA7QnkgUwRsnkSuodhCTFQSzOeTeestfWt/C
	pNirl3PMAFSH89SzNexS5ZM0gNzSxvSaTJ0exyDLY7ygcTy5CnqftWlCW35sdI9mzJvB
	wclt/TS8DaIHwmrXPt7rWBur6LXzilKt6UloTrznkgQLKRZAu8MY7O8XVEcL/1FBH1MC
	ZTlQ==
Received: by 10.52.90.37 with SMTP id bt5mr3475484vdb.67.1352925418688; Wed,
	14 Nov 2012 12:36:58 -0800 (PST)
MIME-Version: 1.0
Received: by 10.59.0.10 with HTTP; Wed, 14 Nov 2012 12:36:38 -0800 (PST)
X-Originating-IP: [5.13.212.52]
In-Reply-To: <20121114145142.752ED10340@opal>
References: <20121114145142.752ED10340@opal>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Wed, 14 Nov 2012 22:36:38 +0200
Message-ID: <CAK18fxFthW1wRo=e=xPT7QkmY4_eAkVRFz-Z_rU4wzufTDhoXQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQm+9JxIdEHbwOiP8iHPcps4jRFE4R2M8u55UNxXuHQhsr+YnmvDom2B1VfNGAv3UiOpzd9s
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [oe-commits] Constantin Musca : insane.bbclass: add qa package name check
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
X-List-Received-Date: Wed, 14 Nov 2012 20:50:55 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Nov 14, 2012 at 4:51 PM, <git@git.openembedded.org> wrote:

> Module: openembedded-core.git
> Branch: master-next
> Commit: da8cdf4c170314b6c317a69cc0a6c22730c9ff13
> URL:
> http://git.openembedded.org/?p=openembedded-core.git&a=commit;h=da8cdf4c170314b6c317a69cc0a6c22730c9ff13
>
> Author: Constantin Musca <constantinx.musca@intel.com>
> Date:   Tue Nov 13 17:51:00 2012 +0200
>
> insane.bbclass: add qa package name check
>
> Check if package names match the [a-z0-9.+-]+ regular
> expression
>
> [YOCTO #3139]
>
> Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>
> ---
>
>  meta/classes/insane.bbclass |    8 ++++++++
>  1 files changed, 8 insertions(+), 0 deletions(-)
>
> diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
> index 34bcd98..237ee82 100644
> --- a/meta/classes/insane.bbclass
> +++ b/meta/classes/insane.bbclass
> @@ -781,6 +781,9 @@ python do_package_qa () {
>          return
>
>      testmatrix = d.getVarFlags("QAPATHTEST")
> +    import re
> +    # The package name matches the [a-z0-9.+-]+ regular expression
> +    pkgname_pattern = re.compile("^[a-z0-9.+-]+$")
>
>      g = globals()
>      walk_sane = True
> @@ -804,6 +807,11 @@ python do_package_qa () {
>                  errorchecks.append(g[testmatrix[e]])
>
>          bb.note("Checking Package: %s" % package)
> +        # Check package name
> +        if not pkgname_pattern.match(package):
> +            package_qa_handle_error("pkgname",
> +                    "%s doesn't match the [a-z0-9.+-]+ regex\n" %
> package, d)
> +


Maybe we should do this check only in ipk builds?

ag

