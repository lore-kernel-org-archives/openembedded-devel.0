Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PJMV3-0008Dx-Ob
	for openembedded-devel@lists.openembedded.org;
	Fri, 19 Nov 2010 09:39:18 +0100
Received: by iwn9 with SMTP id 9so1717474iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Nov 2010 00:38:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=uHh8zTqU7ykWod9NejYsRxIf/Ow2J042Knj/Pgy5+Ow=;
	b=oN1fXdedDQjWofpjXoPGhy2AG+IDpppsXTv4mVCMh1hlcsyiMQhZ6W2osbKDf+utMp
	QUELix+te27F7TmSUfCPusUitmBkvrSimrF+A8rAi1eOhl39ICKaS5Adhmk4txIvPNkr
	k3x7qXKg2aY5fS7SKWwRhiXp9ahDCwVF4rW6o=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=fTR+zmC0cdFr5jE+UYToPwJrHAeMP7BLBB94GepBFHWWQofXnY8yyNWX97PkKFvbsL
	Ibr7qos7uPfcDeL7zlG9D9VzC0b3NGs0hzfMmP9wKBiAujt/yZrBfUULKrFYO4e3fZCr
	QBY89cPCglr7JbLafldwgXlTletXO1N0gLOZU=
MIME-Version: 1.0
Received: by 10.231.17.203 with SMTP id t11mr1777027iba.1.1290155891081; Fri,
	19 Nov 2010 00:38:11 -0800 (PST)
Received: by 10.231.33.4 with HTTP; Fri, 19 Nov 2010 00:38:11 -0800 (PST)
In-Reply-To: <AANLkTinVj9oh0p9xp9ZUtBijB63Fy7O8LcXc5-tUF9v6@mail.gmail.com>
References: <AANLkTinVj9oh0p9xp9ZUtBijB63Fy7O8LcXc5-tUF9v6@mail.gmail.com>
Date: Fri, 19 Nov 2010 09:38:11 +0100
Message-ID: <AANLkTin9RsPL4tc5Vh42YKzF=GqgweCc-6t23gzwO_yK@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: release-2010.12 branch ready for testing
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
X-List-Received-Date: Fri, 19 Nov 2010 08:39:18 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/11/18 Khem Raj <raj.khem@gmail.com>:
> Hello all,
>
> The work branch for upcoming 2010.12 release has been created. Please
> lend your hand in testing this branch and cherry-picking
> fixes that we need to make the release a robust one. Testing as many
> combinations of machine/distro/image as possible would be
> nice. Please use the Testing matrix to report the results.
>
> If you are not cloning then ignore the first step
>
> $ git clone git://git.openembedded.org/openembedded
> $ cd openembedded
> $ git checkout -b release-2010.12 origin/release-2010.12
>
> Cherry pick the patches that need to go into this branch and when you
> are ready to push them then do
>
> $ git push -v origin release-2010.12:release-2010.12
>
> this will only push the commits meant for release branch and other
> branches wont be pushed
>
> Please send the patches that need to be cherry picked to mailing list
> for review with subject line prefixed with [release-2010.12]
> or discuss on IRC.
>
> Thank you for help
>
> Lets make this release a success
>
> -Khem
>

I suggest as one of the tests to do a real clean build.
Typically my tests start with an empty TMPDIR, but I tend to reuse my
downloads dir. Also normally for packages not in downloads I use a
local premirror (at least at work).

Yesterday I found that php did not fetch any more from the src as a
new version was made available and the old version moved to a
different address (museum).
Could be there are more of this.
Suggestion is that a build is tested with an empty downloads dir and
without any mirror (but can't set it up such a test easily at the
moment)

For php I have a crude patch, but will try to improve it this weekend.

The crude patch is to change php.inc with:
diff --git a/recipes/php/php.inc b/recipes/php/php.inc
index bfee93c..ae9c7e2 100644
--- a/recipes/php/php.inc
+++ b/recipes/php/php.inc
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.php.net"
 SECTION = "console/network"
 LICENSE = "PHP"

-SRC_URI =     "http://us2.php.net/distributions/php-${PV}.tar.bz2;name=src \
+SRC_URI =     "http://museum.php.net/php5/php-${PV}.tar.bz2;name=src \
                file://acinclude-xml2-config.patch \
                file://php-m4-divert.patch"

However, that does not allow having the newest version and an older
version in a recipe as the SRC_URI mismatches
Plan is to move SRC_URI outside the inc and to the individual recipes,
but it'll be sat or sun before I get to that.
I'll also try to peek at upgrading php for master.

Frans


