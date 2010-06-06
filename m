Received: from asmtpout025.mac.com ([17.148.16.100])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <elvis.dowson@mac.com>) id 1OL9KK-0004it-6f
	for openembedded-devel@lists.openembedded.org;
	Sun, 06 Jun 2010 08:28:06 +0200
MIME-version: 1.0
Received: from [192.168.1.104] ([87.201.169.38])
	by asmtp025.mac.com (Sun Java(tm) System Messaging Server 6.3-8.01
	(built Dec
	16 2008; 32bit)) with ESMTPSA id <0L3K00J7EXQ8Y330@asmtp025.mac.com> for
	openembedded-devel@lists.openembedded.org; Sat,
	05 Jun 2010 23:23:00 -0700 (PDT)
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
	ipscore=0 phishscore=0 bulkscore=0 adultscore=0 classifier=spam
	adjust=0
	reason=mlx engine=6.0.2-1004200000 definitions=main-1006050236
X-Proofpoint-Virus-Version: vendor=fsecure
	engine=1.12.8161:2.4.5,1.2.40,4.0.166
	definitions=2010-06-06_01:2010-02-06, 2010-06-06,
	2010-06-05 signatures=0
From: Elvis Dowson <elvis.dowson@mac.com>
In-reply-to: <AANLkTin1Wa5buxLDTg3w1ZAu609NRR_vCXf3DydPfF8j@mail.gmail.com>
Date: Sun, 06 Jun 2010 10:22:54 +0400
Message-id: <96D51530-A1A0-4898-AD8F-4E01EFB496D1@mac.com>
References: <F7B59210-EE40-4F5D-AE84-3C2040426D89@mac.com>
	<AANLkTimdoOiHxXo3XU-3tLC2v9o90k8V0omWcjX_8n5w@mail.gmail.com>
	<CC3AC527-3026-4188-8BF1-F6AEC47A7A6C@mac.com>
	<AANLkTin1Wa5buxLDTg3w1ZAu609NRR_vCXf3DydPfF8j@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.1078)
X-SA-Exim-Connect-IP: 17.148.16.100
X-SA-Exim-Mail-From: elvis.dowson@mac.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.4 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: autologin recipe for gumstix Overo
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
X-List-Received-Date: Sun, 06 Jun 2010 06:28:07 -0000
Content-transfer-encoding: 7BIT
Content-type: text/plain; charset=us-ascii

Hi Ash,

On Jun 6, 2010, at 9:31 AM, Ash Charles wrote:

> Does the image do the autologin the second time you boot it?

Yes, it does, no problems there. 

The post init stuff is supposed to modify the inittab file, but it didn't. 

I manually edited the /etc/inittab file after I discovered that the bitbake rootfs process for omap3-console-image with the autologin recipe added, did not modify the inittab file. 

Best regards,

Elvis Dowson


