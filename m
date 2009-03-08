Received: from [209.85.146.182] (helo=wa-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Lg80B-0003c2-E0
	for openembedded-devel@lists.openembedded.org;
	Sun, 08 Mar 2009 02:40:27 +0100
Received: by wa-out-1112.google.com with SMTP id n7so532857wag.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 Mar 2009 17:35:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:organization:to:subject
	:date:user-agent:cc:references:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:message-id;
	bh=kF/ry94lRXm6fx0MawgsiLrJyDI7DQ1Us0MVQ/uNpro=;
	b=TgwJOO3v0ijNsInXR4dTNPuEWsez/flzN0Hb2kfGdd3B3sC1RTYNDQwT7oDumnloeG
	u3AQvmxESyVA8EKb7+4KG3USAyXZxUpQ15WDdx+TjZzP3TQ4+jxHuRmmB2RESMgpgm1z
	x1ggivVFD+lVIs2Qftq9ZDasfk9bAzcmgBLQc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:organization:to:subject:date:user-agent:cc:references
	:in-reply-to:mime-version:content-type:content-transfer-encoding
	:content-disposition:message-id;
	b=XlhfF751d+Bg00XNa3lkm0I8rknFbWsCog2gOSMBoKozCAGP5ftAGs/cFQ8xaGZICM
	n33+TDoGjf3UjCCkX5S1is+O+DWFuN8T2swL6j5HBK5oFIU51NLT2GvdOViViMgOygM7
	5SWZ20sfq9gvqiRbPBxa3u9f5aoR76IOhaA5E=
Received: by 10.115.91.2 with SMTP id t2mr2530563wal.224.1236476144830;
	Sat, 07 Mar 2009 17:35:44 -0800 (PST)
Received: from morpheus.localnet (adsl-71-146-1-99.dsl.pltn13.sbcglobal.net
	[71.146.1.99])
	by mx.google.com with ESMTPS id n40sm2615730wag.48.2009.03.07.17.35.42
	(version=SSLv3 cipher=RC4-MD5); Sat, 07 Mar 2009 17:35:43 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
Organization: Juniper Networks Inc.
To: openembedded-devel@lists.openembedded.org
Date: Sat, 7 Mar 2009 17:35:28 -0800
User-Agent: KMail/1.11.1 (Linux/2.6.28-8-generic; KDE/4.2.1; x86_64; ; )
References: <1236463653.25861.321.camel@cheeto.emacinc.com>
In-Reply-To: <1236463653.25861.321.camel@cheeto.emacinc.com>
MIME-Version: 1.0
Message-Id: <200903071735.37618.raj.khem@gmail.com>
Subject: Re: failure on gcc-cross-initial-4.2.4-r5 for i686
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
X-List-Received-Date: Sun, 08 Mar 2009 01:40:27 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Saturday 07 March 2009 14:07:33 Travis Stratman wrote:
> Hello,
>
> I am trying to build an image for an i686 based machine (pentiumpro). I
> have it configured to use gcc 4.2.4, glibc 2.6.1, binutils 2.18.50.0.7.
>
> The build fails on do_compile in gcc-cross-initial. The log shows
> "checking for C compiler default output file name... configure: error: C
> compiler cannot create executables" in configure-stage2-intl.
>
> Looking at the config.log in gcc-4.2.4/build.i686-linux.i686-linux/intl
> shows:
> ----
> configure:2118: checking for C compiler default output file name
> configure:2121: 
> /opt/oe/EMAC-OE-x86/tmp/work/i686-linux/gcc-cross-initial-4.2.4-r5/gcc-4.2.
>4/build.i686-linux.i686-linux/./prev-gcc/xgcc
> -B/opt/oe/EMAC-OE-x86/tmp/work/i686-linux/gcc-cross-initial-4.2.4-r5/gcc-4.
>2.4/build.i686-linux.i686-linux/./prev-gcc/
> -B/opt/oe/EMAC-OE-x86/tmp/cross/i686/i686-linux/bin/ -O2 -g
> -fomit-frame-pointer   conftest.c  >&5
> /opt/oe/EMAC-OE-x86/tmp/cross/i686/i686-linux/bin/ld: crt1.o: No such file:
> No such file or directory
> collect2: ld returned 1 exit status
> ----
>
> If I recall correctly the crt1.o file is a start file provided by glibc,
> but I need to get gcc compiled first...

yes. gcc-initial is really very minimal gcc. It does not depend on anything 
except binutils. We make sure that it does not build stuff thats not needed at 
this stage.

>
> Any ideas on where to start? Is there any information that I can provide
> that would be helpful?

Are you using latest git? I do not get the error like yours for me it builds 
fine for i686-generic machine. Could you post your local.conf ?
are you using some pre existing distro and machine or defining your own.

Thx

-Khem




