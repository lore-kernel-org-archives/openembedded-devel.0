Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1JzFVA-0007Zo-Mi
	for openembedded-devel@openembedded.org; Thu, 22 May 2008 20:27:19 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1JzFSV-0007sY-SR
	for openembedded-devel@openembedded.org; Thu, 22 May 2008 18:24:12 +0000
Received: from ip-62-143-23-251.hsi.ish.de ([62.143.23.251])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 22 May 2008 18:24:11 +0000
Received: from no2spam by ip-62-143-23-251.hsi.ish.de with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 22 May 2008 18:24:11 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Rolf Leggewie <no2spam@nospam.arcornews.de>
Date: Thu, 22 May 2008 20:24:04 +0200
Message-ID: <g14do2$eur$1@ger.gmane.org>
References: <70c9a9110805220710x6663f582lc5d6b75744960d08@mail.gmail.com>
	<70c9a9110805220711i33fd397k518855a05773edf0@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip-62-143-23-251.hsi.ish.de
User-Agent: Thunderbird 2.0.0.14 (X11/20080505)
In-Reply-To: <70c9a9110805220711i33fd397k518855a05773edf0@mail.gmail.com>
Sender: news <news@ger.gmane.org>
Subject: Re: GCC 4.3 fails to build glibc(-intermediate)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Thu, 22 May 2008 18:27:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Enric Balletbò i Serra wrote:
> I have the same problem, but at this moment I don't have idea about solution.

I am also experiencing similar problems for a spitz build.  The problem
started to appear about a week ago.
f2497299e919cb94e12fc8690a709479451e5510 still builds fine.  I think the
most likely candidates that triggered this problem are to be found among
the changes to gcc that were made after that revision.  I see changes
from koen and RP in the commit-ml.  It would be nice if the people who
understand this stuff took a look to spot a possible regression.  I will
try and narrow the revision down further.

http://oss.leggewie.org/wip/f2497299e919cb94e12fc8690a709479451e5510_vs_HEAD.txt



