Received: from [207.164.182.72] (helo=smtp.cbnco.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jmahonin@cbnco.com>) id 1MYPSw-0000q7-I2
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Aug 2009 21:14:30 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 2B7BC52D5F5
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  4 Aug 2009 14:58:56 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 27862-07 for <openembedded-devel@lists.openembedded.org>; 
	Tue,  4 Aug 2009 14:58:56 -0400 (EDT)
Received: from [172.20.22.81] (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTPSA id DCF4652D5EF
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  4 Aug 2009 14:58:55 -0400 (EDT)
Message-ID: <4A7884EA.7070104@cbnco.com>
Date: Tue, 04 Aug 2009 14:58:50 -0400
From: Josh Mahonin <jmahonin@cbnco.com>
User-Agent: Thunderbird 2.0.0.18 (X11/20081112)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Virus-Scanned: amavisd-new at cbnco.com
Subject: [RFC] Issues with 'RDEPENDS kernel' in module.bbclass using .deb packages
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
X-List-Received-Date: Tue, 04 Aug 2009 19:14:30 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi all,

I'm working on an updated recipe for nvidia-display, but unfortunately
during the rootfs stage of building an image it errors out on :
---
The following packages have unmet dependencies:
  nvidia-display: Depends: kernel (= 2.6.30) but 2.6.30-r1 is to be
installed
---


Now I'm building debian style packages, so when I check /var/dpkg/status
under the rootfs (which classes/rootfs_deb.bbclass uses) , sure enough I
have an entry for the kernel, with both the PV and PR in the 'Version'
field:
---
Package: kernel
Status: install ok unpacked
...
Version: 2.6.30-r1
...
---


In classes/module.bbclass, however, we have the RDEPENDS which matches
only on PV, without the PR:
---
RDEPENDS += "kernel (${KERNEL_VERSION}) update-modules"
---

In the meantime I've worked around it by removing the KERNEL_VERSION
requirement in module.bbclass, although I don't think that's really the
right way to do it.

I suppose I could remove writing the PR to the status file, although
that might be useful to keep as a reference when upgrading packages
later.  It looks IPK-style packages also keep the PR in the version
field - is this an issue for those users as well, or is this DEB specific?

Are there any thoughts as to the right way to fix this issue?

Thanks in advance,

Josh


