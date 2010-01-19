Received: from mail-gx0-f227.google.com ([209.85.217.227])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1NXEoe-0006Ii-L6
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Jan 2010 15:12:23 +0100
Received: by gxk27 with SMTP id 27so3582498gxk.7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Jan 2010 06:10:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=TiaeBkGCshRqvRG0kXC/NgKPIYzt16s+tpNPHNfNTD0=;
	b=HYO+uxHC2lEIRg2B3GylgBhctNBoM5cR57p9F8sUlLZMqiew/pOEWlNOFmE8fYthzV
	hSMz5tmrstkvDbIofGuhJU8FAJBFekfW5c2EXcMHtpl/I0S5r9AGxu5LI4zJVIRi4yDq
	dBVgy8t4bIaqlKe13EuiYMFFdX4rJdKAsvlgY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=Fme0WTqL6/xOj4ILRELPSVyAwsTBnk52rP1uTQLUirzPzpF2VoC3dEIgBrmCb9gbvC
	rgL/Z+7Pwds1lf1QEbqHxy1WR+1FOwzujgDcwjNGXaRr5AOawJKxhsNyds9xuZ8MgRke
	hDuFV+5uqkzJLic8YUjsdDAyzP3WhAO38NisA=
MIME-Version: 1.0
Received: by 10.101.160.12 with SMTP id m12mr11731421ano.69.1263910204808; 
	Tue, 19 Jan 2010 06:10:04 -0800 (PST)
In-Reply-To: <201001191449.31769.sgh@sgh.dk>
References: <1263904767-23489-1-git-send-email-sgh@sgh.dk>
	<1263908226.10980.105.camel@mattotaupa.wohnung.familie-menzel.net>
	<201001191449.31769.sgh@sgh.dk>
Date: Tue, 19 Jan 2010 15:10:04 +0100
Message-ID: <ac9c93b11001190610jb3e754chf7d7ddfabead206@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.217.227
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] Make perl-native_* depend on make-native.
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
X-List-Received-Date: Tue, 19 Jan 2010 14:12:24 -0000
Content-Type: text/plain; charset=ISO-8859-1

Some comments on this issue (having discussed this with sgh on irc)

- apparently for sgh things did not work because make was missing. Not
sure where it was missing as he wrote that he had make installed
- perl definitely needs make. Note that it is perl-native we are talking about.
- for me things build without having make-native. There is no
make-native in my i686 work dir. and no make program in cross or
staging
- the wiki says (in the getting started page) that you should have
make in your path "GNU extensions to tools are often required. Symlink
GNU patch, make, and cp (from fileutils), chmod, sed, find, tar, awk
into your OE development path. "
- when aiming for a self contained system there is a point for having
a make-native (just like we have e.g. gcc-native) (and yeah, I know
this gives a bootstrap problem but that also exists for gcc)

Frans


