Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f42.google.com (mail-pl0-f42.google.com
	[209.85.160.42])
	by mail.openembedded.org (Postfix) with ESMTP id B38AD71C14
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Mar 2018 19:19:54 +0000 (UTC)
Received: by mail-pl0-f42.google.com with SMTP id w12-v6so5933489plp.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Mar 2018 12:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=Pkzy4+s2/hjnU77DkucvkHO7jyeVqZmdEuCqSAKoivk=;
	b=baVpvnFA5S/zrz2+t68r/tU76RbQdKKMCI85FKuXH2X5Sf08vF1rnmp2s8QsCyq76m
	hM8T0Xn7GjTzmMDkv+VuL9oWHtgNtxDiPq4JXGDVhJaJ5LhfeSIZmBdM/8lUlnC8hB2Q
	WvIRE1Gx8HgtuwLiBZYPVmuI+ajAI6vMSpunRj9ycqoQBd/pvKYx/r4N0yNKWhdT8By3
	/sYjBUX87oHpSDtInpi06qqHtXwOGRdMw0w8Si3XaC5F+YFEbkXWEkFNpB5+eYDIMAZV
	aFCXWtVhgYED43emxLoXtAaYmaslZhIGAh0qt9ay/7cNZAV7KaMxia6i05+i2sImqJyo
	IU3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=Pkzy4+s2/hjnU77DkucvkHO7jyeVqZmdEuCqSAKoivk=;
	b=SVjnBDGKuiJriFUtSwBSTONgAWv7DUJ2VGhI1xIDdUSKPMZDzm4Z0p+wVTKUH+QbXU
	fSCRrIwjkf/lyx3O3f1lrvDsopt5XVHpNLfWQMG+pfd4L9dSpox/fNQmVHeMMgK6hJru
	jFoC0I74w6SB5VZF5AFQuClaLP0tH/eMun66JdXV91gK4feDcCv9uFFZcfg63NAeGQS9
	ICNwALrpuHevwOQImJMRMMyDSXCIhD647237+szBA+g3RsLtKtGlF683QpxAG1AUQgFB
	4XVg0jENXecNZWIs4SONNpyyZ3U0xeIiJsSYt0ZfB1ZypNDxq13q91wncVXdZvMz6w/e
	LuDg==
X-Gm-Message-State: AElRT7ECn/fz3MznBjTIX5B95XUEkBU879N/qczH/iUbWhje8dJZte6m
	Jf8RpxamkajQCLEWiNofddDyXg==
X-Google-Smtp-Source: AG47ELt86Fq8YA+Y77dTbgs/2q8YjB46CJXE0sZ7nWZyu8az2Ami50pZGCYReWahCra4MLj2nGyhNQ==
X-Received: by 2002:a17:902:a610:: with SMTP id
	u16-v6mr25951980plq.293.1521746395478; 
	Thu, 22 Mar 2018 12:19:55 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1184:d51a:28df:7b7:12f5?
	([2601:202:4000:1184:d51a:28df:7b7:12f5])
	by smtp.gmail.com with ESMTPSA id
	q66sm12060398pfk.95.2018.03.22.12.19.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 22 Mar 2018 12:19:54 -0700 (PDT)
