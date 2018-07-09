Return-Path: <leon.anavi@konsulko.com>
Received: from mail-pl0-f67.google.com (mail-pl0-f67.google.com
	[209.85.160.67])
	by mail.openembedded.org (Postfix) with ESMTP id 995086006A
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Jul 2018 15:17:22 +0000 (UTC)
Received: by mail-pl0-f67.google.com with SMTP id z9-v6so6181347plo.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Jul 2018 08:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=UarUfa/jzQ5Ew6l5xiIr+RCBtw1oeP2LUtiK0a3mSow=;
	b=AdEef/cEGNXfQx34nxJCZZfG7Bf+JoDnjlQ84NG5XC7Ar9R5ejV5CRKpXrQEykzT9A
	PUzzdNywXxbRvGz+A3PQV7EfFt27/vmxC18z5GYG+h53s6LfKQj762b/zl7i5lrtEGX+
	o4zzM0+55cKnuQXm2wDPj8JfjEm2rv7mxkWzE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=UarUfa/jzQ5Ew6l5xiIr+RCBtw1oeP2LUtiK0a3mSow=;
	b=co4n9Gc5qATGmB8lo9Qh88JDsbE1thabWxUzn3tlvR81aJ3ZRAyZv0UHI5FY0bleqi
	Zh82uyqPDmktow4QZH5yP296sKXEiTXL+Azp8pYL7SxPh3HHPA+Z1+KX/93Zm+tAUzUL
	bNCSlB2FeNOZnRDjXND2Nq8VWM4ZLxC3ezb/rfW2okwkS7kbLppfWiKgep85FUCnT+Nj
	P+m7zhO8NiqbkJZ/9Iz45BH3hToA7NSGlw0hSmZPCIrxoTWP361PNUIB5q4oHF4vCr+O
	5InxZ5rSKIH3r6W5iUrbsa77c0HvP3y+r5MnPPcPIlxhSpJ8G1TUl12E/6iRD+T/uSEx
	4IFg==
X-Gm-Message-State: APt69E0GDcbdySa2HOem9vjpMyxAQO1ueD+5saaDvwHTf+Kz1ihFEbU5
	1OB3sxW3n+rfleutYxJnGN/+cbE087o=
X-Google-Smtp-Source: AAOMgpekgBQMJqSSa4M7gfbek2nJHd+BtHdATk50acbgamPOsB4Ajaqvn6PLgvuXOvUmVDGhsN7xqA==
X-Received: by 2002:a17:902:bc85:: with SMTP id
	bb5-v6mr21060808plb.229.1531149443513; 
	Mon, 09 Jul 2018 08:17:23 -0700 (PDT)
Received: from [192.168.4.209] ([78.130.197.177])
	by smtp.gmail.com with ESMTPSA id
	x13-v6sm4037257pgv.91.2018.07.09.08.17.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 09 Jul 2018 08:17:22 -0700 (PDT)
To: Khem Raj <raj.khem@gmail.com>
References: <1530868443-19241-1-git-send-email-leon.anavi@konsulko.com>
	<CAMKF1soVBU+OSVc=iUnfNcTR9jnKdA6tnQOg3oefgwgcS_r40Q@mail.gmail.com>
From: Leon Anavi <leon.anavi@konsulko.com>
Openpgp: preference=signencrypt
Autocrypt: addr=leon.anavi@konsulko.com; prefer-encrypt=mutual; keydata=
	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
	Z14qQ+tQr2c=
Message-ID: <fdeb4807-a74e-b52b-6c63-f8776d90175e@konsulko.com>
Date: Mon, 9 Jul 2018 18:17:19 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1soVBU+OSVc=iUnfNcTR9jnKdA6tnQOg3oefgwgcS_r40Q@mail.gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] vim: update to 8.1.0155
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
X-List-Received-Date: Mon, 09 Jul 2018 15:17:22 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Khem,

Thank you for the feedback. I have updated the patch according to your
recommendations. However, git send-email somehow didn't properly sent
the prefix of the subject. Sorry about that. Anyway version 3 of my vim
patch is available at:
http://lists.openembedded.org/pipermail/openembedded-devel/2018-July/119281.html

Please let me know if you have any additional remarks.

Thanks,
Leon


