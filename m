Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1KVcLw-0008Dk-4W
	for openembedded-devel@openembedded.org; Wed, 20 Aug 2008 03:19:12 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1KVcKt-0000Rl-7a
	for openembedded-devel@openembedded.org; Wed, 20 Aug 2008 01:18:07 +0000
Received: from ip-62-143-12-162.hsi.ish.de ([62.143.12.162])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 20 Aug 2008 01:18:07 +0000
Received: from no2spam by ip-62-143-12-162.hsi.ish.de with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 20 Aug 2008 01:18:07 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Rolf Leggewie <no2spam@nospam.arcornews.de>
Date: Wed, 20 Aug 2008 03:18:04 +0200
Message-ID: <g8frc9$5ei$1@ger.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip-62-143-12-162.hsi.ish.de
User-Agent: Thunderbird 2.0.0.16 (X11/20080724)
Sender: news <news@ger.gmane.org>
Subject: Circular dependency
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
X-List-Received-Date: Wed, 20 Aug 2008 01:19:12 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

I am trying to get "bitbake world" operational again (boy, our meta-data 
is rotten!).  One thing I have come across is circular dependencies when 
there really are none.  Try "bitbake udhcp" and witness

ERROR: 
'['/usr/src/oe/org.openembedded.dev/packages/udhcp/udhcp_0.9.8.bb']' 
RDEPENDS/RRECOMMENDS or otherwise requires the runtime entity 'udhcp' 
but it wasn't found in any PACKAGE or RPROVIDES variables

The bb file definition looks fine for all I know.  What is the problem here?

Regards

Rolf


PS: Can't we drop udhcp in favor of busybox(-udhcp)?  Seems like 
redundant meta-data to me.



