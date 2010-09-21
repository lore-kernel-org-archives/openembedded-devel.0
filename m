Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1Oy6jR-0002U7-2x
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Sep 2010 19:34:18 +0200
Received: from [192.168.42.217] (unknown [92.117.88.188])
	by gandharva.secretlabs.de (Postfix) with ESMTPA id 56D431B10C07
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Sep 2010 17:36:40 +0000 (UTC)
Message-ID: <4C98EC64.3040203@freyther.de>
Date: Wed, 22 Sep 2010 01:33:24 +0800
From: Holger Freyther <holger+oe@freyther.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.9) Gecko/20100908 Fedora/3.1.3-1.fc14 Lightning/1.0b2
	Thunderbird/3.1.3
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4C97AC2B.1040205@cbnco.com>	<AANLkTikd-8b1oMbyVus7372HT7u9KON0rx_nZM9fn-8A@mail.gmail.com>
	<4C98B9F0.2010005@cbnco.com>
In-Reply-To: <4C98B9F0.2010005@cbnco.com>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] base.bbclass: add make-native to default dependencies
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
X-List-Received-Date: Tue, 21 Sep 2010 17:34:18 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 09/21/2010 09:58 PM, Michael Smith wrote:
> Khem Raj wrote:
> 
>> although it does but make 3.82 is not usable out of box yet.
>> so people might find surprises. 3.81 would be ok.
> 
> I could add a DEFAULT_PREFERENCE = "-1" to the 3.82 recipe and mention the
> packages that don't build with it in a comment. Do you remember which packages
> fail to build with 3.82?

well, busybox, glibc, gst* have failed and were fixed. In general I have hit:

	- mixing 'rule %rule:', newer GNU make refuses to match that
          (busybox, glibc)
	- spaces vs. tab. e.g. using 8 spaces instead of a tab (gst)


