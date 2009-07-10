Received: from [209.85.132.242] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1MPDz9-0008Kg-3B
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 Jul 2009 13:09:47 +0200
Received: by an-out-0708.google.com with SMTP id c5so391083anc.42
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Jul 2009 03:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=bYRPqRXsa76bHHhitKg0qE6ycXzgILkr5WDjOp04Sgo=;
	b=saBbvZLnR2MaV6OWDvCvX5nyz6BPL2hLkOA5AolD/uYSDaPhYyGTz7t7BVWMvp4Da3
	hkVfhdrZ7OWuBfj1gc6A5Y17B7Wgk9SKR3v+26v+rEA+pQd0SK3/QxGWWyM43C//Ic7B
	rnu0o5Qk2qgPpshmzLkixSHDIN9l2cGdY+AtY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=hCPoIRigVCIV4wuXUrp886zvhHP8CKMF0sqUSgu0fcynnE5sIFvEppt6uVZo9Q22qP
	L8nLAOn2i3UtiVPpnbVqWzFEFIZtIIrjRmCw/ur5G6TYKlo6edlirZutt4m/AQVQ1RT6
	D1iuSEX5yWf1BlZKVdDMkEviZ1OVZeM8Momxw=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.100.231.8 with SMTP id d8mr2375967anh.196.1247223415399; Fri, 
	10 Jul 2009 03:56:55 -0700 (PDT)
In-Reply-To: <200907092009.28507.khimov@altell.ru>
References: <be7a9f3d0907090612k3babae30h64d0424a4fe8dcc0@mail.gmail.com>
	<200907091919.56858.khimov@altell.ru>
	<be7a9f3d0907090834q3e1a57b2s6723e15b5f3a9fa6@mail.gmail.com>
	<200907092009.28507.khimov@altell.ru>
Date: Fri, 10 Jul 2009 07:56:55 -0300
X-Google-Sender-Auth: 47850e019dd6d4a6
Message-ID: <be7a9f3d0907100356y171913cjbfa203cd83a7b7b0@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [RFH] Stable qemu-native BROKEN
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
X-List-Received-Date: Fri, 10 Jul 2009 11:09:47 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hello,

2009/7/9 Roman I Khimov <khimov@altell.ru>:
> EXTRA_OECONF += "--target-list=arm-linux-user,arm-softmmu"

I got it fixed without the workaround; it was a failure in the sid's
toolchain, already fixed.

-- 
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


