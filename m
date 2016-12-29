Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id C434E6093B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Dec 2016 00:37:53 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id l2so38692797wml.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Dec 2016 16:37:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=NZQblcMgryAGltk7qJKjyi/4w6Oc/3OnvfjYhEFgVIg=;
	b=eKl+QYX9/V/wbq2ZDp/TNYzOmlDW3BqpuknqPlJjs9xOuIN6b+NWAVWdQMP1+MT/7S
	cLOMa139Rn7FF15zO8E8GhDyLetIet235bp1SBO7TlGEWDFBEmARpmHj24WwsDa6UIEx
	Frv6U7nXBrII4BSmUSQj2yLeEUM41/eRX9Zdz7iE9r3LzxWLofG8NM/SjlvxG+sX4LHa
	6H/Wkn2oRT2/Y4SAXBraR7/URmXIdC35inUPlCgEO+w072KKJAcP46XUq/7prJA5i4lW
	MTs792ebR4hi2H+DlN04KOLpJND/WjwOAfxuuQAOOjdGCFXgUhZnXLVXYwQYGdIazH9f
	vHsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=NZQblcMgryAGltk7qJKjyi/4w6Oc/3OnvfjYhEFgVIg=;
	b=q9p7gysih36YYB6bYZARbgbjpwENosmgusj9kIDGy9LG6ELwO93XqzjasBUnsUKQuA
	5R/zcHv5wff87335BkQLjnEmYWCcLeBN6UByduEgpgDMjw2HUoGtiIRSC3ogg3DskbXe
	+sv2geMypdzaNjKaLfYGxaIXPgNB82iaUibckut3EF2WG8FNts338/U8XsD41NqBW9Ci
	aQM7hoSYhe1HnfSQJCgAlCR+ZIejIK5Az7YaIqN9e/jkyBVOHgYUi7TT0BL3g5ZZ9WS6
	sNlucoSxUNAtWzat0hq52lD7LXMnwW560ZBgUSQNZvugFV5GErEZLglCAwC5WYyVh8Ci
	ZODw==
X-Gm-Message-State: AIkVDXL5ojEQPNpxF9nWm5DG0EEdQif5oBuC3dZJ5KK/b4uzoBIkw1ZpQSxjL6276SmvN0kSMsYLNzX7E+VPJg==
X-Received: by 10.28.109.29 with SMTP id i29mr27253361wmc.124.1482971874396;
	Wed, 28 Dec 2016 16:37:54 -0800 (PST)
MIME-Version: 1.0
Received: by 10.80.148.174 with HTTP; Wed, 28 Dec 2016 16:37:53 -0800 (PST)
In-Reply-To: <CAMKF1srmFh83WsKAptTGtCiphnY6+hDzRbvZjVhNQBEpORx1eQ@mail.gmail.com>
References: <1482926435-13846-1-git-send-email-oleksandr.kravchuk@pelagicore.com>
	<CA+chaQcgfRj827K4kSZog6-jDsMu3EX9dGCWT-QCaJihEp23aw@mail.gmail.com>
	<CAKuJqM8AC2pi7y8xGE9o5yJnCkD3GbkLz8RD9y1YSFigwJjKGw@mail.gmail.com>
	<CAMKF1srmFh83WsKAptTGtCiphnY6+hDzRbvZjVhNQBEpORx1eQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 29 Dec 2016 01:37:53 +0100
Message-ID: <CA+chaQeuGNX53YonpVMz5cA4EJwaaSOEWgVYpj1FjAFmCoC0Jg@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [PATCH] devmem2: fix broken SRC_URI
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
X-List-Received-Date: Thu, 29 Dec 2016 00:37:54 -0000
Content-Type: text/plain; charset=UTF-8

It's already on OE src mirror (which is populated by my world builds for
last couple months):

http://sources.openembedded.org/devmem2.c

But this mirror is already in default MIRRORS variable, so it's searched
when original SRC_URI doesn't work.

