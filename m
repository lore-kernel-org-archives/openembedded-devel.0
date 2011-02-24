Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1PskZ2-0001iY-RE
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Feb 2011 00:25:41 +0100
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1PskXZ-0000XR-9H from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Feb 2011 15:24:09 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	svr-orw-fem-01.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Thu, 24 Feb 2011 15:24:09 -0800
Received: from [172.30.80.151] ([172.30.80.151]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 24 Feb 2011 16:24:08 -0700
Message-ID: <4D66E88B.6040506@mentor.com>
Date: Thu, 24 Feb 2011 16:23:55 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-OriginalArrivalTime: 24 Feb 2011 23:24:08.0241 (UTC)
	FILETIME=[EF60A210:01CBD479]
Subject: Release-2011.03: Let the testing continue again!
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
X-List-Received-Date: Thu, 24 Feb 2011 23:25:41 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hey all,

I've updated the testing-release-2011.03 branch exist now and we're 
ready for more testing.  As a reminder, please update the table on 
http://wiki.openembedded.org/index.php?title=Release-2011.03 with your 
results and the githash you're on.

This go-around should be much less bumpy as we've both fixed a number of 
RPATH issues and made the error non-fatal.  I've also pushed a small 
number of fixes for issues I hit in my builder but once again need to 
add one more thing locally to confirm or rule out an occasional bug (the 
config.sub failure I reported earlier in testing out the cross.bbclass 
patch for RPATH stuff).

If all goes well, I plan to make a temporary branch Tuesday, add in (and 
then revert from master at Khem's request) 
http://patches.openembedded.org/patch/256/ since it is needed for 
SHR/shr-image to work.  Get one last go-round and then call it a release.

Thanks again all!

-- 
Tom Rini
Mentor Graphics Corporation


