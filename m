Received: from asmtpout028.mac.com ([17.148.16.103])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <elvis.dowson@mac.com>) id 1O9iT2-00062H-Jm
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 May 2010 19:33:26 +0200
MIME-version: 1.0
Received: from [87.201.169.136] by asmtp028.mac.com
	(Sun Java(tm) System Messaging Server 6.3-8.01 (built Dec 16 2008;
	32bit)) with ESMTPSA id <0L1Y00LHBGFNCX50@asmtp028.mac.com> for
	openembedded-devel@lists.openembedded.org; Wed,
	05 May 2010 09:28:46 -0700 (PDT)
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
	ipscore=0 phishscore=0 bulkscore=0 adultscore=0 classifier=spam
	adjust=0
	reason=mlx engine=5.0.0-1004140000 definitions=main-1005050112
From: Elvis Dowson <elvis.dowson@mac.com>
Date: Wed, 05 May 2010 20:28:32 +0400
Message-id: <2D3EFC75-3DFC-492D-A230-ED263BB96281@mac.com>
To: OpenEmbedded Developer <openembedded-devel@lists.openembedded.org>
X-Mailer: Apple Mail (2.1078)
X-SA-Exim-Connect-IP: 17.148.16.103
X-SA-Exim-Mail-From: elvis.dowson@mac.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: How to modify omap3-console-image recipe to modify /etc/inittab
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
X-List-Received-Date: Wed, 05 May 2010 17:33:29 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT

Hi,
      How can I modify the omap3-console-image recipe to modify the /etc/inittab file from 

c1:12345:respawn:/sbin/agetty 38400 tty1 linux
to

c1:12345:respawn:/sbin/agetty -n -l /usr/sbin/autologin 38400 tty1 linux

after the rootfs is fully created? 

Best regards,

Elvis



