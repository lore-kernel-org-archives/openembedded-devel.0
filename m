Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1M4UVu-0003sy-Jo
	for openembedded-devel@openembedded.org; Thu, 14 May 2009 08:34:00 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1M4UPJ-0001a4-OI
	for openembedded-devel@openembedded.org; Thu, 14 May 2009 06:27:05 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 14 May 2009 06:27:05 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 14 May 2009 06:27:05 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 14 May 2009 08:26:51 +0200
Message-ID: <gugdje$d8p$1@ger.gmane.org>
References: <20090513205603.AAC121893A7@amethyst.openembedded.net>
	<20090513211342.GN7973@smtp.west.cox.net>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b5pre) Gecko/20090427 Shredder/3.0b3pre
In-Reply-To: <20090513211342.GN7973@smtp.west.cox.net>
Sender: news <news@ger.gmane.org>
Subject: Re: [oe-commits] Koen Kooi : gcc 4.3.3: fix regression from 4.3. 1 that caused fortran to get disabled for linux-gnueabi
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
X-List-Received-Date: Thu, 14 May 2009 06:34:20 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13-05-09 23:13, Tom Rini wrote:
> On Wed, May 13, 2009 at 10:56:03PM +0200, GIT User account wrote:
>
>> Author: Koen Kooi<koen@openembedded.org>
>> Date:   Wed May 13 22:49:19 2009 +0200
>>
>> gcc 4.3.3: fix regression from 4.3.1 that caused fortran to get disabled for linux-gnueabi
>
> This came up on IRC today for something else.  Why do we only build a
> fortran compiler on ARM (EABI)?  Should it just be disabled on a few
> platforms perhaps?

When we first started playing with things like this (2005-ish) some 
people didn't want java, fortran or obj-c compilers, so everything 
defaulted to off.
And gcc is crappy enough that java, fortran and objc just don't 
crosscompile for every arch (check the arm fortran patches).

Having said that, I rather like complete toolchains, so if it was up to 
me, java, fortran and objc would be turned on by default for every arch.

regards,

Koen



