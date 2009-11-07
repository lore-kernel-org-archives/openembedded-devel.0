Received: from [209.85.217.227] (helo=mail-gx0-f227.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1N6s3N-0001rX-1w
	for openembedded-devel@lists.openembedded.org;
	Sat, 07 Nov 2009 21:38:36 +0100
Received: by gxk27 with SMTP id 27so682887gxk.7
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 Nov 2009 12:37:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=zK/yZHnN38D+F0fI3HqEdYIJshMIJhQqNYSZ7HlgDMc=;
	b=Xk0ztLu6v7Cx8PmAyvfGTnM9DBztvVjSQ3JBVsAHTd9c0PaGzor8VF7ZPcU41DT2sa
	Uqt90KsnMas/q6S9vy7+DO+oUNewz7DnHkjdCYrjn9ehnOKFRPK43KGsrQ/XR6kKfRoQ
	RELnRWF0UesSPRgJrzS2VTvGAkED3l+M83CK0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=YGaBW5BcH+4Z2pAhU1ZIZUvDYX9cswMpdIvYy7nIhzsRh9J8viC/Apx7ACR5J0XZBw
	/SgVya6Tr0W69kg+D92JI1R2CbIBeqAPSnDcwbpXN4cEiwcDHEY4t9NwTHfN76v3WzFf
	Ukh/fycdS8ROx2FGtKScga+afnNP5zKrGTYJs=
MIME-Version: 1.0
Received: by 10.101.23.18 with SMTP id a18mr5617095anj.144.1257626237636; Sat, 
	07 Nov 2009 12:37:17 -0800 (PST)
Date: Sat, 7 Nov 2009 21:37:17 +0100
Message-ID: <ac9c93b10911071237p63d19210m619afcaa914189f3@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.217.227
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: perl/cpan issue (cpan.bbclass, perl/config.sh)
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
X-List-Received-Date: Sat, 07 Nov 2009 20:38:36 -0000
Content-Type: text/plain; charset=ISO-8859-1

I was trying to make xmltv but noticed some files were missing from the recipe.
The recipe includes cpan

Apparently some of the files are in the xmltv work dir but others are
copied to the perl work dir.
I don't think this is good, but I am not a perl/cpan expert, so
seeking for advice and/or a fix.

Apparently cpan.bbclass invokes perl/config.sh
This one contains things like:
config_arg7='-Dinstallprefix=/home/frans/oe/tmp_angstrom/work/armv7a-angstrom-linux-gnueabi/perl-5.8.8-r29/image'
..
installbin='/home/frans/oe/tmp_angstrom/work/armv7a-angstrom-linux-gnueabi/perl-5.8.8-r29/image/usr/bin'
...
Guess config.sh is the bad guy
Not sure how to fix this.

Please advise (or if you are a wiz, please fix and I'll study the fix
and learn from it :-) )

Frans


