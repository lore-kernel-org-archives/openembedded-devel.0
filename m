Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1MnYF2-00043f-B5
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Sep 2009 15:38:47 +0200
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>)
	id 1MnYEV-0007ox-Mb; Tue, 15 Sep 2009 14:38:12 +0100
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <philb@gnu.org>)
	id 1MnYEU-0003dr-VL; Tue, 15 Sep 2009 14:38:11 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20090915115601.GA26039@jama>
References: <1252881838-19764-1-git-send-email-Martin.Jansa@gmail.com>
	<1253002300.4490.1103.camel@lenovo.internal.reciva.com>
	<20090915091626.GH4970@jama>
	<1253010711.12689.160.camel@mill.internal.reciva.com>
	<20090915115601.GA26039@jama>
Date: Tue, 15 Sep 2009 14:38:07 +0100
Message-Id: <1253021887.12689.208.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.3 
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: philb@gnu.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: bitbake-dev@lists.berlios.de
Subject: Re: [PATCH] Allow % as wildcard in the end of PREFERRED_VERSION_pkg
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
X-List-Received-Date: Tue, 15 Sep 2009 13:38:48 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2009-09-15 at 13:56 +0200, Martin Jansa wrote:
> Ok, but then you can say, that the same problem is when there is two or
> more packages with PV = "1.0".
> 
> You can have as many git-based bb files as long as they have different
> PV prefix like 1.0+git% and then 1.1+git% or 2.0+git.
> 
> Why would you have more bbffiles with the same PN and all git-based with
> PV = "1.0+gitr${SRCPV}" ?

Well, er, because the git tree contains multiple revisions.  There's no
reason why I mightn't want to package git revision
9324048f648da3b5ac3e507ab5fcc1bb8a3721c9 if that one worked particularly
well for me, whereas someone else might prefer to package revision
aea9acb329d715db851c1bed8506c3d0f9b42ae1.  If those two versions are
different enough to require recipe differences then you would indeed end
up with two different .bb files.

Given that the primary use of floating git versions is for upstream
projects that don't release often (or at all), it doesn't seem like
relying on the released version number to disambiguate these different
git checkouts is going to get you very far.

> Setting PREFERRED_VERSION_pkg at least close enough to match
> "1.0+gitr${SRCPV}" seems better for me than not setting preferred at
> all and rely on DEFAULT_PREFERENCE.

I agree that setting PREFERRED_VERSION would be somewhat neater, but
only if there was a way to obtain the actual floating version that is
going to be used.  I don't think wildcards are an appropriate way to
solve that problem, and definitely not if the implementation is going to
end up as fragile as this one seems to be.

> BTW: in shr there is one distribution "shr" with -testing and -unstable
> variants, main difference is which files with srcrevs and preferred
> versions are included during build, how to set DEFAULT_PREFERENCE in
> bbfile for this case (-testing wants some relased version, -unstable
> using AUTOREV on _git version)?

If the -testing distribution is selecting a fixed version then this will
override any default preference that might be set on the floating
recipe.  So I don't think there is any problem here.

p.




