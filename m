Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1OeHy9-0001jw-9c
	for openembedded-devel@lists.openembedded.org;
	Thu, 29 Jul 2010 03:31:35 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1OeHxp-00027M-Bn from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Wed, 28 Jul 2010 18:31:13 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Wed, 28 Jul 2010 18:31:13 -0700
Received: from [172.30.80.63] ([172.30.80.63]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Wed, 28 Jul 2010 19:31:12 -0600
Message-ID: <4C50D9DB.1070006@mentor.com>
Date: Wed, 28 Jul 2010 18:31:07 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <i1chst$tq5$1@dough.gmane.org>
In-Reply-To: <i1chst$tq5$1@dough.gmane.org>
X-OriginalArrivalTime: 29 Jul 2010 01:31:12.0475 (UTC)
	FILETIME=[BA9D2AB0:01CB2EBD]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: 'LIBC' variable clashes with perl variable
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
X-List-Received-Date: Thu, 29 Jul 2010 01:31:35 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> Hi,
> 
> Perl (among others) uses the 'LIBC' variable to point its linker to
> libc.so.6, which fails due to OE redefing LIBC.
> 
> Any objections to renaming LIBC to TARGET_LIBC in OE?

bitbake.conf: Unexport LIBC from the environment

As spoted by Koen at least perl makes use of LIBC coming from the 
environment to be meaningful, so don't export it as it doesn't match our 
meaning.

Signed-off-by: Tom Rini <tom_rini@mentor.com>

diff --git a/conf/bitbake.conf b/conf/bitbake.conf
index d523519..ddb6a79 100644
--- a/conf/bitbake.conf
+++ b/conf/bitbake.conf
@@ -799,3 +799,6 @@ TARGET_ARCH[unexport] = "1"
  # (breaks sysvinit at least)
  DISTRO[unexport] = "1"

+# Make sure that LIBC isn't exported
+# (breaks perl at least)
+LIBC[unexport] = "1"

-- 
Tom Rini
Mentor Graphics Corporation


