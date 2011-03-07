Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1PwfoU-0004B5-5T
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Mar 2011 20:09:50 +0100
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1Pwfn0-00032T-Fz from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Mar 2011 11:08:18 -0800
Received: from SVR-ORW-FEM-04.mgc.mentorg.com ([147.34.97.41]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Mon, 7 Mar 2011 11:08:18 -0800
Received: from [172.30.80.238] (147.34.91.1) by svr-orw-fem-04.mgc.mentorg.com
	(147.34.97.41) with Microsoft SMTP Server id 14.1.270.1;
	Mon, 7 Mar 2011 11:08:16 -0800
Message-ID: <4D752D1A.6050808@mentor.com>
Date: Mon, 7 Mar 2011 12:08:10 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.14) Gecko/20110223 Lightning/1.0b2 Thunderbird/3.1.8
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1299522811-2065-1-git-send-email-dick@softplc.com>
In-Reply-To: <1299522811-2065-1-git-send-email-dick@softplc.com>
X-OriginalArrivalTime: 07 Mar 2011 19:08:18.0318 (UTC)
	FILETIME=[04A782E0:01CBDCFB]
Subject: Re: [PATCH] cc1 and cc1plus had about 20 mbytes of debug	information each, in the final redistributable form. This patch strips those two	binaries yielding a savings of about 40 mbytes per SDK.
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
X-List-Received-Date: Mon, 07 Mar 2011 19:09:50 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 03/07/2011 11:33 AM, Dick Hollenbeck wrote:
> Signed-off-by: Dick Hollenbeck<dick@softplc.com>

We recently added logic to conf/distro/include/sane-toolchain-* to 
handle the debug level via DEBUG_LEVEL.  Would you mind adding a 
DEBUG_LEVEL_HOST to conf/bitbake.conf and making BUILD_OPTIMIZATION obey 
that instead so that we can drop debug info from all of them?  Thanks.

-- 
Tom Rini
Mentor Graphics Corporation


