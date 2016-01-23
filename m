Return-Path: <brunovern.a@gmail.com>
Received: from mail-lf0-f45.google.com (mail-lf0-f45.google.com
	[209.85.215.45])
	by mail.openembedded.org (Postfix) with ESMTP id D9FC87687B
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 Jan 2016 21:46:59 +0000 (UTC)
Received: by mail-lf0-f45.google.com with SMTP id h129so66188860lfh.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 Jan 2016 13:47:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:content-type; bh=MhmWySoXaVQM0gUvCdge/Em2CBZiCq/uqPukv1C6UzM=;
	b=aFCDFvIhemeQZyjIMMtRuW5G0rGqvRf+jcGDcPTPTWO/YVNrhK/y56GayeyzTg1rTm
	4NL01jd4Ah8yOtHl0HpIFAU/pAOGTjTeTwDayru92sja6OKAMl076ICYjlikHu/zcH4P
	CRF3n0slct37fVly6Eqf32VBUhxx9BP1E6i2c2bBzsLQXdiuhXtFDpeXBT2eG1mG17xU
	+ElCZZMcQuxRnCl8TfrsiENUE/lmSm5Emuphi/437NRGOdrV12k/N17u69jWj18ymEtK
	gfqmQ2AhqAblBVJsfXJNfN5OaJpau1mvXILFOy7RD2LycLtQBC7rS7Nez3X4xEwqGN5p
	yRhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:content-type;
	bh=MhmWySoXaVQM0gUvCdge/Em2CBZiCq/uqPukv1C6UzM=;
	b=UPXXVQYp9hz4kIL0Un5VAOILw9cWHPLNSH558bUAMU50/jxfmNGF3YSzI/YJRbZNvY
	cIYPpirB9XGrZucPi45PNgTdsPd83LCD5QAmQmLaDnf/uCiQKirE2gnLSf/Oj1J7Ddpd
	9s9PpOBZMN83ChZN8RtKLZ5sokZG8xHfBn8q27P/3/Yu2VpPkyDOkdy62cPGT91Pss9K
	AK0idoatV7RSTSayqIVEGmsMkKJZ5D5bEmP8FUd0UzUPCiWaweRxYTosa8OvhP15r9kn
	gG8U/0sNBDKe7XniTxw3IEydjVNYxKEn5gAdln7SIJ7T2hKtliBqt1umS6XCTYnproCk
	YKeA==
X-Gm-Message-State: AG10YOTwNnre/VuyPZoxWVejoQFDR/MVCwKx93hbYpcSM3COEsrcJaD7aGeoOAmz5FYMhzdtU0sk92Qafmsbfw==
X-Received: by 10.25.167.74 with SMTP id q71mr2979161lfe.22.1453585618614;
	Sat, 23 Jan 2016 13:46:58 -0800 (PST)
MIME-Version: 1.0
References: <1453584691-8550-1-git-send-email-BrunoVern.a@gmail.com>
In-Reply-To: <1453584691-8550-1-git-send-email-BrunoVern.a@gmail.com>
From: Bruno Vernay <brunovern.a@gmail.com>
Date: Sat, 23 Jan 2016 21:46:48 +0000
Message-ID: <CAF3KAoQSrGP2fbG8ebcPVMbxoRNmgOxxf6MKnckvZTYqS9Cjgw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH] OpenLDAP modules
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
X-List-Received-Date: Sat, 23 Jan 2016 21:47:03 -0000
Content-Type: text/plain; charset=UTF-8

By the way, I wonder if there is a way to write test that would launch
OpenLDAP in Qemu and check that OpenLDAP can answer a request for example,
and not just build and fail at runtime ...
Also would it be a good idea to write a readme to show some example on how
to use the recipe, or would it be better in the recipe comment header ?
Because I struggled a bit to find out and a simple example could have save
me time.
Thanks
Bruno

On Sat, Jan 23, 2016 at 10:31 PM BrunoVernay <brunovern.a@gmail.com> wrote:

