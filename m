Return-Path: <martin.jansa@gmail.com>
Received: from mail-yb0-f196.google.com (mail-yb0-f196.google.com
	[209.85.213.196])
	by mail.openembedded.org (Postfix) with ESMTP id E065A71A18
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Jun 2017 11:11:08 +0000 (UTC)
Received: by mail-yb0-f196.google.com with SMTP id o185so4802834yba.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 Jun 2017 04:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=VqgDzuIQKxxAhMxkEWyluo/cdUaRXQBUFdVhyeefKh4=;
	b=WIFQGPZI4HLyb0rCLmjFR89G5fC3SDX7DuSYD+sAG8p7knL4oWKNS9MGCMW7ZdISQJ
	jAjEmOgX1iOzIu8kzWBnoLUpWLmTsko+c6yRNjZEbpRgUr3d3wLH5vRYEody7Zn0ohWU
	7io9wrlI0vVFdcbcRGZDnrCHF8Kj6dyljx1sVTqpzQ3A7zw1r+wNaPBu0QdQQvZUc8id
	8YL0Jj5dsNYtgttle7C7y4ISuMkh3S6xHFoMZdN9FVuXy8EvXo+zqhUM4uyt7Arnnchz
	CJjVU4lOcMihlF5rMSs17M6/vAQkLZr8yaCudOusL5Q6srWi7qExhSu1yFOE/wYZmu0F
	7TIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=VqgDzuIQKxxAhMxkEWyluo/cdUaRXQBUFdVhyeefKh4=;
	b=YbFcqJmfQe5RM+slmNP5kLL6El9HEKBT9xlIsR/qb1ZXyvaQmt0D3NIC7Eq4PFCo0P
	1CLShHRcqNoNqurh5im3U0Gyk32YV14fE0WmhUbQ2dhAm/5PfyGgLY2d4riQcdueL6D3
	jcRnbzGMNuiRMjbExdN2Z5M25zgyu5+w0CJn1Ei6eG8UQFX2/ubvDbQFKlw2lGwuKX7C
	1N+MzJuolG+7PYXfxfqWJq6H5UJXXzvs8mbY4g7K7sqkVBGPgZM6jCqxclPCvTPZtE2D
	HEyTh/G9YInQ7zL1UEraCLUeeyDbvNWyL0uCR9BSBVYnRdzMrsWLafZmORV/55gpR4zc
	ymew==
X-Gm-Message-State: AODbwcBLZbdE2g+esExM6Xlyw4PwIFBPwl0eCe+DeVcJSz2yOm/JcQ4Q
	M8/3FSfJz9i5TKkWFWbAhdylvz/P6g==
X-Received: by 10.37.32.195 with SMTP id g186mr3962524ybg.109.1496661069546;
	Mon, 05 Jun 2017 04:11:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.162.38 with HTTP; Mon, 5 Jun 2017 04:11:09 -0700 (PDT)
In-Reply-To: <20170602055545.20448-2-mns@gomspace.com>
References: <20170602055545.20448-1-mns@gomspace.com>
	<20170602055545.20448-2-mns@gomspace.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 5 Jun 2017 13:11:09 +0200
Message-ID: <CA+chaQdFmNp71fVfgRn=X7QyzP5mAgqcP6_ZMz_5+EvX8ioELQ@mail.gmail.com>
To: Martin Siegumfeldt <mns@gomspace.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>,
	Denys Dmytriyenko <denys@ti.com>
Subject: Re: [meta-oe][PATCH 2/2] devmem2: use different filename to avoid checksum conflicts
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
X-List-Received-Date: Mon, 05 Jun 2017 11:11:09 -0000
Content-Type: text/plain; charset="UTF-8"

You should mention to which branch you want this to be applied and CC the
maintainer of that branch.

I can move it to correct bundle in patchwork, but that can still easily
slip release maintainer attention.

Also I wonder why Denys added do_unpack_append() instead of just changing
do_compile to:

${CC} -o devmem2 devmem2-new.c ${CFLAGS} ${LDFLAGS}

but that should be improved in master first to keep your backport request
identical with what we got in master.

On Fri, Jun 2, 2017 at 7:55 AM, Martin Siegumfeldt <mns@gomspace.com> wrote:

> From: Denys Dmytriyenko <denys@ti.com>
>
> The newly resurrected devmem2.c file besides having a new location, also
> updates its header, producing different checksums, which would conflict
> with any previously cached or mirrored instances. To avoid such conflicts,
> use a different filename in fetch(). Rename it back to original name at
> unpack() for devmem2-fixups-2.patch to succeed w/o modifications.
>
> WARNING: devmem2-1.0-r7 do_fetch: Fetcher failure for URL: '
> http://www.free-electrons.com/pub/mirror/devmem2.c'. Checksum mismatch!
> File: '/OE/master/downloads/devmem2.c' has md5 checksum
> be12c0132a1ae118cbf5e79d98427c1d when e23f236e94be4c429aa1ceac0f01544b
> was expected
> File: '/OE/master/downloads/devmem2.c' has sha256 checksum
> ec382c90af3ef2f49695ff14a4d6521e58ac482c4e29d6c9ebca8768f699c191 when
> 3b15515693bae1ebd14d914e46d388edfec2175829ea1576a7a0c8606ebbe639 was
> expected
> If this change is expected (e.g. you have upgraded to a new version
> without updating the checksums) then you can use these lines within the
> recipe:
> SRC_URI[md5sum] = "be12c0132a1ae118cbf5e79d98427c1d"
> SRC_URI[sha256sum] = "ec382c90af3ef2f49695ff14a4d652
> 1e58ac482c4e29d6c9ebca8768f699c191"
> Otherwise you should retry the download and/or check with upstream to
> determine if the file has become corrupted or otherwise unexpectedly
> modified.
>
> WARNING: devmem2-1.0-r7 do_fetch: Renaming /OE/sources/devmem2.c to
> /OE/sources/devmem2.c_bad-checksum_be12c0132a1ae118cbf5e79d98427c1d
>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta-oe/recipes-support/devmem2/devmem2.bb | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-support/devmem2/devmem2.bb
> b/meta-oe/recipes-support/devmem2/devmem2.bb
> index c42eb5e..c86eb2e 100644
> --- a/meta-oe/recipes-support/devmem2/devmem2.bb
> +++ b/meta-oe/recipes-support/devmem2/devmem2.bb
> @@ -3,12 +3,16 @@ LICENSE = "GPLv2+"
>  LIC_FILES_CHKSUM = "file://devmem2.c;endline=38;md5=
> a9eb9f3890384519f435aedf986297cf"
>  PR = "r7"
>
> -SRC_URI = "http://www.free-electrons.com/pub/mirror/devmem2.c \
> +SRC_URI = "http://www.free-electrons.com/pub/mirror/devmem2.c;
> downloadfilename=devmem2-new.c \
>             file://devmem2-fixups-2.patch;apply=yes;striplevel=0"
>  S = "${WORKDIR}"
>
>  CFLAGS += "-DFORCE_STRICT_ALIGNMENT"
>
> +python do_unpack_append() {
> +    os.rename("devmem2-new.c", "devmem2.c")
> +}
> +
>  do_compile() {
>      ${CC} -o devmem2 devmem2.c ${CFLAGS} ${LDFLAGS}
>  }
> --
> 2.9.3
>
>

