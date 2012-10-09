Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1TLUpJ-0006ox-Cx
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Oct 2012 10:06:05 +0200
Received: from puchatek.dom (87-206-60-225.dynamic.chello.pl [87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id A06E9D22BA
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Oct 2012 09:52:42 +0200 (CEST)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  9 Oct 2012 09:52:21 +0200
Message-Id: <1349769155-12643-1-git-send-email-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 1.7.10.4
Subject: Some updates from my world builds
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
X-List-Received-Date: Tue, 09 Oct 2012 08:06:05 -0000

During AArch64 work I did several 'world' builds to stress cross
toolchain and catch all ICEs and other problems. As there were
problems I tried to fix them when possible.

[PATCH 01/14] soft66: added missing AM_PROG_AR
[PATCH 02/14] libdivecomputer: added missing AM_PROG_AR

Those two were simple. We need to update libdivecomputer to more
up-to-date version as fix is upstream already.

[PATCH 06/14] ttf-gentium: added license stuff
[PATCH 07/14] ttf-hunkyfonts: added license stuff
[PATCH 08/14] ttf-mplus: added license stuff
[PATCH 09/14] ttf-wqy-zenhei: added license stuff
[PATCH 10/14] ttf-ubuntu-font-family: added license stuff and

Looks like no one builds those so I fixed them to comply.

[PATCH 03/14] lzip: update to 1.13
[PATCH 12/14] ca-certificates: update to 20120623 version
[PATCH 11/14] libedit: update to latest version

Previous ones were unfetchable.

[PATCH 04/14] orrery: added missing dependency on gtk+
[PATCH 05/14] lvm2: added missing dependency on udev
[PATCH 14/14] net-snmp: add pciutils to dependencies

I do love missing dependencies. Doing builds without libffi available
allows to catch interesting failures ;)

[PATCH 13/14] modemmanager: do not include glib private headers

Fix taken from upstream.


