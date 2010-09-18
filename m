Received: from mailout-de.gmx.net ([213.165.64.23] helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <schnitzeltony@gmx.de>) id 1OwwdJ-0004n1-T1
	for openembedded-devel@lists.openembedded.org;
	Sat, 18 Sep 2010 14:35:10 +0200
Received: (qmail invoked by alias); 18 Sep 2010 12:34:17 -0000
Received: from p50884064.dip.t-dialin.net (EHLO [192.168.142.128])
	[80.136.64.100]
	by mail.gmx.net (mp037) with SMTP; 18 Sep 2010 14:34:17 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1/a9Rs//HbaTaxsRbQVBe1Cnp+yBMxzWJu6beaR2e
	oNcGcn/5anpuKX
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 18 Sep 2010 14:33:06 +0200
User-Agent: KMail/1.9.6 (enterprise 0.20071012.724442)
References: <1284810428-19013-1-git-send-email-fransmeulenbroeks@gmail.com>
In-Reply-To: <1284810428-19013-1-git-send-email-fransmeulenbroeks@gmail.com>
MIME-Version: 1.0
Message-Id: <201009181433.06608.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
X-SA-Exim-Connect-IP: 213.165.64.23
X-SA-Exim-Mail-From: schnitzeltony@gmx.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] clutter: moved COMPATIBLE_MACHINE to clutter-common.inc
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
X-List-Received-Date: Sat, 18 Sep 2010 12:35:10 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Saturday 18 September 2010 01:47:08 pm Frans Meulenbroeks wrote:
> moved COMPATIBLE_MACHINE from clutter.inc to clutter-common.inc
> the other recipes all DEPEND on clutter but do not have a COMPATIBLE_MACHINE
> defined, but of course do not work for other machines.
> This patch moves COMPATIBLE_MACHINE to clutter-common.inc which is
> included by all other inc file and so it applies to all
Is there any fallout expected by removing COMPATIBLE_MACHINE? 

All machines not having an explicit DEPENDS / EXTRA_OECONF get virtual/libgl (mesa) as depends and --with-flavour=glx as defaults which should build for all (?).

If there is no damage caused by removing COMPATIBLE_MACHINE there is no need to enter (new) machines here in the future..

Andreas


