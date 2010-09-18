Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Ox4MY-0003yt-IU for openembedded-devel@lists.openembedded.org;
	Sat, 18 Sep 2010 22:50:28 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Ox4Lj-0004EK-Uf for openembedded-devel@lists.openembedded.org;
	Sat, 18 Sep 2010 22:49:31 +0200
Received: from pool-96-240-180-126.ronkva.east.verizon.net ([96.240.180.126])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Sep 2010 22:49:31 +0200
Received: from philip by pool-96-240-180-126.ronkva.east.verizon.net with
	local (Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Sep 2010 22:49:31 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Philip Balister <philip@balister.org>
Date: Sat, 18 Sep 2010 16:49:23 -0400
Message-ID: <i738kk$sb6$1@dough.gmane.org>
References: <1280886048-6272-1-git-send-email-clarson@kergoth.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: pool-96-240-180-126.ronkva.east.verizon.net
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.9) Gecko/20100907 Fedora/3.1.3-1.fc13 Thunderbird/3.1.3
In-Reply-To: <1280886048-6272-1-git-send-email-clarson@kergoth.com>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH (resend)] image.bbclass: implement IMAGE_FEATURES
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
X-List-Received-Date: Sat, 18 Sep 2010 20:50:28 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/03/2010 09:40 PM, Chris Larson wrote:
> From: Christopher Larson<clarson@mvista.com>
>
> This adds the ability to include groups of packages in an image.  It is
> similar in concept to the IMAGE_FEATURES used in Poky, but here we use
> IMAGE_FEATURE_<feature>  and IMAGE_FEATURE_<feature>_OPTIONAL, rather than
> base_contains calls.
>
> Initially defined groups:
> base - the packages requested via IMAGE_INSTALL&  IMAGE_BOOT
> dbg - debug packages
> dev - development packages
> doc - documentation packages (of limited use at the moment due to task.bbclass)
> vmlinux - kernel debugging packages (just kernel-vmlinux at the moment)
>
> To add groups to your images:
> IMAGE_FEATURES += "dbg dev"
>
> To add a new package group:
> IMAGE_FEATURE_myfeature = "gstreamer python pulseaudio"
>
> Signed-off-by: Chris Larson<clarson@mvista.com>

Acked-by: Philip Balister <philip@balister.org>

Works for me. I'm using it to install and the -dbg packages in an image 
so I can oprofile better.

