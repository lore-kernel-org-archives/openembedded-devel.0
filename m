Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1P2Dvf-0006aP-69
	for openembedded-devel@lists.openembedded.org;
	Sun, 03 Oct 2010 04:03:56 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1P2DvO-0001gO-Kf from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Sat, 02 Oct 2010 19:03:38 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Sat, 2 Oct 2010 19:03:38 -0700
Received: from [172.30.80.12] ([172.30.80.12]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Sat, 2 Oct 2010 20:03:35 -0600
Message-ID: <4CA7E46F.9080409@mentor.com>
Date: Sat, 02 Oct 2010 19:03:27 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1286038095.3743.9.camel@mattotaupa>
In-Reply-To: <1286038095.3743.9.camel@mattotaupa>
X-OriginalArrivalTime: 03 Oct 2010 02:03:35.0700 (UTC)
	FILETIME=[30214540:01CB629F]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] python-{native}-2.6.5: Fix parallel build.
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
X-List-Received-Date: Sun, 03 Oct 2010 02:03:56 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Paul Menzel wrote:
> Date: Sat, 2 Oct 2010 12:51:03 +0200
> 
> Randomly the build failed for me with the following error message.
> 
>     libpython2.6.so: undefined reference to `_PyParser_Grammar'
> 
> The applied patch in [5] tried to fix this problem, but it turns out that this was due to a possible race and already known in OpenOffice too [3].
> 
> R. David Murray (dmalcolm) <dmalcolm@fedoraproject.org> fixed this in Fedora [1] and I applied his patch.
> 
> I reported this issue upstream [4] and this will only be fixed in Python 2.7, so we have to keep this patch for Python 2.6.
> 
> [1] http://pkgs.fedoraproject.org/gitweb/?p=python.git;a=commitdiff;h=b95f6cc2ca6a009f97436c6aa16cfd70547353d9
> [2] http://www.openoffice.org/issues/show_bug.cgi?id=114866
> [3] http://doc.services.openoffice.org/wiki/RedTinderboxStatusInEIS
> [4] http://bugs.python.org/issue10013
> [5] http://patchwork.openembedded.org/patch/1899/
> 
> Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>

Aside from what Khem said, thanks for tracking this one down!

-- 
Tom Rini
Mentor Graphics Corporation


