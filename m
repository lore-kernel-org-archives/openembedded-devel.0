Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1OxhXP-00062v-1e
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Sep 2010 16:40:14 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1OxhXG-0001DZ-Ue from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Sep 2010 07:40:02 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Mon, 20 Sep 2010 07:40:02 -0700
Received: from [172.30.80.197] ([172.30.80.197]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 20 Sep 2010 08:40:01 -0600
Message-ID: <4C97723F.7010401@mentor.com>
Date: Mon, 20 Sep 2010 07:39:59 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <E1OxTYC-0004Sl-3k@melo.openembedded.org>
In-Reply-To: <E1OxTYC-0004Sl-3k@melo.openembedded.org>
X-OriginalArrivalTime: 20 Sep 2010 14:40:01.0955 (UTC)
	FILETIME=[B5136F30:01CB58D1]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [oe-commits] Khem Raj : iphone: Exclude from world.
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
X-List-Received-Date: Mon, 20 Sep 2010 14:40:14 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

git version control wrote:
> Module: openembedded.git
> Branch: master
> Commit: 0319f8878547c6e8a78373cfc86a85cea60450ae
> URL:    http://gitweb.openembedded.net/?p=openembedded.git&a=commit;h=0319f8878547c6e8a78373cfc86a85cea60450ae
> 
> Author: Khem Raj <raj.khem@gmail.com>
> Date:   Sun Sep 19 16:38:38 2010 -0700
> 
> iphone: Exclude from world.
> 
> apple-csu overwrites the C startup files and nothing works after that
> we can not select them with normal linux toolchain being staged and
> used
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

Shouldn't this be a COMPATIBLE_something case?  You'd want this for 
world if that was what you were targeting... no?

-- 
Tom Rini
Mentor Graphics Corporation


