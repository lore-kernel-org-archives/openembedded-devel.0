Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NBPkK-0001FJ-F2 for openembedded-devel@lists.openembedded.org;
	Fri, 20 Nov 2009 10:25:43 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1NBPiy-0006QY-51
	for openembedded-devel@lists.openembedded.org;
	Fri, 20 Nov 2009 10:24:16 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Nov 2009 10:24:16 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Nov 2009 10:24:16 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 20 Nov 2009 10:23:46 +0100
Message-ID: <he5n72$ltj$1@ger.gmane.org>
References: <992df8520911150534v4aeec248u91c5ca477de25eb9@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.6pre) Gecko/20091109 Shredder/3.0pre
In-Reply-To: <992df8520911150534v4aeec248u91c5ca477de25eb9@mail.gmail.com>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Initial Support for the Samsung Omnia (SGH-i900)
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
X-List-Received-Date: Fri, 20 Nov 2009 09:25:43 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15-11-09 14:34, Alex Ferguson wrote:
> I've been working on some initial support for the Samsung Omnia (SGH-i900)
> in the form of a machine configuration file and kernel. I also posted this
> as a bug here:
>
> http://bugs.openembedded.org/show_bug.cgi?id=5335

Oops, I missed a serious bug in your patches:

+++ b/recipes/tslib/tslib/sgh-i900/tslib.sh
@@ -0,0 +1,5 @@
+#!/bin/sh
+
+TSLIB_TSDEVICE=/dev/input/event1
+
+export TSLIB_TSDEVICE

That is so wrong it isn't funny anymore. The eventX numbers are pretty 
much randomly assigned, so you can't depend on them. In OE we have a 
udev script that finds all touchscreens and creates 
/dev/input/touchscreenX symlinks. The default tslib.sh uses those.

Could you please explain why the default tslib.sh isn't working for you?

regards,

Koen



