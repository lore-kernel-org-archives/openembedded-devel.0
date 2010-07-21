Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1Oba94-0004Fu-SQ
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Jul 2010 16:19:50 +0200
Received: by fxm12 with SMTP id 12so3586414fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Jul 2010 07:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=SFKhE0sHCPlTnBSbDHSsnCPHlHJlWnNlSmFzIZbj0eg=;
	b=ni2f6lQTPiJ8hx35gPCox83NTT3nn1FIwMYPNTQ8rTH3O2hpB395z7LEMWOzyXsI73
	4sKBOcFcqYQ793pObiR2E7OvxTo/15jMb+iBThv8AcJAbauor6t8iZ50aaxuUVBcouNY
	0K3FKJKvN6Fd/mWf1Asg9LWuPKdgdJClpQDd8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=MKz1LtR6yuLqZeCXVKYNHuHCOJ09QJvQ7bKJdKBfSZt0CCJaxRGv7fwcG0cARQl/OZ
	y1VUOCuUZuQfu/AyjVrlGExo3o2ZTl5qanywjWGBr8vXz9p1CRLxYuLs8CBVIv0tUGGu
	U32NvCTFUk4XK32E8wqwy85V4e2FbMhjS10KI=
Received: by 10.86.96.13 with SMTP id t13mr369430fgb.45.1279721967876;
	Wed, 21 Jul 2010 07:19:27 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 14sm2909313fav.26.2010.07.21.07.19.27
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 21 Jul 2010 07:19:27 -0700 (PDT)
Date: Wed, 21 Jul 2010 16:20:16 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100721142016.GH2189@jama>
References: <i216cf$pju$1@dough.gmane.org>
 <4C46DCE3.1080207@zafena.se>
MIME-Version: 1.0
In-Reply-To: <4C46DCE3.1080207@zafena.se>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Openjdk shark and cacao VMs not working - shark fixed
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
X-List-Received-Date: Wed, 21 Jul 2010 14:19:50 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

FYI:

Tested on om-gta02 (armv4t) and only -zero seems to work (built from
yesterday oe.dev, waiting for todays fixes to built).

SHR root@gojama ~ $ javac Linpack.java
Warning: no leading - on line 43 of `/usr/lib/jvm/java-6-openjdk/jre/lib/arm/jvm.cfg'
Warning: missing VM type on line 43 of `/usr/lib/jvm/java-6-openjdk/jre/lib/arm/jvm.cfg'
Warning: no leading - on line 43 of `/usr/lib/jvm/java-6-openjdk/jre/lib/arm/jvm.cfg'
Warning: missing VM type on line 43 of `/usr/lib/jvm/java-6-openjdk/jre/lib/arm/jvm.cfg'
dl failure on line 696Error: failed /usr/lib/jvm/java-6-openjdk/jre/lib/arm/shark/libjvm.so, because /usr/lib/libLLVMCodeGen.so: symbol powf, version GLIBCXX_3.4 not defined in file libstdc++.so.6 with link time reference
SHR root@gojama ~ $ javac -zero Linpack.java
Warning: no leading - on line 43 of `/usr/lib/jvm/java-6-openjdk/jre/lib/arm/jvm.cfg'
Warning: missing VM type on line 43 of `/usr/lib/jvm/java-6-openjdk/jre/lib/arm/jvm.cfg'
Warning: no leading - on line 43 of `/usr/lib/jvm/java-6-openjdk/jre/lib/arm/jvm.cfg'
Warning: missing VM type on line 43 of `/usr/lib/jvm/java-6-openjdk/jre/lib/arm/jvm.cfg'

SHR root@gojama ~ $ java -zero Linpack
Warning: no leading - on line 43 of `/usr/lib/jvm/java-6-openjdk/jre/lib/arm/jvm.cfg'
Warning: missing VM type on line 43 of `/usr/lib/jvm/java-6-openjdk/jre/lib/arm/jvm.cfg'
Warning: no leading - on line 43 of `/usr/lib/jvm/java-6-openjdk/jre/lib/arm/jvm.cfg'
Warning: missing VM type on line 43 of `/usr/lib/jvm/java-6-openjdk/jre/lib/arm/jvm.cfg'
Mflops/s: 1.687  Time: 0.41 secs  Norm Res: 1.43  Precision: 2.220446049250313E-16
SHR root@gojama ~ $ java -shark Linpack
Warning: no leading - on line 43 of `/usr/lib/jvm/java-6-openjdk/jre/lib/arm/jvm.cfg'
Warning: missing VM type on line 43 of `/usr/lib/jvm/java-6-openjdk/jre/lib/arm/jvm.cfg'
Warning: no leading - on line 43 of `/usr/lib/jvm/java-6-openjdk/jre/lib/arm/jvm.cfg'
Warning: missing VM type on line 43 of `/usr/lib/jvm/java-6-openjdk/jre/lib/arm/jvm.cfg'
dl failure on line 696Error: failed /usr/lib/jvm/java-6-openjdk/jre/lib/arm/shark/libjvm.so, because /usr/lib/libLLVMCodeGen.so: symbol powf, version GLIBCXX_3.4 not defined in file libstdc++.so.6 with link time reference
SHR root@gojama ~ $ java -cacao Linpack
Warning: no leading - on line 43 of `/usr/lib/jvm/java-6-openjdk/jre/lib/arm/jvm.cfg'
Warning: missing VM type on line 43 of `/usr/lib/jvm/java-6-openjdk/jre/lib/arm/jvm.cfg'
Warning: no leading - on line 43 of `/usr/lib/jvm/java-6-openjdk/jre/lib/arm/jvm.cfg'
Warning: missing VM type on line 43 of `/usr/lib/jvm/java-6-openjdk/jre/lib/arm/jvm.cfg'
LOG: [0x40190000] md_signal_handler_sigill: Unknown illegal instruction 0xed1c5a06 at 0x441c1790
LOG: [0x40190000] Aborting...
Aborted

-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


