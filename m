Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <d.moussaud@gmail.com>) id 1OBjiH-0007GY-7T
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 May 2010 09:17:36 +0200
Received: by fxm11 with SMTP id 11so3187859fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 May 2010 00:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=Wcr49Bh7gemz7VzRk2onMz0M+0dHlBziB7PE7XpBkE4=;
	b=XcLTFgBqI6ZPeSy1EQ/CwkgDKe6NndcXylRc9SUdz678tKIecV57/5Ml65PSsPXZCo
	5ZxCJhvX9gNB3ASPLmRgrFzUI4xQvoqUmWysNjX2qHOc9gwRti89YN2X1YTzHaZ6nSon
	ZVk4ixpJDQu2al968aw+l+CJUcI3ADmJGyE6s=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=mVCYjbDv+w+q1GkZWfPtVFY2iwJ2C9wAeYZdcMUmc+GqXX0UGWNTjqNn48h5HM3eqj
	c3YdUkyiDRk6QXH2+UgiUx1DWZDrWSXpbBbdk+b4m7QaOyVD9KqSTBtA9YIsWOmY18AT
	iHI09J+UKOZnANGEUVoqvkinA3/5kam5sCSBE=
Received: by 10.204.84.83 with SMTP id i19mr77459bkl.175.1273561996106; Tue, 
	11 May 2010 00:13:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.204.65.66 with HTTP; Tue, 11 May 2010 00:12:56 -0700 (PDT)
In-Reply-To: <20100510165817.GB2845@denix.org>
References: <AANLkTikMZbhHtXqXqfLBSO0GY6Z6Tt8QuJPUMMBucAS_@mail.gmail.com> 
	<20100510165817.GB2845@denix.org>
From: David MOUSSAUD <d.moussaud@gmail.com>
Date: Tue, 11 May 2010 09:12:56 +0200
Message-ID: <AANLkTimBUUydUVoJUrBj148MVqz6mXSiHSDVRLt-AE18@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: d.moussaud@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: problem using meta-toolchain.bb and external-toolchain-generic.bb
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
X-List-Received-Date: Tue, 11 May 2010 07:17:38 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, May 10, 2010 at 6:58 PM, Denys Dmytriyenko <denis@denix.org> wrote:
>
> On Mon, May 10, 2010 at 11:14:14AM +0200, David MOUSSAUD wrote:
> > Hi all,
> >
> > I'm trying to use an external toolchain with OE.
> > So I've build one using the recipe meta-toolchain.bb with an angstrom
> > distribution. I'm on the org.openembedded.dev branch (updated
> > recently).
> > I've extracted the 2 tar.gz provided in my root directory. So I have a
> > nice /usr/local/angstrom layout with my pre-built toochain.
> >
> > Then I have changed my distro.conf file setting that 2 parameter:
> >
> > # Set the toolchain type (internal, external) and brand (generic, csl etc.)
> > TOOLCHAIN_TYPE ?= "external"
> > TOOLCHAIN_BRAND ?= "generic"
> >
> > I've cleaned my build/tmp directory.
> >
> > Finally I've tried to build a minimalist image. Everything goes fine,
> > the toolchain is found by OE but it fails when it tries to create the
> > filesystem.
> > Here is the following log file : http://pastebin.com/YZmuzmtx
> >
> > I can not understand what to do to tell OE how it could find the glibc !?
> >
> > Thanks in advance for your tips and suggestions,
>
> You are missing the IPKs from the second -extras.tar.gz file, which should go
> into /usr/local/angstrom/ipk and get copied to the deploy directory by
> external toolchain recipe. Check that you extracted it properly or that the
> -extras.tar.gz tarball actually contain those IPKs...

Those ipk are well in the directory ${DEPLOY_DIR}/glibc/ipk :

#ll /home/enove/svn/Sources/trunk/ES/07-Infrastructure/build-platform/tmp/deploy/glibc/ipk/
(aton-pccar is my MACHINE_NAME)

