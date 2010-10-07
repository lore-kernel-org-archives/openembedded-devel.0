Received: from asmtpout023.mac.com ([17.148.16.98])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <elvis.dowson@mac.com>) id 1P3yhF-0001Ra-A0
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Oct 2010 00:12:18 +0200
MIME-version: 1.0
Received: from [192.168.1.100] ([87.201.169.209])
	by asmtp023.mac.com (Sun Java(tm) System Messaging Server 6.3-8.01
	(built Dec
	16 2008; 32bit)) with ESMTPSA id <0L9X00MGTUVFCS80@asmtp023.mac.com> for
	openembedded-devel@lists.openembedded.org; Thu,
	07 Oct 2010 14:11:43 -0700 (PDT)
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
	ipscore=0 suspectscore=5 phishscore=0 bulkscore=0 adultscore=0
	classifier=spam
	adjust=0 reason=mlx engine=6.0.2-1004200000 definitions=main-1010070136
X-Proofpoint-Virus-Version: vendor=fsecure
	engine=2.50.10432:5.2.15,1.0.148,0.0.0000
	definitions=2010-10-07_09:2010-10-07, 2010-10-07,
	1970-01-01 signatures=0
From: Elvis Dowson <elvis.dowson@mac.com>
Date: Fri, 08 Oct 2010 01:11:34 +0400
Message-id: <3ADCCD33-6EA5-43FA-84EE-31D6B7C5A005@mac.com>
To: OpenEmbedded Developer Mailing List
	<openembedded-devel@lists.openembedded.org>
X-Mailer: Apple Mail (2.1081)
X-SA-Exim-Connect-IP: 17.148.16.98
X-SA-Exim-Mail-From: elvis.dowson@mac.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,
	HTML_FONT_FACE_BAD,HTML_MESSAGE,SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: How to modify /etc/network/interfaces file in a OE recipe
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
X-List-Received-Date: Thu, 07 Oct 2010 22:12:20 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT

Hi,
       Would someone be able to help me with modifying an omap3-console-image recipe, such that in the final image, the /etc/network/interfaces file gets edited as follows

#auto eth0				<- remove # sign ( auto eth0 )
#iface eth0 inet dhcp		<- remove # sign ( iface eth0 inet dhcp )
#iface eth1 inet dhcp

I am using a Gumstix Overo + Chestnut43 expansion board, which has an inbuilt wired ethernet interface. I have to make this modification manually, to enable this interface each time. However, if I can modify the OE recipe somehow to do this it would be great. I know it can be done, but I don't know where to start and which file to modify. 

Elvis Dowson


