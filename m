Return-Path: <andrei.kholodnyi@gmail.com>
Received: from mail-vk0-f42.google.com (mail-vk0-f42.google.com
	[209.85.213.42])
	by mail.openembedded.org (Postfix) with ESMTP id 6157376FD0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Oct 2015 08:04:32 +0000 (UTC)
Received: by vkat63 with SMTP id t63so5599435vka.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Oct 2015 01:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=YfiHMCVOqsvgoY0OOEO+AV6zJSvhbt2BwydxWnGvleg=;
	b=aLwXQBuJvwG1XhL479z2WNr4tfn0H/8kE+aNmUja2kz6SmaGT2ySqcvmH9vpl7E7HE
	9aiHXTo1Mxzv0q8L1NMvNEL3dNNiohqUVZNNYp4BPC14EWZbjzPiZH6pR2yh/wfY1Azp
	yHtssgSogqhhOj6TS9dN0gKkR+3HUxXcuh8intDTCbx84/988qPO72DuZShdmAw5jLbO
	2wiYt9kdTfybYBXuhuJ5owki4ShIoceVx46qUGmsof0GzOB2InIo2rGYp8Qt7CaJ+22M
	RtafVr8heinFOvHgZdX6Jo+Cf9wB1mB9Uthl/lmvi5eIN8qVLnf8wfYWxKcCXfZXTHOV
	APtg==
X-Received: by 10.31.165.76 with SMTP id o73mr20062612vke.140.1444723471948;
	Tue, 13 Oct 2015 01:04:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.95.86 with HTTP; Tue, 13 Oct 2015 01:04:12 -0700 (PDT)
In-Reply-To: <3E673099-DB5C-4269-92FC-019C985A63F6@gmail.com>
References: <1443897005-23957-1-git-send-email-andrei.kholodnyi@gmail.com>
	<CABcZAN=kqUjdKUqvziBkTa=yhVUFvOw-oGL6LQdzgMeUNGqLyw@mail.gmail.com>
	<3E673099-DB5C-4269-92FC-019C985A63F6@gmail.com>
From: Andrei Kholodnyi <andrei.kholodnyi@gmail.com>
Date: Tue, 13 Oct 2015 10:04:12 +0200
Message-ID: <CABYVMoTqcsn5jo3DOSM3Nbfo8MujhJfBwh5cGokOX2U0aksaqw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Tue, 13 Oct 2015 08:04:34 -0000
Content-Type: text/plain; charset=UTF-8

Sorry for the late answer, your replies lands to spam in my gmail box :(
yes, the name of the package shall be libtalloc, similar to debian.
I have kept the name "talloc" for compatibility reasons.
I'd rather apply this or similar patch otherwise "populate sdk" is broken.

does it make sense to add -staticdev to the list and resubmit?

2015-10-06 13:41 GMT+02:00 Jens Rehsack <rehsack@gmail.com>:

>
> > Am 03.10.2015 um 20:37 schrieb Christopher Larson <clarson@kergoth.com>:
> >
> > On Sat, Oct 3, 2015 at 11:30 AM, Andrei Kholodnyi <
> > andrei.kholodnyi@gmail.com> wrote:
> >
> >> populate_sdk fails with following message:
> >> error: talloc-dev-2.1.1-r0 requires talloc = 2.1.1-r0
> >>
> >> these packages are empty,remove them from the package list
> >> ---
> >> meta-oe/recipes-support/talloc/talloc_2.1.1.bb | 5 +----
> >> 1 file changed, 1 insertion(+), 4 deletions(-)
> >>
> >> diff --git a/meta-oe/recipes-support/talloc/talloc_2.1.1.bb
> >> b/meta-oe/recipes-support/talloc/talloc_2.1.1.bb
> >> index 89c390f..0c98bb6 100644
> >> --- a/meta-oe/recipes-support/talloc/talloc_2.1.1.bb
> >> +++ b/meta-oe/recipes-support/talloc/talloc_2.1.1.bb
> >> @@ -20,12 +20,9 @@ EXTRA_OECONF += "--disable-rpath \
> >>                  --with-libiconv=${STAGING_DIR_HOST}${prefix}\
> >>                 "
> >>
> >> -PACKAGES += "libtalloc libtalloc-dbg libtalloc-dev pytalloc
> pytalloc-dbg
> >> pytalloc-dev"
> >> +PACKAGES = "libtalloc libtalloc-dbg libtalloc-dev pytalloc pytalloc-dbg
> >> pytalloc-dev"
> >>
> >> #ALLOW_EMPTY_${PN} = "1"
> >> -FILES_${PN} = ""
> >> -FILES_${PN}-dev = ""
> >> -FILES_${PN}-dbg = ""
> >>
> >
> > Question, why does this use libtalloc as the package names rather than
> the
> > default of talloc? In the common case of the debian bbclass inherited,
> > they'll get renamed based on the library soname anyway. Also, overriding
> > the PACKAGES list isn't ideal, since it means future changes to the
> default
> > value of PACKAGES will not be picked up here. Also, this packaging is
> worse
> > than default, as it doesn't have the -staticdev package.
>
> In current situation you have to touch every recipe depending on
> talloc - not only in poky and meta-oe, also in any 3rd party layer.
>
> I agree to the rename, but at a better time (e.g. when jethro has been
> settled).
>
> Cheers
> --
> Jens Rehsack - rehsack@gmail.com
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>



-- 
Believe is not enough, you must know

