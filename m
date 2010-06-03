Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OK2lw-0004MX-F2
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 Jun 2010 07:15:17 +0200
Received: by iwn9 with SMTP id 9so1441866iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 Jun 2010 22:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=72ViNmzzIRVyOmVOTZgBui5qyMNQ3C6QJUZUMSt7lD8=;
	b=HIF5lbww0V+BxI20XaBiXRnw4LCWh18hg+IyjKrpwkSuTamC5L0ypcJHYpzK6LNZUJ
	yzmA/DYzwYln8N44UbIdNDnp49giYnTBe6bk7QPRrYbTlFuBWF9M4Zhxao4WqoC+erqv
	zP4U2jFo2Dy+Z9CvF/rgLHxeuSGsMdlNAdpv8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=AvzEtJCw4b0n9tArbxBcpnvRcH3yuVSz/0HHE4BBn41dgYpPzrwHl7Jn9+gE3RCj2a
	d+7kh/VMOTmLT9QkYq4EY5VUwjjuYIe2jAJ0R2F2gRKg4iUjFXycAUmaBCslr49A3KTK
	IdBiwNSptaqAsuWGEObkLzNHhfVjtEczo+rok=
Received: by 10.231.185.6 with SMTP id cm6mr11183044ibb.72.1275541862368; Wed, 
	02 Jun 2010 22:11:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.10.202 with HTTP; Wed, 2 Jun 2010 22:10:42 -0700 (PDT)
In-Reply-To: <76E258664B189C4CBEF125491CA11ECC9445E0CF88@KCINPUNHJCMS01.kpit.com>
References: <76E258664B189C4CBEF125491CA11ECC9445E0CF85@KCINPUNHJCMS01.kpit.com>
	<AEB54AFF070EB34A921BC7E006B711BE11905D1147@SRV10.nortechonline.net> 
	<76E258664B189C4CBEF125491CA11ECC9445E0CF88@KCINPUNHJCMS01.kpit.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 2 Jun 2010 22:10:42 -0700
Message-ID: <AANLkTinJcbZ3ApaSpSvsrte40TWF8f5Rz3NIIXX8ZhCR@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS,
	WEIRD_PORT autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: (No subject)
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
X-List-Received-Date: Thu, 03 Jun 2010 05:15:17 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 2, 2010 at 7:37 PM, Soumya R <Soumya.R@kpitcummins.com> wrote:
> Ya you are right i am using Ubuntu 10.4..
> Thanks a lot for the reply it worked..
>
> Thank you so much:-)

are you using .dev ?. I don't see this issue here locally on ubuntu
10.04. whats your distro
and machine.it could be issue in ipkg-utils-native

Thx
-Khem

