Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PX4C2-00005S-Tx
	for openembedded-devel@lists.openembedded.org;
	Mon, 27 Dec 2010 04:56:21 +0100
Received: by pvd12 with SMTP id 12so1655675pvd.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 26 Dec 2010 19:55:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:references:in-reply-to
	:content-type:content-transfer-encoding;
	bh=uP7q0aw7yGv1COmiOH+r7Ehcbb7yk5o1PURbJiFSNzc=;
	b=rOuts2ukDB0adLzmlTNNbOebTOKSzuBVOyjtSZIHRh0sg/ebuQJu1ff5yK2XwzRfHq
	ZaAkRBcbvs93s1oLcT55+e9SGQwtnDYnWxbgw5xOWUu9lw9qSyu6l1jC/W48uGQKcSO2
	+UoIU4dp8O7qv3ijmrzYATBIym/4apek4zHgY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=jeTtyT18ayOPXPkKsd9vvkN1nIht/rXQhtp7coxmveMYep5w+OY1U3xEKHxrKmjjfK
	MR7ZqmiT/0z/2M6JqBuzc0KcOkbd42kYRANDUTGqH1iSAvMIZRgn1WBPRTGzIr6kx8ts
	qeffuk8GoOWrl1gLUQQH7RobSROyLYV1fkYOw=
Received: by 10.143.3.6 with SMTP id f6mr9625445wfi.205.1293422152914;
	Sun, 26 Dec 2010 19:55:52 -0800 (PST)
Received: from [192.168.1.68] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id q13sm17051989wfc.17.2010.12.26.19.55.51
	(version=SSLv3 cipher=RC4-MD5); Sun, 26 Dec 2010 19:55:51 -0800 (PST)
Message-ID: <4D180E45.2010306@gmail.com>
Date: Sun, 26 Dec 2010 19:55:49 -0800
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US;
	rv:1.9.2.13) Gecko/20101207 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1293399498-14036-1-git-send-email-fransmeulenbroeks@gmail.com>
In-Reply-To: <1293399498-14036-1-git-send-email-fransmeulenbroeks@gmail.com>
Subject: Re: [PATCH v2] cpan_build.bbclass; added cc and ld flags to the perl Build.PL invocation
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
X-List-Received-Date: Mon, 27 Dec 2010 03:56:21 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/26/2010 1:38 PM, Frans Meulenbroeks wrote:
> Without these gcc would be used which resolves to /usr/bin/gcc
> and one gets an intel exe.
> This showed up with libparams-validate-perl and libdatetime-perl
> The LDFLAGS are added to resolve the GNU_HASH QA error
>
> Signed-off-by: Frans Meulenbroeks<fransmeulenbroeks@gmail.com>

Why a new dir called poky ?

