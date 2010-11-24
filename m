Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <esbenhaabendal@gmail.com>) id 1PLLGT-0008Tv-9J
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Nov 2010 20:44:26 +0100
Received: by gyd12 with SMTP id 12so68691gyd.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Nov 2010 11:43:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=HmTtl8YPB58XrTNQi80t6UPbRhNPjqSxzAN4HAY5J+8=;
	b=ahpU7oAk/WJU6VLgBrHNbHi0qswe55rQZLYNOQFO7txpYot04ZOMwd7iwqA0Bsn7rm
	Z6fzVvovUJ/Obydd0knCoYvvVwulFoBNlErxVgk5+6SpQAPeC2WYPqkdRaslxHKBGYTE
	7SSc72cmFf013odv+2xfMxmvOlknJlkLD+K3w=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=D/1tRcMM5568VJMzLr0fSUbH+Tp0KfHEhgnkuldQ8oMM9RhQqg3RbR7u/LPykVfYp8
	CyqIr4qvelQ4eFXs9TwzOUOFkN4naHVbVaLZAIDW73tzUN5NIXo9Lv2pc5l9ZiOW9pZa
	a3eWRRVe9/E5bTCbo1XWad02uDwrRHAEAM1Fg=
MIME-Version: 1.0
Received: by 10.100.195.4 with SMTP id s4mr6496804anf.7.1290627790574; Wed, 24
	Nov 2010 11:43:10 -0800 (PST)
Received: by 10.100.47.6 with HTTP; Wed, 24 Nov 2010 11:43:10 -0800 (PST)
In-Reply-To: <AANLkTikq8DZGrfXMY8Fr7GNrMe8-oe05JNh_CfEEPzfH@mail.gmail.com>
References: <AANLkTimVOOQ28E1NfJm5Rim4X+WmvXAtOSJ9W34KH7X-@mail.gmail.com>
	<AANLkTik022J6+49_rQZ5mk2o3x79t6vc5Z6yEiRY8izM@mail.gmail.com>
	<AANLkTineOx1jewpHS_tC=5tBxgqt+z2Mq8EfceZ0zUuD@mail.gmail.com>
	<AANLkTi=c5NjS+TYVYyzJtdPsnmL34hBTYeN-MgHtvYJx@mail.gmail.com>
	<AANLkTikq8DZGrfXMY8Fr7GNrMe8-oe05JNh_CfEEPzfH@mail.gmail.com>
Date: Wed, 24 Nov 2010 20:43:10 +0100
Message-ID: <AANLkTi=a_M=ekYjcyGz+rWqm9Ev3YaoUjLveLiP09LNJ@mail.gmail.com>
From: Esben Haabendal <esbenhaabendal@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: esbenhaabendal@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: openembedded / dpkg-buildpackage hybrid
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
X-List-Received-Date: Wed, 24 Nov 2010 19:44:27 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Nov 24, 2010 at 3:19 PM, Chris Larson <clarson@kergoth.com> wrote:

> Have you taken a look at the work Richard Purdie has done on bitbake
> for Poky/Yocto?

Yes, I am aware of the work done for Poky.  But with regards to staging,
I just want to go the direct way and have package-based, per-recipe
staging now.  I am aware that this would be a huge effort to undertake
for entire OpenEmbedded, but I don't have to do that for now.

> It isn't refactoring the way you've done, but it does rework how
> packaged staging is used.

I understand that the idea is to take micro-steps from the current
situation towards the desired solution, but I simply find both the
Poky/Yocto sstate and the current OpenEmbedded staging situation both to
error-prone and complicated.  KISS rules here ;-)

> It implements per-task metadata checksumming (based upon my oe
> signatures code) and task level output archiving for populate_sysroot,
> to be used to short-circuit its build in subsequent runs.
> Conceptually its an interesting tactic, and I think metadata
> checksumming is going to be critical going forward, to improving our
> build reproducibility.

I am also in the process of adding metadata and source checksumming.
The checksumming of dependencies of-course ends up being rather
different based on the different approach to build dependencies.  For
now, I have metadata and dependency checksumming for all tasks, and hope
to soon add package-based dependency checksumming, which will enable
some interesting effects with regards to re-use of prebuilt packages.

But definitely, metadata checksumming is on the critical path forwards
if we want to improve build reproducibility.  But so is per-recipe
staging.

/Esben