On 7.07.2018 00:21, Khem Raj wrote:
> On Fri, Jul 6, 2018 at 2:14 AM Leon Anavi <leon.anavi@konsulko.com> wrote:
>> Update vim to the latest version 8.1.0155.
>>
>> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
>> ---
>>  meta-oe/recipes-support/vim/vim-tiny_8.1.0.116.bb |  13 ---
>>  meta-oe/recipes-support/vim/vim-tiny_8.1.0155.bb  |  13 +++
>>  meta-oe/recipes-support/vim/vim_8.1.0.116.bb      | 113 ----------------------
>>  meta-oe/recipes-support/vim/vim_8.1.0155.bb       | 113 ++++++++++++++++++++++
>>  4 files changed, 126 insertions(+), 126 deletions(-)
>>  delete mode 100644 meta-oe/recipes-support/vim/vim-tiny_8.1.0.116.bb
>>  create mode 100644 meta-oe/recipes-support/vim/vim-tiny_8.1.0155.bb
>>  delete mode 100644 meta-oe/recipes-support/vim/vim_8.1.0.116.bb
>>  create mode 100644 meta-oe/recipes-support/vim/vim_8.1.0155.bb
>>
> this patch is ok however I would suggest that you add
>
> [diff]
>         renames = copies
>
> to your ~/.gitconfig this will help git detect renames and make
> patches easier to review.
>
>> diff --git a/meta-oe/recipes-support/vim/vim-tiny_8.1.0.116.bb b/meta-oe/recipes-support/vim/vim-tiny_8.1.0.116.bb
>> deleted file mode 100644
>> index bb8f2b7..0000000
>> --- a/meta-oe/recipes-support/vim/vim-tiny_8.1.0.116.bb
>> +++ /dev/null
>> @@ -1,13 +0,0 @@
>> -require vim_${PV}.bb
>> -
>> -SUMMARY += " (with tiny features)"
>> -
>> -PACKAGECONFIG += "tiny"
>> -
>> -do_install() {
>> -    install -d ${D}/${bindir}
>> -    install -m 0755 ${S}/vim ${D}/${bindir}/vim.tiny
>> -}
>> -
>> -ALTERNATIVE_PRIORITY = "90"
>> -ALTERNATIVE_TARGET = "${bindir}/vim.tiny"
>> diff --git a/meta-oe/recipes-support/vim/vim-tiny_8.1.0155.bb b/meta-oe/recipes-support/vim/vim-tiny_8.1.0155.bb
>> new file mode 100644
>> index 0000000..bb8f2b7
>> --- /dev/null
>> +++ b/meta-oe/recipes-support/vim/vim-tiny_8.1.0155.bb
>> @@ -0,0 +1,13 @@
>> +require vim_${PV}.bb
>> +
>> +SUMMARY += " (with tiny features)"
>> +
>> +PACKAGECONFIG += "tiny"
>> +
>> +do_install() {
>> +    install -d ${D}/${bindir}
>> +    install -m 0755 ${S}/vim ${D}/${bindir}/vim.tiny
>> +}
> This could just be made a single liner with
>
> install -D -m 0755 ${S}/vim ${D}/${bindir}/vim.tiny
>
>> +
>> +ALTERNATIVE_PRIORITY = "90"
>> +ALTERNATIVE_TARGET = "${bindir}/vim.tiny"
>> diff --git a/meta-oe/recipes-support/vim/vim_8.1.0.116.bb b/meta-oe/recipes-support/vim/vim_8.1.0.116.bb
>> deleted file mode 100644
>> index f669dfe..0000000
>> --- a/meta-oe/recipes-support/vim/vim_8.1.0.116.bb
>> +++ /dev/null
>> @@ -1,113 +0,0 @@
>> -SUMMARY = "Vi IMproved - enhanced vi editor"
>> -SECTION = "console/utils"
>> -DEPENDS = "ncurses gettext-native"
>> -# vimdiff doesn't like busybox diff
>> -RSUGGESTS_${PN} = "diffutils"
>> -LICENSE = "vim"
>> -LIC_FILES_CHKSUM = "file://../runtime/doc/uganda.txt;md5=b6eb9d541de3933cc8f48125ae0335fe"
>> -
>> -SRC_URI = "git://github.com/vim/vim.git \
>> -           file://disable_acl_header_check.patch;patchdir=.. \
>> -           file://vim-add-knob-whether-elf.h-are-checked.patch;patchdir=.. \
>> -"
>> -SRCREV = "a87b72cc316e065d66dcbcf7ec1cde330adef3a3"
>> -
>> -S = "${WORKDIR}/git/src"
>> -
>> -VIMDIR = "vim${@d.getVar('PV').split('.')[0]}${@d.getVar('PV').split('.')[1]}"
>> -
>> -inherit autotools-brokensep update-alternatives
>> -
>> -CLEANBROKEN = "1"
>> -
>> -# vim configure.in contains functions which got 'dropped' by autotools.bbclass
>> -do_configure () {
>> -    rm -f auto/*
>> -    touch auto/config.mk
>> -    aclocal
>> -    autoconf
>> -    oe_runconf
>> -    touch auto/configure
>> -    touch auto/config.mk auto/config.h
>> -}
>> -
>> -#Available PACKAGECONFIG options are gtkgui, acl, x11, tiny
>> -PACKAGECONFIG ??= ""
>> -PACKAGECONFIG += "${@bb.utils.filter('DISTRO_FEATURES', 'acl selinux', d)}"
>> -
>> -PACKAGECONFIG[gtkgui] = "--enable-gtk2-test --enable-gui=gtk2,--enable-gui=no,gtk+,"
>> -PACKAGECONFIG[acl] = "--enable-acl,--disable-acl,acl,"
>> -PACKAGECONFIG[x11] = "--with-x,--without-x,xt,"
>> -PACKAGECONFIG[tiny] = "--with-features=tiny,--with-features=big,,"
>> -PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux,libselinux,"
>> -PACKAGECONFIG[elfutils] = "--enable-elf-check,,elfutils,"
>> -
>> -EXTRA_OECONF = " \
>> -    --disable-gpm \
>> -    --disable-gtktest \
>> -    --disable-xim \
>> -    --disable-netbeans \
>> -    --with-tlib=ncurses \
>> -    ac_cv_small_wchar_t=no \
>> -    vim_cv_getcwd_broken=no \
>> -    vim_cv_memmove_handles_overlap=yes \
>> -    vim_cv_stat_ignores_slash=no \
>> -    vim_cv_terminfo=yes \
>> -    vim_cv_tgetent=non-zero \
>> -    vim_cv_toupper_broken=no \
>> -    vim_cv_tty_group=world \
>> -    STRIP=/bin/true \
>> -"
>> -
>> -do_install() {
>> -    autotools_do_install
>> -
>> -    # Work around file-rdeps picking up csh, awk, perl or python as a dep
>> -    chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/vim132
>> -    chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/mve.awk
>> -    chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/*.pl
>> -    chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/*.py
>> -
>> -    # Install example vimrc from runtime files
>> -    install -m 0644 ../runtime/vimrc_example.vim ${D}/${datadir}/${BPN}/vimrc
>> -
>> -    # we use --with-features=big as default
>> -    mv ${D}${bindir}/${BPN} ${D}${bindir}/${BPN}.${BPN}
>> -}
>> -
>> -PARALLEL_MAKEINST = ""
>> -
>> -PACKAGES =+ "${PN}-common ${PN}-syntax ${PN}-help ${PN}-tutor ${PN}-vimrc ${PN}-tools"
>> -FILES_${PN}-syntax = "${datadir}/${BPN}/${VIMDIR}/syntax"
>> -FILES_${PN}-help = "${datadir}/${BPN}/${VIMDIR}/doc"
>> -FILES_${PN}-tutor = "${datadir}/${BPN}/${VIMDIR}/tutor ${bindir}/${BPN}tutor"
>> -FILES_${PN}-vimrc = "${datadir}/${BPN}/vimrc"
>> -FILES_${PN}-data = "${datadir}/${BPN}"
>> -FILES_${PN}-tools = "${datadir}/${BPN}/${VIMDIR}/tools"
>> -FILES_${PN}-common = " \
>> -    ${datadir}/${BPN}/${VIMDIR}/*.vim \
>> -    ${datadir}/${BPN}/${VIMDIR}/autoload \
>> -    ${datadir}/${BPN}/${VIMDIR}/colors \
>> -    ${datadir}/${BPN}/${VIMDIR}/compiler \
>> -    ${datadir}/${BPN}/${VIMDIR}/ftplugin \
>> -    ${datadir}/${BPN}/${VIMDIR}/indent \
>> -    ${datadir}/${BPN}/${VIMDIR}/keymap \
>> -    ${datadir}/${BPN}/${VIMDIR}/lang \
>> -    ${datadir}/${BPN}/${VIMDIR}/macros \
>> -    ${datadir}/${BPN}/${VIMDIR}/plugin \
>> -    ${datadir}/${BPN}/${VIMDIR}/print \
>> -    ${datadir}/${BPN}/${VIMDIR}/spell \
>> -    ${datadir}/icons \
>> -"
>> -
>> -RDEPENDS_${BPN} = "ncurses-terminfo-base"
>> -# Recommend that runtime data is installed along with vim
>> -RRECOMMENDS_${BPN} = "${PN}-syntax ${PN}-help ${PN}-tutor ${PN}-vimrc ${PN}-common"
>> -
>> -ALTERNATIVE_${PN} = "vi vim"
>> -ALTERNATIVE_TARGET = "${bindir}/${BPN}.${BPN}"
>> -ALTERNATIVE_LINK_NAME[vi] = "${base_bindir}/vi"
>> -ALTERNATIVE_LINK_NAME[vim] = "${bindir}/vim"
>> -ALTERNATIVE_PRIORITY = "100"
>> -
>> -BBCLASSEXTEND = "native"
>> diff --git a/meta-oe/recipes-support/vim/vim_8.1.0155.bb b/meta-oe/recipes-support/vim/vim_8.1.0155.bb
>> new file mode 100644
>> index 0000000..532b50c
>> --- /dev/null
>> +++ b/meta-oe/recipes-support/vim/vim_8.1.0155.bb
>> @@ -0,0 +1,113 @@
>> +SUMMARY = "Vi IMproved - enhanced vi editor"
>> +SECTION = "console/utils"
>> +DEPENDS = "ncurses gettext-native"
>> +# vimdiff doesn't like busybox diff
>> +RSUGGESTS_${PN} = "diffutils"
>> +LICENSE = "vim"
>> +LIC_FILES_CHKSUM = "file://../runtime/doc/uganda.txt;md5=b6eb9d541de3933cc8f48125ae0335fe"
>> +
>> +SRC_URI = "git://github.com/vim/vim.git \
>> +           file://disable_acl_header_check.patch;patchdir=.. \
>> +           file://vim-add-knob-whether-elf.h-are-checked.patch;patchdir=.. \
>> +"
>> +SRCREV = "ae728edc93fe5a2f8c39fa75b1ae9ed71526858c"
>> +
>> +S = "${WORKDIR}/git/src"
>> +
>> +VIMDIR = "vim${@d.getVar('PV').split('.')[0]}${@d.getVar('PV').split('.')[1]}"
>> +
>> +inherit autotools-brokensep update-alternatives
>> +
>> +CLEANBROKEN = "1"
>> +
>> +# vim configure.in contains functions which got 'dropped' by autotools.bbclass
>> +do_configure () {
>> +    rm -f auto/*
>> +    touch auto/config.mk
>> +    aclocal
>> +    autoconf
>> +    oe_runconf
>> +    touch auto/configure
>> +    touch auto/config.mk auto/config.h
>> +}
>> +
>> +#Available PACKAGECONFIG options are gtkgui, acl, x11, tiny
>> +PACKAGECONFIG ??= ""
>> +PACKAGECONFIG += "${@bb.utils.filter('DISTRO_FEATURES', 'acl selinux', d)}"
>> +
>> +PACKAGECONFIG[gtkgui] = "--enable-gtk2-test --enable-gui=gtk2,--enable-gui=no,gtk+,"
>> +PACKAGECONFIG[acl] = "--enable-acl,--disable-acl,acl,"
>> +PACKAGECONFIG[x11] = "--with-x,--without-x,xt,"
>> +PACKAGECONFIG[tiny] = "--with-features=tiny,--with-features=big,,"
>> +PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux,libselinux,"
>> +PACKAGECONFIG[elfutils] = "--enable-elf-check,,elfutils,"
>> +
>> +EXTRA_OECONF = " \
>> +    --disable-gpm \
>> +    --disable-gtktest \
>> +    --disable-xim \
>> +    --disable-netbeans \
>> +    --with-tlib=ncurses \
>> +    ac_cv_small_wchar_t=no \
>> +    vim_cv_getcwd_broken=no \
>> +    vim_cv_memmove_handles_overlap=yes \
>> +    vim_cv_stat_ignores_slash=no \
>> +    vim_cv_terminfo=yes \
>> +    vim_cv_tgetent=non-zero \
>> +    vim_cv_toupper_broken=no \
>> +    vim_cv_tty_group=world \
>> +    STRIP=/bin/true \
>> +"
>> +
>> +do_install() {
>> +    autotools_do_install
>> +
>> +    # Work around file-rdeps picking up csh, awk, perl or python as a dep
>> +    chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/vim132
>> +    chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/mve.awk
>> +    chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/*.pl
>> +    chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/*.py
>> +
>> +    # Install example vimrc from runtime files
>> +    install -m 0644 ../runtime/vimrc_example.vim ${D}/${datadir}/${BPN}/vimrc
>> +
>> +    # we use --with-features=big as default
>> +    mv ${D}${bindir}/${BPN} ${D}${bindir}/${BPN}.${BPN}
>> +}
>> +
>> +PARALLEL_MAKEINST = ""
>> +
>> +PACKAGES =+ "${PN}-common ${PN}-syntax ${PN}-help ${PN}-tutor ${PN}-vimrc ${PN}-tools"
>> +FILES_${PN}-syntax = "${datadir}/${BPN}/${VIMDIR}/syntax"
>> +FILES_${PN}-help = "${datadir}/${BPN}/${VIMDIR}/doc"
>> +FILES_${PN}-tutor = "${datadir}/${BPN}/${VIMDIR}/tutor ${bindir}/${BPN}tutor"
>> +FILES_${PN}-vimrc = "${datadir}/${BPN}/vimrc"
>> +FILES_${PN}-data = "${datadir}/${BPN}"
>> +FILES_${PN}-tools = "${datadir}/${BPN}/${VIMDIR}/tools"
>> +FILES_${PN}-common = " \
>> +    ${datadir}/${BPN}/${VIMDIR}/*.vim \
>> +    ${datadir}/${BPN}/${VIMDIR}/autoload \
>> +    ${datadir}/${BPN}/${VIMDIR}/colors \
>> +    ${datadir}/${BPN}/${VIMDIR}/compiler \
>> +    ${datadir}/${BPN}/${VIMDIR}/ftplugin \
>> +    ${datadir}/${BPN}/${VIMDIR}/indent \
>> +    ${datadir}/${BPN}/${VIMDIR}/keymap \
>> +    ${datadir}/${BPN}/${VIMDIR}/lang \
>> +    ${datadir}/${BPN}/${VIMDIR}/macros \
>> +    ${datadir}/${BPN}/${VIMDIR}/plugin \
>> +    ${datadir}/${BPN}/${VIMDIR}/print \
>> +    ${datadir}/${BPN}/${VIMDIR}/spell \
>> +    ${datadir}/icons \
>> +"
>> +
>> +RDEPENDS_${BPN} = "ncurses-terminfo-base"
>> +# Recommend that runtime data is installed along with vim
>> +RRECOMMENDS_${BPN} = "${PN}-syntax ${PN}-help ${PN}-tutor ${PN}-vimrc ${PN}-common"
>> +
>> +ALTERNATIVE_${PN} = "vi vim"
>> +ALTERNATIVE_TARGET = "${bindir}/${BPN}.${BPN}"
>> +ALTERNATIVE_LINK_NAME[vi] = "${base_bindir}/vi"
>> +ALTERNATIVE_LINK_NAME[vim] = "${bindir}/vim"
>> +ALTERNATIVE_PRIORITY = "100"
>> +
>> +BBCLASSEXTEND = "native"
>> --
>> 2.7.4
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

-- 
Leon Anavi
Software Engineer
konsulko.com


