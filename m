Received: from mail-px0-f178.google.com ([209.85.212.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PUnLS-0004vQ-Rn
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Dec 2010 22:32:39 +0100
Received: by pxi9 with SMTP id 9so1054509pxi.9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Dec 2010 13:32:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=yJWIf/snGv9D0W4NS25M8V5Ef0zv5YSsQLqq/ZCzagA=;
	b=WxeSdVNYwOTqUmsc5z4G+R/NJLsz3y7q/dTwQ4gByx2BODWBkqnbuHkIa3/UUuurX2
	9QpejxyORUzINcwZ0IU35I4THHH0m89fFceuNXhml5+t2/pr5plEB8DW63XDYVP0X0fD
	TGkzyR2yo9bE2abdMgZyJABcHPIqx6DGchnjE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=VmSJYNXaLEu3J1YCmJupLtyw1xA3izzb2tFflRLNtS4EJ0DqyMWx0ScXb8kR838uKM
	cm8PlIFYmshmcZXycX7cq1J7UDNGoiO0a6G5mRjQFKRZPUgiXUoWVmm44TrsnXVzxN3T
	+fBSsKLYO9P8+h29qeL5dGTUQxlQUA7i2jQEA=
Received: by 10.142.108.18 with SMTP id g18mr3846603wfc.179.1292880750651;
	Mon, 20 Dec 2010 13:32:30 -0800 (PST)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id w14sm6423216wfd.18.2010.12.20.13.32.29
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 20 Dec 2010 13:32:29 -0800 (PST)
Date: Mon, 20 Dec 2010 13:32:43 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101220213243.GD17904@gmail.com>
References: <4D0FB245.90008@gmail.com>
MIME-Version: 1.0
In-Reply-To: <4D0FB245.90008@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: qemu-native_0.13.0 do_compile fails
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
X-List-Received-Date: Mon, 20 Dec 2010 21:32:39 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (20/12/10 20:45), Jan Paesmans wrote:
> Hi,
> 
> After hacking the problem with openssl-native, the following happens for
> qemu-native.
> I found a reference describing the same problem with the new gold linker.
> Any advice?
> 
> |   LINK  alpha-linux-user/qemu-alpha
> | /usr/bin/ld: error: address of section '.tbss' moves backward from
> 0x6018e440 to 0x6018e260
> | collect2: ld returned 1 exit status
> | make[1]: *** [qemu-alpha] Error 1
> | make: *** [subdir-alpha-linux-user] Error 2
> | FATAL: oe_runmake failed
> | ERROR: Function do_compile failed
> NOTE: package qemu-native-0.13.0-r2: task do_compile: Failed
> ERROR: TaskFailed event exception, aborting
> ERROR: Build of
> virtual:native:/home/janp/hudson/openembedded/recipes/qemu/qemu_0.13.0.bb do_compile
> failed
> ERROR: Task 947
> (virtual:native:/home/janp/hudson/openembedded/recipes/qemu/qemu_0.13.0.bb,
> do_compile) failed with 256

Well 0.13 has some more issues as it turns out. May be you can DP it to -1 
and use 0.12.5 instead you will end up in better situation.

> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


