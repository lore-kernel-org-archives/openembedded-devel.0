Received: from familie-heinold.de
	([85.214.48.103] helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1Q08xd-0001wO-U3
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Mar 2011 09:53:38 +0100
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id AC8EA11000BA
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Mar 2011 09:51:55 +0100 (CET)
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id CD77111000B7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Mar 2011 09:51:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.1
Received: from rhein.familie-heinold.de (g225146072.adsl.alicedsl.de
	[92.225.146.72]) by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Mar 2011 09:51:54 +0100 (CET)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id 94DBF3C0BA; Thu, 17 Mar 2011 09:51:05 +0100 (CET)
Date: Thu, 17 Mar 2011 09:51:05 +0100
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110317085104.GA3317@mail.familie-heinold.de>
References: <1300325100-29332-1-git-send-email-denis@denix.org>
	<20110317014349.GN3042@denix.org> <4D817F36.30900@gmail.com>
	<ilsdn3$dg5$1@dough.gmane.org>
MIME-Version: 1.0
In-Reply-To: <ilsdn3$dg5$1@dough.gmane.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: [PATCH] cairo: disable native atomic operations, conflicts with libatomics-ops
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
X-List-Received-Date: Thu, 17 Mar 2011 08:53:38 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

I am courious while cairo is using here libatomic-ops at all and not the
kernel-handler or the gcc stuff for linux. Besides libatomic-ops
is no pulseaudio project. Pulse only need it for mips and some other
archs, for arm the kernel-handler is used.

So my sugestion is to find out which arch is needing and which not
and adjust the build process accrodingly. 

Bye Henning


