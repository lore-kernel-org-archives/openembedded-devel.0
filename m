Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P2ofD-0001AH-C7
	for openembedded-devel@openembedded.org; Mon, 04 Oct 2010 19:17:25 +0200
Received: by iwn2 with SMTP id 2so7116287iwn.6
	for <openembedded-devel@openembedded.org>;
	Mon, 04 Oct 2010 10:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=ZuIBiY+PI158XstF+jIJPQhTy4JVXfhboRLXYireejA=;
	b=kNtbRtF5figbGUaGy+JPcz3/E5JoMEjX1z4u4axwYngYysLzZsluqGd0N11QfPCjOE
	BP7DkV7gPLmwM1CEiH3S7D2YfvobRnDg9AvYBAtbTBdClWkIWacSqY1FDN39L+CK90lM
	8C+QQ3wcueB7lNngTuDb9xBoXrm2M//0bG9tw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=a+VBFkMWctP9NvXHYyQBtbSmUGQNgS9zJZu6FiPvuIhiaiNy0+U0HXoItcPNxozrzR
	ejpTpbAAoWkI2dKS21K+DYrdu4pXVltqrCfuv8Nt4yiaM3jqx5N2VCCGE52FSafLtHFm
	jjEzrexcCKKjlw9LxJb5vHeVfQFrCgCj2md3A=
MIME-Version: 1.0
Received: by 10.231.190.149 with SMTP id di21mr10475171ibb.166.1286212625709; 
	Mon, 04 Oct 2010 10:17:05 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Mon, 4 Oct 2010 10:17:05 -0700 (PDT)
Date: Mon, 4 Oct 2010 19:17:05 +0200
Message-ID: <AANLkTikO4fHqYzZJ5PDjmWV9Q3a9tBD_Y+rSs0iO6=5m@mail.gmail.com>
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
Subject: cups issue
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
X-List-Received-Date: Mon, 04 Oct 2010 17:17:25 -0000
Content-Type: text/plain; charset=ISO-8859-1

No idea who is the maintainer of cups, but I found the following issue:

/etc/init.d/cups refers to ps ax but if you have busybox installed
there are no ax options.
As busybox has configurable columns it does not seem too good to fix
cups to be able to handle both procps ps and busybox ps.
Guess the preferred solution is to add a dependency to procps and get
the real thing.

However when wanting to make that change I bumped into the following:

We have 6 cups recipes:

cups_1.1.23.bb  cups_1.2.12.bb  cups_1.2.7.bb  cups_1.3.8.bb
cups_1.4.3.bb  cups_1.4.4.bb

The last three (!) of them have DP = "-1"
Is there a point in add ing a recipe that has DP = "-1" for a
prolonged time, then create a new version with DP = -1?
(btw: and no version is pinned or so).

Guess this recipe needs some love.

(btw cups 1.4.4 solves a number of security issues; guess the best way
forward is to test 1.4.4, then rm the old insecure stuff).

Frans


