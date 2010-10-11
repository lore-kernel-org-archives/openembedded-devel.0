Received: from asmtpout023.mac.com ([17.148.16.98])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <elvis.dowson@mac.com>) id 1P5BRZ-0006TV-ED
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Oct 2010 08:01:08 +0200
MIME-version: 1.0
Received: from [192.168.1.100] ([87.201.169.234])
	by asmtp023.mac.com (Sun Java(tm) System Messaging Server 6.3-8.01
	(built Dec
	16 2008; 32bit)) with ESMTPSA id <0LA400CYT3BPKI20@asmtp023.mac.com> for
	openembedded-devel@lists.openembedded.org; Sun,
	10 Oct 2010 22:59:52 -0700 (PDT)
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
	ipscore=0 suspectscore=5 phishscore=0 bulkscore=0 adultscore=0
	classifier=spam
	adjust=0 reason=mlx engine=6.0.2-1004200000 definitions=main-1010100218
X-Proofpoint-Virus-Version: vendor=fsecure
	engine=2.50.10432:5.2.15,1.0.148,0.0.0000
	definitions=2010-10-11_01:2010-10-10, 2010-10-10,
	1970-01-01 signatures=0
From: Elvis Dowson <elvis.dowson@mac.com>
Date: Mon, 11 Oct 2010 09:59:43 +0400
Message-id: <F34D057F-F640-4BB6-841B-2B66AFE37A99@mac.com>
To: OpenEmbedded Developer Mailing List
	<openembedded-devel@lists.openembedded.org>
X-Mailer: Apple Mail (2.1081)
X-SA-Exim-Connect-IP: 17.148.16.98
X-SA-Exim-Mail-From: elvis.dowson@mac.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Building for multiple machines
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
X-List-Received-Date: Mon, 11 Oct 2010 06:01:09 -0000
Content-transfer-encoding: 7BIT
Content-type: text/plain; charset=us-ascii

Hi,
        What should I do build for multiple machines ? 

I have an overo-oe repository, but I need to temporarily build u-boot for a different board. 

In my auto.conf, the entry is MACHINE="overo"

u-boot board definitions for say beagleboard, have named the board "beagle" 

So, would an appropriate command be 

bitbake u-boot-omap3 MACHINE="beagle"


Elvis Dowson


