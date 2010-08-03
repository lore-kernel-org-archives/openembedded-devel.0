Received: from asmtpout026.mac.com ([17.148.16.101])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <elvis.dowson@mac.com>) id 1OgPnE-0000va-Rp
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Aug 2010 00:17:21 +0200
MIME-version: 1.0
Received: from [192.168.1.103] ([87.201.169.38])
	by asmtp026.mac.com (Sun Java(tm) System Messaging Server 6.3-8.01
	(built Dec
	16 2008; 32bit)) with ESMTPSA id <0L6L00BEUKJM4Y90@asmtp026.mac.com> for
	openembedded-devel@lists.openembedded.org; Tue,
	03 Aug 2010 15:16:39 -0700 (PDT)
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
	ipscore=0 phishscore=0 bulkscore=0 adultscore=0 classifier=spam
	adjust=0
	reason=mlx engine=6.0.2-1004200000 definitions=main-1008030183
X-Proofpoint-Virus-Version: vendor=fsecure
	engine=2.50.10432:5.0.10011,1.0.148,0.0.0000
	definitions=2010-08-03_09:2010-08-03, 2010-08-03,
	1970-01-01 signatures=0
From: Elvis Dowson <elvis.dowson@mac.com>
Date: Wed, 04 Aug 2010 02:16:12 +0400
Message-id: <EDA1D3B6-800D-41CB-9DAB-ADFB4D8D0618@mac.com>
To: OpenEmbedded Developer <openembedded-devel@lists.openembedded.org>
X-Mailer: Apple Mail (2.1081)
X-SA-Exim-Connect-IP: 17.148.16.101
X-SA-Exim-Mail-From: elvis.dowson@mac.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Switching between linux kernel versions
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
X-List-Received-Date: Tue, 03 Aug 2010 22:17:22 -0000
Content-transfer-encoding: 7BIT
Content-type: text/plain; charset=us-ascii

Hi,
       Will I encounter problems, if within a single oe installation, I keep switching back and forth between linux kernel versions, e.g. 

linux-omap3-2.6.32  and linux-omap3-2.6.35 ?

I was told earlier that it wasn't a good idea to do this, but I've noticed that now, the machine PR is taken from one of the mach/omap files, and set to r51 for TI OMAP 35xx series, e.g. beagleboard and Overo platforms.

So, is it safe to do this? I have to keep experimenting with various kernel versions, and what I'm doing at the moment is keeping the main recipe PV the same, e.g. linux-omap3-2.6.32, but internally, I change the git branch to point to different versions .e.g 2.6.35 , and perform the build, till I'm satisfied with the kernel version I want to work with.

Best regards,

Elvis


