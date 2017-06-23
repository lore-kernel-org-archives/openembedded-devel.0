Return-Path: <raj.khem@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 5DB6B781F8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Jun 2017 20:46:58 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id k67so15148742wrc.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Jun 2017 13:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=oVrEaY0C/uRtJSgWO7IjbiNkcsx4+EzLBDBT29dM7W4=;
	b=M+bGbGQcz8OSm98a1Xu+UzSs/mXgU0RQOFwDOaxQv/D2cCE39wGYQWq3BxlPyht+Oz
	WZQ0aU1s2JrMDWju9B31NYhw6fLwsWI+E6hQhgLUJnbE9zcs72wUHdYT4Gj5zT5OhOVg
	lk80P2l8A7o7tegPHuB+q63sknMv5XzCcaQ4GyBJW1ZMmoMngcxNLU1pca22R7GryveR
	zBs5Se8BtZ4lGhdBq7q50fi6+7wbmDDiG8tXiysU+wTQzk2Va80LaQLRZIMsoEu2Wqoa
	YS4sairEphEMt7GtGQAMCfBLG1C0MKpV6UPTWKxsNx4eyCdhHn5lmuCtN8dLWPvUluxL
	QTMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=oVrEaY0C/uRtJSgWO7IjbiNkcsx4+EzLBDBT29dM7W4=;
	b=m7pLXFkK991siGMq+lsiunMBrzF6ohNXJNWLEt3hbgMSGJoNqbuD1pjRHmi+T22NS/
	NpjMLJgS7b4AXo6IYibNOZTIldrA46yfWjT298X861190U/GP//dlAiWID49vP+5pzHZ
	ihHHIS0qJbZrexm+PXS5K3ZeysHo8+C5VJbbhvaSGWmJtuayIrjXT77mGzZ2f0SGQm6v
	HtZdSuyUHzembFIFnFIFsAqd+zKVqNWUPXO+3W9THmm4yKqsrRzoLgmOmE6OgUwuPgJf
	pIxxk1vTMleyzYX1WKO9MV6uNep/rtmRi+37FZAKqd95uoxTaiMzVV2jf6TUzaSAzmUx
	rv4w==
X-Gm-Message-State: AKS2vOxMRR1kp6zP4oBzb4p+odUOl07gTiotBntR/I446A8xgRs0t5in
	CqlRY9S6faNmM7DYp/mgOOJgy3sIGA==
X-Received: by 10.80.139.229 with SMTP id n34mr3197879edn.127.1498250819127;
	Fri, 23 Jun 2017 13:46:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.165.198 with HTTP; Fri, 23 Jun 2017 13:46:28 -0700 (PDT)
In-Reply-To: <20170623202324.69194-3-amery@hanoverdisplays.com>
References: <20170623202324.69194-1-amery@hanoverdisplays.com>
	<20170623202324.69194-3-amery@hanoverdisplays.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 23 Jun 2017 13:46:28 -0700
Message-ID: <CAMKF1srbObwq=vu3CFniU4QCSJYVbXBX0vRKPVe8Bp+8YZtEdw@mail.gmail.com>
To: Alejandro Mery <amery@hanoverdisplays.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Denys Dmytriyenko <denys@ti.com>
Subject: Re: [meta-oe][morty][PATCH 2/6] devmem2: use different filename to avoid checksum conflicts
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
X-List-Received-Date: Fri, 23 Jun 2017 20:46:58 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Jun 23, 2017 at 1:23 PM, Alejandro Mery
<amery@hanoverdisplays.com> wrote:
> From: Denys Dmytriyenko <denys@ti.com>
>
> The newly resurrected devmem2.c file besides having a new location, also
> updates its header, producing different checksums, which would conflict
> with any previously cached or mirrored instances. To avoid such conflicts,
> use a different filename in fetch(). Rename it back to original name at
> unpack() for devmem2-fixups-2.patch to succeed w/o modifications.
>
> WARNING: devmem2-1.0-r7 do_fetch: Fetcher failure for URL: 'http://www.free-electrons.com/pub/mirror/devmem2.c'. Checksum mismatch!
> File: '/OE/master/downloads/devmem2.c' has md5 checksum be12c0132a1ae118cbf5e79d98427c1d when e23f236e94be4c429aa1ceac0f01544b was expected
> File: '/OE/master/downloads/devmem2.c' has sha256 checksum ec382c90af3ef2f49695ff14a4d6521e58ac482c4e29d6c9ebca8768f699c191 when 3b15515693bae1ebd14d914e46d388edfec2175829ea1576a7a0c8606ebbe639 was expected
> If this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:
> SRC_URI[md5sum] = "be12c0132a1ae118cbf5e79d98427c1d"
> SRC_URI[sha256sum] = "ec382c90af3ef2f49695ff14a4d6521e58ac482c4e29d6c9ebca8768f699c191"
> Otherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.
>
> WARNING: devmem2-1.0-r7 do_fetch: Renaming /OE/sources/devmem2.c to /OE/sources/devmem2.c_bad-checksum_be12c0132a1ae118cbf5e79d98427c1d
>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta-oe/recipes-support/devmem2/devmem2.bb | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-support/devmem2/devmem2.bb b/meta-oe/recipes-support/devmem2/devmem2.bb
> index c42eb5e0b..c86eb2e4b 100644
> --- a/meta-oe/recipes-support/devmem2/devmem2.bb
> +++ b/meta-oe/recipes-support/devmem2/devmem2.bb
> @@ -3,12 +3,16 @@ LICENSE = "GPLv2+"
>  LIC_FILES_CHKSUM = "file://devmem2.c;endline=38;md5=a9eb9f3890384519f435aedf986297cf"
>  PR = "r7"
>
> -SRC_URI = "http://www.free-electrons.com/pub/mirror/devmem2.c \
> +SRC_URI = "http://www.free-electrons.com/pub/mirror/devmem2.c;downloadfilename=devmem2-new.c \
>             file://devmem2-fixups-2.patch;apply=yes;striplevel=0"
>  S = "${WORKDIR}"
>

can we explore use of downloadfilename= parameter of http/ftp fetcher

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
> 2.13.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

