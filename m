Received: from mail.gmx.net ([213.165.64.20])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <schnitzeltony@gmx.de>) id 1OYoIq-0003fI-SY
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Jul 2010 00:50:17 +0200
Received: (qmail invoked by alias); 13 Jul 2010 22:50:13 -0000
Received: from p50885B0D.dip.t-dialin.net (EHLO [192.168.142.128])
	[80.136.91.13]
	by mail.gmx.net (mp008) with SMTP; 14 Jul 2010 00:50:13 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX18u4nAPiFku1oc0/ixyAg9N2Fl8nxl3DxeCfgs/JE
	dUTP07u06GK62D
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 14 Jul 2010 00:43:15 +0200
User-Agent: KMail/1.9.6 (enterprise 0.20071012.724442)
MIME-Version: 1.0
Message-Id: <201007140043.18547.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
X-SA-Exim-Connect-IP: 213.165.64.20
X-SA-Exim-Mail-From: schnitzeltony@gmx.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Naming/Version conventions for git/svn recipes
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
X-List-Received-Date: Tue, 13 Jul 2010 22:50:17 -0000
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

I did not find this in documentation. What is the preferred convention for PV/PR. Up to now I saw:

Option 1:
PV = "1.3.8+git${SRCREV}"
PR = "r0"

Option 2:
PV = "1.1.0"
PR = "${INC_PR}.0"
PR_append = "+git${SRCREV}"

Is there a preferred convention?

Andreas


