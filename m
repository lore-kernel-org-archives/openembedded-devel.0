Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>)
	id 1POuYe-0005Wh-9c; Sat, 04 Dec 2010 17:01:57 +0100
Received: by gyd12 with SMTP id 12so5411482gyd.6
	for <multiple recipients>; Sat, 04 Dec 2010 08:00:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:cc:content-type;
	bh=EIuC2dt06Y3mMzvrfCMi1bIYcXKzQ5Lh7SM1JLDbgb4=;
	b=APjvZQIyjmwZFMa9pppNelVXXuHXNtvMjM87WVq84OLWIR3PlYxpR2/CpGKA8gYd62
	jfvOx0U7NmNz7enkMXIqgT/+QyKsBIGBwxSjhJ/tcaMJSentPkIPJYwRYt6gkOJvp+9R
	Cql7Wl1VK42HCCnRWnWiQ70GP/IAlgwyffAW4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	b=se9AkLAydPDFvrVW18KuFZU/nsNJz27RkalIVpVYXMwEMIkxjGhBO8DZdM2v7HwYZf
	AT6WsmDxf2Ig/FeidtP5bg/c1Z4KxXbZZUgDpjxrSymrt1MgV6bb4c5Sw5LA2LDT8PZY
	v3qKP5eZctuVfree5A3X5UG4Srm/rugZLLdz8=
Received: by 10.90.31.16 with SMTP id e16mr5083177age.21.1291478430379; Sat,
	04 Dec 2010 08:00:30 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.120.8 with HTTP; Sat, 4 Dec 2010 08:00:10 -0800 (PST)
In-Reply-To: <AANLkTinu8LHgHVr58VjZmfvv2p1m4HsDMJ81Phzh8XGr@mail.gmail.com>
References: <AANLkTinu8LHgHVr58VjZmfvv2p1m4HsDMJ81Phzh8XGr@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 4 Dec 2010 08:00:10 -0800
Message-ID: <AANLkTikmKv3GmnPgMQGD8ynwyn=JD2EVZtFGzybnxkPv@mail.gmail.com>
To: Sathishkumar Duraisamy <flowerslab@gmail.com>
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembeded-users <Openembedded-users@lists.openembedded.org>,
	openembeded-devel <Openembedded-devel@lists.openembedded.org>
Subject: Re: [Openembedded-users] package glibc-2.9-r37.4: task do_package: Failed
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
X-List-Received-Date: Sat, 04 Dec 2010 16:01:57 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Dec 3, 2010 at 8:50 PM, Sathishkumar Duraisamy
<flowerslab@gmail.com> wrote:
> Hi all,
> I have been trying to build base-image using angstrom distribution. The
> package glibc is failed. I have attached the log using "tee" command.


qemu-arm: relocation error: qemu-arm: symbol sigprocmask, version
GLIBC_2.0 not defined in file libc.so.6 with link time reference

what distro are you using on the build host. It seems that qemu did
not build properly on your host.
are you using qemu-native ? if not try that if you were using
qemu-native then try to find out how it was linked from
the build logs

alternatively you can disable locale generation if not needed and you
wll bypass this issue.
> With Thanks
> Sathishkumar
> _______________________________________________
> Openembedded-users mailing list
> Openembedded-users@linuxtogo.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-users
>
>


