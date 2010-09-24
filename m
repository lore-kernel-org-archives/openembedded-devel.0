Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OzGPw-0005Me-AM
	for openembedded-devel@lists.openembedded.org;
	Sat, 25 Sep 2010 00:06:57 +0200
Received: by bwz2 with SMTP id 2so2366706bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Sep 2010 15:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=J8hsc84mCDQtjMXCrl0m5W5foPRBmyC74+RkfQlMnDo=;
	b=TJw9PRNRGllQzjWMV1Q4z38vkzZ4/iL4dHk0Z0gphh5axaFZZG9J3ItWbOBYwv5JAB
	KVPkjFQL0EGrodoZS2Vw/mDm6OSPZZdgjgD1+ALMuTSbATBYVOwPIThbhNASkyoR2XiZ
	FOPOuvBVXglY0smng9hh9NiRnD7kVnv99W7aY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=S66ASBd7bPyWYS0+RHeklY+57AHGeBmgdaasui08I7/jmc/xjV9RrLWrfdG06ZDM5K
	wTPrQ7ZgbTgnrDgWvrDvwJoGrGmoZTzeRQEyEEHmMxWXeZNIeOFg/igYERRkQN5P2Ytb
	5GNJXCPQULOHJhvUJJAxnyBEMKasFUIjYSCiw=
Received: by 10.204.112.129 with SMTP id w1mr2392040bkp.204.1285366010996;
	Fri, 24 Sep 2010 15:06:50 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id f10sm1950872bkl.17.2010.09.24.15.06.50
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 24 Sep 2010 15:06:50 -0700 (PDT)
Date: Sat, 25 Sep 2010 00:06:49 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100924220649.GB3423@jama>
References: <AANLkTik4OGdeazaQbURbzDS4FSDDLPrrCT43YEQ8YJn2@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTik4OGdeazaQbURbzDS4FSDDLPrrCT43YEQ8YJn2@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS,
	WEIRD_PORT autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: navit svn fetchg issue
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
X-List-Received-Date: Fri, 24 Sep 2010 22:06:57 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 24, 2010 at 10:30:54PM +0200, Frans Meulenbroeks wrote:
> bumped into this fetch issue with navit
> 
> first did a bitbake -c patch -b navit-icons_svn.bb
> then did a bitbaek -c patch -b navit_svn.bb
> 
> That one failed with:
> 
> NOTE: Running task 2 of 2 (ID: 0,
> /home/frans/oe/openembedded/recipes/navit/navit_svn.bb, do_fetch)
> NOTE: package navit-1_0.1.99+svnr3535-r8.10: task do_fetch: Started
> NOTE: Update svn://anonymous@navit.svn.sourceforge.net/svnroot/navit/trunk;module=navit;proto=https
> svn: Failed to add directory 'navit': an unversioned directory of the
> same name already exists
> ERROR: Task 0 (/home/frans/oe/openembedded/recipes/navit/navit_svn.bb,
> do_fetch) failed with exit code '1'
> WARNING: /home/frans/oe/bitbake/lib/bb/build.py:49:
> DeprecationWarning: BaseException.message has been deprecated as of
> Python 2.6
>   self.message = name
> 
> NOTE: oestats: error sending task, disabling stats
> NOTE: package navit-1_0.1.99+svnr3535-r8.10: task None: Failed
> WARNING: /home/frans/oe/bitbake/lib/bb/build.py:59:
> DeprecationWarning: BaseException.message has been deprecated as of
> Python 2.6
>   msg = self.message
> 
> ERROR: Unknown fetch Error: [Errno 2] No such file or directory:
> '/home/frans/oe/downloads/navit_navit.svn.sourceforge.net_.svnroot.navit.trunk_3535_.tar.gz'
> 
> Guess there is an issue fetching navit after having fetched navit-icons.

Yes same downgrade/upgrade cycle as there was in matchbox-panel-2 and
matchbox-panel-2-icon-themes
http://git.openembedded.org/cgit.cgi/openembedded/commit/?id=c6a72ee2b934017cfa31914886b32f1c58978c72
issue discussed here many times..

but keeping same SRCREV between navit and navit-icons is not good fix,
because introducing separate navit-icons was mostly because it doesn't
need to be upgraded that often (and it's rather big package to
redownload even without any change inside everytime SRCREV of main navit
recipe changes).

Regards,

-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


