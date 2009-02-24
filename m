Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Lc3RF-000629-OR
	for openembedded-devel@openembedded.org; Tue, 24 Feb 2009 20:59:33 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1Lc3OF-0004Pd-Fc
	for openembedded-devel@openembedded.org; Tue, 24 Feb 2009 19:56:27 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 24 Feb 2009 19:56:27 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 24 Feb 2009 19:56:27 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 24 Feb 2009 20:56:19 +0100
Message-ID: <go1jd3$mlv$1@ger.gmane.org>
References: <1235501736.8911.52.camel@alap>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20090209 Shredder/3.0b2pre
In-Reply-To: <1235501736.8911.52.camel@alap>
Sender: news <news@ger.gmane.org>
Subject: Re: [PATCH] add the openmoko git kernel stable branch to fso/milestone5
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
X-List-Received-Date: Tue, 24 Feb 2009 19:59:33 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24-02-09 19:55, Angus Ainslie wrote:

> +KERNEL_RELEASE = "2.6.29-rc3"
> +KERNEL_VERSION = "${KERNEL_RELEASE}"
> +
> +OMV = "stable"
> +PV = "${KERNEL_RELEASE}-${OMV}+gitr${SRCREV}"

NACK. This violates OEs versioning policy since 2.6.29-rc3 will sort 
higher than 2.6.29 final.

regards,

Koen



