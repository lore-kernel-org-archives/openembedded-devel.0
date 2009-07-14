Received: from [85.214.48.103] (helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1MQldH-0006dg-JV
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 Jul 2009 19:17:37 +0200
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 0DBF4220012A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Jul 2009 19:04:17 +0200 (CEST)
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 15198220010A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Jul 2009 19:04:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-3.2 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_05
	autolearn=ham version=3.2.5
Received: from rhein.familie-heinold.de (unknown [78.52.225.201])
	by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Jul 2009 19:04:16 +0200 (CEST)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id 787363C0A0; Tue, 14 Jul 2009 19:04:15 +0200 (CEST)
Date: Tue, 14 Jul 2009 19:04:15 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090714170415.GA24919@rhein.zuhause.netz>
MIME-Version: 1.0
User-Agent: Mutt/1.5.20 (2009-06-14)
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Broken git-native in dev
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
X-List-Received-Date: Tue, 14 Jul 2009 17:17:45 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

today I stumbled over some mess up with git-native. I wondered why disk was full. I examined
that my staging dir was about 3 gig's. I examined further and found ot that most of the space comes
from i686-linux/libexec/git-core. Problem is we install git-bins without calling strip
so each 130 executables is about 22 Megs. If no one has a quick solution I will try dig further.

Maybee we should put a test in the native class which checks if the executables are striped.

Bye Henning


