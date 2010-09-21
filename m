Received: from smtp.cbnco.com ([207.164.182.72])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <msmith@cbnco.com>) id 1Oy9rB-0006cv-SP
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Sep 2010 22:54:30 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 29605745ECF
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Sep 2010 16:54:27 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 10955-03 for <openembedded-devel@lists.openembedded.org>; 
	Tue, 21 Sep 2010 16:54:27 -0400 (EDT)
Received: from [172.20.22.83] (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTPSA id DF1F2745D6E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Sep 2010 16:54:26 -0400 (EDT)
Message-ID: <4C991B82.3090803@cbnco.com>
Date: Tue, 21 Sep 2010 16:54:26 -0400
From: Michael Smith <msmith@cbnco.com>
User-Agent: Thunderbird 2.0.0.24 (X11/20100228)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4C97AC2B.1040205@cbnco.com>	<AANLkTikd-8b1oMbyVus7372HT7u9KON0rx_nZM9fn-8A@mail.gmail.com>	<4C98B9F0.2010005@cbnco.com>
	<4C98EC64.3040203@freyther.de>
In-Reply-To: <4C98EC64.3040203@freyther.de>
X-Virus-Scanned: amavisd-new at cbnco.com
X-SA-Exim-Connect-IP: 207.164.182.72
X-SA-Exim-Mail-From: msmith@cbnco.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
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
X-List-Received-Date: Tue, 21 Sep 2010 20:54:30 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Holger Freyther wrote:
> On 09/21/2010 09:58 PM, Michael Smith wrote:
>> I could add a DEFAULT_PREFERENCE = "-1" to the 3.82 recipe and mention the
>> packages that don't build with it in a comment. Do you remember which packages
>> fail to build with 3.82?
> 
> well, busybox, glibc, gst* have failed and were fixed. In general I have hit:
> 
> 	- mixing 'rule %rule:', newer GNU make refuses to match that
>           (busybox, glibc)
> 	- spaces vs. tab. e.g. using 8 spaces instead of a tab (gst)

Maybe it'd be easier to fix the affected packages, then. Would you be 
opposed to make-native being a default dep? The next testing cycle would 
probably spot any remaining fallout from 3.82.

Mike


