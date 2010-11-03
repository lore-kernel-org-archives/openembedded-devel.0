Received: from mail-qy0-f182.google.com ([209.85.216.182])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vwyodapink@gmail.com>) id 1PDmts-0004DX-1n
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Nov 2010 00:37:52 +0100
Received: by qyk7 with SMTP id 7so554318qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Nov 2010 16:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=eNscMkGf4uLYY55EnZbGqvraRuZzqbvZro6g2K9cwmM=;
	b=fI/lcEwzBL8F6WahcerwvYG63aqXJqqC+s8V80ql1XO0wCv57SnTtjEpVkOTAaJAw0
	ZU1FwbNS58YNBy6cs3t6HqeLRv3kKiv1RCK31dG2XmYVL6A4SN4K1V8/4pfZw+wZOCHR
	3jV7t2NopocNCPInDCdXO8HCidWYSQQCe9KLc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=oDMptK775hRvD8R/9H0t9F3+TUwj8E/P45SDYBcbI1R0sCM0U4m5x2XJ0K2RYKmzwc
	yxv8DAkUgPj+Z6/tC/RgHbpKTxWPPbV8+YiLYuCr14FThqhUJV7I8q+3hw7dhazTPpSD
	On8QezkQzK1Ox93jBFHXo5Fppmu9BECoYVSGs=
MIME-Version: 1.0
Received: by 10.229.233.20 with SMTP id jw20mr2195763qcb.62.1288827419713;
	Wed, 03 Nov 2010 16:36:59 -0700 (PDT)
Received: by 10.229.8.210 with HTTP; Wed, 3 Nov 2010 16:36:59 -0700 (PDT)
In-Reply-To: <AANLkTim-aV6bGmFZN3sg-w83ji1DGBvKJAh=DabPL-ij@mail.gmail.com>
References: <AANLkTik9vuL4RR0x1mn_dSGXP2r2dn1RrgbOyxqYw+TD@mail.gmail.com>
	<AANLkTim-aV6bGmFZN3sg-w83ji1DGBvKJAh=DabPL-ij@mail.gmail.com>
Date: Wed, 3 Nov 2010 16:36:59 -0700
Message-ID: <AANLkTikOZCR47_Yd6Z7WoPSZZGW_65wTtzpxTPu89D1w@mail.gmail.com>
From: "J. L. " <vwyodapink@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.216.182
X-SA-Exim-Mail-From: vwyodapink@gmail.com
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
X-List-Received-Date: Wed, 03 Nov 2010 23:37:52 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Nov 3, 2010 at 4:24 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Wed, Nov 3, 2010 at 3:55 PM, J. L. <vwyodapink@gmail.com> wrote:
>> I am having an issue of how libtool is building on my machine. I am
>> running Ubuntu 10.10 64bit Kernel 2.6.35-23-generic bitbake 1.10.1
>> overo branch. Here is what happens when building:
>>
>> Error for openldap
>> NOTE: package openldap-2.4.23-r2: task do_configure: Started
>> ERROR: Function do_configure failed
>> NOTE: Task failed: ('function do_configure failed',
>> '/home/vdubhack/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/openldap-2.4.23-r2/temp/log.do_configure.12815')
>> ERROR: Logfile of failure stored in:
>> /home/vdubhack/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/openldap-2.4.23-r2/temp/log.do_configure.12815
>> Log data follows:
>> | cp: cannot stat
>> `/home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/share/libtool/ltmain.sh':
>> No such file or directory
>
> can you add DEPENDS += "libtool" to openldap_2.4.23.bb and retry ?

Still getting this error and I cleaned and rebuilt both recipes

ERROR: Logfile of failure stored in:
/home/vdubhack/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/openldap-2.4.23-r2/temp/log.do_configure.2783
Log data follows:
| cp: cannot stat
`/home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/share/libtool/ltmain.sh':
No such file or directory
| ERROR: Function do_configure failed
NOTE: package openldap-2.4.23-r2: task do_configure: Failed


libtool does not build to this location
/home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/share/libtool/
it builds to here
tmp/sysroots/armv7a-angstrom-linux-gnueabi/home/vdubhack/overo-oe/tmp/sysroots/x86_64-linux/usr/share/libtool/

It seems to put home/vdubhack/overo-oe/tmp the incorrect way. instead
of being in front of the tmp/sysroot like most things

same with aclocal and aclocal-1.11

Thanks

JL
>
>
> -khem
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


