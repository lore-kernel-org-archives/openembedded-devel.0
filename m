Received: from mailout-de.gmx.net ([213.165.64.22] helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <schnitzeltony@gmx.de>) id 1OZtzg-0006qX-MS
	for openembedded-devel@lists.openembedded.org;
	Sat, 17 Jul 2010 01:07:15 +0200
Received: (qmail invoked by alias); 16 Jul 2010 23:00:07 -0000
Received: from p508856FC.dip.t-dialin.net (EHLO [192.168.142.128])
	[80.136.86.252]
	by mail.gmx.net (mp008) with SMTP; 17 Jul 2010 01:00:07 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1/I3nQEAhTIRkUYweZBueYYKf7kIxOMMEe0flEy1p
	9VcuO3GDvvHBG9
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 17 Jul 2010 00:52:26 +0200
User-Agent: KMail/1.9.6 (enterprise 0.20071012.724442)
MIME-Version: 1.0
Message-Id: <201007170052.26932.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
X-SA-Exim-Connect-IP: 213.165.64.22
X-SA-Exim-Mail-From: schnitzeltony@gmx.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: How to force a bash-function to be inserted in the package
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
X-List-Received-Date: Fri, 16 Jul 2010 23:07:16 -0000
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

I am working on a scenario where two recipes (powervr-drivers: libgles-omap3 / omap3-sgx-modules) should share the same code at the pkg_postinst state (I want to select if the cpu supports 
sgx and select the proper version of module/lib 2.x 3.x 5.x only once and forever). To avoid redundant code I added a function in a file both recipes include. In the recipes I simply say 

pkg_postinst_${PN}_prepend() {
	check_cpu_for_sgx ${base_libdir}/modules/${KERNEL_VERSION}/kernel/drivers/gpu/pvr
}

check_cpu_for_sgx is the function included in both recipes.

I did not run this so far (I haven't got a hardware right now to test) but I expect this not to work because the function check_cpu_for_sgx will not be included the packet information (I checked I 
didn't find this function in the files of the package).

Now my question:

Is there something (e.g a keyword prepended to the function) which forces oe to include a function in the postinst/postrm code?


