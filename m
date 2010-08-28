Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OpGkd-0004is-TT
	for openembedded-devel@lists.openembedded.org;
	Sat, 28 Aug 2010 10:27:02 +0200
Received: by iwn2 with SMTP id 2so3245593iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Aug 2010 01:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=ZubriPGpC07P9DxYRvPxnKy5d5bb7A/hLXIzLTPLLII=;
	b=yB8UPVQ2llo9Piqx2wZGLznKPuE11k5OuklxhidejvYdLKU3LFg2kEtfLb4adZCa/Y
	mBBe+joj49Eh7r+gc/wH8qsle3bnNnRX+1ECLaPhCzw1+B+gnCYf1SYsjqXOxmAoQSL4
	Cnx6w+mG5pWPv8+F9U2W/e+aHd2scXDIy7Ysw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=rQHAFC4yprX9VO10cE1BDWTJU5knRv2trzr6zTdwtRl2w6QDnTda2exJ1jfVC0UfaG
	/okWpQbXsjjLbNPtkcCoI2SjlyKG6o6DQ0X/4HZsYLnAMLXJ1TXJUTozIgqf4Qz6dp7L
	I7UUvbVGHbMdZGxXkMWfV6xyObYfz4OMXEFEk=
MIME-Version: 1.0
Received: by 10.231.35.199 with SMTP id q7mr2444698ibd.47.1282983837142; Sat,
	28 Aug 2010 01:23:57 -0700 (PDT)
Received: by 10.231.205.138 with HTTP; Sat, 28 Aug 2010 01:23:57 -0700 (PDT)
Date: Sat, 28 Aug 2010 10:23:57 +0200
Message-ID: <AANLkTinFXpPdAkd79h94z70m_8MbamLd48pzR4sLQs34@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [RFD] increased dependency checking
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
X-List-Received-Date: Sat, 28 Aug 2010 08:27:02 -0000
Content-Type: text/plain; charset=ISO-8859-1

Currently if a package in the DEPENDS list is modified, a package that
depends on it does not get updated even if explicitly build
E.g. when I just updated libexif and after that did a bitbake
mythplugins (which has a DEPENDS on libexif) libexif got build but
mythplugins did not get rebuild.

This is not really proper. E.g. if the lib changed a .h file the build
of the using package could fail, but it could easily get unnoticed as
one will only become aware of this when forcefully rebuilding that
using package.

I think we can do better by better exploiting the timestamp.
E.g. what about doing it this way:

If you build a package and the timestamp of e.g. do-install  (or
do-stage or another pass) of one of your DEPENDS packages is newer
than your do-install (or another task) then your dependency is most
likely newer, so you need a rebuild. (preceded with a clean to get rid
of the old stuff). This should be added to the task list.

Of course is is not as trivial as I sketch here.
This whole game needs to be played recursively bottom up.
So if A depends on B and B depends on C and C gets changed for
whatever reason, then bitbake A should lead to rebuilding B first.

A similar thing might also be needed for RDEPENDS.
If you run time depend on a package that is newer than you are, it
might also be that there are inconsistencies.

How does this sound? I assume it will increase the workload of
bitbake, but I feel this will lead to more stable packages.
Your feedback is appreciated!

Frans.


