Received: from [206.46.173.15] (helo=vms173015pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1N1On9-0001tc-NP
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Oct 2009 20:23:14 +0200
Received: from gandalf.denix.org ([71.251.63.147]) by vms173015.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KRZ001SPCBM2KGX@vms173015.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Fri,
	23 Oct 2009 13:21:35 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id EC20614AF60; Fri,
	23 Oct 2009 14:21:21 -0400 (EDT)
Date: Fri, 23 Oct 2009 14:21:21 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20091023182121.GA28604@denix.org>
References: <200910230504.57681.holger+oe@freyther.de>
	<1256286976.4529.117.camel@mill.internal.reciva.com>
	<hbrs68$gbd$1@ger.gmane.org> <200910231133.11053.holger+oe@freyther.de>
	<hbs7hq$j3v$1@ger.gmane.org>
	<1256301732.4529.161.camel@mill.internal.reciva.com>
MIME-version: 1.0
In-reply-to: <1256301732.4529.161.camel@mill.internal.reciva.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.15
X-SA-Exim-Mail-From: denis@denix.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Revert "package bbclass: strip static libs as well"
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
X-List-Received-Date: Fri, 23 Oct 2009 18:23:16 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Fri, Oct 23, 2009 at 01:42:12PM +0100, Phil Blundell wrote:
> On Fri, 2009-10-23 at 14:28 +0200, Koen Kooi wrote:
> > -libc_baselibs = "${base_libdir}/libcrypt*.so.* 
> > ${base_libdir}/libcrypt-*.so ${base_libdir}/libc*.so.* 
> > ${base_libdir}/libc-*.so ${base_libdir}/libm*.so.* 
> > ${base_libdir}/libm-*.so ${base_libdir}/ld*.so.* ${base_libdir}/ld-*.so 
> > ${base_libdir}/libpthread*.so.* ${base_libdir}/libpthread-*.so 
> > ${base_libdir}/libresolv*.so.* ${base_libdir}/libresolv-*.so 
> > ${base_libdir}/librt*.so.* ${base_libdir}/librt-*.so 
> > ${base_libdir}/libutil*.so.* ${base_libdir}/libutil-*.so 
> > ${base_libdir}/libnsl*.so.* ${base_libdir}/libnsl-*.so 
> > ${base_libdir}/libnss_files*.so.* ${base_libdir}/libnss_files-*.so 
> > ${base_libdir}/libnss_compat*.so.* ${base_libdir}/libnss_compat-*.so 
> > ${base_libdir}/libnss_dns*.so.* ${base_libdir}/libnss_dns-*.so 
> > ${base_libdir}/libdl*.so.* ${base_libdir}/libdl-*.so 
> > ${base_libdir}/libanl*.so.* ${base_libdir}/libanl-*.so 
> > ${base_libdir}/libBrokenLocale*.so.* ${base_libdir}/libBrokenLocale-*.so"
> > +libc_baselibs = "${base_libdir}/libcrypt*.so.* 
> > ${base_libdir}/libcrypt-*.so ${base_libdir}/libc*.so.* 
> > ${base_libdir}/libc-*.so ${base_libdir}/libm*.so.* 
> > ${base_libdir}/libm-*.so ${base_libdir}/ld*.so.* ${base_libdir}/ld-*.so 
> > ${base_libdir}/libpthread*.so.* ${base_libdir}/libpthread-*.so 
> > ${base_libdir}/libresolv*.so.* ${base_libdir}/libresolv-*.so 
> > ${base_libdir}/librt*.so.* ${base_libdir}/librt-*.so 
> > ${base_libdir}/libutil*.so.* ${base_libdir}/libutil-*.so 
> > ${base_libdir}/libnsl*.so.* ${base_libdir}/libnsl-*.so 
> > ${base_libdir}/libnss_files*.so.* ${base_libdir}/libnss_files-*.so 
> > ${base_libdir}/libnss_compat*.so.* ${base_libdir}/libnss_compat-*.so 
> > ${base_libdir}/libnss_dns*.so.* ${base_libdir}/libnss_dns-*.so 
> > ${base_libdir}/libdl*.so.* ${base_libdir}/libdl-*.so 
> > ${base_libdir}/libanl*.so.* ${base_libdir}/libanl-*.so 
> > ${base_libdir}/libBrokenLocale*.so.* ${base_libdir}/libBrokenLocale-*.so 
> > ${base_libdir}/libcidn-*.so  ${base_libdir}/libmemusage.so"
> 
> It took me a moment to spot what was actually happening here, but I
> think this is a step in the wrong direction.  Libmemusage is not
> something that most folks are going to want in their rootfs; libcidn is
> a bit more debatable but I suspect that at least some people will view
> it as bloat.  I would prefer to see the glibc packaging becoming less
> rather than more monolithic and I think these two libraries would be
> better placed in their own subpackages.

Phil,

I don't understand your concern here - packaging all the libraries from glibc 
does not mean they will appear in the rootfs. But having them handy as IPKs is 
helpful, when someone wants to do debugging - just opkg install those...

-- 
Denys


