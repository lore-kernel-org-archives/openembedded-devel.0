Received: from ns.penguin.cz ([84.21.108.25])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <utx@penguin.cz>) id 1QCZfU-0002D7-MV
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Apr 2011 17:50:16 +0200
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id B0EB91416BC5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Apr 2011 17:48:19 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at ns.penguin.cz
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (ns.penguin.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cYWMT5DRpmFr
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Apr 2011 17:48:19 +0200 (CEST)
Received: from [10.20.5.32] (nat.scz.novell.com [213.151.88.252])
	by ns.penguin.cz (Postfix) with ESMTP id 90DA31416BA5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Apr 2011 17:48:19 +0200 (CEST)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4DAD6FF9.8040700@opendreambox.org>
References: <1302996247.3122.32.camel@utx.lan>
	<4DAD6FF9.8040700@opendreambox.org>
Date: Wed, 20 Apr 2011 17:47:55 +0200
Message-ID: <1303314475.17572.261.camel@oct.suse.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.1 
Subject: Re: [PATCH 2/5] pkgconfig.bbclass: search configs in D instead of S
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
X-List-Received-Date: Wed, 20 Apr 2011 15:50:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Andreas Oberritter wrote:

> > diff --git a/classes/pkgconfig.bbclass b/classes/pkgconfig.bbclass
> > index d96b708..00298ca 100644
> > --- a/classes/pkgconfig.bbclass
> > +++ b/classes/pkgconfig.bbclass
> > @@ -14,7 +14,7 @@ SYSROOT_PREPROCESS_FUNCS += "pkgconfig_sysroot_preprocess"
> >  
> >  pkgconfig_sysroot_preprocess () {
> >  	install -d ${SYSROOT_DESTDIR}${PKG_CONFIG_DIR}
> > -	for pc in `find ${S} -name '*.pc' -type f | grep -v -- '-uninstalled.pc$'`; do
> > +	for pc in `find ${D} -name '*.pc' -type f`; do
> >  		pcname=`basename $pc`
> >  		if [ ! -f ${SYSROOT_DESTDIR}${PKG_CONFIG_DIR}/$pcname ]; then
> >  			oenote "$pcname was not installed."
> > 
> 
> This function just prints a warning, if it finds a .pc file that didn't
> get installed. Using ${D} at this point makes this function a no-op.
> 
> It might be better to just remove it completely.

Good hint. So I'll not submit this patch. Your commit c2c8fe4 already
did the right fix here.

-- 
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



