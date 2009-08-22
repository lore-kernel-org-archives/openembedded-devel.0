Received: from [151.189.21.49] (helo=mail-in-09.arcor-online.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martinator.de@arcor.de>) id 1Mer12-0000JE-Jj
	for openembedded-devel@lists.openembedded.org;
	Sat, 22 Aug 2009 15:52:20 +0200
Received: from mail-in-10-z2.arcor-online.net (mail-in-10-z2.arcor-online.net
	[151.189.8.27]) by mx.arcor.de (Postfix) with ESMTP id A17771AF797
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Aug 2009 15:34:47 +0200 (CEST)
Received: from mail-in-04.arcor-online.net (mail-in-04.arcor-online.net
	[151.189.21.44])
	by mail-in-10-z2.arcor-online.net (Postfix) with ESMTP id 814DE23D885
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Aug 2009 15:34:47 +0200 (CEST)
Received: from [192.168.178.27] (e179143172.adsl.alicedsl.de [85.179.143.172])
	(Authenticated sender: martinator.de@arcor.de)
	by mail-in-04.arcor-online.net (Postfix) with ESMTPSA id 3B1DE33A941
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Aug 2009 15:34:47 +0200 (CEST)
X-DKIM: Sendmail DKIM Filter v2.8.2 mail-in-04.arcor-online.net 3B1DE33A941
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arcor.de; s=mail-in;
	t=1250948087; bh=KWUh8UCUgg0/3OdKtg22enzP2tKbObVlHIApI0A/cqk=;
	h=Message-ID:Date:From:MIME-Version:To:Subject:References:
	In-Reply-To:Content-Type:Content-Transfer-Encoding;
	b=fLQvFD2T4vSU4VBDe9yhyBZYi93lKzpTiTw0ynzP+Qk+OOSdmdB3KaQW7YL81LJin
	4EuLTWFwp5fQXNRc1Lv5Dr9nVpMNdIraHSVq9qzZDwQGBaCYori9XwR8TEAWGPErq5
	W4r0BgbZjg+OAFEZa+md6lm4M37toGF94zqHIlbI=
Message-ID: <4A8FF3EB.3010709@arcor.de>
Date: Sat, 22 Aug 2009 15:34:35 +0200
From: Martin Wegner <martinator.de@arcor.de>
User-Agent: Thunderbird 2.0.0.23 (Windows/20090812)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4A8F6FE3.5080901@arcor.de>
	<1250927519.4215.321.camel@lenovo.internal.reciva.com>
In-Reply-To: <1250927519.4215.321.camel@lenovo.internal.reciva.com>
X-Enigmail-Version: 0.96.0
Subject: Re: bitbake source fetch problem :(
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
X-List-Received-Date: Sat, 22 Aug 2009 13:52:20 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi Phil,

thank you for your quick answer. Now I installed mecurial but I found a
bug...

NOTE: Fetch hg://icedtea.classpath.org;module=hg/icedtea6;rev=bb7ad7d43804
abort: No such file or directory: hg/icedtea6
NOTE: Task failed: Fetch failed: Fetch command export
SSH_AUTH_SOCK=/tmp/keyring-J8gFA7/socket.ssh; export
PATH=/stuff/tmp/staging/i686-linux/usr/bin/armv5te-angstrom-linux-gnueabi:/stuff/tmp/staging/i686-linux/usr/bin/armv5te-angstrom-linux-gnueabi:/stuff/tmp/staging/i686-linux/usr/sbin:/stuff/tmp/staging/i686-linux/usr/bin:/stuff/tmp/cross/armv5te/bin:/stuff/tmp/staging/i686-linux/sbin:/stuff/tmp/staging/i686-linux/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games;
/usr/bin/env hg clone -r bb7ad7d43804
http://icedtea.classpath.org/hg/icedtea6 hg/icedtea6 failed with signal
255, output:
abort: No such file or directory: hg/icedtea6

When I create the hg/icedtea6 directory at
/stuff/sources/hg/icedtea.classpath.org/ I got this log

NOTE: Fetch hg://icedtea.classpath.org;module=hg/icedtea6;rev=bb7ad7d43804
abort: destination 'hg/icedtea6' already exists
NOTE: Task failed: Fetch failed: Fetch command export
SSH_AUTH_SOCK=/tmp/keyring-J8gFA7/socket.ssh; export
PATH=/stuff/tmp/staging/i686-linux/usr/bin/armv5te-angstrom-linux-gnueabi:/stuff/tmp/staging/i686-linux/usr/bin/armv5te-angstrom-linux-gnueabi:/stuff/tmp/staging/i686-linux/usr/sbin:/stuff/tmp/staging/i686-linux/usr/bin:/stuff/tmp/cross/armv5te/bin:/stuff/tmp/staging/i686-linux/sbin:/stuff/tmp/staging/i686-linux/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games;
/usr/bin/env hg clone -r bb7ad7d43804
http://icedtea.classpath.org/hg/icedtea6 hg/icedtea6 failed with signal
255, output:
abort: destination 'hg/icedtea6' already exists

It only works when I delete the hg/icedtea6 directory I added before and
create only the hg directory at /stuff/sources/hg/icedtea.classpath.org/

I posted this bug to the jalimo mailing list.

Greetings!

Martin

Phil Blundell schrieb:
> On Sat, 2009-08-22 at 06:11 +0200, Martin Wegner wrote:
>   
>> PATH=/stuff/tmp/staging/i686-linux/usr/bin/armv5te-angstrom-linux-gnueabi:/stuff/tmp/staging/i686-linux/usr/bin/armv5te-angstrom-linux-gnueabi:/stuff/tmp/staging/i686-linux/usr/sbin:/stuff/tmp/staging/i686-linux/usr/bin:/stuff/tmp/cross/armv5te/bin:/stuff/tmp/staging/i686-linux/sbin:/stuff/tmp/staging/i686-linux/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games;
>> /usr/bin/env hg clone -r bb7ad7d43804
>> http://icedtea.classpath.org/hg/icedtea6 hg/icedtea6 failed with signal
>> 127, output:
>> /usr/bin/env: hg: No such file or directory
>>     
>
> This error seems fairly self-explanatory: it would appear that you are
> trying to check out from a mercurial repository without having the
> mercurial client installed.
>
> p.
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>   


