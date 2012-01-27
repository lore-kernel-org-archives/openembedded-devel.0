Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@mi.fu-berlin.de>) id 1RqlaX-0002b5-1W
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 Jan 2012 14:11:33 +0100
Received: from relay1.zedat.fu-berlin.de ([130.133.4.67])
	by outpost1.zedat.fu-berlin.de (Exim 4.69)
	for openembedded-devel@lists.openembedded.org with esmtp
	(envelope-from <heinold@mi.fu-berlin.de>)
	id <1RqlT0-00081r-BB>; Fri, 27 Jan 2012 14:03:46 +0100
Received: from hydra.imp.fu-berlin.de ([160.45.117.149]
	helo=mail.imp.fu-berlin.de) by relay1.zedat.fu-berlin.de (Exim 4.69)
	for openembedded-devel@lists.openembedded.org with esmtp
	(envelope-from <heinold@mi.fu-berlin.de>)
	id <1RqlT0-00022g-8B>; Fri, 27 Jan 2012 14:03:46 +0100
Received: from andorra.imp.fu-berlin.de ([160.45.42.84])
	by mail.imp.fu-berlin.de with esmtps (MTA Exim 4.72) id
	1RqlSW-0000tu-Kw (envelope-from <heinold@mi.fu-berlin.de>)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jan 2012 14:03:32 +0100
Received: from heinold by andorra.imp.fu-berlin.de with local (client Exim
	4.72) id 1RqlSR-0007Vw-Es
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jan 2012 14:03:11 +0100
Date: Fri, 27 Jan 2012 14:03:11 +0100
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120127130311.GA18521@mi.fu-berlin.de>
References: <20120126054457.GE5566@sakrah.homelinux.org>
	<1327611041-7681-1-git-send-email-yauhen.kharuzhy@promwad.com>
MIME-Version: 1.0
In-Reply-To: <1327611041-7681-1-git-send-email-yauhen.kharuzhy@promwad.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Sender: Henning Heinold <heinold@mi.fu-berlin.de>
X-Remote-IP: 160.45.42.84
X-Spam_Score: -2.9
X-exim-Spam_Score_Int: -28
X-exim-Spam_Bar: --
X-Spam_Report: * -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
	* -0.0 T_RP_MATCHES_RCVD Envelope sender domain matches handover relay
	*      domain
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
X-Originating-IP: 160.45.117.149
Subject: Re: [PATCH v2] Add recipe for krb5
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
X-List-Received-Date: Fri, 27 Jan 2012 13:11:33 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 26, 2012 at 11:50:41PM +0300, Yauhen Kharuzhy wrote:
> Add building of MIT Kerberos implementation.
> 
> The recipe was picked from OE-Classic & updated to new version
> 
> Signed-off-by: Yauhen Kharuzhy <yauhen.kharuzhy@promwad.com>
> ---
>  meta/recipes-connectivity/krb5/krb5_1.8.5.bb |   39 ++++++++++++++++++++++++++
>  1 files changed, 39 insertions(+), 0 deletions(-)
>  create mode 100644 meta/recipes-connectivity/krb5/krb5_1.8.5.bb
> 
> diff --git a/meta/recipes-connectivity/krb5/krb5_1.8.5.bb b/meta/recipes-connectivity/krb5/krb5_1.8.5.bb
> new file mode 100644
> index 0000000..2f497a3
> --- /dev/null
> +++ b/meta/recipes-connectivity/krb5/krb5_1.8.5.bb
> @@ -0,0 +1,39 @@
> +DESCRIPTION = "A network authentication protocol"
> +HOMEPAGE = "http://web.mit.edu/Kerberos/"
> +SECTION = "console/network"
> +PR = "r0"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://${S}/../README;md5=5595a75ae6fab5f825f579a817baa618"
> +DEPENDS = "ncurses util-linux e2fsprogs-native"
> +
> +inherit autotools binconfig perlnative
> +
> +SRC_URI = "http://web.mit.edu/kerberos/dist/krb5/1.8/krb5-1.8.5-signed.tar"
> +
> +S = "${WORKDIR}/${PN}-${PV}/src/"
> +
> +EXTRA_OECONF += " --without-tcl --with-system-et"
> +CACHED_CONFIGUREVARS += "krb5_cv_attr_constructor_destructor=yes ac_cv_func_regcomp=yes \
> +                  ac_cv_printf_positional=yes ac_cv_file__etc_environment=yes \
> +                  ac_cv_file__etc_TIMEZONE=no"
> +
> +CFLAGS_append += "-DDESTRUCTOR_ATTR_WORKS=1 -I${STAGING_INCDIR}/et"
> +LDFLAGS_append += "-lpthread"
> +
> +FILES_${PN}-doc += ${datadir}/examples
> +

> +krb5_do_unpack() {
> +	tar xzf ${WORKDIR}/krb5-1.8.5.tar.gz -C ${WORKDIR}/
> +}
How do this differ from the unpack in the normal classes?

Are you able to clean it up?
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
> +SRC_URI[md5sum] = "48b17caedf19d07d714a8d7a25422c95"
> +SRC_URI[sha256sum] = "7d6989efaaf0b3330ce5b329edb1d0bf33250ca78b789fdd117e02c49c238812"
> -- 
> 1.7.7.6
> 

Did you check if it is a version which do not have security bugs?

Bye Henning