> home/likewise-open/KPIT/soumyar/oe/build/tmp/sysroots/i686-linux/usr/bin/=
arfile.py
>
> Change the line:
> size =3D int(descriptor[5])
>
> To:
> size =3D int(descriptor[3])
>
> I'm afraid I can't explain why you need to do this, only that it works fo=
r me.
>
> Simon
>
> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembed=
ded-devel-bounces@lists.openembedded.org] On Behalf Of Soumya R
> Sent: 02 June 2010 10:20
> To: openembedded-devel@lists.openembedded.org
> Cc: angstrom-distro-devel@linuxtogo.org
> Subject: [oe] (no subject)
>
> Hi All,
>
> =A0 I am running bibake micro-image i got the following error,
>
> NOTE: Running task 965 of 970 (ID: 93, /home/likewise-open/KPIT/soumyar/o=
e/openembedded/recipes/mtd/mtd-utils-native_1.3.1.bb, do_package_write)
> NOTE: Running task 966 of 970 (ID: 18, /home/likewise-open/KPIT/soumyar/o=
e/openembedded/recipes/images/micro-image.bb, do_package_update_index_ipk)
> ERROR: function do_package_update_index_ipk failed
> ERROR: log data follows (/home/likewise-open/KPIT/soumyar/oe/build/tmp/wo=
rk/at91sam9263ek-angstrom-linux-gnueabi/micro-image-1.0-r0/temp/log.do_pack=
age_update_index_ipk.24831)
> | + ipkgarchs=3D'all any noarch arm =A0armv4 armv4t armv5te at91sam9263ek=
'
> | + '[' '!' -z '' ']'
> | + mkdir -p /home/likewise-open/KPIT/soumyar/oe/build/tmp/deploy/glibc/i=
pk
> | + touch /home/likewise-open/KPIT/soumyar/oe/build/tmp/deploy/glibc/ipk/=
Packages
> | + ipkg-make-index -r /home/likewise-open/KPIT/soumyar/oe/build/tmp/depl=
oy/glibc/ipk/Packages -p /home/likewise-open/KPIT/soumyar/oe/build/tmp/depl=
oy/glibc/ipk/Packages -l /home/likewise-open/KPIT/soumyar/oe/build/tmp/depl=
oy/glibc/ipk/Packages.filelist -m /home/likewise-open/KPIT/soumyar/oe/build=
/tmp/deploy/glibc/ipk
> | /home/likewise-open/KPIT/soumyar/oe/build/tmp/sysroots/i686-linux/usr/b=
in/ipkg.py:39: DeprecationWarning: the md5 module is deprecated; use hashli=
b instead
> | =A0 import md5
> |
> | + for arch in '$ipkgarchs'
> | + '[' -e /home/likewise-open/KPIT/soumyar/oe/build/tmp/deploy/glibc/ipk=
/all/ ']'
> | + touch /home/likewise-open/KPIT/soumyar/oe/build/tmp/deploy/glibc/ipk/=
all/Packages
> | + ipkg-make-index -r /home/likewise-open/KPIT/soumyar/oe/build/tmp/depl=
oy/glibc/ipk/all/Packages -p /home/likewise-open/KPIT/soumyar/oe/build/tmp/=
deploy/glibc/ipk/all/Packages -l /home/likewise-open/KPIT/soumyar/oe/build/=
tmp/deploy/glibc/ipk/all/Packages.filelist -m /home/likewise-open/KPIT/soum=
yar/oe/build/tmp/deploy/glibc/ipk/all/
> | /home/likewise-open/KPIT/soumyar/oe/build/tmp/sysroots/i686-linux/usr/b=
in/ipkg.py:39: DeprecationWarning: the md5 module is deprecated; use hashli=
b instead
> | =A0 import md5
> | Traceback (most recent call last):
> | =A0 File "/home/likewise-open/KPIT/soumyar/oe/build/tmp/sysroots/i686-l=
inux/usr/bin/ipkg-make-index", line 114, in <module>
> | =A0 =A0 pkg =3D ipkg.Package(filename)
> | =A0 File "/home/likewise-open/KPIT/soumyar/oe/build/tmp/sysroots/i686-l=
inux/usr/bin/ipkg.py", line 161, in __init__
> | =A0 =A0 tarStream =3D ar.open("control.tar.gz")
> | =A0 File "/home/likewise-open/KPIT/soumyar/oe/build/tmp/sysroots/i686-l=
inux/usr/bin/arfile.py", line 59, in open
> | =A0 =A0 f =3D self._scan(fname)
> | =A0 File "/home/likewise-open/KPIT/soumyar/oe/build/tmp/sysroots/i686-l=
inux/usr/bin/arfile.py", line 79, in _scan
> | =A0 =A0 size =3D int(descriptor[5])
> | IndexError: list index out of range
> NOTE: Task failed: /home/likewise-open/KPIT/soumyar/oe/build/tmp/work/at9=
1sam9263ek-angstrom-linux-gnueabi/micro-image-1.0-r0/temp/log.do_package_up=
date_index_ipk.24831
> ERROR: TaskFailed event exception, aborting
> ERROR: Build of /home/likewise-open/KPIT/soumyar/oe/openembedded/recipes/=
images/micro-image.bb do_package_update_index_ipk failed
> NOTE: Running task 967 of 970 (ID: 95, /home/likewise-open/KPIT/soumyar/o=
e/openembedded/recipes/mtd/mtd-utils-native_1.3.1.bb, do_package_stage)
> ERROR: Task 18 (/home/likewise-open/KPIT/soumyar/oe/openembedded/recipes/=
images/micro-image.bb, do_package_update_index_ipk) failed
> NOTE: Waiting for 1 active tasks to finish
> NOTE: 1: /home/likewise-open/KPIT/soumyar/oe/openembedded/recipes/mtd/mtd=
-utils-native_1.3.1.bb, do_package_stage (24841)
> NOTE: Tasks Summary: Attempted 965 tasks of which 927 didn't need to be r=
erun and 1 failed.
> ERROR: '/home/likewise-open/KPIT/soumyar/oe/openembedded/recipes/images/m=
icro-image.bb' failed
> KPIT\soumyar@d-5289lnx:~/oe/build$
>
> =A0 Anybody can help me out to resolve this.Any suggestions are welcome:-=
)
>
> Thanks in advance:-)
>
> Regards,
> Soumya
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


