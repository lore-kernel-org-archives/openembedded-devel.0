Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PXht7-0004bm-KJ
	for openembedded-devel@lists.openembedded.org;
	Tue, 28 Dec 2010 23:19:25 +0100
Received: by iyj18 with SMTP id 18so8931329iyj.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Dec 2010 14:19:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=0IP58RQAFU2ninSZ3ZQYmSYzb45A5qNvuENSSziEPTE=;
	b=uQIIQle8anA+FqfvRMcO1SPRIAA2UA9TA84AV0YX9a0IM1gu36WW03vhSQr6YP8lHL
	zlNB3TOMguWCy+cl2d5oqDqMYNb0twUv1sbSFGTin9/J+fsQynAdTEKLzIQzXHU88MDX
	6E+khGivX5IBXWpIcYD/GAUPQeKkpAi0pCwfQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=QWV1Xj53VGFXKAcKAVN2lIotlXDTWvVwN9JPrLkhF2vJzz7R7SdzKqkvbyPEmXQi3r
	InKxA6T9585n5Szz7xXv3+0aAHzX3I2NqrwXT86UwuogZ8k0vIT65b/y5M67yNa1JwLW
	l/QHPsQcPm9Feg0BtDQurRSvPKH6S8RbxNSXc=
MIME-Version: 1.0
Received: by 10.231.37.136 with SMTP id x8mr13806476ibd.132.1293574749702;
	Tue, 28 Dec 2010 14:19:09 -0800 (PST)
Received: by 10.231.200.140 with HTTP; Tue, 28 Dec 2010 14:19:09 -0800 (PST)
In-Reply-To: <AANLkTinj-pWTJfLqszpHVkN29McgpZ1Lidg8n-+V7RYo@mail.gmail.com>
References: <1293469867-18737-1-git-send-email-fransmeulenbroeks@gmail.com>
	<201012272236.01404.roman@khimov.ru>
	<AANLkTi=P_dKFv4JiyU8_g_EoLK_Zn+HvNtVfUEccTA56@mail.gmail.com>
	<201012282200.18012.roman@khimov.ru>
	<AANLkTinj-pWTJfLqszpHVkN29McgpZ1Lidg8n-+V7RYo@mail.gmail.com>
Date: Tue, 28 Dec 2010 23:19:09 +0100
Message-ID: <AANLkTikKLawM78rC4mc2B4M2S2N1+eqa-9Tp9TS1M__5@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH v3] cpan_build.bbclass; added cc and ld flags to the perl Build.PL invocation
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
X-List-Received-Date: Tue, 28 Dec 2010 22:19:25 -0000
Content-Type: text/plain; charset=KOI8-R

One more test result.

After Roman pushed his patches, I tried again.
It seems the proper compiler is invoked, but  this time I get a compiler error:

| arm-oe-linux-gnueabi-gcc -march=armv5te -mtune=arm926ej-s
-mthumb-interwork -mthumb -Ic -I/usr/lib/perl/5.10/CORE
-DXS_VERSION="0.61" -DVERSION="0.61" -fPIC -c
-isystem/home/frans/oe/tmp_minimal/sysroots/armv5te-oe-linux-gnueabi/usr/include
-fexpensive-optimizations -fomit-frame-pointer -frename-registers -O1
-DDEBIAN -D_REENTRANT -D_GNU_SOURCE -DTHREADS_HAVE_PIDS
-fno-strict-aliasing -pipe -O2 -o lib/DateTime.o lib/DateTime.c
| lib/DateTime.xs:7:20: fatal error: EXTERN.h: No such file or directory


Too late to investigate this now.

Frans


