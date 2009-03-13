Received: from [209.85.219.166] (helo=mail-ew0-f166.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1LiA8H-00080R-OO
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Mar 2009 17:21:13 +0100
Received: by ewy10 with SMTP id 10so2823854ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Mar 2009 09:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=fJ8uBwizOIyCAdeDJjpZjPA/fJPm37j3YeZk0F7BMdg=;
	b=QnHTPIFQhcmwphEPGa0Yzsl8qSWvR8iNMqANnvimm2aEK83Ox2En2G7B0xMIGAbqCu
	/+TiaS7GEg55WlRtey8gp0FGJsiY4SSJzLEzTPfDL05s3FQrQXa85rzNPrM+7cHJPH0R
	p3I9MEKLnBBkdcwV548OEtemO+vnxU8xBAz0U=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=OA1tMPMJIJnUROWdNZjJyDfbjyN1GJ833QwkGRpNmomMJarcfHvnQE7HInNXaXyVkl
	fMbpOj+WNSLO6KLdXBdGxKbRwchmfU0h32OX4rcAgO2XdaXr6EhfDkcHb1Mi1dHFkqrM
	HTAPlndrShnQFcWX3A60Sh0HSS4Cszs41wXoY=
MIME-Version: 1.0
Received: by 10.210.125.7 with SMTP id x7mr880100ebc.89.1236961251857; Fri, 13 
	Mar 2009 09:20:51 -0700 (PDT)
In-Reply-To: <20090313160732.GA26615@denix.org>
References: <20090313145610.GA26373@denix.org>
	<018101c9a3f0$7f5b2cd0$5e3018ac@Glamdring>
	<20090313160732.GA26615@denix.org>
Date: Fri, 13 Mar 2009 17:20:51 +0100
Message-ID: <ac9c93b10903130920t14221262y841d9999563bd912@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: PARALLEL_MAKE
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
X-List-Received-Date: Fri, 13 Mar 2009 16:21:13 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

I'm not sure how PARALLEL_MAKE is supposed to work, but I noticed that
often there is a problem because with it a package on which there is a
dependency is build in parallel. Since there is a dependency in a lot
of cases the underlying package fails.

A typical scenario:
a package X depends on perl-native, typically they start to build in
parallel but perl-native does take much longer than X. X requires
perl-native to complete and fails.

Parallelism within a task (e.g. running two compiles in parallel would work).
Parallelism between tasks is tricky although some of them can always
be parallelized (e.g. downloading, unpacking and patching).

Frans


