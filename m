Received: from p3plsmtpa01-05.prod.phx3.secureserver.net ([72.167.82.85])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <mike@mwester.net>) id 1O0FKS-0008L2-Ab
	for openembedded-devel@lists.openembedded.org;
	Fri, 09 Apr 2010 16:37:05 +0200
Received: (qmail 24737 invoked from network); 9 Apr 2010 14:26:58 -0000
Received: from unknown (209.242.7.187)
	by p3plsmtpa01-05.prod.phx3.secureserver.net (72.167.82.85) with ESMTP;
	09 Apr 2010 14:26:57 -0000
Message-ID: <4BBF3920.1000702@mwester.net>
Date: Fri, 09 Apr 2010 09:26:40 -0500
From: Mike Westerhof <mike@mwester.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.8.1.24) Gecko/20100228 Thunderbird/2.0.0.24 Mnenhy/0.7.6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <r2u48239d391004090326qb2a80dd6ic11530d737c6edde@mail.gmail.com>	<201004091439.53806.khimov@altell.ru>	<k2j48239d391004090353mcc7c01a0o4bc58d8c1efd5c27@mail.gmail.com>	<201004091526.53400.khimov@altell.ru>
	<q2r48239d391004090658m577b6d71vcde72629078be670@mail.gmail.com>
In-Reply-To: <q2r48239d391004090658m577b6d71vcde72629078be670@mail.gmail.com>
X-SA-Exim-Connect-IP: 72.167.82.85
X-SA-Exim-Mail-From: mike@mwester.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: postinst scripts and opkg configure
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
X-List-Received-Date: Fri, 09 Apr 2010 14:37:05 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Sergey Lapin wrote:
>> Actually, update-rc.d scripts should work on build host (that "$OPT" in script
>> is exactly for that purpose) and so are update-alternatives (thanks to
>> OPKG_OFFLINE_ROOT magic), so there might be something wrong with your setup.
> I found the reason for that error - update-rc.d is not being staged,
> so scripts fail.

Same problem encountered here - this commit fixed it for SlugOS (which
has its own initscripts which explicitly invoke update-rc.d, thus
causing an obvious build failure): c906fd7faa8517ca565faba90887d10ebb90e092
Basically, adding RDEPENDS="update-rc.d" and
DEPENDS="update-rc.d-native" resolved the issue.

(I glanced at the other initscripts BB files, and didn't change those
because there wasn't an obvious reference to update-rc.d in the recipes
-- I didn't consider the use case you described or I would have fixed
those recipes as well.)

> bitbake update-rc.d update-rc.d-native -c rebuild doesn't help either.
> Can't see why, because copying it from workdir to staging bin fixes
> this problem.
> Any ideas?
> 
> S.

-Mike (mwester)



