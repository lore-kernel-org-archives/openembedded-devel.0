Received: from [84.21.108.25] (helo=ns.penguin.cz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1M6R2w-0003EP-Ax
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 May 2009 17:16:02 +0200
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id 23D9E1416BA5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 May 2009 17:09:33 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at ns.penguin.cz
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (ns.penguin.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GroJqHEYMAOI
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 May 2009 17:09:33 +0200 (CEST)
Received: from [10.20.1.86] (styx-ext.suse.cz [82.119.242.94])
	by ns.penguin.cz (Postfix) with ESMTP id E83A81416BA2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 May 2009 17:09:32 +0200 (CEST)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1242497080-28506-2-git-send-email-khimov@altell.ru>
References: <20090515183512.GZ7973@smtp.west.cox.net>
	<1242497080-28506-1-git-send-email-khimov@altell.ru>
	<1242497080-28506-2-git-send-email-khimov@altell.ru>
Date: Tue, 19 May 2009 17:08:37 +0200
Message-Id: <1242745717.18648.151.camel@hammer.suse.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.1.1 
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
X-List-Received-Date: Tue, 19 May 2009 15:16:03 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Roman I Khimov wrote:
>  		localedef_opts = "--force --old-style --no-archive --prefix=%s --inputfile=%s/i18n/locales/%s --charmap=%s %s" % (treedir, datadir, locale, encoding, name)
> -		cmd = "PATH=\"%s\" I18NPATH=\"%s\" %s -L %s %s/bin/localedef %s" % (path, i18npath, qemu, treedir, treedir, localedef_opts)
> +		cmd = "PATH=\"%s\" I18NPATH=\"%s\" %s -L %s -E LD_LIBRARY_PATH=%s %s/bin/localedef %s" % (path, i18npath, qemu, treedir, ldlibdir, treedir, localedef_opts)
>  

It breaks in angstrom build for spitz. My qemu-arm from
qemu-native-0.9.1+svnr4242-r15 (default for angstrom) apparently does
not understand "-E". After reverting this patch (or removing -E argument
from the command line manually) it works again.

-- 
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