Philip
> ---
>   classes/image.bbclass |  101 ++++++++++++++++++++++++++++++++++++++++++++++++-
>   1 files changed, 99 insertions(+), 2 deletions(-)
>
> diff --git a/classes/image.bbclass b/classes/image.bbclass
> index 2105195..30137be 100644
> --- a/classes/image.bbclass
> +++ b/classes/image.bbclass
> @@ -29,11 +29,10 @@ ${IMAGE_DEV_MANAGER} \
>   ${IMAGE_INIT_MANAGER} \
>   ${IMAGE_LOGIN_MANAGER} "
>
> -RDEPENDS += "${IMAGE_INSTALL} ${IMAGE_BOOT}"
> +RDEPENDS += "${__PACKAGE_INSTALL}"
>
>   # "export IMAGE_BASENAME" not supported at this time
>   IMAGE_BASENAME[export] = "1"
> -export PACKAGE_INSTALL ?= "${IMAGE_INSTALL} ${IMAGE_BOOT}"
>
>   # We need to recursively follow RDEPENDS and RRECOMMENDS for images
>   do_rootfs[recrdeptask] += "do_deploy do_populate_sysroot"
> @@ -61,6 +60,7 @@ python () {
>       bb.data.setVarFlag('do_rootfs', 'depends', deps, d)
>
>       runtime_mapping_rename("PACKAGE_INSTALL", d)
> +    runtime_mapping_rename("PACKAGE_INSTALL_ATTEMPTONLY", d)
>   }
>
>   #
> @@ -107,6 +107,103 @@ IMAGE_LINGUAS ?= "de-de fr-fr en-gb"
>
>   LINGUAS_INSTALL = "${@" ".join(map(lambda s: "locale-base-%s" % s, bb.data.getVar('IMAGE_LINGUAS', d, 1).split()))}"
>
> +def __pkgmap(d):
> +    from os import listdir
> +    from os.path import isdir, join, dirname
> +
> +    os = d.getVar("TARGET_OS", True)
> +    vendor = d.getVar("TARGET_VENDOR", True)
> +    basedir = dirname(d.getVar("PKGDATA_DIR", True))
> +
> +    dirs = ("%s%s-%s" % (arch, vendor, os)
> +            for arch in d.getVar("PACKAGE_ARCHS", True).split())
> +
> +    for pkgdatadir in (join(basedir, sys) for sys in dirs):
> +        try:
> +            files = listdir(pkgdatadir)
> +        except OSError:
> +            continue
> +
> +        for pn in filter(lambda f: not isdir(join(pkgdatadir, f)), files):
> +            try:
> +                pkgdata = read_pkgdatafile(join(pkgdatadir, pn))
> +            except OSError:
> +                continue
> +
> +            for pkg in pkgdata["PACKAGES"].split():
> +                yield pkg, pn
> +
> +def pkgmap(d):
> +    pkgmap_data = d.getVar("__pkgmap_data", False)
> +    if pkgmap_data is None:
> +        pkgmap_data = dict(__pkgmap(d))
> +        d.setVar("__pkgmap_data", pkgmap_data)
> +
> +    return pkgmap_data
> +
> +def recipename(pkg, d):
> +    return pkgmap(d).get(pkg)
> +
> +def pkgjoin(l):
> +    return ' '.join(set(l))
> +
> +def pkgsplit(var, d):
> +    return (d.getVar(var, True) or "").split()
> +
> +def __packages(features, d):
> +    for feature in features:
> +        for pkg in pkgsplit('IMAGE_FEATURE_%s' % feature, d):
> +            yield pkg
> +
> +def required_packages(features, d):
> +    for pkg in __packages((f for f in features if not d.getVar("IMAGE_FEATURE_%s_OPTIONAL" % f, True)), d):
> +        yield pkg
> +
> +def optional_packages(features, d):
> +    for pkg in __packages((f for f in features if d.getVar("IMAGE_FEATURE_%s_OPTIONAL" % f, True)), d):
> +        yield pkg
> +
> +def active_packages(features, d):
> +    from itertools import chain
> +
> +    for pkg in chain(required_packages(features, d), optional_packages(features, d)):
> +        yield pkg
> +
> +def active_recipes(features, d):
> +    for pkg in active_packages(features, d):
> +        recipe = recipename(pkg, d)
> +        if recipe:
> +            yield recipe
> +
> +def image_features_noextras(d):
> +    for f in d.getVar("IMAGE_FEATURES", True).split():
> +        if not f in ('dbg', 'dev', 'doc'):
> +            yield f
> +
> +def dbg_packages(d):
> +    from itertools import chain
> +
> +    features = image_features_noextras(d)
> +    return pkgjoin("%s-dbg" % pkg for pkg in chain(active_packages(features, d), active_recipes(features, d)))
> +
> +__PACKAGE_INSTALL = "${@' '.join(required_packages(d.getVar('IMAGE_FEATURES', True).split(), d))}"
> +PACKAGE_INSTALL = "${__PACKAGE_INSTALL}"
> +PACKAGE_INSTALL_ATTEMPTONLY = "${@' '.join(optional_packages(d.getVar('IMAGE_FEATURES', True).split(), d))}"
> +
> +IMAGE_FEATURES ?= ""
> +IMAGE_FEATURES_prepend = "base "
> +
> +# Define our default available image features
> +IMAGE_FEATURE_base = "${IMAGE_INSTALL} ${IMAGE_BOOT}"
> +IMAGE_FEATURE_vmlinux = "kernel-vmlinux"
> +
> +IMAGE_FEATURE_dbg = "${@dbg_packages(d)}"
> +IMAGE_FEATURE_dbg_OPTIONAL = "1"
> +IMAGE_FEATURE_dev = "${@pkgjoin('%s-dev' % pn for pn in active_recipes(image_features_noextras(d), d))}"
> +IMAGE_FEATURE_dev_OPTIONAL = "1"
> +IMAGE_FEATURE_doc = "${@pkgjoin('%s-doc' % pn for pn in active_recipes(image_features_noextras(d), d))}"
> +IMAGE_FEATURE_doc_OPTIONAL = "1"
> +
>   do_rootfs[nostamp] = "1"
>   do_rootfs[dirs] = "${TOPDIR}"
>   do_build[nostamp] = "1"




