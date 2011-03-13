Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PyrrE-0006LH-Lf
	for openembedded-devel@lists.openembedded.org;
	Sun, 13 Mar 2011 21:25:44 +0100
Received: by pzk35 with SMTP id 35so507974pzk.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Mar 2011 13:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=7gfjr+7TXXAF8gEI+5T3NHTNp2CSuGAf6Hmf7YYc6p0=;
	b=d7Fur21CSS69Vf1mkbQW9d0b7ind79x2Oo2cc5O+juiLLaqhPko4iRU/pgmUBERJ51
	o5Z17cQ5beoStet9GEMtRm/NsqZfMezSt9+LYxWXkf0uNypq+TDwuU7PBhuubYUzpJsy
	VpoDYy1h9MGVzFTL8oGux7RqC66U2n00kfJwA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=urwRNHBICSZbBdhntyAcpWnvQISUWsWYuSR4/602OyY1zwcj1k7jaArp6jhUMq7UCB
	UYgBMr2XPrGWByQHfNOIr4X680O2gZN82crSynPUYvRKVTucEhtpY05pOVnNOddea+0g
	OD2Vkp0FUHnji09FF8wsFDCMsOaZ+yCjPuTdI=
Received: by 10.142.61.33 with SMTP id j33mr659243wfa.368.1300047841621;
	Sun, 13 Mar 2011 13:24:01 -0700 (PDT)
Received: from [192.168.1.70] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id n4sm9169455wfl.2.2011.03.13.13.23.59
	(version=SSLv3 cipher=OTHER); Sun, 13 Mar 2011 13:24:00 -0700 (PDT)
Message-ID: <4D7D27D5.6060004@gmail.com>
Date: Sun, 13 Mar 2011 13:23:49 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US;
	rv:1.9.2.15) Gecko/20110303 Thunderbird/3.1.9
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1300042739-17381-1-git-send-email-eric@eukrea.com>
In-Reply-To: <1300042739-17381-1-git-send-email-eric@eukrea.com>
Subject: Re: [PATCH 1/9] apr: add 1.4.2
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 13 Mar 2011 20:25:45 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/13/2011 11:58 AM, Eric Bénard wrote:
> Signed-off-by: Eric Bénard<eric@eukrea.com>

Acked-by: Khem Raj <raj.khem@gmail.com>

> ---
>   recipes/apr/apr_1.4.2.bb |   33 +++++++++++++++++++++++++++++++++
>   1 files changed, 33 insertions(+), 0 deletions(-)
>   create mode 100644 recipes/apr/apr_1.4.2.bb
>
> diff --git a/recipes/apr/apr_1.4.2.bb b/recipes/apr/apr_1.4.2.bb
> new file mode 100644
> index 0000000..0595731
> --- /dev/null
> +++ b/recipes/apr/apr_1.4.2.bb
> @@ -0,0 +1,33 @@
> +DESCRIPTION = "Apache Portable Runtime (APR) library"
> +SECTION = "libs"
> +LICENSE = "Apache License, Version 2.0"
> +
> +SRC_URI = "${APACHE_MIRROR}/apr/${P}.tar.bz2 \
> +           file://configure_fixes.patch \
> +           file://configfix.patch"
> +
> +inherit autotools lib_package binconfig
> +
> +OE_BINCONFIG_EXTRA_MANGLE = " -e 's:location=source:location=installed:'"
> +
> +do_configure_prepend() {
> +	echo "top_builddir=@apr_builddir@">>  ${S}/Makefile.in
> +}
> +
> +FILES_${PN}-dev += "${datadir}/build-1/* ${libdir}/apr.exp"
> +
> +do_install_append() {
> +	install -d ${D}${datadir}/apr
> +	cp ${S}/build/apr_rules.mk ${D}${datadir}/apr/
> +	sed -i s,apr_builddir=.*,apr_builddir=,g ${D}${datadir}/apr/apr_rules.mk
> +	sed -i s,apr_builders=.*,apr_builders=,g ${D}${datadir}/apr/apr_rules.mk
> +	sed -i s,LIBTOOL=.*,LIBTOOL=\$\(SHELL\)\ ${HOST_SYS}-libtool,g ${D}${datadir}/apr/apr_rules.mk
> +	sed -i s,\$\(apr_builders\),${D}${datadir}/apr/,g ${D}${datadir}/apr/apr_rules.mk
> +	cp ${S}/build/mkdir.sh ${D}${datadir}/apr/
> +	cp ${S}/build/make_exports.awk ${D}${datadir}/apr/
> +	cp ${S}/build/make_var_export.awk ${D}${datadir}/apr/
> +	cp ${S}/${HOST_SYS}-libtool ${D}${datadir}/build-1/libtool
> +}
> +
> +SRC_URI[md5sum] = "4b00e8f70c067893d075577962656b35"
> +SRC_URI[sha256sum] = "2017ca700694d09d2b0b21dd7c4d195e43a48735aac88526160c6195ee8f5391"



