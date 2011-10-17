Received: from smtprelay-h22.telenor.se ([195.54.99.197])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ulf_samuelsson@telia.com>) id 1RFu8W-0002UV-HX
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 Oct 2011 22:50:17 +0200
Received: from iph3.telenor.se (iph3.telenor.se [195.54.127.134])
	by smtprelay-h22.telenor.se (Postfix) with ESMTP id CA858EA656
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Oct 2011 22:44:27 +0200 (CEST)
X-SENDER-IP: [83.227.57.13]
X-LISTENER: [smtp.bredband.net]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AnwvAD2TnE5T4zkNPGdsb2JhbAAMN4k8kDaMaIISAQEBATeCX0A9FhgDAgECATEnCAEBvzWICASTepFW
X-IronPort-AV: E=Sophos;i="4.69,361,1315173600"; d="scan'208";a="132376376"
Received: from c-0d39e353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	[10.175.196.249]) ([83.227.57.13])
	by iph3.telenor.se with ESMTP; 17 Oct 2011 22:44:27 +0200
Message-ID: <4E9C93AB.7090705@telia.com>
Date: Mon, 17 Oct 2011 22:44:27 +0200
From: Ulf Samuelsson <ulf_samuelsson@telia.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: Performance measurement: Building openembedded-core with and without overclocking on C-i7 2600K
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
X-List-Received-Date: Mon, 17 Oct 2011 20:50:17 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

If anyone is interested...

Same machine in two different configurations.

.........................................................#1...........................#2
P8Z68V Pro
Core-i7 2600K @                             3.4 GHz..................4.4 GHz
8 GB @ ...........................................1333 
MHz...............1640 MHz
1TB WD Black 7200 RPM
Ubuntu 11-10

Almost all source code already in source directory

Building meta-toolchain is 13% faster with overclocking.


#1
build:    meta-toolchain
START                                   10:46:23        55:52
FINISH                                  11:42:15
build:    core-image-minimal
START                                   11:42:15        17:34
FINISH                                  11:59:49
build:    core-image-sato
START                                   13:40:47        01:19
FINISH                                  13:42:06
Build fails, since one package could not be downloaded.
build:    meta-toolchain-sdk
START                                   13:42:06        00:38
FINISH                                  13:42:44
build:    adt-installer
START                                   13:42:44        00:03
FINISH                                  13:42:51
build:    meta-ide-support
START                                   13:42:51        01:13
FINISH                                  13:44:04



#2
build:    meta-toolchain
START                                   20:18:51        49:19    (vs 55:52)
FINISH                                  21:08:10
build:    core-image-minimal
START                                   21:08:10        16:38    (vs 17:34)
FINISH                                  21:24:48
build:    core-image-sato
START                                   21:24:48        15:38    (vs 
01:19 - I think I have a problem in the first build)
FINISH                                  21:40:26
build:    meta-toolchain-sdk
START                                   21:40:26        00:59    (vs 00:38)
FINISH                                  21:41:25
build:    adt-installer
START                                   21:41:25        00:03    (vs 00:03)
FINISH                                  21:41:28
build:    meta-ide-support
START                                   21:41:28        01:03    (vs 01:13)
FINISH                                  21:42:31



-- 
Best Regards
Ulf Samuelsson



