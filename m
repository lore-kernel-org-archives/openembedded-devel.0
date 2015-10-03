Return-Path: <kergoth@gmail.com>
Received: from mail-ig0-f177.google.com (mail-ig0-f177.google.com
	[209.85.213.177])
	by mail.openembedded.org (Postfix) with ESMTP id 32F82760F4
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  3 Oct 2015 18:37:27 +0000 (UTC)
Received: by igbkq10 with SMTP id kq10so37341308igb.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 03 Oct 2015 11:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:content-type;
	bh=1vKEaVwf6tgRb+6lVTeSKXAPzKUNutVDvNFaBISfjJM=;
	b=VG69jLBP2XSEG/ZKxSAL56DhZC1ugN05cqbRESsSjB06WmIUwVcMV64ikSbXf+Pkdc
	vdkmMbJUeBTKSV4jTFp+6+1tXXzpp+6VlLRr0jdPPmhQ3Efhq8r+fHy8DdpzwQRXqIdZ
	IFiGfEFDXzdZq92xVEMYNTc/4njRSEeoDV6SLC+LTMLZyR7J7bHiMeI6NPFPRHH7TN8a
	pg1G7xMP0bk9zsOwJbRWVCcjpjt+yjwj2TzU4QdL0EJcvcpyIXXJJGo03D3ZgtgqjXjo
	JY9W6RTBwckVCS522gmDYNtuSPK6ZB8bxTad2dTJz5RS/AEvI6f39GPXPSABVreZG4zq
	AuIQ==
X-Received: by 10.50.43.170 with SMTP id x10mr3025476igl.68.1443897447352;
	Sat, 03 Oct 2015 11:37:27 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.100.71 with HTTP; Sat, 3 Oct 2015 11:37:08 -0700 (PDT)
In-Reply-To: <1443897005-23957-1-git-send-email-andrei.kholodnyi@gmail.com>
References: <1443897005-23957-1-git-send-email-andrei.kholodnyi@gmail.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Sat, 3 Oct 2015 11:37:08 -0700
X-Google-Sender-Auth: ACiwC1360hEW7bHZZz9iDA-T1Gw
Message-ID: <CABcZAN=kqUjdKUqvziBkTa=yhVUFvOw-oGL6LQdzgMeUNGqLyw@mail.gmail.com>
To: Openembedded Discussion <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH] talloc: remove default packages from the packages list since empty
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
X-List-Received-Date: Sat, 03 Oct 2015 18:37:28 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Oct 3, 2015 at 11:30 AM, Andrei Kholodnyi <
andrei.kholodnyi@gmail.com> wrote:

> populate_sdk fails with following message:
> error: talloc-dev-2.1.1-r0 requires talloc = 2.1.1-r0
>
> these packages are empty,remove them from the package list
> ---
>  meta-oe/recipes-support/talloc/talloc_2.1.1.bb | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/meta-oe/recipes-support/talloc/talloc_2.1.1.bb
> b/meta-oe/recipes-support/talloc/talloc_2.1.1.bb
> index 89c390f..0c98bb6 100644
> --- a/meta-oe/recipes-support/talloc/talloc_2.1.1.bb
> +++ b/meta-oe/recipes-support/talloc/talloc_2.1.1.bb
> @@ -20,12 +20,9 @@ EXTRA_OECONF += "--disable-rpath \
>                   --with-libiconv=${STAGING_DIR_HOST}${prefix}\
>                  "
>
> -PACKAGES += "libtalloc libtalloc-dbg libtalloc-dev pytalloc pytalloc-dbg
> pytalloc-dev"
> +PACKAGES = "libtalloc libtalloc-dbg libtalloc-dev pytalloc pytalloc-dbg
> pytalloc-dev"
>
>  #ALLOW_EMPTY_${PN} = "1"
> -FILES_${PN} = ""
> -FILES_${PN}-dev = ""
> -FILES_${PN}-dbg = ""
>

Question, why does this use libtalloc as the package names rather than the
default of talloc? In the common case of the debian bbclass inherited,
they'll get renamed based on the library soname anyway. Also, overriding
the PACKAGES list isn't ideal, since it means future changes to the default
value of PACKAGES will not be picked up here. Also, this packaging is worse
than default, as it doesn't have the -staticdev package.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

