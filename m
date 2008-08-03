Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1KPYdD-0008RD-Um
	for openembedded-devel@openembedded.org; Sun, 03 Aug 2008 10:08:00 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1KPYbI-00018N-9M
	for openembedded-devel@openembedded.org; Sun, 03 Aug 2008 08:06:00 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sun, 03 Aug 2008 08:06:00 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Sun, 03 Aug 2008 08:06:00 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sun, 03 Aug 2008 10:05:50 +0200
Message-ID: <g73osv$q5l$1@ger.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Thunderbird/3.0a2pre (Macintosh; 2008071203)
Sender: news <news@ger.gmane.org>
Subject: Re: rrdtool: fixup in EXTRA_OECONF to get past error in do_configure. add do_stage. Closes 2524.
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
X-List-Received-Date: Sun, 03 Aug 2008 08:08:00 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

I just noticed a commit doing this:

-EXTRA_OECONF = "--enable-shared --enable-local-libpng 
--enable-local-zlib --program-prefix=''"
+EXTRA_OECONF = "rd_cv_ieee_works=yes --enable-shared 
--enable-local-libpng --enable-local-zlib --program-prefix=''"

Please don't specify such information on the commandline, it belongs 
into the site files.

If you are sure it's generic, put it in site/common like this:

rd_cv_ieee_works=${rd_cv_ieee_works=yes}

I'f you aren't sure if it applies to both linux and uclinux, put it in 
common-linux or common-uclinux or even in <arch>-common.

If we put it in the site files we don't have to reinvent the wheel 
everytime a package tests for rd_cv_ieee_works.

regards,

Koen





