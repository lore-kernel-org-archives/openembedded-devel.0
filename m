Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 535A271A71
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Jun 2017 15:07:21 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id g15so19444069wmc.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Jun 2017 08:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=NzhU5SF6R+m+dZnqLBjaALYSL/irt9IcZRiEB2hpIgs=;
	b=sfY8oNCLKdEjEvn3XcrR/3ebihcYSLRhzMR3lf1mh+ZqUK0PTWrXlCf/rMNP3/VHDT
	HVymVN3ENxwPHXdfGBBm4YY+KEcEkE4lncBqtwk/pGqv+aVHlsKeOmxw7WZ5uTvo6wwz
	ArPVJ+irjMCWI9wTX+9SQW2RRoo0oDP6oxS4cvFznF07UK9+Y6huTKAUMOWcJqcx5Etf
	R5ArpnZSUvOVtbqcIySNzhni8MbZVLv91EoQaIlpA+XUKi+bbsvTWG3Ulv9I9IlSfkmm
	XLzTEzhHfL8KaVZIrsV0z3IBLLEFSzoH083EBy6O7zaJzqmEMpz+YG2MjGK3B3aQ/Bct
	GCPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=NzhU5SF6R+m+dZnqLBjaALYSL/irt9IcZRiEB2hpIgs=;
	b=MGAHA45em94vCO2XkAvkvobC10i/yL8JuLZTHM8C1t2cEhmnhZ+Yi6a9jnAw1dITbP
	ZAZl6lyuHQRQ++zhYKnXEN4IPiF7I1CXiwn/ut9aVw+vBmOZ7BUjVyiciX4hGLWP5nsO
	HnAl2fOI61ordxctD1wjUMtD5ZQYJwUihXEfCDZsVN+v2XOclUwbGLDSluCbi+dh7YP4
	SUUl02EPJu1BRz3fnPoW8Mh7Af+YHI2BPYl6kPf4HwMnjZKGsfkXhxm6wLPj8JIfnD5h
	OOrDtf8nbU8279RTQY5atQ+wuai2mlG/dR8L5ADIE+CBS7ESVxchufcIzlgy0c0bKTCO
	vdIQ==
X-Gm-Message-State: AODbwcCix2KcN61RgC96896LNweuUf6YOkWiS7eVTHfHummI8e/wuK9U
	ZxtpjWEVccnmDTyWENmyQ6eQ5vxe1Q==
X-Received: by 10.80.137.56 with SMTP id e53mr6477396ede.67.1496416042983;
	Fri, 02 Jun 2017 08:07:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.195.143 with HTTP; Fri, 2 Jun 2017 08:06:52 -0700 (PDT)
In-Reply-To: <1496390693-8675-1-git-send-email-pascal.bach@siemens.com>
References: <1496390693-8675-1-git-send-email-pascal.bach@siemens.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 2 Jun 2017 08:06:52 -0700
Message-ID: <CAMKF1sr9mimCKC21phffsM5dCQ3LQKc5zdjajawhLBnaTT2-QQ@mail.gmail.com>
To: Pascal Bach <pascal.bach@siemens.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] leveldb: update to 1.20
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
X-List-Received-Date: Fri, 02 Jun 2017 15:07:23 -0000
Content-Type: text/plain; charset="UTF-8"

Pascal

I sent a patch to upgrade to 1.20 yesterday

http://lists.openembedded.org/pipermail/openembedded-devel/2017-June/113003.html

with additional packaging changes as well.



