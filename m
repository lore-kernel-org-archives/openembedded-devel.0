Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id 86FAF79664
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Sep 2018 14:39:09 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id t5-v6so1899009qtn.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Sep 2018 07:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=81+TriKFuIPiE3Cv7ansXvGvLML7ixnDOs6Q+oZjjqk=;
	b=aJLTt6hCdVLITTcWcQuDk8KnpNnxYtZnNKwtNc39h67lfvHxFTZ+31IX+oPf0g8XjN
	dDG2lg5/HMn8z3SBTEKpfTplrVuT3R/Gq6bxTYxwSVSZO87agZXrp7WRuNt/lhZFu55r
	Dg8VqGUHms8X1G7IgsUpoeTrZKjeGt8ZISGhg+Oajvh1bN35BbjUwMQHG+M4v63MLZTU
	RAXSmcrKjXE5XA3cSvIhsuX6AIG5X31kEUf/NBR5Ul0z0GZ8troxt2wf35QKy1HnWd5f
	68ajtF93HbRqeIUZS+fPXlzj951IHS0ht4nWgh701b8qYjSzijAvcBAD3UquTPATuU5C
	nXNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=81+TriKFuIPiE3Cv7ansXvGvLML7ixnDOs6Q+oZjjqk=;
	b=VdCs0PS+QVqaWOA9gJFsGG1HhD38St/vx1ha7U5Oav8VYs+8QJPbBmaPeG7GWBzWUT
	fBW4nYtWrtaPiPSdFX3an0/oFLgn4WWGW4RVM62Ja7g64cRBn/MWD5l8kdIdnBtPzI76
	MbcMNZ+GVTE6z8+XIbTYSX1o+wR166CLSbk6U40FsT/kQ+QTxiqExHviwi7AXUOd7aXV
	RgA65NwGv4lGNPZIepGYhzgwjmQ1zy8mmDmJeyYy5TCu7PZVwG681IC9nJJNzhTfBS+r
	8zEiofmgpgO5OsPWZRyADOQqLrtZM85wcnGR4HAqDaLQzOdPmYDSkI78C8q7vP8XMV+d
	rNcA==
X-Gm-Message-State: APzg51D8pRj8Y/3BSaYyrWFrPvW1Gk5W7+hfcBua+a+ZnrDRJ4UeevbE
	NWSnjSHUkcX6N+PS4KylZqpxB1rrCgeRYfd7LrkBpedq3nk=
X-Google-Smtp-Source: ANB0VdaPL5seY2wM7fS/GHuzXTuTGld6cGrq0ud61LrjLIab2uZGtPikZmQqXT08wvgqFfBjEdDJsXdWu3vyljuMCsM=
X-Received: by 2002:ac8:4649:: with SMTP id
	f9-v6mr21657620qto.34.1537281550155; 
	Tue, 18 Sep 2018 07:39:10 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1537199591.git.hongxu.jia@windriver.com>
	<9b031741bd6629c60a01e5a613b3719ac56b71cd.1537199591.git.hongxu.jia@windriver.com>
In-Reply-To: <9b031741bd6629c60a01e5a613b3719ac56b71cd.1537199591.git.hongxu.jia@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 18 Sep 2018 07:38:43 -0700
Message-ID: <CAMKF1srCou=EG6e+FSu=piH2ZYv5fxHui-SSjRh2a2o_WZiALw@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 12/19] xerces-c: split one dpg package
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
X-List-Received-Date: Tue, 18 Sep 2018 14:39:09 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 17, 2018 at 8:57 AM Hongxu Jia <hongxu.jia@windriver.com> wrote:
>
> Multiple -dbg packages per recipe is not encouraged, and only one is
> recommended and the code only works properly in some cases for one.
>
> Add RPROVIDES_${PN}-dbg to be compatiable with previous dbg packages
> requiring.
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  meta-oe/recipes-devtools/xerces-c/xerces-c_3.1.4.bb | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
>
> diff --git a/meta-oe/recipes-devtools/xerces-c/xerces-c_3.1.4.bb b/meta-oe/recipes-devtools/xerces-c/xerces-c_3.1.4.bb
> index 9bc4ea3..caf2661 100644
> --- a/meta-oe/recipes-devtools/xerces-c/xerces-c_3.1.4.bb
> +++ b/meta-oe/recipes-devtools/xerces-c/xerces-c_3.1.4.bb
> @@ -24,24 +24,20 @@ do_install_prepend () {
>  }
>
>  PACKAGES = "libxerces-c \
> -    libxerces-c-dbg \
>      libxerces-c-dev \
>      xerces-c-samples \
> -    xerces-c-samples-dbg \
>      libxerces-c-staticdev \
>  "
>
> +RPROVIDES_${PN}-dbg += "libxerces-c-dbg xerces-c-samples-dbg"
> +
>  FILES_libxerces-c = "${libdir}/libxerces-c-3.1.so"
> -FILES_libxerces-c-dbg = "${libdir}/.debug \
> -    ${prefix}/src/debug \
> -"

results in errors

ERROR: xerces-c-3.1.4-r0 do_package: QA Issue: xerces-c:
Files/directories were installed but not shippe
  /usr/src
  /usr/bin/.debug
  /usr/bin/.debug/StdInParse
  /usr/bin/.debug/XInclude
  /usr/bin/.debug/Redirect
  /usr/bin/.debug/PSVIWriter
  /usr/bin/.debug/CreateDOMDocument
  /usr/bin/.debug/MemParse
  /usr/bin/.debug/PParse
  /usr/bin/.debug/SAXPrint
  /usr/bin/.debug/DOMCount
  /usr/bin/.debug/SAXCount
  /usr/bin/.debug/SEnumVal
  /usr/bin/.debug/EnumVal
  /usr/bin/.debug/SCMPrint
  /usr/bin/.debug/SAX2Count
  /usr/bin/.debug/SAX2Print
  /usr/bin/.debug/DOMPrint
  /usr/lib/.debug
  /usr/lib/.debug/libxerces-c-3.1.so
  /usr/src/debug
  /usr/src/debug/xerces-c
  /

>  FILES_libxerces-c-dev = "${libdir}/lib*.la \
>      ${libdir}/libxerces-c.so \
>      ${libdir}/pkgconfig/xerces-c.pc \
>      ${includedir}/xercesc \
>  "
>  FILES_xerces-c-samples = "${bindir}/*"
> -FILES_xerces-c-samples-dbg = "${bindir}/.debug/"
>  FILES_libxerces-c-staticdev = "${libdir}/lib*.a"
>
>  BBCLASSEXTEND = "native"
> --
> 2.7.4
>

