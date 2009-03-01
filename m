Received: from [212.60.202.196] (helo=mail.kernelconcepts.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <nils.faerber@kernelconcepts.de>) id 1LdvRn-00069t-1I
	for Openembedded-devel@lists.openembedded.org;
	Mon, 02 Mar 2009 00:51:51 +0100
Received: from [85.181.241.28] (helo=[192.168.178.35])
	by mail.kernelconcepts.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.63)
	(envelope-from <nils.faerber@kernelconcepts.de>) id 1Ldvcl-0006CL-0B
	for Openembedded-devel@lists.openembedded.org;
	Mon, 02 Mar 2009 01:03:11 +0100
Message-ID: <49AB1EB0.5090002@kernelconcepts.de>
Date: Mon, 02 Mar 2009 00:48:00 +0100
From: Nils Faerber <nils.faerber@kernelconcepts.de>
User-Agent: Thunderbird 2.0.0.19 (X11/20090105)
MIME-Version: 1.0
To: Openembedded-devel@lists.openembedded.org
X-Enigmail-Version: 0.95.0
Subject: Dependency tracking - or - how to get rid of kexec-tools
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
X-List-Received-Date: Sun, 01 Mar 2009 23:51:51 -0000
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit

Hi!
I just found a little bit of a problem and am now looking for the most
correct solution to it...
I am trying to build x11-image for a mipsel target. I am using the
dev-head and angstrom-2009 or DISTRO_VERSION = "2009.X-test-20090301"
respectively.
The problem is that this constellation includes kexec-tools-static for
something just that kexec-tools-1.101 does not support mipsel.
As far as I have seen it I will not make use of kexec-tools later on. I
just want to build a quite simple X11 image for that device.

So I can do two things:
1. Get rid of the dependency so that it will not be built. How can I
find out which dependency pulls in kexec-tools?

2. Upgrade kexec-tools to the version that is e.g. in Debian, like
kexec-tools_20080324.orig.tar.gz which now include mipsel support.

So, what to do now?
Even if 2. would be the best way to go I would still be interested how
one can trace this kind of dependency - sometimes I would be really
interested why certain packages are built.


PS: I am planning on submitting this mipsel machine support. What would
be the best way? Create a diff against dev-head and post here?

Cheers
  nils faerber

-- 
kernel concepts GbR      Tel: +49-271-771091-12
Sieghuetter Hauptweg 48  Fax: +49-271-771091-19
D-57072 Siegen           Mob: +49-176-21024535
--


