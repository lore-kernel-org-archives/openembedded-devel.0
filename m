Received: from qmta01.westchester.pa.hmc1.comcast.net ([76.96.53.8])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jfaith@soundmetrics.com>) id 1OHfrR-0005Wn-4M
	for openembedded-devel@lists.openembedded.org;
	Thu, 27 May 2010 18:23:10 +0200
Received: from omta03.westchester.pa.hmc1.comcast.net ([76.96.53.19])
	by qmta01.westchester.pa.hmc1.comcast.net with comcast
	id Nctf1e0090Qry6401gHzlJ; Thu, 27 May 2010 16:17:59 +0000
Received: from [192.168.10.133] ([75.147.191.205])
	by omta03.westchester.pa.hmc1.comcast.net with bizsmtp
	id NgHy1e0044SLwm301gHymp; Thu, 27 May 2010 16:17:59 +0000
Message-ID: <4BFE9AD1.6030003@soundmetrics.com>
Date: Thu, 27 May 2010 09:16:17 -0700
From: John Faith <jfaith@soundmetrics.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.8.1.22) Gecko/20090605 SeaMonkey/1.1.17
	(Ubuntu-1.1.17+nobinonly-0ubuntu1)
MIME-Version: 1.0
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 76.96.53.8
X-SA-Exim-Mail-From: jfaith@soundmetrics.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Showing build dependencies, boost needs libxt?
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
X-List-Received-Date: Thu, 27 May 2010 16:23:10 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi,
I'm trying to build boost_1.40 for omap3530.  When I use 'bitbake -g 
boost' I see no libxt or X11 stuff in the generated .dot files, but when 
I 'bitbake -c compile boost' it first tries to build libxt which fails 
for me (missing headers, which is another problem).  I'd like to 
understand where the dependency on libxt is.  Is there an easy way to 
get this info from bitbake?

Thanks,
John



