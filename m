Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Qp1ab-0007Cn-Hb
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Aug 2011 19:20:09 +0200
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1Qp1WI-0005AG-B5 from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Aug 2011 10:15:42 -0700
Received: from SVR-ORW-FEM-04.mgc.mentorg.com ([147.34.97.41]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Thu, 4 Aug 2011 10:12:12 -0700
Received: from [172.30.80.87] (147.34.91.1) by svr-orw-fem-04.mgc.mentorg.com
	(147.34.97.41) with Microsoft SMTP Server id 14.1.289.1;
	Thu, 4 Aug 2011 10:15:41 -0700
Message-ID: <4E3AD3A9.4000101@mentor.com>
Date: Thu, 4 Aug 2011 10:15:21 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.18) Gecko/20110617 Lightning/1.0b2 Thunderbird/3.1.11
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <0C757E680E33864AB113392C7E83F910BE5D9A@GSX300A.mxchg.m.corp>
	<0C757E680E33864AB113392C7E83F910BE51C7@GSX300A.mxchg.m.corp>
In-Reply-To: <0C757E680E33864AB113392C7E83F910BE51C7@GSX300A.mxchg.m.corp>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 04 Aug 2011 17:12:12.0015 (UTC)
	FILETIME=[A66087F0:01CC52C9]
Subject: Re: 2011.03-maintenance: eglibc-binary-localedata packages	missing on image
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
X-List-Received-Date: Thu, 04 Aug 2011 17:20:09 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 08/04/2011 03:10 AM, Hauser, Wolfgang (external) wrote:
> Ping ...
> 
> Has someone an idea how to solve this problem ?
> 
> If we examine the angstrom glibc "locale-base-*" packages they have an dependency on the  "glibc-binary-localedata-*" but no provides entry for this package.

I would look at classes/libc-package.bbclass and
recipes/eglibc/eglibc-package.inc in oe.dev and see if there's been a
fix here that needs to be back ported / cherry-picked.

-- 
Tom Rini
Mentor Graphics Corporation


