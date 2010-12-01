Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1PNlv9-0000SK-Kr
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Dec 2010 13:36:28 +0100
Received: by wyb40 with SMTP id 40so7000524wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Dec 2010 04:35:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=0Ryqjy4BWDtsIuHPTjUBkXyBIJgWegZRZ22zMdDcyl0=;
	b=Uce7SEizZkmwYEQ5PI1RiOnZqDAD3/m1HE59oTKnEcmD7rP61VrdqeknOhWdiBmXof
	JYOgjfla2065xu8Xeh81hQbwQyrV0kvx1+Ko4jebG/v8PL7oao6VFUJFNi+OhhNoBzU6
	nEpYE4sBt1OCiINglxUlnQeX/WSG6JfxuNRu8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=MJgp6ObtFHebdCwG2SbvwekfNfVVqLAXmTXHnkphat0dXeioef1EL5AQYpLqIkxJVL
	K6qizsN3zkwG7iHUW7QwAWPCZMlUCpvtMTp1536SHO8z4oBunaDNcKGs12fguMMbj0Uy
	qQPG9IaXbLbrvb8DBQGAWITmDsL5qdrAKNVeg=
MIME-Version: 1.0
Received: by 10.216.164.66 with SMTP id b44mr1815935wel.85.1291206904047; Wed,
	01 Dec 2010 04:35:04 -0800 (PST)
Received: by 10.216.49.130 with HTTP; Wed, 1 Dec 2010 04:35:02 -0800 (PST)
In-Reply-To: <4CF63A8C.1040502@xora.org.uk>
References: <1290768432-13366-1-git-send-email-ynezz@true.cz>
	<AANLkTi=SB9wuO4wcTXz3M5fYb2WyO09_pK3ooA+i4xgo@mail.gmail.com>
	<ico56o$f8$2@dough.gmane.org>
	<20101127140200.GH10755@ibawizard.net>
	<AANLkTi=kAyxY9i+_c-6UoeEp6ZjUf91m3z3UE272ibVu@mail.gmail.com>
	<AANLkTinrTnrTXsLVFFxpnUWt1ivwn_V2xS=V8dsej97u@mail.gmail.com>
	<4CF6346B.2060407@opensimpad.org>
	<20101201115806.GQ10755@ibawizard.net>
	<4CF63A8C.1040502@xora.org.uk>
Date: Wed, 1 Dec 2010 13:35:02 +0100
Message-ID: <AANLkTikSTUht-q5KgZXGuPYv91iXu7Q8Ls7f0OD2cek6@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: andrea.adami@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] angstrom-2008.1: bump uclibc to 0.9.30.3 which unbreaks x264
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
X-List-Received-Date: Wed, 01 Dec 2010 12:36:28 -0000
Content-Type: text/plain; charset=ISO-8859-1

>>> This is true. We could add some python foo and check for angstrom? In my
>>> opinion the log2f patch is of no real harm. The tls support might be a
>>> problem.

About the tls:

http://bugs.gentoo.org/204102

... in e2fsprogs-1.40.4 the way uuids are generated has changed
(http://e2fsprogs.sourceforge.net/e2fsprogs-release.html#1.40.4).
e2fsprogs-1.40.3 works fine!

Perhaps Angstrom-2008.1 could pin 1.40.3

Andrea


