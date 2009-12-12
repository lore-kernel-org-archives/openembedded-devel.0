Received: from mail-gx0-f215.google.com ([209.85.217.215])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1NJbn0-0005hs-8M
	for openembedded-devel@lists.openembedded.org;
	Sun, 13 Dec 2009 00:54:21 +0100
Received: by gxk7 with SMTP id 7so2835452gxk.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Dec 2009 15:52:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=gt83DwyqjUCm4oPDlkKIQt13oY8FFN+/vxKHCh1X43Y=;
	b=FD38yNvlKgsjRwRQk+uu/eyOXlsp/RJJGZ8zYkvG+AH6jMzdk3PyrzKGy/DeS12+Id
	TjqKRHKwpkeKqGLUEDQ3cfHoNs5c/dexn5mQLXtcZ2jJZz7BXAxGg75P/695r6Vmr0C+
	ytewEGH7e5UQ+QEY9qKD1Vwfu3aM90obGf6HI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=lwijcIL4JQdNIIT2jXRxhp9gJcccoy/MmFYYr+DUQoBmJvHxO7dbYibD0izqCnn4Db
	GyvuB9mZwj92UIjhtupNE1+SJhf49tEO413EPjQvdEbTawvxMalU3a2QU5BYKshz9Ym8
	wa5EzaDU4MQ8EBRpgWoZKs2N3X4gxqERenW7k=
MIME-Version: 1.0
Received: by 10.101.213.24 with SMTP id p24mr4787662anq.16.1260661953846; Sat, 
	12 Dec 2009 15:52:33 -0800 (PST)
Date: Sun, 13 Dec 2009 00:52:33 +0100
Message-ID: <ac9c93b10912121552v19610a66ke416d4abe97c8bd6@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.217.215
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: new staging breaks apache2
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
X-List-Received-Date: Sat, 12 Dec 2009 23:54:21 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

I changed apache to use libpcre and also moved libpcre to the new
staging. (effectively removing do_stage)
However, apparently things do not work as the should.

apparently things seemed to work so I committed my work.
However after changing one more thing in apache, it does not build any more.
I get an error in configure stating:
configure: error: Did not find pcre-config script at
/home/frans/oe/tmp_angstrom/staging/armv7a-angstrom-linux-gnueabi/usr/bin/..

In the libpcre work dir it creates:
./package/usr/bin/pcre-config

would expect this to end up in staging too with the new staging.

However, if I run a find for pcre-config in staging I get:
./i686-linux/usr/bin/armv5te-angstrom-linux-gnueabi/pcre-config
./i686-linux/usr/bin/armv7a-angstrom-linux-gnueabi/pcre-config
./armv7a-angstrom-linux-gnueabi/usr/share/doc/pcre/pcre-config.txt
./armv7a-angstrom-linux-gnueabi/usr/share/doc/pcre/html/pcre-config.html

no ./armv7a-angstrom-linux-gnueabi/usr/bin/pcre-config

What did I do wrong/what went wrong?????

Totally puzzled.
Will dig into this tomorrow (it is now 1 am here so little chance I
can find a decent solution, need some sleep first).
Any suggestions/help is appreciated (and apologies for breaking the
apache2 build (and yes, I could revert but actually the old version
was not really sound either).

Frans