On Fri, Jun 2, 2017 at 1:04 AM, Pascal Bach <pascal.bach@siemens.com> wrote:
> The tmalloc patch went upstream in the meantime
>
> Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
> ---
>  .../leveldb/0001-Explicitly-disable-tcmalloc.patch | 48 ----------------------
>  meta-oe/recipes-extended/leveldb/leveldb_git.bb    |  8 ++--
>  2 files changed, 3 insertions(+), 53 deletions(-)
>  delete mode 100644 meta-oe/recipes-extended/leveldb/leveldb/0001-Explicitly-disable-tcmalloc.patch
>
> diff --git a/meta-oe/recipes-extended/leveldb/leveldb/0001-Explicitly-disable-tcmalloc.patch b/meta-oe/recipes-extended/leveldb/leveldb/0001-Explicitly-disable-tcmalloc.patch
> deleted file mode 100644
> index 4b76dd0..0000000
> --- a/meta-oe/recipes-extended/leveldb/leveldb/0001-Explicitly-disable-tcmalloc.patch
> +++ /dev/null
> @@ -1,48 +0,0 @@
> -From d6daac04dab4b3acf4b88f16742d1b402cdc3d83 Mon Sep 17 00:00:00 2001
> -From: Martin Jansa <Martin.Jansa@gmail.com>
> -Date: Wed, 1 Oct 2014 18:54:04 +0200
> -Subject: [PATCH] Explicitly disable tcmalloc
> -
> -Without this change leveldb autodetects tcmalloc from sysroot and
> -sometimes became dependant on gperftools
> -
> -Disable autodetection without TCMALLOC_ENABLED=true pased to make
> -
> -Upstream-Status: Pending
> -Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ----
> - build_detect_platform | 16 +++++++++-------
> - 1 file changed, 9 insertions(+), 7 deletions(-)
> -
> -diff --git a/build_detect_platform b/build_detect_platform
> -index bb76c4f..a586364 100755
> ---- a/build_detect_platform
> -+++ b/build_detect_platform
> -@@ -201,15 +201,17 @@ EOF
> -         PLATFORM_LIBS="$PLATFORM_LIBS -lsnappy"
> -     fi
> -
> --    # Test whether tcmalloc is available
> --    $CXX $CXXFLAGS -x c++ - -o $CXXOUTPUT -ltcmalloc 2>/dev/null  <<EOF
> --      int main() {}
> -+    if [ "$TCMALLOC_ENABLED" = "true" ]; then
> -+        # Test whether tcmalloc is available
> -+        $CXX $CXXFLAGS -x c++ - -o $CXXOUTPUT -ltcmalloc 2>/dev/null  <<EOF
> -+          int main() {}
> - EOF
> --    if [ "$?" = 0 ]; then
> --        PLATFORM_LIBS="$PLATFORM_LIBS -ltcmalloc"
> --    fi
> -+        if [ "$?" = 0 ]; then
> -+            PLATFORM_LIBS="$PLATFORM_LIBS -ltcmalloc"
> -+        fi
> -
> --    rm -f $CXXOUTPUT 2>/dev/null
> -+        rm -f $CXXOUTPUT 2>/dev/null
> -+    fi
> - fi
> -
> - PLATFORM_CCFLAGS="$PLATFORM_CCFLAGS $COMMON_FLAGS"
> ---
> -2.1.1
> -
> diff --git a/meta-oe/recipes-extended/leveldb/leveldb_git.bb b/meta-oe/recipes-extended/leveldb/leveldb_git.bb
> index a6a3024..8c66055 100644
> --- a/meta-oe/recipes-extended/leveldb/leveldb_git.bb
> +++ b/meta-oe/recipes-extended/leveldb/leveldb_git.bb
> @@ -4,12 +4,10 @@ HOMEPAGE = "http://leveldb.googlecode.com"
>  LICENSE = "BSD-3-Clause"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=92d1b128950b11ba8495b64938fc164d"
>
> -SRCREV = "803d69203a62faf50f1b77897310a3a1fcae712b"
> -PV = "1.18+git${SRCPV}"
> +SRCREV = "a53934a3ae1244679f812d998a4f16f2c7f309a6"
> +PV = "1.20+git${SRCPV}"
>
> -SRC_URI = "git://github.com/google/${BPN}.git \
> -    file://0001-Explicitly-disable-tcmalloc.patch \
> -"
> +SRC_URI = "git://github.com/google/${BPN}.git"
>
>  S = "${WORKDIR}/git"
>
> --
> 2.1.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

