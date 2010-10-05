Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1P385Z-00060e-OL
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Oct 2010 16:01:54 +0200
Received: from [192.168.0.101] (91-64-127-39-dynip.superkabel.de
	[91.64.127.39])
	by gandharva.secretlabs.de (Postfix) with ESMTPA id 245311B10C05;
	Tue,  5 Oct 2010 14:05:18 +0000 (UTC)
Message-ID: <4CAB2FBD.6060401@freyther.de>
Date: Tue, 05 Oct 2010 22:01:33 +0800
From: Holger Freyther <holger+oe@freyther.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.9) Gecko/20100921 Fedora/3.1.4-1.fc14 Lightning/1.0b2
	Thunderbird/3.1.4
MIME-Version: 1.0
To: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: Latest qt4-sdk-tools* patch is wrong
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
X-List-Received-Date: Tue, 05 Oct 2010 14:01:55 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi Dmitry,

your latest change is wrong. You apply a patch (that is not mentioned in the
commit message) that does not exist in the tree. Your patch to
qt4-tools-sdk.inc is also wrong. qt4-tools-sdk.inc is only used by
qt4-tools-sdk_4.7.0.bb which is using -embedded and -no-freetype... so adding
the patch and the extra includes is not correct (and you probably should have
bumped INC_PR in that file).

For Qt 4.6.3 I would propose building the tools with --no-freetype as we have
no interest in GUI anyway.

I hope you can fix that soon.

	thanks.


