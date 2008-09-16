Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>)
	id 1Kfcrk-0004hy-D9; Tue, 16 Sep 2008 17:53:24 +0200
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>)
	id 1Kfcnv-00047m-JR; Tue, 16 Sep 2008 16:49:54 +0100
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <pb@reciva.com>)
	id 1Kfcnv-00028y-3P; Tue, 16 Sep 2008 16:49:27 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20080916002127.GK29676@smtp.west.cox.net>
References: <20080912160657.GE29676@smtp.west.cox.net>
	<20080914235938.GH29676@smtp.west.cox.net>
	<1221469471.24620.7.camel@mill.internal.reciva.com>
	<20080916002127.GK29676@smtp.west.cox.net>
Date: Tue, 16 Sep 2008 16:49:26 +0100
Message-Id: <1221580166.24620.59.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Cc: openembedded-devel@openembedded.org
Subject: Re: [Bug 4549] A number of xorg dev packages are uninstallable
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
X-List-Received-Date: Tue, 16 Sep 2008 15:53:24 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2008-09-15 at 17:21 -0700, Tom Rini wrote:
>  	for pkg in package_list:
>  		rdepends = explode_deps(bb.data.getVar('RDEPENDS_' + pkg, d, 1) or bb.data.getVar('RDEPENDS', d, 1) or "")
> +
> +		if main_is_empty:
> +			for rdep in rdepends:
> +				if rdep.find(main_pkg + " ") != -1:
> +					rdepends.remove(rdep)
>  		for l in dangling_links[pkg]:
>  			found = False
>  			bb.debug(1, "%s contains dangling link %s" % (pkg, l))

If you change that 1 to 0 in the first bb.data.getVar() call, the
package names should be left in their unexpanded form and you can then
safely match against a literal '${PN} (= ${PV})' as found in
bitbake.conf.  That's still a bit yucky but probably better than what
you have there.

Other than that, yeah, this looks fine to me.

p.




