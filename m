Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P62E6-0001K8-Su
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Oct 2010 16:22:47 +0200
Received: by iwn2 with SMTP id 2so2550741iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Oct 2010 07:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=JYKH0IWA32yRN0XHfucilUmdY2He5Pr39UqOSEKR05o=;
	b=msocvVQCCypenjS8gaAG1Oq7ORvay7I2t3M1eItFMwxLKx8JCDySkUDOwp3AdUm7jW
	i2CdWisBuU2E0LDfYG6tR2KpgaACWw44oeXPC2wKZ4154tOpg6Ia2iwSLthUljACcum9
	dH0QzJjKId42uvJ/iw3dS7n07a/Qc8EiZEhdI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=amEL2P5kb7mNgg6QkkXJvo8z2rvnZ7UEzcfxYXLGt9ENOZWmqlID7GIHlkMbgju6WJ
	pB92qGohlNTPSvWGzg3di9SwSnZ3fWSc7vlum71vAuUHgPfn7N3WhI3sq/srEM4gMsAn
	1gkoaURSYgRv0P++RYJ0eE9z73/h5G6kVJkjk=
MIME-Version: 1.0
Received: by 10.231.183.10 with SMTP id ce10mr7099026ibb.96.1286979131488;
	Wed, 13 Oct 2010 07:12:11 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Wed, 13 Oct 2010 07:12:09 -0700 (PDT)
Date: Wed, 13 Oct 2010 16:12:09 +0200
Message-ID: <AANLkTimmoNWm5fDxSBvR7MSUDBH8w0FyiRMFoR5WXuuf@mail.gmail.com>
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
Subject: do we need patch-native ?
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
X-List-Received-Date: Wed, 13 Oct 2010 14:22:52 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

I had to do a build on OpenSuse 11.3 today, and it failed building
quilt-native (0.46-r2)

Root cause is that quilt configure tries to find whether patch is
installed and has a version > 2.4
It does so by calling patch --version and extract the version string from it.

The patch from 11.3 identifies itself as:
GNU patch 2.6.1.81-5b68
However the quilt configure script expected to find output like:
patch 2.6 (which is what I get on my ubuntu 10.4 version).

I see several possible options to fix this:
- make a package patch-native, so we can use our own patch
- patch quilt so its configure can deal with both patch version strings

Problem with the latter is that I have no idea how many other recipes
will have a similar test (and definitely they are not all triggered by
the images I regularly build.
Therefore I think I have a preference to introduce patch-native, but I
would like to hear how you guys & gals think about this, and whether
you see other options.

Best regards, Frans


