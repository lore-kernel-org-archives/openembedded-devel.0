Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1ObIKQ-00085g-AH
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Jul 2010 21:18:23 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1ObIKF-0006yD-MD from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Jul 2010 12:17:59 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Tue, 20 Jul 2010 12:17:59 -0700
Received: from [172.30.80.25] ([172.30.80.25]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Tue, 20 Jul 2010 13:17:58 -0600
Message-ID: <4C45F65F.9060307@mentor.com>
Date: Tue, 20 Jul 2010 12:17:51 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <E1ObHus-0007iy-S8@melo.openembedded.org>
In-Reply-To: <E1ObHus-0007iy-S8@melo.openembedded.org>
X-OriginalArrivalTime: 20 Jul 2010 19:17:58.0765 (UTC)
	FILETIME=[439E31D0:01CB2840]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [oe-commits] Tom Rini : bitbake.conf, local.conf.sample: Disable ccache by default
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
X-List-Received-Date: Tue, 20 Jul 2010 19:18:25 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

git version control wrote:
> Module: openembedded.git
> Branch: org.openembedded.dev
> Commit: 337e67cf191963f70006e0ccda90cea2394dbcca
> URL:    http://gitweb.openembedded.net/?p=openembedded.git&a=commit;h=337e67cf191963f70006e0ccda90cea2394dbcca
> 
> Author: Tom Rini <tom_rini@mentor.com>
> Date:   Tue Jul 20 11:50:09 2010 -0700
> 
> bitbake.conf, local.conf.sample: Disable ccache by default
> 
> This moves the current CCACHE over to local.conf.sample and documents
> when it's useful to enable.
> 
> Signed-off-by: Tom Rini <tom_rini@mentor.com>

We ran into yet another case of ccache causing a failed build on IRC 
today, and given what ccache does and doesn't buy us, I made this change.

-- 
Tom Rini
Mentor Graphics Corporation


