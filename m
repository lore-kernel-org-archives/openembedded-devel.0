Received: from opensource.wolfsonmicro.com ([80.75.67.52]
	helo=opensource2.wolfsonmicro.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dp@opensource.wolfsonmicro.com>) id 1OoDU4-0002bc-Rl
	for openembedded-devel@lists.openembedded.org;
	Wed, 25 Aug 2010 12:45:44 +0200
Received: from [172.20.20.118] (lumison.wolfsonmicro.com [87.246.78.27])
	by opensource2.wolfsonmicro.com (Postfix) with ESMTPSA id 41B0778815D; 
	Wed, 25 Aug 2010 11:44:56 +0100 (BST)
From: Dimitris Papastamos <dp@opensource.wolfsonmicro.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1282319238.17914.5.camel@dpdev>
References: <1282294508.6198.27.camel@dpdev> <4C6E920E.4030806@balister.org>
	<1282319238.17914.5.camel@dpdev>
Date: Wed, 25 Aug 2010 11:45:24 +0100
Message-ID: <1282733124.8247.0.camel@dpdev>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
X-SA-Exim-Connect-IP: 80.75.67.52
X-SA-Exim-Mail-From: dp@opensource.wolfsonmicro.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: broonie@opensource.wolfsonmicro.com
Subject: Re: udev hangs on boot
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
X-List-Received-Date: Wed, 25 Aug 2010 10:45:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi,

The issue has been resolved. Udev was hanging on boot because the kernel
was compiled without unix domain sockets support.



