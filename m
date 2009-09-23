Received: from [80.91.229.12] (helo=lo.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MqQNN-0002G4-Qj for openembedded-devel@lists.openembedded.org;
	Wed, 23 Sep 2009 13:51:16 +0200
Received: from list by lo.gmane.org with local (Exim 4.50) id 1MqQLC-0006gG-30
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Sep 2009 13:48:58 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Sep 2009 13:48:58 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Sep 2009 13:48:58 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 23 Sep 2009 13:46:35 +0200
Message-ID: <h9d1qs$564$1@ger.gmane.org>
References: <1253697229-6181-1-git-send-email-Martin.Jansa@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.3pre) Gecko/20090811 Shredder/3.0b4pre
In-Reply-To: <1253697229-6181-1-git-send-email-Martin.Jansa@gmail.com>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] findutils: fix update-alternatives and native packages
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
X-List-Received-Date: Wed, 23 Sep 2009 11:51:17 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23-09-09 11:13, Martin.Jansa wrote:
> Move update-alternatives logic to findutils-alternatives.inc which is not included in -native packages.
> Patch mkinstalldirs.patch is needed also for findutils-native_4.2.29.
> Remove version 4.4 as there is no tarball upstream (it's 4.4.0 actually).
> Add latest version 4.4.2, probably not compatible with old glibc 2.6.1 (staging/armv4t-angstrom-linux-gnueabi/usr/include/stdio.h:654: error: conflicting types for 'rpl_fseeko'), findutils-native-4.4.2 is ok

Anything with rpl_* is usually a replacement function for the real 
thing. I suspect the autoconf site files need updating to cope with 
seeko. The iperf recipe has a tweak to avoid using rpl_malloc, maybe 
something analogous can be done with findutils.

regards,

Koen



