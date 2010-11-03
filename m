Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PDmiN-0003Za-13
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Nov 2010 00:25:59 +0100
Received: by gyf3 with SMTP id 3so988159gyf.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Nov 2010 16:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=5Sy673ji5HbGvnpFLqbzJhQKRzqoEYQ8SMtk9ywD9qQ=;
	b=a1f15kvX7WFtqdTiejBZB+9XRxtZx08r3v+qzqTH9NvLHiXTgPWV7fyoTKYIILbNxK
	/Ms0VsCFxTwrjMwJXIFHUH91V39H360QN11jiuSSmgi7pcI/zQ9qE2tNl29Q8yzkYBtk
	HlUHjSmY1Oekrgh1g7h6xgsPjLOu+9nw20928=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=rNQ71M5OJIjBCJRXE7R+7apqeieoZm3CTQEfnp9LV4wkORTW0JJPPhl2djH2YR2ExP
	942bJOBNX5UkCPJsM0ZIqbUCUx5yjy3HjEM+o6FYkbs7ilFes87SURQ022uyVhhYdN5f
	Cjf1dsUOxSfpl5kuLqiaYTYjYgQJFlZ18H0TI=
Received: by 10.90.57.2 with SMTP id f2mr205100aga.118.1288826706438; Wed, 03
	Nov 2010 16:25:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.91.135.18 with HTTP; Wed, 3 Nov 2010 16:24:46 -0700 (PDT)
In-Reply-To: <AANLkTik9vuL4RR0x1mn_dSGXP2r2dn1RrgbOyxqYw+TD@mail.gmail.com>
References: <AANLkTik9vuL4RR0x1mn_dSGXP2r2dn1RrgbOyxqYw+TD@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 3 Nov 2010 16:24:46 -0700
Message-ID: <AANLkTim-aV6bGmFZN3sg-w83ji1DGBvKJAh=DabPL-ij@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: problems building openldap and libtool
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
X-List-Received-Date: Wed, 03 Nov 2010 23:25:59 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Nov 3, 2010 at 3:55 PM, J. L. <vwyodapink@gmail.com> wrote:
> I am having an issue of how libtool is building on my machine. I am
> running Ubuntu 10.10 64bit Kernel 2.6.35-23-generic bitbake 1.10.1
> overo branch. Here is what happens when building:
>
> Error for openldap
> NOTE: package openldap-2.4.23-r2: task do_configure: Started
> ERROR: Function do_configure failed
> NOTE: Task failed: ('function do_configure failed',
> '/home/vdubhack/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/openldap-2.4.23-r2/temp/log.do_configure.12815')
> ERROR: Logfile of failure stored in:
> /home/vdubhack/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/openldap-2.4.23-r2/temp/log.do_configure.12815
> Log data follows:
> | cp: cannot stat
> `/home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/share/libtool/ltmain.sh':
> No such file or directory

can you add DEPENDS += "libtool" to openldap_2.4.23.bb and retry ?


-khem


