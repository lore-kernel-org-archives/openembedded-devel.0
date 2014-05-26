Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f49.google.com (unknown [209.85.213.49])
	by mail.openembedded.org (Postfix) with ESMTP id 7131E65D6D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 May 2014 20:31:43 +0000 (UTC)
Received: by mail-yh0-f49.google.com with SMTP id c41so6713273yho.22
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 May 2014 13:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=1bGWHqiwk77sY19kt0SVTZzB2QKBQyM1/MJYrgovz34=;
	b=VCbbeiCJlvpmo9z6MjxNzlwaoN5eMAggXcan82zEiGEdn0HSH5aZzUEmQg7pNQ5CNk
	yg/jluYigDMCasvlZ/AFh9zep4PjLpRjf1ZeB/wc64sbU1JXXmpfsz61VUYCH5nZSPtp
	ZiqceDp1vIjSkmNj6BaXrKFExc4oMKG9NBMNZBfNVk+ocpAF9U8SxOO+7wlIyGtU4XR2
	TtwcSt0QhfBXGO5jlOSs/vepj8EuoxRnRj//j7dnWjUSAG6i/uQG9P8TuUKb/2W3vKVC
	2CVsen8nmu6T9u1+p6xHsLLd/APHsZJKkg6vy3YRCPpANI5mwxAPVjzMUXqNnD8C+CIk
	W9xw==
MIME-Version: 1.0
X-Received: by 10.236.74.33 with SMTP id w21mr38151340yhd.87.1401136303910;
	Mon, 26 May 2014 13:31:43 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.166.213 with HTTP; Mon, 26 May 2014 13:31:43 -0700 (PDT)
In-Reply-To: <1401132459-26526-1-git-send-email-ashcharles@gmail.com>
References: <1401132459-26526-1-git-send-email-ashcharles@gmail.com>
Date: Mon, 26 May 2014 17:31:43 -0300
X-Google-Sender-Auth: r9QQdoCbSz6SkOkhSk76TTFiADY
Message-ID: <CAP9ODKoyYcRb7jJ9GWWvqLNCJ5Sy5fhYLL8vNG6vSRyBpmeCtw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] eject: link po subdirectory for out-of-tree build
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
X-List-Received-Date: Mon, 26 May 2014 20:31:46 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, May 26, 2014 at 4:27 PM, Ash Charles <ashcharles@gmail.com> wrote:
> The po subdirectory is not copied over to the build directory of
> found on the VPATH for an out-of-tree build so we symlink it over.
>
> Signed-off-by: Ash Charles <ashcharles@gmail.com>
> ---
>  meta-oe/recipes-support/eject/eject_2.1.5.bb | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-support/eject/eject_2.1.5.bb b/meta-oe/recipes-support/eject/eject_2.1.5.bb
> index c47c653..5c9c749 100644
> --- a/meta-oe/recipes-support/eject/eject_2.1.5.bb
> +++ b/meta-oe/recipes-support/eject/eject_2.1.5.bb
> @@ -14,7 +14,9 @@ SRC_URI[sha256sum] = "ef9f7906484cfde4ba223b2682a37058f9a3c7d3bb1adda7a34a67402e
>
>  S = "${WORKDIR}/${BPN}"
>
> -PR = "r1"

You cannot remove the PR without a new version coming out; if you do,
package feeds will get the  revision going backwards.

> +do_compile_prepend() {
> +    ln -s ${S}/po po
> +}

This is not the right fix. Please fix the po/Makefile to use $(srcdir)
and like so you don't need to link it over.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

