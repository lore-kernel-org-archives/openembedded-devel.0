Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QzRru-0008LK-0K for openembedded-devel@lists.openembedded.org;
	Fri, 02 Sep 2011 13:25:06 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QzRn4-0003Tx-Ad for openembedded-devel@lists.openembedded.org;
	Fri, 02 Sep 2011 13:20:06 +0200
Received: from 86.47.116.89 ([86.47.116.89])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Sep 2011 13:20:06 +0200
Received: from gatoguan-os by 86.47.116.89 with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Sep 2011 13:20:06 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: gatopeich <gatoguan-os@yahoo.com>
Date: Fri, 2 Sep 2011 10:58:09 +0000 (UTC)
Message-ID: <loom.20110902T125448-849@post.gmane.org>
References: <0C757E680E33864AB113392C7E83F910BE5D80@GSX300A.mxchg.m.corp>
	<0C757E680E33864AB113392C7E83F910BE5160@GSX300A.mxchg.m.corp>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: sea.gmane.org
User-Agent: Loom/3.14 (http://gmane.org/)
X-Loom-IP: 86.47.116.89 (Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.20) Gecko/20110805 Ubuntu/10.04 (lucid) Firefox/3.6.20)
Subject: Re: Bug in IPV6 DISTRO_FEATURE handling in recipe	openssl_1.0.0d.bb/openssl.inc
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
X-List-Received-Date: Fri, 02 Sep 2011 11:25:06 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

> May be doing it witch a patch or disable OPENSSL_USE_IPV6 in configure is the
saver solution.

I solved it by adding this two lines to my distro.conf, and they might work on
local.conf too:

  # Since we disabled IPv6 and openssl recipe fails miserably in such case:
  EXTRA_OECONF_append_pn-openssl = " -DOPENSSL_USE_IPV6=0"

Obviously, this should go in the buggy recipe but I am not part of the dev team.



