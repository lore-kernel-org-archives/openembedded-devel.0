Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1KiAGy-0003ba-La
	for openembedded-devel@openembedded.org; Tue, 23 Sep 2008 17:57:56 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1KiADW-0003ot-KU
	for openembedded-devel@openembedded.org; Tue, 23 Sep 2008 15:54:22 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 23 Sep 2008 15:54:22 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 23 Sep 2008 15:54:22 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 23 Sep 2008 17:54:14 +0200
Message-ID: <gbb3f6$nfr$1@ger.gmane.org>
References: <d1b08f940809230158s78f04a4bq866bf586dce5cafe@mail.gmail.com>	<gbaj23$rup$1@ger.gmane.org>
	<d1b08f940809230842j78a43e64r6f2e43fcecd1f656@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b1pre) Gecko/20080912030722 Shredder/3.0b1pre
In-Reply-To: <d1b08f940809230842j78a43e64r6f2e43fcecd1f656@mail.gmail.com>
Sender: news <news@ger.gmane.org>
Subject: Re: QA Logs now on tinderbox
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
X-List-Received-Date: Tue, 23 Sep 2008 15:57:56 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Andrea Adami wrote:
>> These two are the most common:
>
> Well, it is clear to me these are 'cruft' in staging. Two wrong
> packages are tainting the whole staging area.
> (This phenomenon has been already seen with libmudflap, libc, ... in
> angstrom-stable [1])
>
> But...why not fix these two immediately?

The .pc.in files need to get fixed, since fixing them when they are 
already in staging means that you are shipping from .pc files in -dev 
packages.

regards,

Koen



>
> Andrea
>
>
> [1]
> ERROR: QA Issue: libmudflap.la failed sanity test (installed) in path
> /OE/angstrom-tmp//staging/arm-angstrom-linux-gnueabi/lib
> NOTE: a QA error occured but will not be logged because QA_LOG is not set
> ERROR: QA Issue: libsupc++.la failed sanity test (installed) in path
> /OE/angstrom-tmp//staging/arm-angstrom-linux-gnueabi/lib
> NOTE: a QA error occured but will not be logged because QA_LOG is not set
> ERROR: QA Issue: libmudflapth.la failed sanity test (installed) in path
> /OE/angstrom-tmp//staging/arm-angstrom-linux-gnueabi/lib
> NOTE: a QA error occured but will not be logged because QA_LOG is not set
> ERROR: QA Issue: libstdc++.la failed sanity test (installed) in path
> /OE/angstrom-tmp//staging/arm-angstrom-linux-gnueabi/lib
> NOTE: a QA error occured but will not be logged because QA_LOG is not set




