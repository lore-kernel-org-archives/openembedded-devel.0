Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1OF7Qb-0000ew-LW
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 May 2010 17:12:56 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1OF7Mf-00007a-V7 from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 May 2010 08:08:49 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Thu, 20 May 2010 08:08:49 -0700
Received: from [172.30.80.86] ([172.30.80.86]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 20 May 2010 09:08:48 -0600
Message-ID: <4BF55079.6030905@mentor.com>
Date: Thu, 20 May 2010 08:08:41 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <bug-5437-13@http.bugs.openembedded.org/>
	<AANLkTilUYA_uexLXydVxyFGHnKol23h1LYOBfOkU7Wzt@mail.gmail.com>
In-Reply-To: <AANLkTilUYA_uexLXydVxyFGHnKol23h1LYOBfOkU7Wzt@mail.gmail.com>
X-OriginalArrivalTime: 20 May 2010 15:08:48.0591 (UTC)
	FILETIME=[596BEDF0:01CAF82E]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [oe-commits] [Bug 5437] New: packaged-staging freezes
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
X-List-Received-Date: Thu, 20 May 2010 15:12:56 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Andrea Adami wrote:
> I had same stall on:
> 
> NOTE: package stagemanager-native-0.0.1-r12: task do_package_write: Succeeded
> 
> There is one patch is shr repo removing one lockfile in
> packaged-staging.bbclass which helped my rebuild.
> 
> http://gitorious.org/~jama/angstrom/jama-shr-experimental/commit/1ae868c5f4029f1862555e97a1aba37a8935221c
> 
> I think RP could say something about this lock.

iirc, that's mine or Chris'.  We want to have a lock on installing 
pstaging otherwise gcc-cross{,-initial,-intermediate} and 
libc{,-initial} can get done in the wrong order.

-- 
Tom Rini
Mentor Graphics Corporation


