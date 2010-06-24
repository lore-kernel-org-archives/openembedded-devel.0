Received: from infosrv.imms.de ([194.95.250.51])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <thomas.elste@imms.de>) id 1ORiTa-0003dA-TU
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Jun 2010 11:12:18 +0200
Received: from infosrv.imms.de (infosrv.imms.de [127.0.0.1])
	by IMSA (Postfix) with ESMTP id 4065F260053
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Jun 2010 11:07:25 +0200 (CEST)
Received: from proxy.imms.de (proxy.imms.de [194.95.250.53])
	by infosrv.imms.de (Postfix) with ESMTP id 1D4D326004A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Jun 2010 11:07:25 +0200 (CEST)
Received: from pluto.imms.de ([172.16.10.24])
	by proxy.imms.de (8.13.8+Sun/8.13.8) with ESMTP id o5O97ZAb013351
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Jun 2010 11:07:35 +0200 (CEST)
From: Thomas Elste <thomas.elste@imms.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 24 Jun 2010 11:06:13 +0200
Message-Id: <1277370374-4677-1-git-send-email-thomas.elste@imms.de>
X-Mailer: git-send-email 1.7.1
X-SA-Exim-Connect-IP: 194.95.250.51
X-SA-Exim-Mail-From: thomas.elste@imms.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Add current Qwt version
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
X-List-Received-Date: Thu, 24 Jun 2010 09:13:02 -0000
X-List-Received-Date: Thu, 24 Jun 2010 09:13:02 -0000
X-List-Received-Date: Thu, 24 Jun 2010 09:13:02 -0000
X-List-Received-Date: Thu, 24 Jun 2010 09:13:02 -0000
X-List-Received-Date: Thu, 24 Jun 2010 09:13:02 -0000
X-List-Received-Date: Thu, 24 Jun 2010 09:13:02 -0000

Hi everyone,

the following patch adds support for the current version
of Qwt. Qt and Qt-Embedded variants are supported.

On Tue, 22 Jun 2010 16:27:55 +0200, Koen Kooi wrote:
> Could you make the -e and regular variants parallel installable? The
> demos could be put in ${D}${bindir}/qwt-examples${QWT_VARIANT} for example.
The Qwt library for Qt-Embedded now gets the suffix "E" appended
like all other Qt-Embedded librarys. Examples are installed in
different directories. So both variants may be installed in parallel.
Tested on Beagleboard/Angstrom with qt-embedded-4.6.2 and
qt4-x11-free-gles-4.6.2.

Regards
Thomas



