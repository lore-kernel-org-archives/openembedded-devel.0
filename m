Received: from asmtpout030.mac.com ([17.148.16.105])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <elvis.dowson@mac.com>) id 1NZ7WM-0004oU-3R
	for openembedded-devel@lists.openembedded.org;
	Sun, 24 Jan 2010 19:49:17 +0100
MIME-version: 1.0
Received: from [87.201.169.25] by asmtp030.mac.com
	(Sun Java(tm) System Messaging Server 6.3-8.01 (built Dec 16 2008;
	32bit)) with ESMTPSA id <0KWR00GDXLI18L90@asmtp030.mac.com> for
	openembedded-devel@lists.openembedded.org; Sun,
	24 Jan 2010 10:46:53 -0800 (PST)
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
	ipscore=0 phishscore=0 bulkscore=0 adultscore=0 classifier=spam
	adjust=0
	reason=mlx engine=5.0.0-0908210000 definitions=main-1001240108
From: Elvis Dowson <elvis.dowson@mac.com>
Date: Sun, 24 Jan 2010 22:46:45 +0400
In-reply-to: <alpine.LFD.2.00.1001241145320.16223@localhost>
To: openembedded-devel@lists.openembedded.org
References: <687C35F4-E7DC-4898-907F-8C1CE8890887@mac.com>
	<alpine.LFD.2.00.1001241145320.16223@localhost>
Message-id: <886C8CCB-A820-4CE5-907B-033A2415DABF@mac.com>
X-Mailer: Apple Mail (2.1077)
X-SA-Exim-Connect-IP: 17.148.16.105
X-SA-Exim-Mail-From: elvis.dowson@mac.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Build failure module-init-tools-cross_3.2.2.bb on Fedora 12 x86_64
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
X-List-Received-Date: Sun, 24 Jan 2010 18:49:17 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT

Hi Robert,

On Jan 24, 2010, at 8:46 PM, Robert P. J. Day wrote:
> 
>  what branch are you working from that has that as a target?  i have
> no such task on the OE dev branch.

Its 1.8. Here is the command fragment that I used, once again. 

$ git clone git://git.openembedded.org/bitbake.git
$ cd bitbake
$ git checkout -b 1.8 --track origin/1.8
$ cd ..

After I installed glibc-static, the build errors went away and I was able to do a full build of the omap3-console-image.

I'm now going to time a fresh build to see just how much performance speed up I get over my previous 32-bit Fedora 10 image. Will post the results shortly.

Best regards,

Elvis



