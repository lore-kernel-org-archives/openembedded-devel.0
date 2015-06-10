Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8D58A6E277
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Jun 2015 08:14:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t5A8E6qO024462
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Jun 2015 01:14:06 -0700 (PDT)
Received: from [128.224.162.136] (128.224.162.136) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 10 Jun 2015 01:14:05 -0700
Message-ID: <5577F1CC.9030900@windriver.com>
Date: Wed, 10 Jun 2015 16:14:04 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1433337060-13188-1-git-send-email-rongqing.li@windriver.com>
In-Reply-To: <1433337060-13188-1-git-send-email-rongqing.li@windriver.com>
Subject: Re: [PATCH][meta-oe][V2] php: add a vardeps for configure on sysconfdir
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 10 Jun 2015 08:14:10 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

please drop it, I will re-fix it

-Roy

On 2015年06月03日 21:11, rongqing.li@windriver.com wrote:
> From: Roy Li <rongqing.li@windriver.com>
>
> Installing target file will fail when sstate is used, since native php is used
> to install these files, makefile rule is in php-5.5.24/pear/Makefile.frag
> |--------------------------------------
> |install-pear-installer: $(SAPI_CLI_PATH)
> |	@$(PHP_NATIVE_DIR)/php $(PEAR_INSTALL_FLAGS) $(builddir)/install-pear-nozlib.phar \
> |-d "$(peardir)" -b "$(bindir)" ${PEAR_PREFIX} ${PEAR_SUFFIX}
> |--------------------------------------
> But if sstate is used, native php from sstate has some obsolete path, lead to
> that config file is installed into obsolete path.
>
> Other packages fixed this kinds of issue by calling create_wrapper, like
> in openssl, rpm; but test show it does not work for php.
>
> only php depends on php-native, so add a vardeps for configure on sysconfdir
> to force php-native to build always.
>
> Signed-off-by: Roy Li <rongqing.li@windriver.com>
> ---
>   meta-oe/recipes-devtools/php/php_5.5.24.bb | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/meta-oe/recipes-devtools/php/php_5.5.24.bb b/meta-oe/recipes-devtools/php/php_5.5.24.bb
> index 3e656af..9c0dd7f 100644
> --- a/meta-oe/recipes-devtools/php/php_5.5.24.bb
> +++ b/meta-oe/recipes-devtools/php/php_5.5.24.bb
> @@ -106,6 +106,8 @@ EXTRA_OEMAKE = "INSTALL_ROOT=${D}"
>
>   acpaths = ""
>
> +do_configure[vardeps] += "${sysconfdir}"
> +
>   do_configure_prepend () {
>       rm -f ${S}/build/libtool.m4 ${S}/ltmain.sh ${S}/aclocal.m4
>       find ${S} -name config.m4 | xargs -n1 sed -i 's!APXS_HTTPD=.*!APXS_HTTPD=${STAGING_BINDIR_NATIVE}/httpd!'
>

-- 
Best Reagrds,
Roy | RongQing Li