drwxr-xr-x 2 enove enove    4096 2010-05-11 08:50 all
drwxr-xr-x 2 enove enove   20480 2010-05-11 08:50 aton-pccar
-rw-r--r-- 1 enove enove  398902 2010-05-05 19:17 glibc-dbg_2.9-r36.3.5_i686.ipk
-rw-r--r-- 1 enove enove   43462 2010-05-05 19:17
glibc-extra-nss_2.9-r36.3.5_i686.ipk
-rw-r--r-- 1 enove enove  149678 2010-05-05 19:17
glibc-utils_2.9-r36.3.5_i686.ipk
drwxr-xr-x 2 enove enove   20480 2010-05-11 08:50 i686
drwxr-xr-x 2 enove enove    4096 2010-05-11 08:50 i686-i686-sdk
-rw-r--r-- 1 enove enove 1309462 2010-05-05 19:17 libc6_2.9-r36.3.5_i686.ipk
-rw-r--r-- 1 enove enove 1679898 2010-05-05 19:17 libc6-dev_2.9-r36.3.5_i686.ipk
-rw-r--r-- 1 enove enove   20662 2010-05-05 19:17 libgcc1_4.3.3-r11.1.5_i686.ipk
-rw-r--r-- 1 enove enove  127740 2010-05-05 19:17 libgmp3_4.2.4-r0.5.5_i686.ipk
-rw-r--r-- 1 enove enove   18528 2010-05-05 19:17
libgmp-dev_4.2.4-r0.5.5_i686.ipk
-rw-r--r-- 1 enove enove  138092 2010-05-05 19:17 libmpfr1_2.3.1-r1.5_i686.ipk
-rw-r--r-- 1 enove enove    9378 2010-05-05 19:17
libmpfr-dev_2.3.1-r1.5_i686.ipk
-rw-r--r-- 1 enove enove    6750 2010-05-05 19:17
libsegfault_2.9-r36.3.5_i686.ipk
-rw-r--r-- 1 enove enove  249766 2010-05-05 19:17
libstdc++6_4.3.3-r11.1.5_i686.ipk
-rw-r--r-- 1 enove enove 2819424 2010-05-05 19:17
libstdc++-dev_4.3.3-r11.1.5_i686.ipk
-rw-r--r-- 1 enove enove   12480 2010-05-05 19:17
libthread-db1_2.9-r36.3.5_i686.ipk
-rw-r--r-- 1 enove enove     772 2010-05-05 19:17
linux-libc-headers-dbg_2.6.31-r4.5_i686.ipk
-rw-r--r-- 1 enove enove  736160 2010-05-05 19:17
linux-libc-headers-dev_2.6.31-r4.5_i686.ipk
-rw-r--r-- 1 enove enove   31627 2010-05-11 08:50 Packages
-rw-r--r-- 1 enove enove       0 2010-05-11 08:50 Packages.filelist
-rw-r--r-- 1 enove enove    4223 2010-05-11 08:50 Packages.gz
-rw-r--r-- 1 enove enove     888 2010-05-11 08:50 Packages.stamps
-rw-r--r-- 1 enove enove     778 2010-05-05 19:17
task-sdk-bare_1.0-r1.5_i686.ipk
-rw-r--r-- 1 enove enove    2606 2010-05-05 19:17 update-rc.d_0.7-r1.5_all.ipk
-rw-r--r-- 1 enove enove     720 2010-05-05 19:17
update-rc.d-dbg_0.7-r1.5_all.ipk
-rw-r--r-- 1 enove enove     722 2010-05-05 19:17
update-rc.d-dev_0.7-r1.5_all.ipk

Maybe it is my opkg.conf file that is wrong. here is its content :

#cat /home/enove/svn/Sources/trunk/ES/07-Infrastructure/build-platform/tmp/staging/i686-linux/etc/opkg.conf

src oe file:/home/enove/svn/Sources/trunk/ES/07-Infrastructure/build-platform/tmp/deploy/glibc/ipk
arch all 1
src oe-all file:/home/enove/svn/Sources/trunk/ES/07-Infrastructure/build-platform/tmp/deploy/glibc/ipk/all
arch any 6
arch noarch 11
arch i686 16
src oe-i686 file:/home/enove/svn/Sources/trunk/ES/07-Infrastructure/build-platform/tmp/deploy/glibc/ipk/i686
arch x86 21
arch i386 26
arch i486 31
arch i586 36
arch aton-pccar 41
src oe-aton-pccar
file:/home/enove/svn/Sources/trunk/ES/07-Infrastructure/build-platform/tmp/deploy/glibc/ipk/aton-pccar


>
> --
> Denys
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


