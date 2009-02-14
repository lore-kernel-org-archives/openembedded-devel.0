Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LYG5d-00052j-Ud
	for openembedded-devel@openembedded.org; Sat, 14 Feb 2009 09:41:33 +0100
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1LYG4A-00072a-RC
	for openembedded-devel@openembedded.org; Sat, 14 Feb 2009 08:40:02 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sat, 14 Feb 2009 08:40:02 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Sat, 14 Feb 2009 08:40:02 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sat, 14 Feb 2009 09:34:56 +0100
Message-ID: <gn5vng$clm$2@ger.gmane.org>
References: <200902140035.13820.khimov@altell.ru>
	<200902140730.32782.openembedded@haerwu.biz>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20090209 Shredder/3.0b2pre
In-Reply-To: <200902140730.32782.openembedded@haerwu.biz>
Sender: news <news@ger.gmane.org>
Subject: Re: [PATCH] New package: siproxd
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
X-List-Received-Date: Sat, 14 Feb 2009 08:41:34 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14-02-09 07:30, Marcin Juszkiewicz wrote:
> On Friday 13 of February 2009 22:35:13 Roman I Khimov wrote:
>
>> diff --git a/packages/siproxd/siproxd.inc
>
>> +RDEPENDS = "libosip2"
>
>> diff --git a/packages/siproxd/siproxd_0.7.1.bb
>
>> +PR = "r0"
>
> Drop those two lines. You should not add libs to RDEPENDS (OE takes care
> of it)

Unless it's dlopen()'ed.

regards,

Koen



