Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RqION-0007vF-2I
	for openembedded-devel@lists.openembedded.org;
	Thu, 26 Jan 2012 07:01:03 +0100
Received: by dakf10 with SMTP id f10so165724dak.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jan 2012 21:53:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=MvnDHR/Y24PO09E8ZE7W1lqCsT7ML00csTUaU+a1J2c=;
	b=D5iCt2Fs+uoNTXVWv0cZ+/qxBV23JgAne1ni7NEkydIa3N/5GqRXygVnUDyBqa5PVk
	pc0lMFjqr2zvXf6scqozfISaVuhKKuOA11goOWbyIflf5z9tEa1VS69hIb+GuNP2fjIh
	Bd9tgFHkGbNNfgcoWLXJv66+ozt0E+O1By6yk=
Received: by 10.68.211.131 with SMTP id nc3mr2397957pbc.17.1327556703295;
	Wed, 25 Jan 2012 21:45:03 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id li19sm8346816pbb.17.2012.01.25.21.45.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 25 Jan 2012 21:45:02 -0800 (PST)
Date: Wed, 25 Jan 2012 21:44:57 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120126054457.GE5566@sakrah.homelinux.org>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <1327489879-29117-1-git-send-email-yauhen.kharuzhy@promwad.com>
MIME-Version: 1.0
In-Reply-To: <1327489879-29117-1-git-send-email-yauhen.kharuzhy@promwad.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH 09/10] Add recipe for krb5
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
X-List-Received-Date: Thu, 26 Jan 2012 06:01:03 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (25/01/12 14:11), Yauhen Kharuzhy wrote:
> Add building of MIT Kerberos implementation.
> 
> The recipe was picked from OE-Classic & updated to new version
> 
> Signed-off-by: Yauhen Kharuzhy <yauhen.kharuzhy@promwad.com>
> ---
>  meta/recipes-connectivity/krb5/krb5_1.8.5.bb |   98 ++++++++++++++++++++++++++
>  1 files changed, 98 insertions(+), 0 deletions(-)
>  create mode 100644 meta/recipes-connectivity/krb5/krb5_1.8.5.bb
> 
> diff --git a/meta/recipes-connectivity/krb5/krb5_1.8.5.bb b/meta/recipes-connectivity/krb5/krb5_1.8.5.bb
> new file mode 100644
> index 0000000..2004213
> --- /dev/null
> +++ b/meta/recipes-connectivity/krb5/krb5_1.8.5.bb
> @@ -0,0 +1,98 @@
> +DESCRIPTION = "A network authentication protocol"
> +HOMEPAGE = "http://web.mit.edu/Kerberos/"
> +SECTION = "console/network"
> +PR = "r0"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://${S}/../README;md5=5595a75ae6fab5f825f579a817baa618"
> +DEPENDS = "perl-native ncurses util-linux e2fsprogs-native"
> +
> +inherit autotools binconfig

should you inherit perlnative here as well

> +
> +SRC_URI = "http://web.mit.edu/kerberos/dist/krb5/1.8/krb5-1.8.5-signed.tar"
> +
> +S = "${WORKDIR}/${PN}-${PV}/src/"
> +
> +# Will clean this up...
> +EXTRA_OECONF += " --without-tcl krb5_cv_attr_constructor_destructor=yes ac_cv_func_regcomp=yes \
> +                  ac_cv_printf_positional=yes ac_cv_file__etc_environment=yes \
> +                  ac_cv_file__etc_TIMEZONE=no --with-system-et"

the variable caching should be specified differently

CACHED_CONFIGUREVARS += "krb5_cv_attr_constructor_destructor=yes \
ac_cv_func_regcomp=yes ac_cv_printf_positional=yes
ac_cv_file__etc_environment=yes ac_cv_file__etc_TIMEZONE=no"

EXTRA_OECONF += "--without-tcl --with-system-et"


> +CFLAGS_append += "-DDESTRUCTOR_ATTR_WORKS=1 -I${STAGING_INCDIR}/et"
> +LDFLAGS_append += "-lpthread"
> +

why append why not just += 

> +FILES_${PN}-doc += /usr/share/examples
> +

use variables here ${datadir}/examples

