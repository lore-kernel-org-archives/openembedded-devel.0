Received: from mail-px0-f172.google.com ([209.85.212.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QLjg1-0008PV-A7
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 May 2011 00:20:41 +0200
Received: by pxi6 with SMTP id 6so3062429pxi.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 May 2011 15:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id
	:mail-followup-to:references:mime-version:content-type
	:content-disposition:content-transfer-encoding:in-reply-to
	:user-agent; bh=ydWxmII3VHa5vnHHu0OM1jfdapRODYBf+rFkn61/pzQ=;
	b=vIzUSbU5hEyqpE7VHrJo9DUQsbJsLQ/a3hfF16zO3iQdUqyuuN4pirhZomvtnH/dgN
	k3gZYfxXPACf53d1nw/h/NuHZ1oZDTg/urw2/Yc+DSwLq4h8ZWE23n8w5Sz5Fbw3zU/Y
	Ig43I1pQ68VbVF5jVOMzv1d9FwUtdzwX4+HW8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	b=uljE/jJboOmYjs3vyaLm4NYifbfdBlwa2Sn5nwPWERi0jU+YzjsYyTiQvyJWW1ASgd
	83vrHSTatcz0MzIVvU7gWzaizCU0rOiQHkAn844ZWVt6MIwtnztBn1QFoXwwbUhk2SVQ
	yICFpkwAA4yor19EoZs0ttR4pv7piNrV85vAc=
Received: by 10.68.66.169 with SMTP id g9mr5869474pbt.527.1305497865958;
	Sun, 15 May 2011 15:17:45 -0700 (PDT)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id a1sm2859037pbo.91.2011.05.15.15.17.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 15 May 2011 15:17:44 -0700 (PDT)
Date: Sun, 15 May 2011 15:16:47 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110515221647.GD24670@sakrah.homelinux.org>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <201105101555.50984.sgh@sgh.dk>
	<1305059211.9982.18.camel@mattotaupa>
MIME-Version: 1.0
In-Reply-To: <1305059211.9982.18.camel@mattotaupa>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: acpid-1.0.10-r5.1 fails compilation
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
X-List-Received-Date: Sun, 15 May 2011 22:20:41 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On (10/05/11 22:26), Paul Menzel wrote:
> Dear Søren,
> 
> > | cc1: warnings being treated as errors
> > | libnetlink.c: In function 'addraw_l':
> > | libnetlink.c:521:56: error: comparison between signed and unsigned integer expressions
> > | make: *** [libnetlink.o] Error 1
> > | make: *** Waiting for unfinished jobs....
> > | + die 'oe_runmake failed'
> > | + oefatal 'oe_runmake failed'
> > | + echo FATAL: 'oe_runmake failed'
> > | FATAL: oe_runmake failed
> > | + exit 1
> > NOTE: package acpid-1.0.10-r5.1: task do_compile: Failed
> 
> I could build it fine using `minimal` as distribution for `MACHINE =
> "beagleboard"`. You seem to compile for i686. I do not know what differs
> there.

code paths are different between arm and x86. Apply this patch 

http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=616194#15

and if it helps then post a patch for OE

-Khem



