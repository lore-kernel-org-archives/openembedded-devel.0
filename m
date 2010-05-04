Received: from ns0.zlo.nu ([85.17.141.90] helo=mzh.zlo.nu)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcolz@zlo.nu>) id 1O9FVj-00033L-NF
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 May 2010 12:37:56 +0200
Received: by mzh.zlo.nu (Postfix, from userid 1000)
	id 75B151425F; Tue,  4 May 2010 12:34:09 +0200 (CEST)
Date: Tue, 4 May 2010 12:34:09 +0200
From: Marc Olzheim <zlo@zlo.nu>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100504103409.GA29548@zlo.nu>
References: <201003301706.14340.khimov@altell.ru>
	<20100428125342.GA31214@zlo.nu>
	<201004290930.00901.roman@khimov.ru>
	<201005040000.00002.roman@khimov.ru>
MIME-Version: 1.0
In-Reply-To: <201005040000.00002.roman@khimov.ru>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 85.17.141.90
X-SA-Exim-Mail-From: marcolz@zlo.nu
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] openssl: add version 1.0.0
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
X-List-Received-Date: Tue, 04 May 2010 10:37:56 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 03, 2010 at 11:59:30PM +0400, Roman I Khimov wrote:
> > OK, it works fine there (i386 and amd64 uclibc, both via cross), so I
> >  didn't notice that it might be a problem. Care to do a patch? It'll take
> >  me some time to create mipsel build setup and try it out.
> 
> Just pushed the fix, please try it out.

Ah yes, the debian-mipsel line is the smae now as what i tried to get it
to work for me. :-)

I notice now that i did a "clean openssl" "build openssl" that it uses
"cp" instead of "install" for do_populate_staging, which fails because
the files that it tries to overwrite (from a previous
do_populate_staging) are mode 0555:

(main task) NOTE: Running task 291 of 294 (ID: 3, /.../oe/recipes/openssl/openssl_1.0.0.bb, do_populate_staging)
cp: cannot create regular file `/.../tmp/staging/mipsel-oe-linux/usr/lib/ssl/engines/libubsec.so': Permission denied
cp: cannot create regular file `/.../tmp/staging/mipsel-oe-linux/usr/lib/ssl/engines/libpadlock.so': Permission denied

...

But that probably has nothing to do with your fix. ;-)

In any case: thanks for the patch!

Marc


