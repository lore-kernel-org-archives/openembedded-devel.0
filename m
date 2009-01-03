Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LJCWI-0002Oc-Ru
	for openembedded-devel@openembedded.org; Sat, 03 Jan 2009 20:50:50 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LJCQc-0006GX-TH
	for openembedded-devel@openembedded.org; Sat, 03 Jan 2009 19:44:58 +0000
Received: from ppp91-122-86-127.pppoe.avangarddsl.ru ([91.122.86.127])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sat, 03 Jan 2009 19:44:58 +0000
Received: from dbaryshkov by ppp91-122-86-127.pppoe.avangarddsl.ru with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Sat, 03 Jan 2009 19:44:58 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Date: Sat, 3 Jan 2009 19:44:49 +0000 (UTC)
Message-ID: <gjof7h$1hd$1@ger.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ppp91-122-86-127.pppoe.avangarddsl.ru
User-Agent: Pan/0.132 (Waxed in Black)
Sender: news <news@ger.gmane.org>
Subject: autotools.bbclass question
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
X-List-Received-Date: Sat, 03 Jan 2009 19:50:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

While trying to fix staging for net-snmp, I got a question regarding
autotools.bbclass. autotools_stage_all uses oe_runmake for installation
while autotools_stage_includes just issues make directly. Isn't it
a misfeature? Shouldn't both of them be changed to use the same approach?

-- 
With best wishes
Dmitry




