Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RTo2T-0001s1-N5
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Nov 2011 06:09:31 +0100
Received: by iahk25 with SMTP id k25so4021930iah.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Nov 2011 21:02:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=SdEgqGvOLuyY6uidqA734m29kz21bs9mBRdvcjN5G8A=;
	b=tf6RrI5OCjce9CmglydBbkpVZt3iahZpPTm9krlbuAhSJy9v8ua2+K44RrIYkJ+Da2
	lspG9cxRugpzPTiN/BU94WubNDZtGxYoCl9Pn4UJrYLndomMm1DKR6Dbs5T8uDkl8VHf
	BoxWbYUiI5EOcnwKVRt5VO1rIMLyUB5eiJl34=
Received: by 10.50.194.229 with SMTP id hz5mr36312924igc.36.1322197372086;
	Thu, 24 Nov 2011 21:02:52 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id a2sm54134409igj.7.2011.11.24.21.02.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 24 Nov 2011 21:02:50 -0800 (PST)
Date: Thu, 24 Nov 2011 21:09:22 -0800
From: Khem Raj <raj.khem@gmail.com>
To: Mr Dash Four <mr.dash.four@googlemail.com>
Message-ID: <20111125050922.GA30623@sakrah.homelinux.org>
Mail-Followup-To: Mr Dash Four <mr.dash.four@googlemail.com>,
	openembedded-devel@lists.openembedded.org
References: <4EC81A85.8050704@googlemail.com>
	<CAMKF1srcWq1mD4wNZEi2Eff2iMCVcwvjL_swTJ7z1Y6=qjZA1Q@mail.gmail.com>
	<4ECE4B0D.6030401@googlemail.com> <4ECE5422.3070504@googlemail.com>
	<20111124174936.GA28767@sakrah.homelinux.org>
	<4ECE87A9.8040109@googlemail.com>
	<20111124182713.GH28767@sakrah.homelinux.org>
	<4ECEE6D8.7080802@googlemail.com>
MIME-Version: 1.0
In-Reply-To: <4ECEE6D8.7080802@googlemail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Fri, 25 Nov 2011 05:09:31 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (25/11/11 00:52), Mr Dash Four wrote:
> > I have no idea OTOH probably adding --with-ppl=no --with-cloog=no
> > to EXTRA_OECONF might help
> That did not work, unfortunately - "perl ./Configure" doesn't like these:

well where did you add them ? they should ONLY be added for gcc-cross
recipe

> + do_configure
> + cd util
> + perl perlpath.pl /home/mr-4/oe/build/tmp/sysroots/x86_64-linux/usr/bin
> + cd ..
> + ln -sf apps/openssl.pod crypto/crypto.pod ssl/ssl.pod doc/
> + os=linux
> ++ grep -q linux
> ++ echo linux
> ++ echo 0
> + '[' 0 -eq 0 ']'
> + os=linux
> + target=linux-x86_64
> + case $target in
> + sed -i -e 's|^\("linux-x86_64",\s*"[^:]\+\):\([^:]\+\)|\1:-DL_ENDIAN 	-DTERMIO   -Wall  -Wa,--noexecstack |g' Configure
> + useprefix=/home/mr-4/oe/build/tmp/sysroots/x86_64-linux/usr
> + '[' x/home/mr-4/oe/build/tmp/sysroots/x86_64-linux/usr = x ']'
> + perl ./Configure --with-ppl=no --with-cloog=no shared --prefix=/home/mr-4/oe/build/tmp/sysroots/x86_64-linux/usr --openssldir=/home/mr-4/oe/build/tmp/sysroots/x86_64-linux/usr/lib/ssl linux-x86_64
> Usage: Configure [no-<cipher> ...] [enable-<cipher> ...] [experimental-<cipher> ...] [-Dxxx] [-lxxx] [-Lxxx] [-fxxx] [-Kxxx] [no-hw-xxx|no-hw] [[no-]threads] [[no-]shared] [[no-]zlib|zlib-dynamic] [no-asm] [no-dso] [no-krb5] [386] [--prefix=DIR] [--openssldir=OPENSSLDIR] [--with-xxx[=vvv]] [--test-sanity] os/compiler[:flags]
> NOTE: package openssl-native-1.0.0d-r14.0: task do_configure: Failed
> 
> Any ideas?
> 

-- 
-Khem


