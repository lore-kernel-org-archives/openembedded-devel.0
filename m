Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TJNKA-0006Fs-NJ
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Oct 2012 13:41:10 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 03 Oct 2012 04:28:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,527,1344236400"; d="scan'208";a="229397586"
Received: from unknown (HELO helios.localnet) ([10.252.122.52])
	by fmsmga001.fm.intel.com with ESMTP; 03 Oct 2012 04:28:09 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 03 Oct 2012 12:28:08 +0100
Message-ID: <9997133.uIUMnIOYLI@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9.1 (Linux/3.2.0-31-generic-pae; KDE/4.9.1; i686; ; )
In-Reply-To: <k4h3gv$n4q$2@ger.gmane.org>
References: <cover.1349107616.git.paul.eggleton@linux.intel.com>
	<f4fa3e7556b5456ed8f9e5450669ab108bd08325.1349107616.git.paul.eggleton@linux.intel.com>
	<k4h3gv$n4q$2@ger.gmane.org>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-webserver][PATCH 3/6] modphp: add from OE-Classic
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
X-List-Received-Date: Wed, 03 Oct 2012 11:41:10 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 03 October 2012 12:20:16 Koen Kooi wrote:
> Op 01-10-12 18:14, Paul Eggleton schreef:
> > No modifications in this commit (apart from not copying some unneeded
> > files).

Again, this is the OE-Classic version prior to updating/fixing.

> > +RDEPENDS_${PN} = "apache2"
> 
> That one goes below do_installed

Fixed in the branch.

> > +DEPENDS = "apache2-native apache2 zlib" + +#SRC_URI =
> > "http://de3.php.net/distributions/php-${PV}.tar.bz2 \
> 
> remove that one

Already removed in the patch following.
 
> > +SRC_URI = "http://museum.php.net/php5/php-${PV}.tar.bz2 \ +
> > file://configure.patch \ +	  " + +S = "${WORKDIR}/php-${PV}" + +inherit
> > autotools + +FILES_${PN} = "${libdir}/apache2 /etc"
> 
> $sysconfdir

Already fixed in the patch following.

> > +FILES_${PN}-dbg += "${libdir}/apache2/modules/.debug"
> 
> and move below do_install

Already fixed in the patch following. 

> > + +CFLAGS += " -g -DPTYS_ARE_GETPT -DPTYS_ARE_SEARCHED
> > -I${STAGING_INCDIR_NATIVE}/apache2" + +EXTRA_OECONF =
> > "--with-apxs2=${STAGING_BINDIR_NATIVE}/apxs \ +
> > --without-mysql \ +		--enable-force-cgi-redirect \ +		--disable-cgi 
\ +
> > --disable-cli \ +		--disable-pdo \ +		--without-pear \ +		--
without-iconv
> > \ +		--disable-ipv6 \ +		--disable-xml \ +		--disable-xmlreader \ +
> > --disable-xmlwriter \ +		--disable-simplexml \ +		--disable-libxml 
\ +
> > --disable-dom \ +                --with-zlib
> > --with-zlib-dir=${STAGING_DIR}${layout_exec_prefix}/.. \ +
> > --with-config-file-path=/etc/php/apache2-php5"
> 
> whitespace errors

Already fixed in the patch following. (Did you look at those patches?)
 
> > +#		--with-libxml-dir=${STAGING_DIR_NATIVE}${layout_exec_prefix} \
> 
> remove

OK, I'll give you that one. Fixed in the branch.

> > + +# to get postgres support, add it to the DEPENDS above +# and
> > uncomment this line.  similar for mysql +#EXTRA_OECONF += "
> > --with-pgsql=${STAGING_DIR_HOST}${layout_exec_prefix}"
> 
> That is a PACKAGECONFIG change

We can make that enhancement at a later date, until then the comment is 
helpful.

> > diff --git a/meta-webserver/recipes-php/modphp/modphp_5.1.6.bb
> > b/meta-webserver/recipes-php/modphp/modphp_5.1.6.bb new file mode 100644
> > index 0000000..a75a742 --- /dev/null +++
> > b/meta-webserver/recipes-php/modphp/modphp_5.1.6.bb @@ -0,0 +1,5 @@
> > +include modphp5.inc 
> > +PR ='r3'
> 
> Double quotes are preferred, but I'm tempted to just say "drop the PR
> entirely"

I've already set it to "r0" using double quotes in the patch following.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


