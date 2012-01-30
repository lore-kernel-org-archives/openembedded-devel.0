Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tworaz666@gmail.com>) id 1Rrxzr-0002c0-4O
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Jan 2012 21:38:39 +0100
Received: by bkaq10 with SMTP id q10so3718890bka.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jan 2012 12:30:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=2xMWbUiBCl3+a7whZqG0F93WFrT/ti/kTFNlfJUKB5w=;
	b=mnthq5wNyDGCyN+SngSF2hP0XpS/xITetPdFOucZiFF9KmN5U7vgJx1QsOWU5Peg2u
	qQOp2ktOorRrRRYiUQjPmtZvinyPVwgcG9uUCIt45JpQ/jo9Daap+wRUzfxJdHHkcsya
	i+MRWq91iC4b/ZJIv4wtWgpLCxf4O9CYIno+0=
Received: by 10.204.152.141 with SMTP id g13mr7128912bkw.48.1327955446383;
	Mon, 30 Jan 2012 12:30:46 -0800 (PST)
Received: from [192.168.0.10] (89-77-50-243.dynamic.chello.pl. [89.77.50.243])
	by mx.google.com with ESMTPS id
	x20sm24809868bka.9.2012.01.30.12.30.45 (version=SSLv3 cipher=OTHER);
	Mon, 30 Jan 2012 12:30:45 -0800 (PST)
Message-ID: <4F26FD7E.5040908@gmail.com>
Date: Mon, 30 Jan 2012 21:28:46 +0100
From: Peter Tworek <tworaz666@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:9.0) Gecko/20120112 Thunderbird/9.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1327952855-28040-1-git-send-email-tworaz666@gmail.com>
	<jg6sti$vjj$1@dough.gmane.org>
In-Reply-To: <jg6sti$vjj$1@dough.gmane.org>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [meta-oe][PATCH 3/3] pidgin: Add gconf to RDEPENDS for libpurple.
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
X-List-Received-Date: Mon, 30 Jan 2012 20:38:39 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/30/2012 09:00 PM, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Op 30-01-12 20:47, Peter Tworek schreef:
>> Without it postinst script for libpurple fails when gconf is not
>> installed: //var/lib/opkg/info/libpurple.postinst: line 8: gconftool-2:
>> command not found
> Why is gconf.bbclass failing to do that?
As far as I understand it only adds gconf to DEPENDS. If a package 
contents are not linked with libgconf-2 (libpurple only needs 
gconftool-2) gconf won't be pulled in as a runtime dependency.

> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.11 (Darwin)
> Comment: GPGTools - http://gpgtools.org
>
> iEYEARECAAYFAk8m9u8ACgkQMkyGM64RGpGRTQCgrzWdMpyRtNE3kO2CKw6b7haa
> j5UAoJ2NPDIIlCsRwYOJSTGTWd2i/hj0
> =axku
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