To: Yang Lyu <yang.lyu@axis.com>, openembedded-devel@lists.openembedded.org
References: <1521632454-11233-1-git-send-email-yangl@axis.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <ac75a7b1-02d4-8b26-2929-a4e1d740c32f@gmail.com>
Date: Thu, 22 Mar 2018 12:19:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <1521632454-11233-1-git-send-email-yangl@axis.com>
Subject: Re: [meta-oe][PATCH] dbus-broker: Add recipe
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
X-List-Received-Date: Thu, 22 Mar 2018 19:19:54 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 03/21/2018 04:40 AM, Yang Lyu wrote:
> DBus-broker is a drop-in replacement for dbus-daemon. It is an implementation of a message
> bus as defined by the D-Bus specification. Its aim is to provide high performance and
> reliability, while keeping compatibility to the D-Bus reference implementation.
>
> 0001-Comment-rst2man-related-stuff.patch avoids using rst2man.
>
> 0002-Correct-including-directory-for-conf.patch fixs path computation for <include> node.
> The patch should be dropped when a newer version of dbus-broker that includes commit:
>     https://github.com/bus1/dbus-broker/commit/9af79016f0f6b1ee60779bc6dc4acd7b4b9e6c70
> is available.
>
> Signed-off-by: Yang Lyu <yang.lyu@axis.com>
> ---
>  .../0001-Comment-rst2man-related-stuff.patch       | 34 ++++++++++++++++++++++
>  ...0002-Correct-including-directory-for-conf.patch | 25 ++++++++++++++++
>  meta-oe/recipes-core/dbus/dbus-broker_git.bb       | 29 ++++++++++++++++++
>  3 files changed, 88 insertions(+)
>  create mode 100644 meta-oe/recipes-core/dbus/dbus-broker/0001-Comment-rst2man-related-stuff.patch
>  create mode 100644 meta-oe/recipes-core/dbus/dbus-broker/0002-Correct-including-directory-for-conf.patch
>  create mode 100644 meta-oe/recipes-core/dbus/dbus-broker_git.bb
>
> diff --git a/meta-oe/recipes-core/dbus/dbus-broker/0001-Comment-rst2man-related-stuff.patch b/meta-oe/recipes-core/dbus/dbus-broker/0001-Comment-rst2man-related-stuff.patch
> new file mode 100644
> index 0000000..f10c49e
> --- /dev/null
> +++ b/meta-oe/recipes-core/dbus/dbus-broker/0001-Comment-rst2man-related-stuff.patch
> @@ -0,0 +1,34 @@
> +From a92fd7da3a262e21c0970a3908eb0b4502819a01 Mon Sep 17 00:00:00 2001
> +From: Yang Lyu <yangl@axis.com>
> +Date: Fri, 23 Feb 2018 16:31:49 +0100
> +Subject: [PATCH] Comment rst2man related stuff
> +
> +---
> + meson.build | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/meson.build b/meson.build
> +index 56d38e4..3c3b109 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -15,7 +15,7 @@ add_project_arguments('-DBINDIR="' + join_paths(get_option('prefix'), get_option
> + cc = meson.get_compiler('c')
> + conf = configuration_data()
> + mod_pkgconfig = import('pkgconfig')
> +-prog_rst2man = find_program('rst2man', 'rst2man.py')
> ++#prog_rst2man = find_program('rst2man', 'rst2man.py')
> + 
> + sub_cdvar = subproject('c-dvar', version: '>=1')
> + sub_clist = subproject('c-list', version: '>=3')
> +@@ -56,7 +56,7 @@ endif
> + 
> + conf.set('bindir', join_paths(get_option('prefix'), get_option('bindir')))
> + 
> +-subdir('docs')
> ++#subdir('docs')
> + subdir('src')
> + 
> + if use_launcher
> +-- 
> +2.1.4
> +
> diff --git a/meta-oe/recipes-core/dbus/dbus-broker/0002-Correct-including-directory-for-conf.patch b/meta-oe/recipes-core/dbus/dbus-broker/0002-Correct-including-directory-for-conf.patch
> new file mode 100644
> index 0000000..4909dea
> --- /dev/null
> +++ b/meta-oe/recipes-core/dbus/dbus-broker/0002-Correct-including-directory-for-conf.patch
> @@ -0,0 +1,25 @@
> +From 4b79f603b948709906c108796087de7b5643f61a Mon Sep 17 00:00:00 2001
> +From: Yang Lyu <yangl@axis.com>
> +Date: Mon, 26 Feb 2018 12:48:34 +0100
> +Subject: [PATCH] Correct including directory for conf
> +
> +---
> + src/launch/config.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/launch/config.c b/src/launch/config.c
> +index 6a68699..579471b 100644
> +--- a/src/launch/config.c
> ++++ b/src/launch/config.c
> +@@ -1022,7 +1022,7 @@ static void config_parser_end_fn(void *userdata, const XML_Char *name) {
> +                                     state->file,
> +                                     state->current->include.selinux_root_relative ?
> +                                         bus_selinux_policy_root() :
> +-                                        state->file->path,
> ++                                        NULL,
> +                                     state->current->cdata);
> +                 if (r) {
> +                         state->error = error_trace(r);
> +-- 
> +2.1.4
> +
> diff --git a/meta-oe/recipes-core/dbus/dbus-broker_git.bb b/meta-oe/recipes-core/dbus/dbus-broker_git.bb
> new file mode 100644
> index 0000000..51dfe8c
> --- /dev/null
> +++ b/meta-oe/recipes-core/dbus/dbus-broker_git.bb
> @@ -0,0 +1,29 @@
> +SUMMARY = "dbus broker"
> +DESCRIPTION = "Drop-in replacement for dbus-daemon."
> +
> +SECTION = "base"
> +
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=7b486c2338d225a1405d979ed2c15ce8"
> +
> +DEPENDS = "dbus glib-2.0 expat systemd"
Please add distro_check for "systemd" if it really needs it or make it a
PACKAGECONFIG .

this fails to build as-is.

> +
> +PV = "9+git${SRCPV}"
> +SRCREV = "ccd06b284892182af569e69046262331150e3536"
> +
> +SRC_URI = "git://github.com/bus1/dbus-broker;protocol=git"
you don't need the protocol=
> +SRC_URI += "file://0001-Comment-rst2man-related-stuff.patch"
> +SRC_URI += "file://0002-Correct-including-directory-for-conf.patch"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit meson pkgconfig systemd
> +
> +SYSTEMD_SERVICE_${PN} = "${BPN}.service"
> +
> +FILES_${PN} += "${systemd_system_unitdir}"
> +FILES_${PN} += "${systemd_user_unitdir}"
> +
> +RDEPENDS_${PN} = "dbus systemd"
> +
> +BBCLASSEXTEND = "native"