> ---
>  .../recipes-support/openldap/openldap_2.4.42.bb    | 28
> +++++++++++++++++++++-
>  1 file changed, 27 insertions(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-support/openldap/openldap_2.4.42.bb
> b/meta-oe/recipes-support/openldap/openldap_2.4.42.bb
> index 49fcb56..23586b7 100644
> --- a/meta-oe/recipes-support/openldap/openldap_2.4.42.bb
> +++ b/meta-oe/recipes-support/openldap/openldap_2.4.42.bb
> @@ -148,6 +148,8 @@ PACKAGES += "${PN}-overlay-proxycache"
>  # it was disabled for cross-compiling.
>  CPPFLAGS_append = " -D_GNU_SOURCE -DURANDOM_DEVICE=\'/dev/urandom\'"
>
> +LDFLAGS += "-pthread"
> +
>  do_configure() {
>      cp ${STAGING_DATADIR_NATIVE}/libtool/build-aux/ltmain.sh ${S}/build
>      rm -f ${S}/libtool
> @@ -166,7 +168,7 @@ LEAD_SONAME = "libldap-${LDAP_VER}.so.*"
>  PACKAGES += "${PN}-slapd ${PN}-slurpd ${PN}-bin"
>
>  # Package contents - shift most standard contents to -bin
> -FILES_${PN} = "${libdir}/lib*.so.* ${sysconfdir}/openldap/ldap.*
> ${localstatedir}/openldap-data"
> +FILES_${PN} = "${libdir}/lib*.so.* ${sysconfdir}/openldap/ldap.*
> ${localstatedir}/${BPN}/data"
>  FILES_${PN}-slapd = "${sysconfdir}/init.d ${libexecdir}/slapd ${sbindir}
> ${localstatedir}/run ${localstatedir}/volatile/run \
>      ${sysconfdir}/openldap/slapd.* ${sysconfdir}/openldap/schema \
>      ${sysconfdir}/openldap/DB_CONFIG.example ${systemd_unitdir}/system/*"
> @@ -195,6 +197,18 @@ do_install_append() {
>      install -d ${D}${systemd_unitdir}/system/
>      install -m 0644 ${WORKDIR}/slapd.service
> ${D}${systemd_unitdir}/system/
>      sed -i -e 's,@SBINDIR@,${sbindir},g'
> ${D}${systemd_unitdir}/system/*.service
> +
> +    # Uses mdm as the database
> +    #  and localstatedir as data directory ...
> +    sed -e 's/# modulepath/modulepath/' \
> +        -e 's/# moduleload\s*back_bdb.*/moduleload    back_mdb/' \
> +        -e 's/database\s*bdb/database        mdb/' \
> +        -e 's%^directory\s*.*%directory   ${localstatedir}/${BPN}/data/%'
> \
> +        -i ${D}${sysconfdir}/openldap/slapd.conf
> +
> +    mkdir -p ${D}${localstatedir}/${BPN}/data
> +
> +
>  }
>
>  INITSCRIPT_PACKAGES = "${PN}-slapd"
> @@ -206,8 +220,20 @@ SYSTEMD_AUTO_ENABLE_${PN}-slapd ?= "disable"
>
>  PACKAGES_DYNAMIC += "^${PN}-backends.* ^${PN}-backend-.*"
>
> +# The modules require their .so to be dynamicaly loaded
> +INSANE_SKIP_${PN}-backend-dnssrv  += "dev-so"
> +INSANE_SKIP_${PN}-backend-ldap    += "dev-so"
> +INSANE_SKIP_${PN}-backend-meta    += "dev-so"
> +INSANE_SKIP_${PN}-backend-mdb     += "dev-so"
> +INSANE_SKIP_${PN}-backend-monitor += "dev-so"
> +INSANE_SKIP_${PN}-backend-null    += "dev-so"
> +INSANE_SKIP_${PN}-backend-passwd  += "dev-so"
> +INSANE_SKIP_${PN}-backend-shell   += "dev-so"
> +
> +
>  python populate_packages_prepend () {
>      backend_dir    = d.expand('${libexecdir}/openldap')
> +    do_split_packages(d, backend_dir, 'back_([a-z]*)\.so$',
> 'openldap-backend-%s', 'OpenLDAP %s backend', prepend=True,
> extra_depends='', allow_links=True)
>      do_split_packages(d, backend_dir, 'back_([a-z]*)\-.*\.so\..*$',
> 'openldap-backend-%s', 'OpenLDAP %s backend', extra_depends='',
> allow_links=True)
>
>      metapkg = "${PN}-backends"
> --
> 2.5.0
>
>

