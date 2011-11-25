Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mr.dash.four@googlemail.com>) id 1RTk8N-00008S-Vg
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Nov 2011 01:59:20 +0100
Received: by wwf22 with SMTP id 22so1595714wwf.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Nov 2011 16:52:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=message-id:disposition-notification-to:date:from:user-agent
	:mime-version:to:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=RBjcmbi9jfBkvRoOS/zLdeiXTGUS2jBfpWDzMt8J6XM=;
	b=eEFWHEfLyPBuR/tiQ8MHMex11DVwkbqcnYhKEPmvNgS/dlWpP+eqSYocvM3iOHvQM8
	UaHYCL3+ksmi0E7zUli/2aWrLRLPilnd8rA+yE9aPS5EJc4HosHtHlhDr4W2reGyELS8
	AipQql0pMTD6Gokpv8ob4WjUDhIhqL/gPs4iA=
Received: by 10.227.209.82 with SMTP id gf18mr7948040wbb.8.1322182363862;
	Thu, 24 Nov 2011 16:52:43 -0800 (PST)
Received: from xp1.wyse.network
	(cpc2-gill1-0-0-cust1894.basl.cable.virginmedia.com. [82.34.63.103])
	by mx.google.com with ESMTPS id gg1sm10719123wbb.17.2011.11.24.16.52.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 24 Nov 2011 16:52:41 -0800 (PST)
Message-ID: <4ECEE6D8.7080802@googlemail.com>
Date: Fri, 25 Nov 2011 00:52:40 +0000
From: Mr Dash Four <mr.dash.four@googlemail.com>
User-Agent: Thunderbird 2.0.0.24 (X11/20110312)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4EC81A85.8050704@googlemail.com>
	<CAMKF1srcWq1mD4wNZEi2Eff2iMCVcwvjL_swTJ7z1Y6=qjZA1Q@mail.gmail.com>
	<4ECE4B0D.6030401@googlemail.com> <4ECE5422.3070504@googlemail.com>
	<20111124174936.GA28767@sakrah.homelinux.org>
	<4ECE87A9.8040109@googlemail.com>
	<20111124182713.GH28767@sakrah.homelinux.org>
In-Reply-To: <20111124182713.GH28767@sakrah.homelinux.org>
Subject: Re: "cannot find -lppl_c" link error
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
X-List-Received-Date: Fri, 25 Nov 2011 00:59:20 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

> I have no idea OTOH probably adding --with-ppl=no --with-cloog=no
> to EXTRA_OECONF might help
That did not work, unfortunately - "perl ./Configure" doesn't like these:
+ do_configure
+ cd util
+ perl perlpath.pl /home/mr-4/oe/build/tmp/sysroots/x86_64-linux/usr/bin
+ cd ..
+ ln -sf apps/openssl.pod crypto/crypto.pod ssl/ssl.pod doc/
+ os=linux
++ grep -q linux
++ echo linux
++ echo 0
+ '[' 0 -eq 0 ']'
+ os=linux
+ target=linux-x86_64
+ case $target in
+ sed -i -e 's|^\("linux-x86_64",\s*"[^:]\+\):\([^:]\+\)|\1:-DL_ENDIAN 	-DTERMIO   -Wall  -Wa,--noexecstack |g' Configure
+ useprefix=/home/mr-4/oe/build/tmp/sysroots/x86_64-linux/usr
+ '[' x/home/mr-4/oe/build/tmp/sysroots/x86_64-linux/usr = x ']'
+ perl ./Configure --with-ppl=no --with-cloog=no shared --prefix=/home/mr-4/oe/build/tmp/sysroots/x86_64-linux/usr --openssldir=/home/mr-4/oe/build/tmp/sysroots/x86_64-linux/usr/lib/ssl linux-x86_64
Usage: Configure [no-<cipher> ...] [enable-<cipher> ...] [experimental-<cipher> ...] [-Dxxx] [-lxxx] [-Lxxx] [-fxxx] [-Kxxx] [no-hw-xxx|no-hw] [[no-]threads] [[no-]shared] [[no-]zlib|zlib-dynamic] [no-asm] [no-dso] [no-krb5] [386] [--prefix=DIR] [--openssldir=OPENSSLDIR] [--with-xxx[=vvv]] [--test-sanity] os/compiler[:flags]
NOTE: package openssl-native-1.0.0d-r14.0: task do_configure: Failed

Any ideas?



