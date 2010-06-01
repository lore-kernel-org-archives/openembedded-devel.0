Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OJQxV-0002BO-Lc
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Jun 2010 14:52:43 +0200
Received: by fxm9 with SMTP id 9so18707fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Jun 2010 05:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=F8JHlyEfj0J4lJR2yscfixrWWwPtizTLbUMihGu0HTs=;
	b=kvL3dv4FALARS3lMUXm5B2Tku8h1UMdzU5wTGBxunM+NvrAkCKeNiMVI4E9RNHgcfm
	a5fo5+iUooM2qSEr33bMUGvjtDAKuhatVKycbZphaQap0qEWYFtZsI3wpCu9cZJp0uCR
	YTjC2cY5XfGyE6x31Q8GFTwtxdMNuPXzXv+wQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	b=mWoY0mHurw4paXRgwzZLMYfoQYzIKbEC4Hhi2brTrs4HrM9NQehGcaIYXZP0LaHNL3
	dYQ4rFtL4/ZNd9QUjX4dmtbK/pjeVkJjA1rtYzvVNJdK2DtQL4ttQ1Y3FRcxoytupN6u
	Zset4vzq8B7pAes/1pljUtqaWYpPEJCHdfX3c=
Received: by 10.223.67.144 with SMTP id r16mr6975050fai.102.1275396505427;
	Tue, 01 Jun 2010 05:48:25 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id g10sm47013990fai.0.2010.06.01.05.48.24
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 01 Jun 2010 05:48:24 -0700 (PDT)
Date: Tue, 1 Jun 2010 14:48:20 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100601124820.GD5446@jama>
References: <76E258664B189C4CBEF125491CA11ECC9445E0CF7C@KCINPUNHJCMS01.kpit.com>
	<76E258664B189C4CBEF125491CA11ECC9445E0CF7D@KCINPUNHJCMS01.kpit.com>
	<20100601123346.GC5446@jama>
	<1275395992.6382.176.camel@mill.internal.reciva.com>
MIME-Version: 1.0
In-Reply-To: <1275395992.6382.176.camel@mill.internal.reciva.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: glibc_2.9.bb do_package failed
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
X-List-Received-Date: Tue, 01 Jun 2010 12:52:43 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 01, 2010 at 01:39:52PM +0100, Phil Blundell wrote:
> On Tue, 2010-06-01 at 14:33 +0200, Martin Jansa wrote:
> > On Tue, Jun 01, 2010 at 05:35:03PM +0530, Soumya R wrote:
> > > qemu-arm: relocation error: qemu-arm: symbol fcntl, version GLIBC_2.0=
 not defined in file libpthread.so.0 with link time reference
> > > NOTE: Task failed: localedef returned an error (command was PATH=3D"/=
home/likewise-open/KPIT/soumyar/oe/build/tmp/sysroots/i686-linux/usr/bin/ar=
mv5te-angstrom-linux-gnueabi:/home/likewise-open/KPIT/soumyar/oe/build/tmp/=
sysroots/i686-linux/usr/bin/armv5te-angstrom-linux-gnueabi:/home/likewise-o=
pen/KPIT/soumyar/oe/build/tmp/sysroots/i686-linux/usr/sbin:/home/likewise-o=
pen/KPIT/soumyar/oe/build/tmp/sysroots/i686-linux/usr/bin:/home/likewise-op=
en/KPIT/soumyar/oe/build/tmp/cross/armv5te//bin:/home/likewise-open/KPIT/so=
umyar/oe/build/tmp/sysroots/i686-linux/sbin:/home/likewise-open/KPIT/soumya=
r/oe/build/tmp/sysroots/i686-linux/bin:/likewise-open/KPIT/soumyar/oe/bitba=
ke/bin:/likewise-open/KPIT/soumyar/oe/bitbake/bin:/likewise-open/KPIT/soumy=
ar/oe/bitbake/bin:/home/likewise-open/KPIT/soumyar/bin:/usr/local/sbin:/usr=
/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games" I18NPATH=3D"/home/like=
wise-open/KPIT/soumyar/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/gli=
bc-2.9-r36.3/locale-t
>  ree/
> > >  usr/share/i18n" qemu-arm -s 1048576 -r 2.6.24 -L /home/likewise-open=
/KPIT/soumyar/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-r3=
6.3/locale-tree -E LD_LIBRARY_PATH=3D/home/likewise-open/KPIT/soumyar/oe/bu=
ild/tmp/work/armv5te-angstrom-linux-gnueabi/glibc-2.9-r36.3/locale-tree/lib=
  /home/likewise-open/KPIT/soumyar/oe/build/tmp/work/armv5te-angstrom-linux=
-gnueabi/glibc-2.9-r36.3/locale-tree/bin/localedef --force --old-style --no=
-archive --prefix=3D/home/likewise-open/KPIT/soumyar/oe/build/tmp/work/armv=
5te-angstrom-linux-gnueabi/glibc-2.9-r36.3/locale-tree --inputfile=3D/usr/s=
hare/i18n/locales/es_NI --charmap=3DUTF-8 es_NI).
> >
> > Are you using latest qemu-native from OE? Otherwise you still need 0 in=
 mmap_min_addr.
> >=20
> > Try to run that command by hand in console to see if it's the same issu=
e.
>=20
> This doesn't look like an mmap_min_addr kind of problem.  It seems like
> there is some mismatch between the version of libpthread that qemu was
> compiled against and the one that it is running against.  The only
> obvious cause that springs to mind would be if you were sharing the
> build tree between multiple hosts, and the host where qemu was compiled
> is not the same as the one where it's trying to run.

Ah, you're right, I apologize. I overlooked first line about fcntl.

--=20
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr=20
JaMa                        =20


