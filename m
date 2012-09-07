Received: from outrightsolutions.nl ([194.145.201.26]
	helo=mail.outrightsolutions.nl)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sander@outrightsolutions.nl>) id 1T9v6i-0006SS-Ob
	for openembedded-devel@lists.openembedded.org;
	Fri, 07 Sep 2012 11:44:12 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.outrightsolutions.nl (Postfix) with ESMTP id 6D68F5BCA11
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Sep 2012 11:31:49 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at outrightsolutions.nl
Received: from mail.outrightsolutions.nl ([127.0.0.1])
	by localhost (hydrogen.outrightsolutions.nl [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id i+O3lN86pVea
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Sep 2012 11:31:48 +0200 (CEST)
Received: from [IPv6:2a02:2308::1ab:f800:2] (unknown
	[IPv6:2a02:2308::1ab:f800:2])
	by mail.outrightsolutions.nl (Postfix) with ESMTPSA id D2E915BCA10
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Sep 2012 11:31:48 +0200 (CEST)
Message-ID: <5049BEFD.9040003@outrightsolutions.nl>
Date: Fri, 07 Sep 2012 11:31:41 +0200
From: Sander van Grieken <sander@outrightsolutions.nl>
Organization: Outright Solutions
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: linux-firmware
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
X-List-Received-Date: Fri, 07 Sep 2012 09:44:12 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi,

Currently, linux-firmware produces one big package with all binary
firmware files installed. It would be benificial , especially for
devices with a very small rootfs, to install only a subset of the entire
collection. Some effort has been done to split off separate packages,
but it's not clear what the preferred naming should be.

- Should it follow the kernel-module-* naming, e.g.
kernel-module-ath9k-htc would need linux-firmware-ath9k-htc?
- Or should it follow the firmware file naming, e.g. linux-firmware-htc-7010
- Or maybe have a bit larger packages and simply split by vendor, e.g.
linux-firmware-atheros
- How and if to package the license file

Thoughts?



