Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1KTPqr-0004Il-M4
	for openembedded-devel@openembedded.org; Thu, 14 Aug 2008 01:34:01 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1KTPqG-0003og-F4
	for openembedded-devel@openembedded.org; Wed, 13 Aug 2008 23:33:24 +0000
Received: from ip-62-143-12-162.hsi.ish.de ([62.143.12.162])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 13 Aug 2008 23:33:24 +0000
Received: from no2spam by ip-62-143-12-162.hsi.ish.de with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 13 Aug 2008 23:33:24 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Rolf Leggewie <no2spam@nospam.arcornews.de>
Date: Thu, 14 Aug 2008 01:33:17 +0200
Message-ID: <g7vqvs$3fi$1@ger.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip-62-143-12-162.hsi.ish.de
User-Agent: Thunderbird 2.0.0.16 (X11/20080724)
Sender: news <news@ger.gmane.org>
Subject: git and dir
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
X-List-Received-Date: Wed, 13 Aug 2008 23:34:01 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

this is something I've been pondering upon today.  I'm hoping for some 
discussion, an opportunity to learn and possibly to make OE even better.

It has always been possible to shoot yourself in the foot with OE.  I 
believe the opportunities will rise with the introduction of git.  The 
reason is that AFAIU, with mtn there was a 1:1 relation between checkout 
dir and upstream branch.  This information was recorded in _MTN/options. 
  git does not have this restriction.  One can freely add remote 
branches to an existing checkout with "git remote add" and switch to 
them with "git checkout $branch".  This can easily corrupt tmp/ and I 
fear it will happen quite often.  I wonder if there is anything 
OE/bitbake can do to alleviate the pain.

Regards

Rolf


PS: I am just thinking if it made sense to add the possibility to 
include the git branch name in TMPDIR just like we can include DISTRO 
now.  I think that would go a long way towards making problems to occur 
only seldomly if at all.



