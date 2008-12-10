Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LAOFg-0002Ak-5o
	for openembedded-devel@openembedded.org; Wed, 10 Dec 2008 13:33:16 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LAOBm-0003YP-OW
	for openembedded-devel@openembedded.org; Wed, 10 Dec 2008 12:29:14 +0000
Received: from iap-pxy-mow1.siemens.ru ([212.248.25.26])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 10 Dec 2008 12:29:14 +0000
Received: from dbaryshkov by iap-pxy-mow1.siemens.ru with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 10 Dec 2008 12:29:14 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Date: Wed, 10 Dec 2008 12:29:07 +0000 (UTC)
Message-ID: <ghocmj$on1$1@ger.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: iap-pxy-mow1.siemens.ru
User-Agent: Pan/0.132 (Waxed in Black)
Sender: news <news@ger.gmane.org>
Subject: Package selection problems
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
X-List-Received-Date: Wed, 10 Dec 2008 12:33:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

I recently stumbled upon a problem that looks more like a BitBake bug for me.
Using bitbake 1.8.10 and current org.OE.dev branch, I did the following:

Added PREFERRED_PROVIDED_virtual/kernel = "linux" to conf/machine/tosa.conf
Added DEFAULT_PREFERENCE_tosa = "1" to packages/linux/linux-2.6.28-rc6.bb

Then untill I added DEFAULT_PREFERENCE_tosa = "-1" to all recipes from
linux-2.6.14 till linux-2.6.21 (more recent ones just contain
DEFAULT_PREFERENCE="-1"), calls to bitbake linux, bitbake virtual/kernel and
even bitbake linux-2.6.27+2.6.28-rc6 tried to build both 2.6.27+2.6.28-rc6
recipe AND the recipe from 2.6.14 -- 2.6.21.

Is it an expended behaviour, is it some misconfiguration on my side or what?

-- 
With best wishes
Dmitry




