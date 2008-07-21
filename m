Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1KL33C-0002sR-V6
	for openembedded-devel@openembedded.org; Mon, 21 Jul 2008 23:36:11 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1KL32A-0000Xe-KX
	for openembedded-devel@openembedded.org; Mon, 21 Jul 2008 21:35:06 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Mon, 21 Jul 2008 21:35:06 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Mon, 21 Jul 2008 21:35:06 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 21 Jul 2008 23:34:59 +0200
Message-ID: <g62ve3$baq$1@ger.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Thunderbird/3.0a2pre (Macintosh; 2008062403)
Sender: news <news@ger.gmane.org>
Subject: please stop updating efl SRCDATE, it breaks builds
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
X-List-Received-Date: Mon, 21 Jul 2008 21:36:11 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

Everytime efl SRCDATE gets changed my builds start failing in do_fetch. 
This is caused by the cvs server only allowing one connection per host, 
so with using multithreaded bitbake I have to restart the build about 10 
times to get everything fetched. I have to disable the autobuilder 
everytime this happens since it would basically DoS bugzilla with 
do_fetch error reports :(

Please think of all this when wanting to bump SRCDATE the next time.

regards,

Koen



