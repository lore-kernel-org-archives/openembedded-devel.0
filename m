Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1OdIOJ-0005Df-0X
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Jul 2010 09:46:28 +0200
Received: from test3.ibr.cs.tu-bs.de ([134.169.35.210] helo=excalibur.local)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1OdINu-0001Pp-Np by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Jul 2010 09:46:08 +0200
Received: from stefan by excalibur.local with local (Exim 4.72)
	(envelope-from <stefan@excalibur.local>) id 1OdINt-0007ZX-KF
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Jul 2010 09:46:01 +0200
Date: Mon, 26 Jul 2010 09:46:01 +0200
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100726074601.GA27921@excalibur.local>
References: <1279651497-20918-1-git-send-email-morphis@gravedo.de>
	<1279651497-20918-2-git-send-email-morphis@gravedo.de>
MIME-Version: 1.0
In-Reply-To: <1279651497-20918-2-git-send-email-morphis@gravedo.de>
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 78.47.116.19
X-SA-Exim-Mail-From: stefan@datenfreihafen.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 1/4] lvm2: rebase all recipes on a global lvm2.inc recipe
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
X-List-Received-Date: Mon, 26 Jul 2010 07:46:28 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Tue, 2010-07-20 at 20:44, Simon Busch wrote:
> This rebases all specific versions of lvm2 on a global recipe lvm2.inc which defines the
> common parameters for building lvm2. Staging is overwritten as we don't need any of the
> executables or manpages the build of lvm2 produces for any related builds.
> 
> Signed-off-by: Simon Busch <morphis@gravedo.de>

Looks good. Two comments below.

> diff --git a/recipes/lvm2/lvm2.inc b/recipes/lvm2/lvm2.inc
> new file mode 100644
> index 0000000..a7e37b5
> --- /dev/null
> +++ b/recipes/lvm2/lvm2.inc
> @@ -0,0 +1,20 @@
> +SECTION = "utils"
> +DESCRIPTION = "LVM2 is a set of utilities to manage logical volumes in Linux."
> +LICENSE = "GPL"
> +DEPENDS = "device-mapper"
> +INC_PR = "r2"
> +
> +S = "${WORKDIR}/LVM2.${PV}"
> +SRC_URI = "ftp://sources.redhat.com/pub/lvm2/old/LVM2.${PV}.tgz \
> +           file://crosscompile_fix.patch"
> +
> +# Unset user/group to unbreak install.
> +EXTRA_OECONF = "--with-user= --with-group= --disable-o_direct"
> +EXTRA_OECONF_arm = "--with-user= --with-group= --disable-o_direct"

I can see that you just merged this in from an already existing recipe, but do
we know why we have an overrirde for ARM here which changes nothing? Looks bogus
to me.

> +inherit autotools
> +
> +# We don't need to stage anything (the executables are no needed at build time by any
> +# other recipe)
> +do_stage() {
> +}

While we don't need the executables the don't hurd either IMHO. Can we get rid
of this?

regards
Stefan Schmidt


