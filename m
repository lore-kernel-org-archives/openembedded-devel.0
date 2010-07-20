Received: from ns0.zlo.nu ([85.17.141.90] helo=mzh.zlo.nu)
	by linuxtogo.org with esmtp (Exim 4.69) (envelope-from <zlo@zlo.nu>)
	id 1Ob7ej-0002Ac-CX for openembedded-devel@lists.openembedded.org;
	Tue, 20 Jul 2010 09:54:28 +0200
Received: from localhost.localdomain (seven.iphion.nl [80.255.245.169])
	by mzh.zlo.nu (Postfix) with ESMTP id 3624F1402C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Jul 2010 09:54:13 +0200 (CEST)
From: Marc Olzheim <zlo@zlo.nu>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 20 Jul 2010 09:54:08 +0200
Message-Id: <1279612450-16776-1-git-send-email-zlo@zlo.nu>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <20100720073237.GA10185@zlo.nu>
References: <20100720073237.GA10185@zlo.nu>
X-SA-Exim-Connect-IP: 85.17.141.90
X-SA-Exim-Mail-From: zlo@zlo.nu
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] libpng: Add add 1.2.44, new version and new
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
X-List-Received-Date: Tue, 20 Jul 2010 07:54:28 -0000

I've rewritten the previous patch.
The first patch cleans up all of the -native .bb files and the .inc file, replacing it by BBCLASSEXTEND = "native" in the libpng.inc file.
The second patch adds libpng 1.2.44, needed to fix
http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2010-1205
and
http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2010-2249

[PATCH 1/2] libpng: Clean up separate -native recipes, making use of BBCLASSEXTEND.
[PATCH 2/2] [SECURITY] libpng: add 1.2.44 to fix CVE-2010-1205 and CVE-2010-2249.


