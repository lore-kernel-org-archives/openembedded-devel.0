Received: from [78.46.147.237] (helo=gandharva.secretlabs.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1MbAV6-0001v2-Ng
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Aug 2009 11:52:08 +0200
Received: from tamarin.localnet (123-192-185-227.dynamic.kbronet.com.tw
	[123.192.185.227])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 751C31B10C04
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Aug 2009 09:39:00 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 12 Aug 2009 11:35:14 +0200
User-Agent: KMail/1.12.0 (Linux/2.6.31-rc4; KDE/4.3.0; i686; ; )
References: <1244124820-13930-1-git-send-email-ihar.hrachyshka@gmail.com>
	<1244132283.2611.127.camel@mill.internal.reciva.com>
In-Reply-To: <1244132283.2611.127.camel@mill.internal.reciva.com>
MIME-Version: 1.0
Message-Id: <200908121135.14408.holger+oe@freyther.de>
Subject: Re: [patch] autotools: detect missing depends for aclocal packages
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
X-List-Received-Date: Wed, 12 Aug 2009 09:52:08 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Thursday 04 June 2009 18:18:03 Phil Blundell wrote:
> On Thu, 2009-06-04 at 17:13 +0300, Ihar Hrachyshka wrote:
> > -DEPENDS = "gmp-native"
> > +DEPENDS = "gmp-native gettext-native"
>
> For laughs, here's a small patch to detect this kind of thing
> automatically in at least some cases.
>
> p.


Signed-Off-by: Holger Freyther <zecke@selfish.org>


>
> --
>
> diff --git a/classes/autotools.bbclass b/classes/autotools.bbclass
> index e43b289..214da3c 100644
> --- a/classes/autotools.bbclass
> +++ b/classes/autotools.bbclass
> @@ -67,6 +67,49 @@ oe_runconf () {
>  	fi
>  }
>
> +python autotools_do_check_aclocal() {
> +        frags = bb.data.expand('${T}/acfragments', d)
> +        bb.note(frags)
> +        if os.path.exists(frags):
> +                pcproviders = {}
> +                needed = []
> +                f = open(frags, "r")
> +                import re
> +                sr = re.compile("aclocal: saw macro (.*)")
> +                fr = re.compile("aclocal: found macro (.*) in .*/(.*).m4")
> +                for l in f.readlines():
> +                        l = l.rstrip()
> +                        m = sr.match(l)
> +                        if m:
> +                                if not m.group(1) in needed:
> +                                        needed.append(m.group(1))
> +                        else:
> +                                m = fr.match(l)
> +                                if m:
> +                                        pcproviders[m.group(1)] =
> m.group(2) +                f.close()
> +                needed_pkgs = []
> +                for n in needed:
> +                        if not pcproviders.has_key(n):
> +                                continue
> +                        fn =
> bb.data.expand("${STAGING_DIR}/${HOST_SYS}/acdeps/%s.m4" % pcproviders[n],
> d) +                        if os.path.exists(fn):
> +                                f = open(fn, "r")
> +                                p = f.readline().rstrip()
> +                                f.close()
> +                                if not p in needed_pkgs:
> +                                        needed_pkgs.append(p)
> +                deps = bb.data.getVar("DEPENDS", d, True).split()
> +                lost = []
> +                for n in needed_pkgs:
> +                        if not n in deps:
> +                                lost.append(n)
> +                if lost:
> +                        bb.note("possibly missing dependencies: %s" % "
> ".join(lost)) +}
> +
> +addtask check_aclocal after do_configure
> +
>  autotools_do_configure() {
>  	case ${PN} in
>  	autoconf*)
> @@ -126,6 +169,8 @@ autotools_do_configure() {
>  			  oenote Executing intltoolize --copy --force --automake
>  			  intltoolize --copy --force --automake
>  			fi
> +                        oenote Extracting list of required m4 fragments
> +                        aclocal --output=/dev/null --verbose 2>&1 | egrep
> '(^aclocal: found macro)|(^aclocal: saw macro)' > ${T}/acfragments || true
> oenote Executing autoreconf --verbose --install --force ${EXTRA_AUTORECONF}
> $acpaths mkdir -p m4
>  			autoreconf -Wcross --verbose --install --force ${EXTRA_AUTORECONF}
> $acpaths || oefatal "autoreconf execution failed." @@ -239,8 +284,14 @@
> autotools_stage_all() {
>  	rm -rf ${STAGE_TEMP}/${mandir} || true
>  	rm -rf ${STAGE_TEMP}/${infodir} || true
>  	autotools_stage_dir ${STAGE_TEMP}/${datadir} ${STAGING_DATADIR}
> +        if [ -d ${STAGE_TEMP}/${datadir}/aclocal ]; then
> +                mkdir -p ${STAGING_DIR}/${HOST_SYS}/acdeps
> +                for i in `find ${STAGE_TEMP}/${datadir}/aclocal/ -name
> '*.m4'`; do +                        echo ${PN} >
> ${STAGING_DIR}/${HOST_SYS}/acdeps/`basename $i` +                done
> +        fi
>  	rm -rf ${STAGE_TEMP}
>  }
>
> -EXPORT_FUNCTIONS do_configure do_install
> +EXPORT_FUNCTIONS do_configure do_install do_check_aclocal
>
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


