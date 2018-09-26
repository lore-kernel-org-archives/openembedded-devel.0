Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
	[209.85.167.66])
	by mail.openembedded.org (Postfix) with ESMTP id E5CD6605BE
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Sep 2018 06:30:33 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id v17-v6so18305429lfe.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Sep 2018 23:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=lkE3Sl79pf9gK3WtatS75+18vUXuKUuD6MG4RkdhKg4=;
	b=H1aMKRR2qLDzqxV2/eLVHa2rsC/YpZuolgE7SBlyCpi4zhJ8nqpt1meq5HYgHw52f1
	KUX9/nO5UrdXG0F1KkwgBaID5ZqvIwW9jcQuiwV3KSM10m3d9l0sEgOT6zqHDuqRMHyE
	RsKRdsqi3ScU2BQOqF0zA3ktwnxH3aD1yn0Yw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=lkE3Sl79pf9gK3WtatS75+18vUXuKUuD6MG4RkdhKg4=;
	b=cX7V4UxryCECVIs8OJfyw2vgPToDafcrfXSsFi7M0TFA+GVbf+d9Q8xsPD/Jb0ZGLB
	UM6o2zWlxRjqaYEFE6TRjgZNcP0DNnbiCU965psSgAnabWKbwtUsjW4RlibAB5p6h8Ni
	UtVRcVPwzphqVHICjGVlp61X6v+NVEQdlB7RrgyeOfDDMEWvTUwthxccrCK0cPCrTTil
	UjFzW+OV+LuhpP8m4/J1DjCb/653MTs6CO7pKaZmMalFJbESuX5DE5LiTTKk69oGlCpR
	OqSLtXPnNgx8UKiBGJ318P9g0shWybLEEfOorLkkMR1unYYwinh7Le1EujRnmFW2m44p
	ZB/Q==
X-Gm-Message-State: ABuFfojngL2WgkHyaNVl0g4hiNbIsqG/YV8NcfM0kSM2q7zWsp/IXI3Y
	elKGNbg6Nr9Q0RrYGqP4UWMKr98kIPcDKGEG3yIhFA==
X-Google-Smtp-Source: ACcGV63g7ETT89JypzdqdwpW+vbhpvuUPgunZLoBoLdQQIKUe2JhokC4m5Csggd5297sdL+wX49tTWvz3eUdM4XHlVU=
X-Received: by 2002:a19:8c1a:: with SMTP id
	o26-v6mr3096043lfd.90.1537943434270; 
	Tue, 25 Sep 2018 23:30:34 -0700 (PDT)
MIME-Version: 1.0
References: <20180926053546.23456-1-paul.eggleton@linux.intel.com>
In-Reply-To: <20180926053546.23456-1-paul.eggleton@linux.intel.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Wed, 26 Sep 2018 08:30:22 +0200
Message-ID: <CAP71Wjx74BfPOPy6eme3fbKSk8eX94bA1R1DrPBW7uAreU8bxg@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][sumo][PATCH] protobuf: make python-protobuf dependency optional and default to off
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
X-List-Received-Date: Wed, 26 Sep 2018 06:30:34 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 26, 2018 at 7:36 AM Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
>
> A dependency on python-protobuf was added in commit
> 5f6fcfd36272768a3ff9078c07c572cf5dc01ccd for the sole purpose of
> providing a ptest, however python-protobuf is in meta-python and thus
> this means that meta-oe would depend on meta-python by default (assuming
> your distro enables ptest by default), and we don't want that - meta-oe
> isn't supposed to depend upon any layer other than openembedded-core.
> Luckily we can still have a ptest even without the python support, so
> add a PACKAGECONFIG and leave it disabled by default.
>
> Note: the PACKAGECONFIG here is not particularly useful since it's only
> about what goes into the -ptest package and thus also the dependency. I
> contemplated just using LANG_SUPPORT instead, but PACKAGECONFIG does
> have the advantage that it's introspectable and fairly well understood
> so in the end I went with it.
>
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>

thanks Paul! With this patch applied and after cherry-picking
251878e8b6b9 (grpc: move it from oe to networking layer) from master,
then yocto-check-layer reports that meta-oe is passing the compliance.
I will send the backport for grpc shortly.


> ---
>  meta-oe/recipes-devtools/protobuf/protobuf_3.5.1.bb | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_3.5.1.bb b/meta-oe/recipes-devtools/protobuf/protobuf_3.5.1.bb
> index 1ffb79da7..073dfaef0 100644
> --- a/meta-oe/recipes-devtools/protobuf/protobuf_3.5.1.bb
> +++ b/meta-oe/recipes-devtools/protobuf/protobuf_3.5.1.bb
> @@ -12,7 +12,7 @@ DEPENDS = "zlib"
>  DEPENDS_append_class-target  = " protobuf-native"
>  RDEPENDS_${PN}-compiler = "${PN}"
>  RDEPENDS_${PN}-dev += "${PN}-compiler"
> -RDEPENDS_${PN}-ptest = "bash python-protobuf"
> +RDEPENDS_${PN}-ptest = "bash ${@bb.utils.contains('PACKAGECONFIG', 'python', 'python-protobuf', '', d)}"
>
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=35953c752efc9299b184f91bef540095"
>
> @@ -24,13 +24,16 @@ SRC_URI = "git://github.com/google/protobuf.git;branch=3.5.x \
>            file://run-ptest \
>            "
>
> +PACKAGECONFIG ??= ""
> +PACKAGECONFIG[python] = ",,"
> +
>  EXTRA_OECONF += " --with-protoc=echo"
>
>  inherit autotools-brokensep pkgconfig ptest
>
>  S = "${WORKDIR}/git"
>  TEST_SRC_DIR="examples"
> -LANG_SUPPORT="cpp python"
> +LANG_SUPPORT = "cpp ${@bb.utils.contains('PACKAGECONFIG', 'python', 'python', '', d)}"
>
>  do_compile_ptest() {
>         # Modify makefile to use the cross-compiler
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

