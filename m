Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OQRYx-00058p-TR
	for openembedded-devel@lists.openembedded.org;
	Sun, 20 Jun 2010 22:56:20 +0200
Received: by bwz14 with SMTP id 14so846780bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Jun 2010 13:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=J7181bWZIeQzfgjAcCQFgjipjZHs/QX8Npz1N36HHY4=;
	b=m8hfOC/PfjihrY8LXWSwmln02GrhWmDjqDcC9QI+0UBgReRTyw2gGAnb5G5U1Q9bHe
	oan/p8+AbAJd8mKnuUe6MfoN+ruN1Jr2AVPDF4pw4cZevEJqLaDYlFmMGPPafV+G2Z0b
	KipGutPA1kLclNHn0jZiCyBe79JQJwR8JZpeE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=n5HXCHYmOtu9o4bOVvRSLN98JZ118r5Q39IQgFAycYYn8WZ7LbarKqARyrejgvWcVh
	Iy4ZieNXr+ZE0F9iW3SHSLBFBnpUl9rkC14eWomw5YBCFKx+gckD8YHlwSP+aAoV3hjO
	Wjoig2kVE2PUCAbKK32KmP6/gsNEQfVOD/pIw=
MIME-Version: 1.0
Received: by 10.204.140.153 with SMTP id i25mr2157434bku.169.1277067108105; 
	Sun, 20 Jun 2010 13:51:48 -0700 (PDT)
Received: by 10.204.77.132 with HTTP; Sun, 20 Jun 2010 13:51:48 -0700 (PDT)
Date: Sun, 20 Jun 2010 22:51:48 +0200
Message-ID: <AANLkTinfB8ijBzNHOoUSbkYIE-9Fug4nc-HOP8EICHzA@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: linux-libc-headers-native, gcc-cross issue
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
X-List-Received-Date: Sun, 20 Jun 2010 20:56:20 -0000
Content-Type: text/plain; charset=ISO-8859-1

Dear all,

After the introduction of linux-libc-headers-native I've bumped into
the following issue.
linux-libc-headers-native installs unistd.h in sysroots
This causes other recipes to pick up the x86 files instead of the target ones.
I've seen this happen for both unistd.h and sigcontext.h

One of the recipes suffering from this is gcc-cross (for some architectures).
Reason is that files are compiled with
-I/home/frans/oe/tmp_angstrom/sysroots/i686-linux/usr/include whereas
the target specific includes are added with -isystem.
This causes the -I to win.

In the past sysroots/i686-linux/usr/include was empty, but with
linux-libc-headers-native it gets populated causing the files in there
to be used instead of the ones in the target ones.
By setting linux-libc-headers-native to ASSUME-PROVIDED and cleaning
and rebuilding TMPDIR I was able to avoid the problem.

However, I think this needs a more structural solution.
Suggestions are appreciated.

Frans.

PS: it might also be that other files suffer from this, but until now
I only had problems with gcc-cross


