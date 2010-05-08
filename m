Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1OAi1B-0002Ct-E5
	for openembedded-devel@lists.openembedded.org;
	Sat, 08 May 2010 13:16:25 +0200
Received: by fxm11 with SMTP id 11so1354992fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 08 May 2010 04:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=GKpeFaccN7t1y5wcsNiT91pUBL5vy/0qU3hGOKiEqDE=;
	b=MfqZrUfItUZFZgCK9AImbQhnCqpg0z4qtlBzKd7PjOCBaTveGN6sI+GOsxYEN21Pou
	RPZqvr7F2hbmuPWsL1uSHouAj1JVAUA8ZsncVN/wYy3t1kZ1TiP841srj4FJVv6TtTqs
	jrC9QEusVzmFeoGQ3EklHQgXIXMg4weL02/9c=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=ZEHu84M6WClLCLey5jb5QUWt/QeeZFIH74NRvyX29v7b+xYcye2D9rWyMjVicJeUMa
	fgv3t4OTc668YI8RoM9V3bHPxodcQcn2pA1FvMRNBCMWrxNbl5s0A9bcgkqFT+NsT/Rr
	k+rh8eL6PnV+YT7qb9yR1ROo+C8P6HfI8F6ws=
MIME-Version: 1.0
Received: by 10.239.188.18 with SMTP id n18mr122613hbh.29.1273317153599; Sat, 
	08 May 2010 04:12:33 -0700 (PDT)
Received: by 10.239.192.77 with HTTP; Sat, 8 May 2010 04:12:33 -0700 (PDT)
In-Reply-To: <n2zd1b08f941005080156gd17a92cbk9985dc913c13fb0a@mail.gmail.com>
References: <v2sd1b08f941005071617u31274631hcddebb5b9eeb888d@mail.gmail.com>
	<n2zd1b08f941005080156gd17a92cbk9985dc913c13fb0a@mail.gmail.com>
Date: Sat, 8 May 2010 13:12:33 +0200
Message-ID: <g2rd1b08f941005080412i42f1ed71ld780acc5e2bd6259@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: andrea.adami@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: gtk+native missing dep ?
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
X-List-Received-Date: Sat, 08 May 2010 11:16:26 -0000
Content-Type: text/plain; charset=ISO-8859-1

PARALLEL_MAKE = "-j5"
#BB_NUMBER_THREADS = "4"
BB_NUMBER_THREADS = "2"

fixed the things. This time the dependencies were (correctly) built before...

Andrea


