Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f68.google.com (mail-vk0-f68.google.com
	[209.85.213.68])
	by mail.openembedded.org (Postfix) with ESMTP id EE2C977248
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Feb 2017 15:24:28 +0000 (UTC)
Received: by mail-vk0-f68.google.com with SMTP id t8so1597841vke.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Feb 2017 07:24:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=vGcs2nmA4xrYJvDGRDHlwiKKBe4IQmgoj/xYM40KOic=;
	b=uCUWFWWYQQ+H1S5pDL9CZIFqfwLJpZDLipSrMsHf0kYq8kLn8pLYmZsafCnYEA8ItV
	drw3iNqq/Uihx5VqItQnZy3Cc4lfTSPsOVtP6KETiSK/IjCht0M2A7GJ+7WEsOa9sxk9
	K9yOolkkzeVwIs5tkwzpeRB9jtYLdbneYqeQu/LvZAfYFIwb2fkWGzaxMfkPU4LRdcow
	fw3P34957pvCSKpCRqi0l/RuJAcI9rJm2bCZCcCmC94snRP8AlsB6Vfo2BkVBfDa2shY
	KPRlu79LapEIZ5P/mvn0gACSvIGgFrWkd2MxMo8jUQR/CTAl+BnnMYAe4MlhaUtMvHcJ
	53ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=vGcs2nmA4xrYJvDGRDHlwiKKBe4IQmgoj/xYM40KOic=;
	b=FDgg4KspfCw8Xm+8wLpRcLiGNyDSAVSqVyWYIgOF5gWdC6lHp+eXhMp/aoZ1OWVecz
	GGlJNmLMlsE0T/X+19J9os0qO9ZwcwTsg7jWniU1AWqU7TQgIkcseMX8glnqitv5bUfv
	Um4VunZn8JiWd9pI/GIjvE/vilF3KlKJuT9ND8ZRT2OG1HCe6jTaS+KKn3thpfSe0SYb
	Ct7tocxT/tNCcOBFptzur5TGQ9B+AgOjn/zfTPAUeW8/D48Wq4clhFUi/CsTjE8LM/j2
	2S7ItkDRFsJPtxzGG1+KUl5x2Dx6hCshy1wAart24g/K4ZqHZmmFtoGuD/1qNFYIjbe/
	pzwQ==
X-Gm-Message-State: AMke39l41MpGYL04c3YqVadPahQHiXQcDHQ2J+iGE97GDyv0oyfkhKMI1rbmeuXkrPR44rb7vNZiBnSRc9ES3A==
X-Received: by 10.31.153.8 with SMTP id b8mr1393553vke.140.1487258668666; Thu,
	16 Feb 2017 07:24:28 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.48.222 with HTTP; Thu, 16 Feb 2017 07:23:58 -0800 (PST)
In-Reply-To: <1487246039-9185-2-git-send-email-linus.svensson@axis.com>
References: <1487246039-9185-1-git-send-email-linus.svensson@axis.com>
	<1487246039-9185-2-git-send-email-linus.svensson@axis.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 16 Feb 2017 07:23:58 -0800