> ---
>   classes/cpan_build.bbclass     |    1 +
>   classes/poky/cpan-base.bbclass |   42 ++++++++++++++++++++++++++++++++++++++++
>   classes/poky/cpan.bbclass      |   38 ++++++++++++++++++++++++++++++++++++
>   3 files changed, 81 insertions(+), 0 deletions(-)
>   create mode 100644 classes/poky/cpan-base.bbclass
>   create mode 100644 classes/poky/cpan.bbclass
>
> diff --git a/classes/cpan_build.bbclass b/classes/cpan_build.bbclass
> index d1bbc4f..070e061 100644
> --- a/classes/cpan_build.bbclass
> +++ b/classes/cpan_build.bbclass
> @@ -26,6 +26,7 @@ cpan_build_do_configure () {
>   		# build for target
>   		. ${STAGING_LIBDIR}/perl/config.sh
>   		perl Build.PL --installdirs vendor \
> +		        --config cc="${CC} ${LDFLAGS}" --config ld="${CCLD} ${LDFLAGS}" \
>   			--destdir ${D} \
>   			--install_path lib="${datadir}/perl5" \
>   			--install_path arch="${libdir}/perl5" \
> diff --git a/classes/poky/cpan-base.bbclass b/classes/poky/cpan-base.bbclass
> new file mode 100644
> index 0000000..3175248
> --- /dev/null
> +++ b/classes/poky/cpan-base.bbclass
> @@ -0,0 +1,42 @@
> +#
> +# cpan-base providers various perl related information needed for building
> +# cpan modules
> +#
> +FILES_${PN} += "${libdir}/perl5 ${datadir}/perl5"
> +
> +DEPENDS  += "${@["perl", "perl-native"][(bb.data.inherits_class('native', d))]}"
> +RDEPENDS  += "${@["perl", ""][(bb.data.inherits_class('native', d))]}"
> +
> +# Determine the staged version of perl from the perl configuration file
> +def get_perl_version(d):
> +	import re
> +    	cfg = bb.data.expand('${STAGING_LIBDIR}/perl/config.sh', d)
> +	try:
> +		f = open(cfg, 'r')
> +	except IOError:
> +		return None
> +	l = f.readlines();
> +	f.close();
> +	r = re.compile("^version='(\d*\.\d*\.\d*)'")
> +	for s in l:
> +		m = r.match(s)
> +		if m:
> +			return m.group(1)
> +	return None
> +
> +# Determine where the library directories are
> +def perl_get_libdirs(d):
> +	libdir = bb.data.getVar('libdir', d, 1)
> +	libdirs = libdir + '/*/*/perl5'
> +	return libdirs
> +
> +def is_target(d):
> +    if not bb.data.inherits_class('native', d):
> +        return "yes"
> +    return "no"
> +
> +PERLLIBDIRS = "${@perl_get_libdirs(d)}"
> +
> +FILES_${PN}-dbg += "${PERLLIBDIRS}/auto/*/.debug \
> +                    ${PERLLIBDIRS}/auto/*/*/.debug \
> +                    ${PERLLIBDIRS}/auto/*/*/*/.debug"
> diff --git a/classes/poky/cpan.bbclass b/classes/poky/cpan.bbclass
> new file mode 100644
> index 0000000..513f0b3
> --- /dev/null
> +++ b/classes/poky/cpan.bbclass
> @@ -0,0 +1,38 @@
> +#
> +# This is for perl modules that use the old Makefile.PL build system
> +#
> +inherit cpan-base
> +
> +EXTRA_CPANFLAGS ?= ""
> +
> +# Env var which tells perl if it should use host (no) or target (yes) settings
> +export PERLCONFIGTARGET = "${@is_target(d)}"
> +
> +# Env var which tells perl where the perl include files are
> +export PERL_INC = "${STAGING_LIBDIR}/perl/${@get_perl_version(d)}/CORE"
> +export PERL_LIB = "${STAGING_DATADIR}/perl/${@get_perl_version(d)}"
> +export PERL_ARCHLIB = "${STAGING_LIBDIR}/perl/${@get_perl_version(d)}"
> +
> +cpan_do_configure () {
> +	export PERL5LIB="${PERL_ARCHLIB}"
> +	yes '' | perl Makefile.PL ${EXTRA_CPANFLAGS}
> +	if [ "${BUILD_SYS}" != "${HOST_SYS}" ]; then
> +		. ${STAGING_LIBDIR}/perl/config.sh
> +		# Use find since there can be a Makefile generated for each Makefile.PL
> +		for f in `find -name Makefile.PL`; do
> +			f2=`echo $f | sed -e 's/.PL//'`
> +			sed -i -e "s:\(PERL_ARCHLIB = \).*:\1${PERL_ARCHLIB}:" \
> +			$f2
> +		done
> +	fi
> +}
> +
> +cpan_do_compile () {
> +	oe_runmake PASTHRU_INC="${CFLAGS}" CCFLAGS="${CFLAGS}" LD="${CCLD}"
> +}
> +
> +cpan_do_install () {
> +	oe_runmake DESTDIR="${D}" install_vendor
> +}
> +
> +EXPORT_FUNCTIONS do_configure do_compile do_install



