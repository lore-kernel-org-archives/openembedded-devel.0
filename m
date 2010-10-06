Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1P3RNi-0007ux-DK
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 Oct 2010 12:38:00 +0200
Received: from guest190.ibr.cs.tu-bs.de ([134.169.35.190] helo=excalibur.local)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1P3RNN-0001YW-BF by authid <stefan@sostec.de> with cram_md5;
	Wed, 06 Oct 2010 12:37:35 +0200
Received: from stefan by excalibur.local with local (Exim 4.72)
	(envelope-from <stefan@excalibur.local>)
	id 1P3RNM-0000xl-2n; Wed, 06 Oct 2010 12:37:32 +0200
Date: Wed, 6 Oct 2010 12:37:32 +0200
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: dfoley <dfoley@telus.net>
Message-ID: <20101006103731.GG3517@excalibur.local>
References: <AANLkTikzKs+3U0JfEbQxg5dLVuMF51To2qTn55YLOmjg@mail.gmail.com>
	<20101005123257.GD3517@excalibur.local>
	<4CAB3B4D.9000007@telus.net>
MIME-Version: 1.0
In-Reply-To: <4CAB3B4D.9000007@telus.net>
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
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: testing 2010-10-04
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
X-List-Received-Date: Wed, 06 Oct 2010 10:38:00 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Tue, 2010-10-05 at 07:50, dfoley wrote:
> 
> May not be correct, but I ran into the same problem and patched.
> 
> diff --git a/recipes/cacao/cacao.inc b/recipes/cacao/cacao.inc
> index c366b74..70bda75 100644
> --- a/recipes/cacao/cacao.inc
> +++ b/recipes/cacao/cacao.inc
> @@ -23,7 +23,7 @@ EXTRA_OECONF = "\
>  	${@['','--enable-softfloat'][bb.data.getVar('TARGET_FPU',d,1) == 'soft']} \
>  	--enable-debug \
>  	--with-vm-zip=${datadir}/cacao/vm.zip \
> -	--with-cacaoh=${STAGING_BINDIR_NATIVE}/cacaoh-${PV} \
> +	--with-cacaoh=${STAGING_BINDIR_NATIVE}/cacaoh-${PV}/cacaoh \
>      --with-build-java-runtime-library-classes=${STAGING_DATADIR}/classpath/glibj.zip \
>      --with-java-runtime-library-classes=${datadir}/classpath/glibj.zip \
>      --with-java-runtime-library-libdir=${libdir_jni}:${libdir} \

This does it fix for me as well. I wonder from which commit the  directory
change was triggered in the last week.

Care to send a git formatted patch with PR bump I could apply? As you did the
work you should get the credits for it. :)

regards
Stefan Schmidt 