Message-ID: <CAMKF1sq5aLAgjciAfGmr6G1-qQU4fU6Ng_Dni0hVH8u0KZdSrw@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v2 2/2] meson.bbclass: Add meson.bbclass
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
X-List-Received-Date: Thu, 16 Feb 2017 15:24:29 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Feb 16, 2017 at 3:53 AM,  <linus.svensson@axis.com> wrote:
> From: Linus Svensson <linussn@axis.com>
>
> Add a class for packages that uses the meson build system.
>
> Meson uses a cross-file that contain needed tools and information about
> the host and target system. Such a file will be created in {WORKDIR}.
>
> Meson only allows installation directories to be specified as relative
> to prefix, except for sysconfdir, which can be absolute.
>
> This patch is based on a prototype patch by
> Ross Burton <ross.burton@intel.com>.
>
> Signed-off-by: Linus Svensson <linussn@axis.com>
> ---
>  meta-oe/classes/meson.bbclass | 86 +++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 86 insertions(+)
>  create mode 100644 meta-oe/classes/meson.bbclass
>
> diff --git a/meta-oe/classes/meson.bbclass b/meta-oe/classes/meson.bbclass
> new file mode 100644
> index 0000000..5a04134
> --- /dev/null
> +++ b/meta-oe/classes/meson.bbclass
> @@ -0,0 +1,86 @@
> +inherit python3native
> +
> +DEPENDS_append = " meson-native ninja-native"
> +
> +# As Meson enforces out-of-tree builds we can just use cleandirs
> +B = "${WORKDIR}/build"
> +do_configure[cleandirs] = "${B}"
> +
> +# Where the meson.build build configuration is
> +MESON_SOURCEPATH = "${S}"
> +
> +# These variables in the environment override the *native* tools not the cross,
> +# so they need to be unexported.
> +CC[unexport] = "1"
> +
> +def noprefix(var, d):
> +    return d.getVar(var, True).replace(d.getVar('prefix', True) + '/', '', 1)
> +
> +MESONOPTS = " --prefix ${prefix} \
> +              --bindir ${@noprefix('bindir', d)} \
> +              --datadir ${@noprefix('datadir', d)} \
> +              --libdir ${@noprefix('libdir', d)} \
> +              --libexecdir ${@noprefix('libexecdir', d)} \
> +              --includedir ${@noprefix('includedir', d)} \
> +              --mandir ${@noprefix('mandir', d)} \
> +              --localedir ${@noprefix('localedir', d)} \
> +              --sysconfdir ${sysconfdir}"
> +
> +MESON_C_ARGS = "${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
> +
> +MESON_HOST_ENDIAN = "${@bb.utils.contains('SITEINFO_ENDIANNESS', 'be', 'big', 'little', d)}"
> +MESON_TARGET_ENDIAN = "${@bb.utils.contains('TUNE_FEATURES', 'bigendian', 'big', 'little', d)}"
> +
> +EXTRA_OEMESON += "${PACKAGECONFIG_CONFARGS}"
> +
> +def meson_array(var, d):
> +    return "', '".join(d.getVar(var, True).split()).join(("'", "'"))
> +
> +addtask write_config before do_configure
> +do_write_config[vardeps] += "MESON_C_ARGS TOOLCHAIN_OPTIONS"
> +do_write_config() {
> +    # This needs to be Py to split the args into single-element lists
> +    cat >${WORKDIR}/meson.cross <<EOF
> +[binaries]
> +c = '${HOST_PREFIX}gcc'
> +cpp = '${HOST_PREFIX}gcc'
> +ar = '${HOST_PREFIX}ar'
> +ld = '${HOST_PREFIX}ld'
> +strip = '${HOST_PREFIX}strip'
> +readelf = '${HOST_PREFIX}readelf'
> +pkgconfig = 'pkg-config'

Perhaps inehriting  pkgconfig would be required too.

> +
> +[properties]
> +c_args = [${@meson_array('MESON_C_ARGS', d)}]
> +c_link_args = [${@meson_array('TOOLCHAIN_OPTIONS', d)}]
> +
> +[host_machine]
> +system = '${HOST_OS}'
> +cpu_family = '${HOST_ARCH}'
> +cpu = '${HOST_ARCH}'
> +endian = '${MESON_HOST_ENDIAN}'
> +
> +[target_machine]
> +system = '${TARGET_OS}'
> +cpu_family = '${TARGET_ARCH}'
> +cpu = '${TARGET_ARCH}'
> +endian = '${MESON_TARGET_ENDIAN}'
> +EOF
> +}
> +
> +meson_do_configure() {
> +    if ! meson ${MESONOPTS} "${MESON_SOURCEPATH}" "${B}" --cross-file ${WORKDIR}/meson.cross ${EXTRA_OEMESON}; then
> +        cat ${B}/meson-logs/meson-log.txt
> +        bbfatal_log meson failed
> +    fi
> +}
> +
> +meson_do_compile() {
> +    ninja ${PARALLEL_MAKE}
> +}
> +
> +meson_do_install() {
> +    DESTDIR='${D}' ninja ${PARALLEL_MAKEINST} install
> +}
> +
> +EXPORT_FUNCTIONS do_configure do_compile do_install
> --
> 2.1.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

