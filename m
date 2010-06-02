Received: from smtp-4.concepts.nl ([213.197.30.111])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pieterg@gmx.com>) id 1OJvuw-000471-5V
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Jun 2010 23:56:08 +0200
Received: from c3404277.ftth.concepts.nl ([195.64.66.119]
	helo=mx1.grimmerink.nl) by smtp-4.concepts.nl with esmtp (Exim 4.69)
	(envelope-from <pieterg@gmx.com>) id 1OJvql-0002HI-Rm
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Jun 2010 23:51:47 +0200
Received: from [10.9.0.12] (unknown [10.9.0.12])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.grimmerink.nl (Postfix) with ESMTPSA id 3E3096A0EA
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 Jun 2010 23:51:43 +0200 (CEST)
From: pieterg <pieterg@gmx.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 2 Jun 2010 23:51:37 +0200
User-Agent: KMail/1.9.9
MIME-Version: 1.0
Message-Id: <201006022351.38129.pieterg@gmx.com>
X-Concepts-MailScanner-Information: Please contact abuse@concepts.nl for more
	information
X-Concepts-MailScanner-ID: 1OJvql-0002HI-Rm
X-Concepts-MailScanner: Found to be clean
X-Concepts-MailScanner-SpamCheck: 
X-Concepts-MailScanner-From: pieterg@gmx.com
X-SA-Exim-Connect-IP: 213.197.30.111
X-SA-Exim-Mail-From: pieterg@gmx.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
	SPF_FAIL autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: AUTOREV and SRCPV
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
X-List-Received-Date: Wed, 02 Jun 2010 21:56:08 -0000
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

I have only a handful of (git) packages for which I need to use AUTOREV, but 
when I define

BB_GIT_CLONE_FOR_SRCREV = "1"
BB_LOCALCOUNT_OVERRIDE = ""

the sideeffect is that hundreds of other packages (which I don't need) are 
suddenly having their repositories cloned as well, when their bb files are 
parsed. Even though these packages are not using AUTOREV, they have fixed 
SRCREV's (either in their bb files, or in my distro).

This is obviously taking a long time, consuming a lot of diskspace, 
generating error messages for invalid git urls, and eventually bitbake will 
fail because it encountered 'parsing errors' because of those invalid git 
urls.

I guess this is because all of these packages are using ${SRCPV} in their 
PV, instead of ${SRCREV} (probably in order to find the correct LOCALCOUNT 
for the gitrev).

But argueing that people who don't use BB_GIT_CLONE_FOR_SRCREV will not get 
these LOCALCOUNT's in their PV anyway, and people that do use 
BB_GIT_CLONE_FOR_SRCREV will use SRCREV = ${AUTOREV} for the packages which 
they want to be automatically updated, so SRCREV would equal SRCPV, 
wouldn't it make sense to just use ${SRCREV} instead of ${SRCPV} in PV?

Rgds, Pieter


