Received: from smtprelay-h21.telenor.se ([195.54.99.196])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ulf_samuelsson@telia.com>) id 1RKBqa-0000Yt-FI
	for openembedded-devel@lists.openembedded.org;
	Sat, 29 Oct 2011 18:33:28 +0200
Received: from iph3.telenor.se (iph3.telenor.se [195.54.127.134])
	by smtprelay-h21.telenor.se (Postfix) with ESMTP id 019D7D4D2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Oct 2011 18:27:26 +0200 (CEST)
X-SENDER-IP: [83.227.59.253]
X-LISTENER: [smtp.bredband.net]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AickAFoorE5T4zv9PGdsb2JhbAAMNok+kRmPKQEBAQE3gmNAPRYYAwIBAgExJwgBAbsniQIElA6RYQ
X-IronPort-AV: E=Sophos;i="4.69,424,1315173600"; d="scan'208";a="139821932"
Received: from c-fd3be353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	[10.175.196.249]) ([83.227.59.253])
	by iph3.telenor.se with ESMTP; 29 Oct 2011 18:27:25 +0200
Message-ID: <4EAC296D.8040403@telia.com>
Date: Sat, 29 Oct 2011 18:27:25 +0200
From: Ulf Samuelsson <ulf_samuelsson@telia.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: Adding sumtool to a JFFS2 build to speed up first boot
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
X-List-Received-Date: Sat, 29 Oct 2011 16:33:28 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Trying to solve another problem I came up with
changing IMAGE_CMD_jffs2 defined in conf/bitbake.conf
by redefining it in conf/local.conf.

During that process I noticed the "sumtool" utility
which works on the jffs2 image, doing some
bookkeeping which then does not have to be
done on the target.

I unserstand, this can speed up loading significantly.
Any reason not using this in OE?

-- 
Best Regards
Ulf Samuelsson



