Received: from mail-pa0-f49.google.com ([209.85.220.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1U91Jv-0008UZ-B9
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Feb 2013 23:42:23 +0100
Received: by mail-pa0-f49.google.com with SMTP id kp6so706870pab.36
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Feb 2013 14:26:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Ds2tHLObWEyeX6K2vzK9MoP0ou+SNMCF4ukH4mypYv4=;
	b=i8oS6VWtkJDtdR2fyv3I6MC+05kbxZTD9olE7j3vPr55e+KiC7KUCvKwSJylcx+mGV
	5OjnVdlXWNqMJhXxftXbb4uh6PWmaKeOkSYaO6YiXWe5wP79pkrv7P9BQ0Sj6BKR+1Wd
	X+1HGyW4Q2gsj3hDFsuDK2OR3GLWmDZ/hhN9vWUk27YOpwSsm9Q/80cWVEV/RWulzdcN
	NUxjwDS7h71bps4usr64sga8I6/E5cNHcM34Ciw4EcCskP34m74H73LkMiKZnLmAcYXi
	TM/R5otONqYPWAIATV1jF1DY6vaRuyWQMUwOonbH3sIHX+C+YZ8JxVfW9xy4rmu5VQ3i
	9VIg==
X-Received: by 10.66.163.166 with SMTP id yj6mr6457113pab.130.1361571966936;
	Fri, 22 Feb 2013 14:26:06 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id eh5sm3767557pbc.44.2013.02.22.14.26.04
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 22 Feb 2013 14:26:05 -0800 (PST)
Date: Fri, 22 Feb 2013 23:26:11 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130222222611.GB3300@jama>
References: <51262D01.7070601@gmail.com>
MIME-Version: 1.0
In-Reply-To: <51262D01.7070601@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: Qt5
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
X-List-Received-Date: Fri, 22 Feb 2013 22:42:25 -0000
X-Groupsio-MsgNum: 43287
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qdlojUNlGboGybTD"
Content-Disposition: inline

--qdlojUNlGboGybTD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 21, 2013 at 03:19:45PM +0100, Tasslehoff Kjappfot wrote:
> Is the meta-qt5 layer at https://github.com/meta-qt5 a work in progress,
> or should it be usable in its current state?

Not really, but I plan to work on it next week(s).

> I currently use qt4-embedded and compile and sdk with qt-support, and
> want to try out qt5. Compiling qtbase gave me some packages I can add to
> my image, but when I tried to create an SDK I got stuck. The
> files/recipes in meta-qt5 differ so much from todays qt4-stuff that I'm
> not sure where to begin, but I suspect at least an SDK-recipe/task and
> maybe some qt5-embedded recipes will have to be added?

upstream sources also differ a lot, so recipes will stay different to
reflect that.

> Thought maybe I'd see if I can create these recipes, but I just wanted
> to check if that is the plan forward.

If you create something useable send it as pull request on github, I
plan to fix issues in current recipes, but don't plan to work on sdk

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--qdlojUNlGboGybTD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlEn8IMACgkQN1Ujt2V2gByexwCfYzm2qnmeQ0sMvghTUypyK/tC
SqoAniB5oCpfQmyEJiiN3mKhhHk+ouq7
=WFiB
-----END PGP SIGNATURE-----

--qdlojUNlGboGybTD--
