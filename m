Received: from [80.91.229.12] (helo=lo.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1N8LjD-0006lI-1z for openembedded-devel@lists.openembedded.org;
	Wed, 11 Nov 2009 23:31:54 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1N8Lh6-00064M-HU
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Nov 2009 23:29:40 +0100
Received: from 92-100-165-7.dynamic.avangarddsl.ru ([92.100.165.7])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Nov 2009 23:29:40 +0100
Received: from dbaryshkov by 92-100-165-7.dynamic.avangarddsl.ru with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Nov 2009 23:29:40 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Date: Wed, 11 Nov 2009 22:27:26 +0000 (UTC)
Message-ID: <hdfdoe$kj7$1@ger.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: 92-100-165-7.dynamic.avangarddsl.ru
User-Agent: Pan/0.132 (Waxed in Black)
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Blackfin toolchain question
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
X-List-Received-Date: Wed, 11 Nov 2009 22:31:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

I'm currently trying to restore/update blackfin toolchain. One of the major problems I've stumbled upon
are versioned scripts/export symbols. Basically there are lot's of software starting from g++ itself
that have symbol versioning scripts. The problem is that blackfin arch prepends all symbols with underscore,
thus breaking all that scripts.

My first intention was to follow the alsa-libs approach: handle all prefixing on package-per-package basis.
However that would be a nigtmare.

My current intention (that at least partially works) is to make libtool (when it's used) generate correct
versioning scripts and resort to package-per-package updating after that.

The problem comes from C++ world, where versioning script can contain unmangled name, but it's demangled
name that should be prefixed with underscore.

So I have a bit hackish idea: maybe it's better to hack ld to accept scripts w/o underscores and prefix all
symbols with it? This will eliminate most of changes. The question is if this patch is acceptable for OE?
Does this approach sound too hackish?

-- 
With best wishes
Dmitry




