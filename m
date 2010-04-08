Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1Nzo97-0006Xc-VS
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 Apr 2010 11:35:34 +0200
Received: from w0952.wlan.rz.tu-bs.de ([134.169.203.190] helo=excalibur)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1Nzo5r-0006be-3D by authid <stefan@sostec.de> with cram_md5;
	Thu, 08 Apr 2010 11:32:13 +0200
Received: from stefan by excalibur with local (Exim 4.71)
	(envelope-from <stefan@excalibur.local>)
	id 1Nzo5q-0005gG-OC; Thu, 08 Apr 2010 11:32:10 +0200
Date: Thu, 8 Apr 2010 11:32:10 +0200
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100408093210.GE27376@excalibur.local>
References: <1266262558.32499.31.camel@jjg-linux>
MIME-Version: 1.0
In-Reply-To: <1266262558.32499.31.camel@jjg-linux>
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 78.47.116.19
X-SA-Exim-Mail-From: stefan@datenfreihafen.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_HELO_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Michael Lauer <mickey@vanille-media.de>
Subject: Re: [PATCH 1/2] python: fix SSL for 2.6
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
X-List-Received-Date: Thu, 08 Apr 2010 09:35:34 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hallo.

On Mon, 2010-02-15 at 13:35, Jesse Gilles wrote:
> 
> This fixes SSL support for python 2.6.  Looks like the python module for
> SSL was missing from the package.

Mickey, can you have a look at this? Thanks.

> * Add SSL module to build -- fixes "import ssl"
> 
> diff --git a/contrib/python/generate-manifest-2.6.py b/contrib/python/generate-manifest-2.6.py
> index fe0e385..890d1c0 100755
> --- a/contrib/python/generate-manifest-2.6.py
> +++ b/contrib/python/generate-manifest-2.6.py
> @@ -248,7 +248,7 @@ if __name__ == "__main__":
>  
>      m.addPackage( "python-io", "Python Low-Level I/O", "python-core python-math",
>      "lib-dynload/_socket.so lib-dynload/_ssl.so lib-dynload/select.so lib-dynload/termios.so lib-dynload/cStringIO.so " +
> -    "pipes.* socket.* tempfile.* StringIO.* " )
> +    "pipes.* socket.* ssl.* tempfile.* StringIO.* " )
>  
>      m.addPackage( "python-json", "Python JSON Support", "python-core python-math python-re",
>      "json" ) # package
> diff --git a/recipes/python/python-2.6-manifest.inc b/recipes/python/python-2.6-manifest.inc
> index cee12c8..188ee31 100644
> --- a/recipes/python/python-2.6-manifest.inc
> +++ b/recipes/python/python-2.6-manifest.inc
> @@ -51,7 +51,7 @@ FILES_python-core="${libdir}/python2.6/__future__.* ${libdir}/python2.6/_abcoll.
>  
>  DESCRIPTION_python-io="Python Low-Level I/O"
>  RDEPENDS_python-io="python-core python-math"
> -FILES_python-io="${libdir}/python2.6/lib-dynload/_socket.so ${libdir}/python2.6/lib-dynload/_ssl.so ${libdir}/python2.6/lib-dynload/select.so ${libdir}/python2.6/lib-dynload/termios.so ${libdir}/python2.6/lib-dynload/cStringIO.so ${libdir}/python2.6/pipes.* ${libdir}/python2.6/socket.* ${libdir}/python2.6/tempfile.* ${libdir}/python2.6/StringIO.* "
> +FILES_python-io="${libdir}/python2.6/lib-dynload/_socket.so ${libdir}/python2.6/lib-dynload/_ssl.so ${libdir}/python2.6/lib-dynload/select.so ${libdir}/python2.6/lib-dynload/termios.so ${libdir}/python2.6/lib-dynload/cStringIO.so ${libdir}/python2.6/pipes.* ${libdir}/python2.6/socket.* ${libdir}/python2.6/ssl.* ${libdir}/python2.6/tempfile.* ${libdir}/python2.6/StringIO.* "
>  
>  DESCRIPTION_python-compiler="Python Compiler Support"
>  RDEPENDS_python-compiler="python-core"
> diff --git a/recipes/python/python.inc b/recipes/python/python.inc
> index 7e61f79..aff18db 100644
> --- a/recipes/python/python.inc
> +++ b/recipes/python/python.inc
> @@ -4,7 +4,7 @@ LICENSE = "PSF"
>  SECTION = "devel/python"
>  PRIORITY = "optional"
>  # bump this on every change in contrib/python/generate-manifest-2.6.py
> -INC_PR = "ml8"
> +INC_PR = "ml9"
>  
>  DEFAULT_PREFERENCE = "-26"

regards
Stefan Schmidt


