Return-Path: <fffonion@gmail.com>
Received: from mail-yw0-f193.google.com (mail-yw0-f193.google.com
	[209.85.161.193])
	by mail.openembedded.org (Postfix) with ESMTP id 7784471C75
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Oct 2017 14:41:02 +0000 (UTC)
Received: by mail-yw0-f193.google.com with SMTP id j4so5921084ywb.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Oct 2017 07:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=PLKOCQ2xZAlsSPcRpf4UNApC4Cp9U1CvbCTvMEa1u84=;
	b=TdJDF1zZx/+WjAtBw8ybnZx6kYBjkOYw6bvifHabYkTTulqwtJiV6ncsoXlLNpe3hC
	P68tfND0aruamqzblDshBJLwGGAWuQsoluykddlRBVwRc3VerAYl4voVe9vzRji9dFul
	QabJ0BUsGRLNPgCTotp6bLiQVVsT5bmpZv5Gw/x167zhq+fLf3dNZlwIWY7PngGELDg4
	8wrl84XdJmnlq2KZe6XqH3zXoF+17WR5a2RDzHP083AhvaVQ1BJjsyYgA7OqoowvD1uL
	SnxSQmYYAQO0A7XSvPw77jCY7/lDbhU1zry3UahF2juvOHWr+6BzJWiN6V1+C/ydad/g
	+eNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=PLKOCQ2xZAlsSPcRpf4UNApC4Cp9U1CvbCTvMEa1u84=;
	b=FW6HYr9eUMAFwIpzNU5O0pxIdNl4q9FHngTQWLVsmhx4LAuiXRqiALF7dEM03UhYHf
	b5pHrEjqkjV8GgXoyCqN8MFDnULcMqIvbvL15l5jnDh7Y3YVJDvFTDojPi0ALfydFOlM
	96obWmhvOJRnJkcImsQ915Wmcg0t9lWWrXyfUAYOIrgx+2pdrxu5F5fdZyqehrfVEl7u
	YU+v7ZCkohFuuAtImBZlSW9iovXDUDN7VUHT8Eg+FaEtD7o+ll/J+/7fGPS+DFPu+CTP
	JvelxFpI0t4xqdZXOLc0HMrW5Zov7/w+gSogKpJ5WgA0MIKGYL6SHEgEZorN2XA5NKr9
	q/uw==
X-Gm-Message-State: AMCzsaWTDEsfMa0DNIdZYF1iBJBJsFrAPlfIkEWBeUxfwPKYXwcV44c4
	hbQ77h4gjkHuiQuRmv9DOpOh0BFf/RgYcnggNC/CvD6i4x8=
X-Google-Smtp-Source: ABhQp+S7eA45e7o0+Eio35PU3eP4tPxJ31A8JK9irj6nNmitUaNpz3SzcQoCxWjp6hn+ZpcKcSCZChLI+GjFAdzY99c=
X-Received: by 10.129.201.6 with SMTP id o6mr467335ywi.443.1509115263307; Fri,
	27 Oct 2017 07:41:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.129.80.133 with HTTP; Fri, 27 Oct 2017 07:40:22 -0700 (PDT)
In-Reply-To: <CAJ86T=V_iz3794cAjC3BdEzWNa9=MDsJUzpTL2hq_Rs4Fi+QKA@mail.gmail.com>
References: <CABR-LLfMQQQvADAH6Z__-L+Pw0BEGnwn+-_E_C36XUwV+X9_8A@mail.gmail.com>
	<CAMKF1soLSiKO1kxSr0nt8HkYjzn_PpJdLmfRRWp6U6szML-YnA@mail.gmail.com>
	<CABR-LLfXBspMaoGXaJnT2iE=zAdyfMWE=zctbzarzfJbXFS1kg@mail.gmail.com>
	<CAJ86T=U9L2-+xZ_1_8u3NJjHsWgh=Xhs4wGun06AizHyPThMuw@mail.gmail.com>
	<CABR-LLcV-gfq4Vix_FDaf4xrybW9MXP0mJecGnOUau8rpvFSLg@mail.gmail.com>
	<CAJ86T=V_iz3794cAjC3BdEzWNa9=MDsJUzpTL2hq_Rs4Fi+QKA@mail.gmail.com>
From: Wangchong Zhou <fffonion@gmail.com>
Date: Fri, 27 Oct 2017 10:40:22 -0400
Message-ID: <CABR-LLfVRvuK2cDpoFkFLfZAoYViLUvGPxLPuvsAVHZM9R8vDQ@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-webserver] [PATCH] fix nginx with large files support
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
X-List-Received-Date: Fri, 27 Oct 2017 14:41:02 -0000
Content-Type: text/plain; charset="UTF-8"

Thanks, patch attached.

Signed-off-by: Wangchong Zhou <fffonion@gmail.com>
---
 meta-webserver/recipes-httpd/nginx/nginx.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-webserver/recipes-httpd/nginx/nginx.inc
b/meta-webserver/recipes-httpd/nginx/nginx.inc
index 4a97e2670..4cdf892c7 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx.inc
+++ b/meta-webserver/recipes-httpd/nginx/nginx.inc
@@ -57,7 +57,7 @@ do_configure () {
     --with-ptr-size=${PTRSIZE} \
     --with-sig-atomic-t=${PTRSIZE} \
     --with-size-t=${PTRSIZE} \
-    --with-off-t=${PTRSIZE} \
+    --with-off-t=8 \
     --with-time-t=${PTRSIZE} \
     --with-sys-nerr=132 \
     --conf-path=${sysconfdir}/nginx/nginx.conf \
--
2.13.5

On Thu, Oct 26, 2017 at 9:05 PM, Andre McCurdy <armccurdy@gmail.com> wrote:

> On Tue, Oct 24, 2017 at 8:06 PM, Wangchong Zhou <fffonion@gmail.com>
> wrote:
> > On Tue, Oct 24, 2017 at 11:01 PM, Andre McCurdy <armccurdy@gmail.com>
> wrote:
> >> Note that disabling the largefile distro feature isn't supported in
> >> oe-core any more (the conditional tests have been removed, so all
> >> recipes in oe-core build with LFS enabled even if you disable the
> >> largefile distro feature).
> >>
> >> http://git.openembedded.org/openembedded-core/commit/?id=
> a75ccaea77c8aad8d46e87e8ed4af2e2e0ad5327
> >>
> >> It's perhaps not the right approach to be adding new conditional tests
> >> now in meta-oe.
> >
> > So guess we are safe to hardcode off_t to be 8?
>
> Yes, I think so.
>

