Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Kq2cE-0004xd-93
	for openembedded-devel@openembedded.org; Wed, 15 Oct 2008 11:24:26 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1Kq2XG-0006nR-Dr
	for openembedded-devel@openembedded.org; Wed, 15 Oct 2008 09:19:18 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 15 Oct 2008 09:19:18 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 15 Oct 2008 09:19:18 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 15 Oct 2008 11:19:10 +0200
Message-ID: <gd4cie$16r$1@ger.gmane.org>
References: <200810151022.38477.zecke@selfish.org>
	<200810151104.29672.zecke@selfish.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b1pre) Gecko/20081006 Shredder/3.0b1pre
In-Reply-To: <200810151104.29672.zecke@selfish.org>
Sender: news <news@ger.gmane.org>
Subject: Re: [RFC] Enable --hash-style=both for all recent gcc4 targets
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
X-List-Received-Date: Wed, 15 Oct 2008 09:24:26 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15-10-2008 11:04, Holger Freyther wrote:
> On Wednesday 15 October 2008 10:22:36 Holger Freyther wrote:
>
> Okay, I have pushed holger/hash-style and would like to test and then merge
> this branch. Comments or better ideas welcome
> 	z.

Your PR split commit has some unrelated changes in it:

+PKG_TAGS = ""
+DEPLOY_DIR_OPK = "${DEPLOY_DIR}/opk"
+SRCPV = "${@bb.fetch.get_srcrev(d)}"
+OPKGBUILDCMD = "opkg-build -O -o 0 -g 0"

It's also missing the actual bump for distro PR in the angstrom configs.

regards,

Koen



