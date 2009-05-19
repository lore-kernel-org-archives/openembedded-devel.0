Received: from [83.222.23.61] (helo=relay1.mail.masterhost.ru)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1M6RJz-0002RY-8k
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 May 2009 17:33:39 +0200
Received: from [UNAVAILABLE] ([80.246.246.162] helo=mate.localnet)
	by relay1.mail.masterhost.ru with esmtp 
	envelope from <khimov@altell.ru> authenticated with rik@osrc.info
	message id 1M6RCp-0007a2-1j
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 May 2009 19:26:15 +0400
From: Roman I Khimov <khimov@altell.ru>
Organization: Altell Ltd.
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 May 2009 19:26:15 +0400
User-Agent: KMail/1.11.2 (Linux/2.6.29; KDE/4.2.2; x86_64; ; )
References: <20090515183512.GZ7973@smtp.west.cox.net>
	<1242497080-28506-2-git-send-email-khimov@altell.ru>
	<1242745717.18648.151.camel@hammer.suse.cz>
In-Reply-To: <1242745717.18648.151.camel@hammer.suse.cz>
MIME-Version: 1.0
Message-Id: <200905191926.15486.khimov@altell.ru>
Subject: Re: [PATCH 2/3] (e)glibc-package: set LD_LIBRARY_PATH on binary locale generation
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
X-List-Received-Date: Tue, 19 May 2009 15:33:39 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Tuesday 19 May 2009 19:08:37 Stanislav Brabec wrote:
> Roman I Khimov wrote:
> >  		localedef_opts = "--force --old-style --no-archive --prefix=%s
> > --inputfile=%s/i18n/locales/%s --charmap=%s %s" % (treedir, datadir,
> > locale, encoding, name) -		cmd = "PATH=\"%s\" I18NPATH=\"%s\" %s -L %s
> > %s/bin/localedef %s" % (path, i18npath, qemu, treedir, treedir,
> > localedef_opts) +		cmd = "PATH=\"%s\" I18NPATH=\"%s\" %s -L %s -E
> > LD_LIBRARY_PATH=%s %s/bin/localedef %s" % (path, i18npath, qemu, treedir,
> > ldlibdir, treedir, localedef_opts)
>
> It breaks in angstrom build for spitz. My qemu-arm from
> qemu-native-0.9.1+svnr4242-r15 (default for angstrom) apparently does
> not understand "-E". After reverting this patch (or removing -E argument
> from the command line manually) it works again.

Sorry for breaking the build, working on fix. Can you try qemu-native 0.10.3, 
maybe it'll work right out of the box for you?


