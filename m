Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PyrsG-0006Lr-G6
	for openembedded-devel@lists.openembedded.org;
	Sun, 13 Mar 2011 21:26:48 +0100
Received: by pzk35 with SMTP id 35so508055pzk.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Mar 2011 13:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=MB0dyLBEDzFQdJsZWAgYknAtopwh/YA5OMlomhXLCkA=;
	b=kOMVNOPknWEYGkjJYqgiF3cTAlD2nn5XM6KyQ3ktX55ZWAWDLarx3NaCtAhIGTS/Ip
	7Qv0wXRq/aSTwRFbXzWpLwcuNpCuf59zPoG+vaZWr/f0J328VY/qIshJ76rgrfduAIqm
	SygsX/eQrMkCZedwwBLI9cZjb+j7c84sNqrn4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=CRejNNW+lw+rcG9hdO4aDvLyehuBaGqcy4vqY+4BwDBjiIbmtjAC8m79Xr/WC2Gc9Z
	kBNr2UMF5wkjqP0UpYqDQkvyI6wf/g+k/yi6Xj+hrXJHSLlB5l/UJKKjn3spPmW+OwC0
	w92uRRAuG8DyGQjzzBt1FLJJ1GBQTl6L2UH3s=
Received: by 10.142.179.1 with SMTP id b1mr444566wff.432.1300047906636;
	Sun, 13 Mar 2011 13:25:06 -0700 (PDT)
Received: from [192.168.1.70] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id n4sm9170305wfl.2.2011.03.13.13.25.04
	(version=SSLv3 cipher=OTHER); Sun, 13 Mar 2011 13:25:05 -0700 (PDT)
Message-ID: <4D7D2816.5070202@gmail.com>
Date: Sun, 13 Mar 2011 13:24:54 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US;
	rv:1.9.2.15) Gecko/20110303 Thunderbird/3.1.9
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1300042739-17381-1-git-send-email-eric@eukrea.com>
	<1300042739-17381-2-git-send-email-eric@eukrea.com>
In-Reply-To: <1300042739-17381-2-git-send-email-eric@eukrea.com>
Subject: Re: [PATCH 2/9] apr-util: add 1.3.10
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
X-List-Received-Date: Sun, 13 Mar 2011 20:26:48 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/13/2011 11:58 AM, Eric Bénard wrote:
> Signed-off-by: Eric Bénard<eric@eukrea.com>


Acked-by: Khem Raj <raj.khem@gmail.com>
> ---
>   recipes/apr/apr-util_1.3.10.bb |   36 ++++++++++++++++++++++++++++++++++++
>   1 files changed, 36 insertions(+), 0 deletions(-)
>   create mode 100644 recipes/apr/apr-util_1.3.10.bb
>
> diff --git a/recipes/apr/apr-util_1.3.10.bb b/recipes/apr/apr-util_1.3.10.bb
> new file mode 100644
> index 0000000..ee32ddd
> --- /dev/null
> +++ b/recipes/apr/apr-util_1.3.10.bb
> @@ -0,0 +1,36 @@
> +DESCRIPTION = "Apache Portable Runtime (APR) companion library"
> +SECTION = "libs"
> +DEPENDS = "apr expat gdbm"
> +LICENSE = "Apache License, Version 2.0"
> +
> +PR = "r0"
> +
> +SRC_URI = "${APACHE_MIRROR}/apr/${P}.tar.gz \
> +           file://configfix.patch \
> +           file://configure_fixes.patch"
> +
> +EXTRA_OECONF = "--with-apr=${STAGING_BINDIR_CROSS}/apr-1-config \
> +		--with-dbm=gdbm \
> +		--with-gdbm=${STAGING_DIR_HOST}${layout_prefix} \
> +		--without-sqlite2 \
> +		--without-sqlite3 \
> +		--without-pgsql \
> +		--with-expat=${STAGING_DIR_HOST}${layout_prefix}"
> +
> +SRC_URI[md5sum] = "82acd25cf3df8c72eba44eaee8b80c19"
> +SRC_URI[sha256sum] = "7c37ac40b2351bfc23000fb6b7b54a67e0872255df315c82eb60c821bcef4b23"
> +
> +inherit autotools lib_package binconfig
> +
> +OE_BINCONFIG_EXTRA_MANGLE = " -e 's:location=source:location=installed:'"
> +
> +do_configure_prepend() {
> +	cp ${STAGING_DATADIR}/apr/apr_rules.mk ${S}/build/rules.mk
> +	echo "AC_PROG_LIBTOOL">>  ${S}/configure.in
> +}
> +
> +do_configure_append() {
> +	sed -i -e  s:apr_builders=/usr/share/build-1:apr_builders=${STAGING_DATADIR}/build-1:g ${S}/build/rules.mk
> +	sed -i /^LIBTOOL/d ${S}/build/rules.mk
> +	echo LIBTOOL="${HOST_SYS}-libtool --tag=CC">>  ${S}/build/rules.mk
> +}



