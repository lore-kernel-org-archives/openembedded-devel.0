Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1QRQSz-0008Dl-El
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 May 2011 17:02:48 +0200
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1QRQPv-0004qY-RK from Tom_Rini@mentor.com ;
	Tue, 31 May 2011 07:59:35 -0700
Received: from SVR-ORW-FEM-02.mgc.mentorg.com ([147.34.96.206]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Tue, 31 May 2011 07:56:07 -0700
Received: from [172.30.80.84] (147.34.91.1) by svr-orw-fem-02.mgc.mentorg.com
	(147.34.96.168) with Microsoft SMTP Server id 14.1.289.1;
	Tue, 31 May 2011 07:59:34 -0700
Message-ID: <4DE50256.1020000@mentor.com>
Date: Tue, 31 May 2011 07:59:34 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: Paul Menzel <paulepanter@users.sourceforge.net>
References: <201105220001.36288.schnitzeltony@gmx.de>	
	<201105220143.54594.schnitzeltony@gmx.de>
	<1306782978.4106.483.camel@mattotaupa>
In-Reply-To: <1306782978.4106.483.camel@mattotaupa>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 31 May 2011 14:56:07.0735 (UTC)
	FILETIME=[DF3C8470:01CC1FA2]
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] Revert "perl-native: create_wrapper on perl${PV} too"
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
X-List-Received-Date: Tue, 31 May 2011 15:02:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On 05/30/2011 12:16 PM, Paul Menzel wrote:
> From: Paul Menzel <paulepanter@users.sourceforge.net>
> Date: Mon, 30 May 2011 21:08:24 +0200
> 
> This reverts commit 1e255fbd296e95ff178d66c4a1fe4875a988d7e1.
> 
> 	Author: Tom Rini <tom_rini@mentor.com>
> 	Date:   Mon May 16 13:06:33 2011 -0700
> 
> 		  perl-native: create_wrapper on perl${PV} too
> 
> 		  perl${PV} becomes hostperl when building for the target so we need a
> 		  wrapper on that too.
> 
> 		  Signed-off-by: Tom Rini <tom_rini@mentor.com>
> 
> It breaks task compile of perl using `angstrom-2010.x` or `minimal{,-uclibc}` for `MACHINE = "beagleboard"` [1].

Didn't another change go in which fixes this go in?

-- 
Tom Rini
Mentor Graphics Corporation


