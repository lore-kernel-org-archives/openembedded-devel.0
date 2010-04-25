Received: from www.xora.org.uk ([80.68.91.202] helo=xora.vm.bytemark.co.uk)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dp@xora.org.uk>) id 1O67ti-00030E-4t
	for openembedded-devel@lists.openembedded.org;
	Sun, 25 Apr 2010 21:53:57 +0200
Received: from localhost (localhost [127.0.0.1])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTP id D48B1A4034
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Apr 2010 20:50:07 +0100 (BST)
X-Virus-Scanned: Debian amavisd-new at xora.vm.bytemark.co.uk
Received: from xora.vm.bytemark.co.uk ([127.0.0.1])
	by localhost (xora.vm.bytemark.co.uk [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id AdEOtRj3QhFk
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Apr 2010 20:50:06 +0100 (BST)
Received: from xora-desktop.xora.org.uk (188-220-34-37.zone11.bethere.co.uk
	[188.220.34.37])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTPSA id 50E07A4030
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Apr 2010 20:50:06 +0100 (BST)
Received: by xora-desktop.xora.org.uk (Postfix, from userid 500)
	id 0776722E46; Sun, 25 Apr 2010 20:52:02 +0100 (BST)
Date: Sun, 25 Apr 2010 20:52:02 +0100
From: Graeme Gregory <dp@xora.org.uk>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100425195202.GC2555@xora-desktop.xora.org.uk>
References: <hr25nh$nft$1@dough.gmane.org>
MIME-Version: 1.0
In-Reply-To: <hr25nh$nft$1@dough.gmane.org>
User-Agent: Mutt/1.5.20 (2009-08-17)
X-SA-Exim-Connect-IP: 80.68.91.202
X-SA-Exim-Mail-From: dp@xora.org.uk
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: a38e7ff2810e55455c7ff7b01d4882344b420e18 breaks build and packaged-staging, among other things
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
X-List-Received-Date: Sun, 25 Apr 2010 19:53:57 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Im sorry I dont know vala at all, but should those VAPI files be put
into -dev packages? basicall add a do_install_append and a FILES=

Doing so would make them appear automagically in staging anyway.

Graeme

On Sun, Apr 25, 2010 at 09:38:24PM +0200, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> Hi,
> 
> Looking at
> http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=a38e7ff2810e55455c7ff7b01d4882344b420e18
> I see:
> 
> - -do_stage_append() {
> +vala_do_stage_vapi() {
>  	install -d ${STAGING_DATADIR_NATIVE}/vala/vapi
>  	for VALAFILE in `find . -name "*.vapi" | grep -v
> "$VALA_DONT_STAGE_VAPIS"`; do install -m 0644 ${VALAFILE}
> ${STAGING_DATADIR_NATIVE}/vala/vapi/; done
>  	for VALAFILE in `find . -name "*.deps" | grep -v
> "$VALA_DONT_STAGE_VAPIS"`; do install -m 0644 ${VALAFILE}
> ${STAGING_DATADIR_NATIVE}/vala/vapi/; done
>  }
> +
> +EXPORT_FUNCTIONS do_stage_vapi
> +
> +addtask stage_vapi after do_populate_staging before do_package
> 
> Attentive readers will see that anything using vala.bbclass will now
> stage things needed for downstream dependencies outside of do_stage
> *and* do_install()
> 
> This means that doing
> 
> bitbake something-depending-on-vala-stuf
> 
> is now broken because bitbake will run
> something-depending-on-vala-stuf.do_configure and compile after
> vala-stuff.do_populate_staging and the vapi files will NOT be there.
> 
> The other problem is that the packaged-staging packages won't contain
> the vapi files, so rebuilding staging it broken as well.
> 
> So all in all: please revert that.
> 
> regards,
> 
> Koen
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
> 
> iD8DBQFL1JowMkyGM64RGpERAnRZAJ4qt9DIkXen+f8KTqp9yWE7YZfibQCdHUAo
> mS3KolPmIvCmOv1F4GHzPS4=
> =UAn/
> -----END PGP SIGNATURE-----
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


