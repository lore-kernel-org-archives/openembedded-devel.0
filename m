Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OvV4M-0008Qu-OJ
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 Sep 2010 14:57:08 +0200
Received: by gxk10 with SMTP id 10so1371976gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Sep 2010 05:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=D6BceAifUeuXHrmiqQvB8zJcZAr1m2/AH7XEAAlK/+c=;
	b=xoRrybgG13LFjcYuRx3eRE3MaSCKafJVciEDxDmoRjtO3ckRO+uQ1nW+UwxPFkdZIO
	FEad+yDYOGOVY804pNNdR35EfPEWbCoeXd/slevQnx+kWa5CzEII9zEkbz1OK1xE2F9k
	1apWggqzcJji7v1BAZUQnoWq6IfM0R/c0RG0E=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=RPSUtziFKoeSUlfHDWCQvVWNobiHI45rORhqabRrH9fgONTMcT0/9X+ub/927tGYus
	xbp0uHQkDCiGZPrPKctOh56N5CqgDB5Setd5ckUG5FRhGB+MaWcKv6vCA+MetrmfFwQC
	oPQfHAVZN+8E4f9e8CDlKHVdDTJBnnAll/H90=
MIME-Version: 1.0
Received: by 10.100.31.14 with SMTP id e14mr2086093ane.46.1284468978324; Tue,
	14 Sep 2010 05:56:18 -0700 (PDT)
Received: by 10.231.205.204 with HTTP; Tue, 14 Sep 2010 05:56:17 -0700 (PDT)
In-Reply-To: <AANLkTikNARJgBSC4m1u0tgjXfHh4VEga2=X9OZPBB1Et@mail.gmail.com>
References: <AANLkTi=6fss18KJvTBYf3oV1MXkgJwT7cqTRz4rK+aTx@mail.gmail.com>
	<4C8F5E55.9010906@balister.org> <4C8F6A6F.4090403@balister.org>
	<AANLkTikNARJgBSC4m1u0tgjXfHh4VEga2=X9OZPBB1Et@mail.gmail.com>
Date: Tue, 14 Sep 2010 14:56:17 +0200
Message-ID: <AANLkTinEdzVgBru=Ui9-MNpaXFD=zGhN6Aek-BM6vAkM@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: testing branch 2010-09-13
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
X-List-Received-Date: Tue, 14 Sep 2010 12:57:08 -0000
Content-Type: text/plain; charset=ISO-8859-1

both slugos/slugos-image and minimal/console-image fail on cairo

checking whether cairo's image surface backend feature could be
enabled... no (requires pixman-1 >= 0.18.4
http://cairographics.org/releases/)

Guess this fix resolves it.
I consider this testing version a fail.

frans