I assume Oleksandr got this error while sources.openembedded.org was down
because of planned OE infrastructure downtime this week.

On Thu, Dec 29, 2016 at 12:21 AM, Khem Raj <raj.khem@gmail.com> wrote:

> On Wed, Dec 28, 2016 at 4:17 AM, Oleksandr Kravchuk
> <oleksandr.kravchuk@pelagicore.com> wrote:
> > This is a reasonable question. I can only say that the header is
> > slightly different, therefore I had to modify the checksums.
> >
> > I could use another mirror that contains original devmem2.c, but I am
> > unfortunately not confident in their longevity.
>
> Can we just store these files on OE src mirror ?
> may be send the original files to Tom and he should be able to help
> to host them
>
> >
> > On 28 December 2016 at 13:10, Martin Jansa <martin.jansa@gmail.com>
> wrote:
> >> If it's a mirror, then why would there be different LIC_FILES_CHKSUM and
> >> SRC_URI checksums?
> >>
> >> On Wed, Dec 28, 2016 at 1:00 PM, Oleksandr Kravchuk <
> >> oleksandr.kravchuk@pelagicore.com> wrote:
> >>
> >>> Original SRC_URI for devmem2 source code is accessible. Use the mirror
> >>> provided by free-electrons instead.
> >>>
> >>> Signed-off-by: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
> >>> ---
> >>>  meta-oe/recipes-support/devmem2/devmem2.bb | 8 ++++----
> >>>  1 file changed, 4 insertions(+), 4 deletions(-)
> >>>
> >>> diff --git a/meta-oe/recipes-support/devmem2/devmem2.bb
> >>> b/meta-oe/recipes-support/devmem2/devmem2.bb
> >>> index e48cc92..ba9d4cb 100644
> >>> --- a/meta-oe/recipes-support/devmem2/devmem2.bb
> >>> +++ b/meta-oe/recipes-support/devmem2/devmem2.bb
> >>> @@ -1,9 +1,9 @@
> >>>  SUMMARY = "Simple program to read/write from/to any location in
> memory"
> >>>  LICENSE = "GPLv2+"
> >>> -LIC_FILES_CHKSUM = "file://devmem2.c;endline=28;md5=
> >>> dd68f2b0a5184b3db3dc25c99e0bd0cd"
> >>> +LIC_FILES_CHKSUM = "file://devmem2.c;endline=38;md5=
> >>> a9eb9f3890384519f435aedf986297cf"
> >>>  PR = "r7"
> >>>
> >>> -SRC_URI = "http://www.lartmaker.nl/lartware/port/devmem2.c \
> >>> +SRC_URI = "http://free-electrons.com/pub/mirror/devmem2.c \
> >>>             file://devmem2-fixups-2.patch;apply=yes;striplevel=0"
> >>>  S = "${WORKDIR}"
> >>>
> >>> @@ -18,5 +18,5 @@ do_install() {
> >>>      install devmem2 ${D}${bindir}
> >>>  }
> >>>
> >>> -SRC_URI[md5sum] = "be12c0132a1ae118cbf5e79d98427c1d"
> >>> -SRC_URI[sha256sum] = "ec382c90af3ef2f49695ff14a4d652
> >>> 1e58ac482c4e29d6c9ebca8768f699c191"
> >>> +SRC_URI[md5sum] = "e23f236e94be4c429aa1ceac0f01544b"
> >>> +SRC_URI[sha256sum] = "3b15515693bae1ebd14d914e46d388
> >>> edfec2175829ea1576a7a0c8606ebbe639"
> >>> --
> >>> 2.7.4
> >>>
> >>> --
> >>> _______________________________________________
> >>> Openembedded-devel mailing list
> >>> Openembedded-devel@lists.openembedded.org
> >>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >>>
> >> --
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> >
> >
> > --
> > echo "EOF" >> /var/tmp/email
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

