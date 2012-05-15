Received: from familie-heinold.de ([85.214.48.103]
	helo=mail.familie-heinold.de) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1SUPU7-0006cZ-56
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 May 2012 23:40:47 +0200
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id B770422325AD
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 May 2012 23:30:48 +0200 (CEST)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 537E422325AC
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 May 2012 23:30:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.1
Received: from rhein.familie-heinold.de (g230117152.adsl.alicedsl.de
	[92.230.117.152]) by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 May 2012 23:30:48 +0200 (CEST)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id 9A7D03C4E9; Tue, 15 May 2012 23:30:46 +0200 (CEST)
Date: Tue, 15 May 2012 23:30:46 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120515213046.GA24022@rhein.zuhause.netz>
References: <CALbNGRQ-sLsjDS9VV2TJ3JOzLzFhrXfCcMH2uxVJR1JboueLAg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALbNGRQ-sLsjDS9VV2TJ3JOzLzFhrXfCcMH2uxVJR1JboueLAg@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: [meta-chromium] chromium build fails
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
X-List-Received-Date: Tue, 15 May 2012 21:40:47 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

looks like you are building on 64bit machine and you do not have installed
the ia32 compat-dev libs. chromium builds some parts for the js engine natively
and that needs to be 32bit.

bye Henning


