Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MBCeh-0006ED-LY
	for openembedded-devel@openembedded.org; Mon, 01 Jun 2009 20:54:44 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1MBCWD-0008Qf-PY
	for openembedded-devel@openembedded.org; Mon, 01 Jun 2009 18:45:58 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Mon, 01 Jun 2009 18:45:57 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Mon, 01 Jun 2009 18:45:57 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 01 Jun 2009 20:45:43 +0200
Message-ID: <h017kn$emm$1@ger.gmane.org>
References: <gr7nfd$32a$1@ger.gmane.org>	<20090601165809.GZ23842@smtp.west.cox.net>
	<h012tn$v40$1@ger.gmane.org>
	<1243880254.5049.1.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1pre) Gecko/20090526 Shredder/3.0b3pre
In-Reply-To: <1243880254.5049.1.camel@lenovo.internal.reciva.com>
Sender: news <news@ger.gmane.org>
Subject: Re: [RFC] Rebuild external kernel modules on kernel change
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
X-List-Received-Date: Mon, 01 Jun 2009 18:54:45 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01-06-09 20:17, Phil Blundell wrote:
> On Mon, 2009-06-01 at 19:25 +0200, Koen Kooi wrote:
>> So far I've only seen suggestions that will trigger a rebuild of recipes
>> using module*bbclass, but no solutions for automagic version changes so
>> that the package manager will pick it up as well.
>
> I don't quite understand why this is so complicated; can't you just
> append the kernel's ABI version to either ${PR} or ${PV} (depending on
> whether or not you want parallel installability) for the modules?

No, since PV and PR need to be known at parsing time when the kernel 
hasn't been built yet.

regards,

Koen



