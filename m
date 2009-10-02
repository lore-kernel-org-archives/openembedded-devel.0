Received: from [209.85.217.227] (helo=mail-gx0-f227.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1MtcIK-0001p8-LF
	for openembedded-devel@lists.openembedded.org;
	Fri, 02 Oct 2009 09:11:15 +0200
Received: by gxk27 with SMTP id 27so735006gxk.7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Oct 2009 00:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=2KRYdNC8350SzmimZWOlLEbIsyXyEwn4C2k3Z43N578=;
	b=ihQXoEZFMWg+KWstxgry3Qwh4NeNixMeMGRIuQwcl2sTfE7fbPiZElnxlEzVYqtIUn
	RP9sRLf+ve9AA1Ve1nakrLaDjVxUe9/DeRNPomFqApg3DB/SxC/jgJk0pDoEo1DRaxU1
	HsSzFQp2AqZIh1rpOEPXdt5L2q265HqS+MZNA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=ZBT6gJSjVW4JaoOowAc7vPGSt9hpMKTu2IiXtIdLeYhkZNoNhmsVGHgtyDqf1z0ukS
	0NPK7gHaYldgSMcSDaGf4n7kbFZKQb7djex9vuKERikaCvFLk8gFtiOkNQBJXlxAgftx
	1y5HaLujB84Pw/WZV0Lg8IwHen8Y554LAmRvI=
MIME-Version: 1.0
Received: by 10.101.57.5 with SMTP id j5mr2429353ank.63.1254467427033; Fri, 02 
	Oct 2009 00:10:27 -0700 (PDT)
Date: Fri, 2 Oct 2009 09:10:27 +0200
Message-ID: <ac9c93b10910020010s10fc04fdy6da8c2696d412844@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.217.227
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: build inconsistency (strip)
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
X-List-Received-Date: Fri, 02 Oct 2009 07:11:15 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

I bumped on something very odd.
I wanted to look at an issue with proftpd. As the API version had
changed, I had to remove my tmp dir.
I did bitbake proftpd, fixed the error, bumped PR, everything fine.
Then I asked Koen to verify my work and decide whether it could be
added to the angstrom feed.

At that point things became confusing. For Koen the build failed due
to install wanting to strip and indeed there was something in
Make.Rules that eventually resulted in an install -s.

My question/worry: why am I getting different results than Koen gets.
And what can we do to avoid this?

Of course it could also be dependent on my host env (b.t.w. I'm using
opensuse 11.1), but my impression was that things were supposed to be
host independent.

BTW: given some of the patches that are needed, would it perhaps be
better to have an oe/bin (or oe/native/bin or whatever) dir somewhere
with our own copies of things like strip, install, uname etc and have
this dir in front of the path when running bitbake?

Frans.


