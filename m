Received: from qmta04.emeryville.ca.mail.comcast.net ([76.96.30.40])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <enelson1000@comcast.net>) id 1PSLsl-0005Za-5e
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 Dec 2010 04:48:55 +0100
Received: from omta09.emeryville.ca.mail.comcast.net ([76.96.30.20])
	by qmta04.emeryville.ca.mail.comcast.net with comcast
	id ipye1f0210S2fkCA4rnHmG; Tue, 14 Dec 2010 03:47:17 +0000
Received: from [192.168.1.101] ([71.202.66.210])
	by omta09.emeryville.ca.mail.comcast.net with comcast
	id irnG1f0064YBSof8VrnGH3; Tue, 14 Dec 2010 03:47:16 +0000
Message-ID: <4D06E8C1.8090108@comcast.net>
Date: Mon, 13 Dec 2010 19:47:13 -0800
From: Ed Nelson <enelson1000@comcast.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US;
	rv:1.9.2.13) Gecko/20101207 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 76.96.30.40
X-SA-Exim-Mail-From: enelson1000@comcast.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: How do i get py-smbus include in image
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
X-List-Received-Date: Tue, 14 Dec 2010 03:48:55 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I am trying to use py-smbus and see that it is included in i2c-tool but 
by default it is not built. It also looks like from the readme file 
under py-smbus that lm-sensors need to be built 1st.

I assume I would add both i2c-tools and lm-sensor to my image recipe as 
follows but is there anything else I need to do to get py-smbus built.

========

#Angstrom base-image with python

require base-image.bb

DEPENDS += "python \
                         python-pyserial \
                         mtd-utils \
                         i2c-tools \
                         lm-sensors \
        "

IMAGE_INSTALL += "python \
                                    python-pyserial \
                                    mtd-utils \
                                    i2c-tools \
                                    lm-sensors \
                                    nano \
              "

export IMAGE_BASENAME = "base-python-image"

========================

Thanks
Ed



