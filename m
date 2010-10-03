Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1P2VSr-0005jD-4I
	for openembedded-devel@lists.openembedded.org;
	Sun, 03 Oct 2010 22:47:26 +0200
Received: by iwn2 with SMTP id 2so6061217iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 03 Oct 2010 13:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=qnvp0BKt9qJBRkCDzz+LbY93R01pWOWLspzwn6kPuyM=;
	b=Zfk/KBnmmRDlQ41FPyuSoehEwbL8g2zd5mRDWcgZ9zk5HNNlpAyYNepf08rNQ9JBB9
	PRSe2NqhrDNs1POMevHCidEop65rFv15TKhajxBqG32NFzDv3t+kWHpyMcjmTGdo7LJx
	wgspX46LpO3TDJXEVQmQNWt4n/3c6beHBKf2E=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=pHcIRNb73EYcSpQZ3Y31Yd/xb4DZgkiQ9FItVhG8zBfrF/1pRIWffZp7H5uykiRNhI
	bVfIuSOjuP7o5AF/KibFmW6nBJnV2W84y1pTSQcf8UUFO5qVA5ZCWzPCHWnaZm3D81bf
	oLNL4dzrIHoiLXFgfmz+NuqBIJBE2FdKT1gGg=
Received: by 10.231.33.73 with SMTP id g9mr9010940ibd.117.1286138823906; Sun,
	03 Oct 2010 13:47:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.199.1 with HTTP; Sun, 3 Oct 2010 13:46:41 -0700 (PDT)
In-Reply-To: <i89bro$g4g$2@dough.gmane.org>
References: <4CA719E0.7050409@freyther.de> <i89b3v$g4g$1@dough.gmane.org>
	<4CA83188.7010203@freyther.de> <i89bro$g4g$2@dough.gmane.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 3 Oct 2010 13:46:41 -0700
Message-ID: <AANLkTi=Bv3pZwMwJ20MNipgMtW7S4rb=r+zxPqc9NGDQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: RPATH in many modules
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
X-List-Received-Date: Sun, 03 Oct 2010 20:47:29 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Oct 3, 2010 at 12:37 AM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 03-10-10 09:32, Holger Freyther wrote:
>> On 10/03/2010 03:24 PM, Koen Kooi wrote:
>>
>>> Could you fix the patch to say to which (wrong) sysroot it points to?
>>>
>>> MACHINE=beagleboard bitbake libcdio
>>>
>>> rpath -> sysroots/x86 or rpath -> sysroots/armv7a or both?
>>
>> ERROR: QA Issue with libgettextlib: package libgettextlib contains bad RPATH
>> /home/ich/build/arm/xscale/tmp/sysroots/armv5te-angstrom-linux-gnueabi/usr/lib
>> in file
>> /home/ich/build/arm/xscale/tmp/work/armv5te-angstrom-linux-gnueabi/gettext-0.18-r3/packages-split/libgettextlib/usr/lib/libgettextlib-0.18.so
>>
>> Can you propose a better wording? From the above I try to indicate that
>> /home/ich/build/arm/xscale/tmp/sysroots/armv5te-angstrom-linux-gnueabi/usr/lib
>> is the bad RPATH and that it is inside the libgettextlib-0.18.so
>
> "Target libs and apps contain a bad RPATH to the target sysroot e.g.
> /tmp/sysroots/armv5te-angstrom-linux-gnueabi/usr/lib" ?

I am working on libtool 2.4 upgrade which has sysroot support. I am
hoping it will help us in fixing this kind
of problems.

>
>>> When we last tried chrpath didn't work in cross mode :(
>>
>> hmm... maybe it is something simple... :}
>
> I certainly hope so!
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFMqDK4MkyGM64RGpERAntvAJ4ra8cYKuiT/QrkcB/5Jb2EHzPkZwCgq1/8
> q4Hur7dh657M+0YRlRxSnRo=
> =CytO
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


