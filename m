Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1Oh1q8-0006Cb-Qx
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Aug 2010 16:54:38 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1Oh1pv-00012Z-Rs from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Aug 2010 07:54:23 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Thu, 5 Aug 2010 07:54:23 -0700
Received: from [172.30.80.92] ([172.30.80.92]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 5 Aug 2010 08:54:22 -0600
Message-ID: <4C5AD09A.8090303@mentor.com>
Date: Thu, 05 Aug 2010 07:54:18 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <E1OguCD-00023v-03@melo.openembedded.org>	<201008051138.00510.khimov@altell.ru>
	<20100805082440.GE29578@jama>	<201008051241.24091.khimov@altell.ru>
	<AANLkTimfaAw_wmNddavmknv4O5haMqLuXDa8v7ECYZyF@mail.gmail.com>
In-Reply-To: <AANLkTimfaAw_wmNddavmknv4O5haMqLuXDa8v7ECYZyF@mail.gmail.com>
X-OriginalArrivalTime: 05 Aug 2010 14:54:22.0916 (UTC)
	FILETIME=[173F2840:01CB34AE]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [oe-commits] Roman I Khimov : bitbake.conf: trust server certificate when doing svn over https
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
X-List-Received-Date: Thu, 05 Aug 2010 14:54:38 -0000
Content-Type: text/plain; charset=KOI8-R; format=flowed
Content-Transfer-Encoding: 8bit

Frans Meulenbroeks wrote:
> 2010/8/5 Roman I Khimov <khimov@altell.ru>:
>> В сообщении от Четверг 05 августа 2010 12:24:40 автор Martin Jansa написал:
> 
>>> I don't know if it's worth it to force builders to upgrade subversion or
>>> add their FETCHCOMMAND_svn UPDATECOMMAND_svn to local.conf.
>> IMO we should not break support for major stable (or LTS) distros, so my patch
>> is broken.
>>
> I agree that we should not break support for major distros. but
> without your patch some of the recipes cannot be build easily.
> The solution of Martin seems a good inbetween.

Adding subversion-native isn't hard, I've got one around locally for 
RHEL4 :) It's svn 1.6.5.  Also got the logic to add svn-native for any 
svn:// uris.

-- 
Tom Rini
Mentor Graphics Corporation


