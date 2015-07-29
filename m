Return-Path: <zboszor@pr.hu>
Received: from mail7.pr.hu (mail7.pr.hu [87.242.0.7])
	by mail.openembedded.org (Postfix) with ESMTP id C6688763C3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Jul 2015 13:26:36 +0000 (UTC)
Received: from [2a02:808:3:101::5] (helo=mail.pr.hu)
	by frontdoor.pr.hu with esmtps (TLS1.2:DHE_RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <zboszor@pr.hu>) id 1ZKRL9-0006Xq-Ex
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Jul 2015 15:24:11 +0200
Received: from [88.132.201.202] (helo=s002.sicom.com)
	by mail.pr.hu with esmtpsa (TLS1.2:DHE_RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <zboszor@pr.hu>) id 1ZKRNP-0000O1-PL
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Jul 2015 15:26:33 +0200
To: openembedded-devel@lists.openembedded.org
From: Boszormenyi Zoltan <zboszor@pr.hu>
X-Enigmail-Draft-Status: N1110
Message-ID: <55B8D485.7080207@pr.hu>
Date: Wed, 29 Jul 2015 15:26:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
X-Host-Lookup-Failed: Reverse DNS lookup failed for 88.132.201.202 (failed)
X-Spam-Score: 1.1 (+)
X-Scan-Signature: 89785d021493d0bbdcf3f583b5839e9c
X-Spam-Tracer: backend.mail.pr.hu 1.1 20150729132633Z
Subject: Trying to resolve build-time cyclic dependency between packages
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
X-List-Received-Date: Wed, 29 Jul 2015 13:26:39 -0000
X-Groupsio-MsgNum: 56426
Content-Type: multipart/mixed; boundary="------------010506090009070801060103"

--------------010506090009070801060103
Content-Type: text/plain; charset=iso-8859-2
Content-Transfer-Encoding: 8bit

Hi,

I have a customized Mesa 10.6.3 package recipe which depends on libva
to be able to build its mesa-va-driver subpackage, but libva also depends
on Mesa to support GLX.

Previously, I simply created a libva-noglx package that builds libva
with --disable-glx that Mesa depend on and the "real" libva package can
depend on Mesa.

But since I also have to produce an SDK image with all the *-dev packages,
creating such an initial image with bitbake fails because of a conflict
in the dependency chain: libva-dev -> mesa-dev -> libva-noglx-dev.

I have come up with the attached bbclass (based on Yocto 1.6) that
now Mesa can inherit and that patches the RDEPENDS / RRECOMMENDS
variables according to externally set variables. The comment at
the beginning of the file explains how to use it.

This pushes the cyclic dependency to opkg which happily breaks it and
installs both libva* and *mesa* packages properly. Creating the initial
image via bitbake works now.

Comments?

Best regards,
Zoltán Böszörményi


--------------010506090009070801060103
Content-Type: text/plain; charset=UTF-8;
 name="cyclic-deps.bbclass"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="cyclic-deps.bbclass"

# Resolve cyclic dependencies in final packages
#
# Example: Mesa vs libva cyclic dependency
#
# Resolving the cyclic dependency can be:
# 1. build libva without GLX support (libva-noglx package)
# 2. build mesa
# 3. build libva with GLX support
#
# Mesa's DEPENDS contains libva-noglx
# libva's DEPENDS contains mesa
# The subpackages of mesa will reference libva-noglx
#
# This class attempts to patch the final package dependencies
# with the following:
# CYCLIC_DEPENDS = "pkg"
# CYCLIC_DEPENDS_pkg = "basepkg"
#
# With the example of Mesa:
# CYCLIC_DEPENDS_PKGS = "libva"
# CYCLIC_DEPENDS_libva = "libva-noglx"

python package_depchains_append () {
    deps = d.getVar('CYCLIC_DEPENDS_PKGS', True).split()
    packages = d.getVar('PACKAGES', True).split()
    for pkg in packages:
        for dep in deps:
            depvar = 'CYCLIC_DEPENDS_' + dep
            basedep = d.getVar(depvar, True)
            bb.note("before cyclic dependency dep %s depvar %s basedep %s" % (dep, depvar, basedep))

            rdep = 'RDEPENDS_' + pkg
            rdepends = d.getVar(rdep, True)
            if rdepends:
                bb.note("before cyclic dependency fix %s = '%s'" % (rdep, rdepends))
                d.setVar(rdep, rdepends.replace(basedep, dep))
                bb.note("after cyclic dependency fix %s = '%s'" % (rdep, d.getVar(rdep, True)))

            rrec = 'RRECOMMENDS_' + pkg
            rrecommends = d.getVar(rrec, True)
            if rrecommends:
                bb.note("before cyclic dependency fix %s = '%s'" % (rrec, rrecommends))
                d.setVar(rrec, rrecommends.replace(basedep, dep))
                bb.note("after cyclic dependency fix %s = '%s'" % (rrec, d.getVar(rrec, True)))
}

--------------010506090009070801060103--