> +krb5_do_unpack() {
> +	tar xzf ${WORKDIR}/krb5-1.8.5.tar.gz -C ${WORKDIR}/
> +}
> +
> +python do_unpack() {
> +	bb.build.exec_func('base_do_unpack', d)
> +	bb.build.exec_func('krb5_do_unpack', d)
> +}
> +
> +do_configure() {
> +	oe_runconf
> +}
> +
> +#do_install_append () {
> +#	mv ${D}${bindir}/ftp ${D}${bindir}/ftp.${PN}
> +#	mv ${D}${sbindir}/ftpd ${D}${sbindir}/ftpd.${PN}
> +#	mv ${D}${bindir}/telnet ${D}${bindir}/telnet.${PN}
> +#	mv ${D}${sbindir}/telnetd ${D}${sbindir}/telnetd.${PN}
> +#}
> +
> +pkg_postinst_${PN} () {
> +#!/bin/sh
> +	update-alternatives --install ${bindir}/ftp ftp ftp.${PN} 100
> +	update-alternatives --install ${sbindir}/ftpd ftpd ftpd.${PN} 100
> +	update-alternatives --install ${bindir}/telnet telnet telnet.${PN} 100
> +	update-alternatives --install ${sbindir}/telnetd telnetd telnetd.${PN} 100
> +}
> +
> +pkg_prerm_${PN} () {
> +#!/bin/sh
> +	update-alternatives --remove ftp ftp.${PN} 100
> +	update-alternatives --remove ftpd ftpd.${PN} 100
> +	update-alternatives --remove telnet telnet.${PN} 100
> +	update-alternatives --remove telnetd telnetd.${PN} 100
> +}
> +
> +#do_install() {
> +#	oe_libinstall -so -C util/support libkrb5support ${STAGING_LIBDIR}
> +#	oe_libinstall -so -C util/et libcom_err ${STAGING_LIBDIR}
> +#	oe_libinstall -so -C lib/crypto libk5crypto ${STAGING_LIBDIR}
> +#	oe_libinstall -so -C lib/krb5 libkrb5 ${STAGING_LIBDIR}
> +#	oe_libinstall -so -C lib/gssapi libgssapi_krb5 ${STAGING_LIBDIR}
> +#	oe_libinstall -so -C lib/rpc libgssrpc ${STAGING_LIBDIR}
> +#	oe_libinstall -so -C lib/kdb libkdb5 ${STAGING_LIBDIR}
> +#	oe_libinstall -so -C lib/kadm5/clnt libkadm5clnt ${STAGING_LIBDIR}
> +#	oe_libinstall -so -C lib/kadm5/srv libkadm5srv ${STAGING_LIBDIR}
> +#
> +#	install -d ${STAGING_INCDIR}/krb5
> +#	for X in krb5.h locate_plugin.h
> +#	do
> +#		install -m 0644 ${S}/include/krb5/$X ${STAGING_INCDIR}/krb5/$X
> +#	done
> +#
> +#	install -d ${STAGING_INCDIR}/gssapi
> +#	for X in gssapi_generic.h gssapi.h gssapi_krb5.h
> +#	do
> +#		install -m 0644 ${S}/include/gssapi/$X ${STAGING_INCDIR}/gssapi/$X
> +#	done
> +#	install -m 0644 ${S}/lib/gssapi/mechglue/mechglue.h ${STAGING_INCDIR}/gssapi/mechglue.h
> +#
> +#	install -d ${STAGING_INCDIR}/gssrpc
> +#	for X in auth.h auth_gss.h auth_gssapi.h auth_unix.h clnt.h netdb.h pmap_clnt.h pmap_prot.h pmap_rmt.h rename.h rpc.h rpc_msg.h svc.h svc_auth.h xdr.h types.h
> +#	do
> +#		install -m 0644 ${S}/include/gssrpc/$X ${STAGING_INCDIR}/gssrpc/$X
> +#	done
> +#
> +#	# com_err.h needs to be added here if you choose to use this builtin
> +#	for X in krb5.h profile.h gssapi.h
> +#	do
> +#		install -m 0644 ${S}/include/$X ${STAGING_INCDIR}/$X
> +#	done
> +#}
> +
> +SRC_URI[md5sum] = "48b17caedf19d07d714a8d7a25422c95"
> +SRC_URI[sha256sum] = "7d6989efaaf0b3330ce5b329edb1d0bf33250ca78b789fdd117e02c49c238812"
> -- 
> 1.7.6.4
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

-- 
-Khem


