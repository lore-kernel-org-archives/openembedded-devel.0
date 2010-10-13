Received: from asmtpout028.mac.com ([17.148.16.103])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <elvis.dowson@mac.com>) id 1P64H9-0003j9-7R
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Oct 2010 18:33:59 +0200
MIME-version: 1.0
Received: from [192.168.1.100] ([87.201.169.163])
	by asmtp028.mac.com (Sun Java(tm) System Messaging Server 6.3-7.04
	(built Sep
	26 2008; 64bit)) with ESMTPSA id <0LA8005WXLZEAMK0@asmtp028.mac.com> for
	openembedded-devel@lists.openembedded.org; Wed,
	13 Oct 2010 09:33:18 -0700 (PDT)
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
	ipscore=0 suspectscore=5 phishscore=0 bulkscore=0 adultscore=0
	classifier=spam
	adjust=0 reason=mlx engine=6.0.2-1004200000 definitions=main-1010130083
X-Proofpoint-Virus-Version: vendor=fsecure
	engine=2.50.10432:5.2.15,1.0.148,0.0.0000
	definitions=2010-10-13_08:2010-10-13, 2010-10-13,
	1970-01-01 signatures=0
From: Elvis Dowson <elvis.dowson@mac.com>
In-reply-to: <2918CB89-AB2D-4882-9C97-949B17EE3843@mac.com>
Date: Wed, 13 Oct 2010 20:33:04 +0400
Message-id: <F33AEE13-68E2-4628-AE9D-B624967C88B1@mac.com>
References: <2918CB89-AB2D-4882-9C97-949B17EE3843@mac.com>
To: OpenEmbedded Developer Mailing List
	<openembedded-devel@lists.openembedded.org>
X-Mailer: Apple Mail (2.1081)
X-SA-Exim-Connect-IP: 17.148.16.103
X-SA-Exim-Mail-From: elvis.dowson@mac.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Suppressing oma3-sgx-modules from omap3-console-image build for beagleboard
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
X-List-Received-Date: Wed, 13 Oct 2010 16:33:59 -0000
Content-transfer-encoding: 7BIT
Content-type: text/plain; charset=us-ascii

Hi,

On Oct 13, 2010, at 4:32 PM, Elvis Dowson wrote:

> Now the thing is there is no reference to omap3-sgx-modules in either task-base or omap3-console-image. 
> 
> Where is it picking this up from then. My auto.cong seeting is machine="beagleboard"

I found the solutions, in the beagleboard.conf, I have to comment out the following:

MACHINE_EXTRA_RRECOMMENDS += " omap3-sgx-modules"

Elvis Dowson


