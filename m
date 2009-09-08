Received: from [78.47.116.19] (helo=sirius.lasnet.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1MlAwL-0007n8-MH
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Sep 2009 02:21:40 +0200
Received: from p5b035ec5.dip.t-dialin.net ([91.3.94.197] helo=dodger)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1Ml5IP-0007hK-3q by authid <stefan@sostec.de> with cram_md5;
	Tue, 08 Sep 2009 20:20:13 +0200
Received: from stefan by dodger with local (Exim 4.69)
	(envelope-from <stefan@dodger.lab.datenfreihafen.org>)
	id 1Ml5Ia-0002Nw-Os; Tue, 08 Sep 2009 20:20:12 +0200
Date: Tue, 8 Sep 2009 20:20:12 +0200
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090908182012.GA4674@dodger.lab.datenfreihafen.org>
References: <E1MZgdH-00057X-Lh@melo.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <E1MZgdH-00057X-Lh@melo.openembedded.org>
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 78.47.116.19
X-SA-Exim-Mail-From: stefan@datenfreihafen.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [oe-commits] Christopher Friedt : emotion_svn.bb: Make it look for edje_cc in STAGING_DIR.
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
X-List-Received-Date: Wed, 09 Sep 2009 00:21:40 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Sat, 2009-08-08 at 07:46, git version control wrote:
> 
> diff --git a/recipes/efl1/emotion_svn.bb b/recipes/efl1/emotion_svn.bb
> index 0f31e66..79b35d9 100644
> --- a/recipes/efl1/emotion_svn.bb
> +++ b/recipes/efl1/emotion_svn.bb
> @@ -3,7 +3,7 @@ LICENSE = "MIT BSD"
>  # we no longer build the libxine backend, since the gstreamer backend seems more promising
>  DEPENDS = "eet evas ecore edje gstreamer gst-plugins-base"
>  PV = "0.1.0.042+svnr${SRCREV}"
> -PR = "r2"
> +PR = "r3"
>  
>  inherit efl
>  
> @@ -12,3 +12,11 @@ EXTRA_OECONF = "--disable-xine --enable-gstreamer --with-edje-cc=${STAGING_BINDI
>  PACKAGES =+ "emotion-backend-gstreamer"
>  FILES_emotion-backend-gstreamer = "${libdir}/emotion/*.so"
>  RRECOMMENDS_${PN} = "emotion-backend-gstreamer"
> +
> +
> +do_configure_append() {
> +	for i in $(find ${WORKDIR}/emotion -name 'Makefile'); do 
> +		sed -i -e s:/usr/bin/edje_cc:${STAGING_DIR}/${BUILD_SYS}/usr/bin/edje_cc: \
> +			${i}
> +	done
> +}

Christopher, can you verify that the configure_append is really needed? I added
--with-edje-cc in EXTRA_OECONF, you can see a part of it above, to fix the
edje_cc native detection.

Starting a build from scratch today emotion fails for me as the sed entry messes
around with the path as follows:

| make[2]:
/home/sschmidt/oe/build/dev/tmp/staging/x86_64-linux/home/sschmidt/oe/build/dev/tmp/staging/x86_64-linux/usr/bin/edje_cc:
Command not found

Removing the do_configure_append again makes it work again over here.

regards
Stefan Schmidt


