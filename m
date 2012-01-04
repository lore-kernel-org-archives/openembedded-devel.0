Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mgargela@gmail.com>) id 1RiQzp-0006kG-8v
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Jan 2012 14:35:13 +0100
Received: by vbbfc21 with SMTP id fc21so13584465vbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Jan 2012 05:27:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type;
	bh=NchRpJNY7GUB0i+3ziVFNe6pHjCLybXbXFNpTqAVb2s=;
	b=FmN0he2u+eiphFWp1rdnYJdhwnF77XWsoN+4SKYmhlIAcckh7L43ngRImwWGA5klZj
	icijRZfpx30SNQqBVDeOA74O0B4ch0bQlB4X0pL3E9p4kOuQhN4puoXvcjN7adblXFNm
	M4caPEfzrlv/OcNPHA8UdUuTM5PyZkgY+xdwY=
MIME-Version: 1.0
Received: by 10.52.19.201 with SMTP id h9mr26268806vde.118.1325683671091; Wed,
	04 Jan 2012 05:27:51 -0800 (PST)
Sender: mgargela@gmail.com
Received: by 10.52.160.165 with HTTP; Wed, 4 Jan 2012 05:27:51 -0800 (PST)
Date: Wed, 4 Jan 2012 15:27:51 +0200
X-Google-Sender-Auth: Fe8zSd4TRsWMn-n7rGIademO8qY
Message-ID: <CAObi9r-QdBpK9hzwQr1M1tjjKW1F+qLfr2CLbjyWCAuSuEUKAQ@mail.gmail.com>
From: mgundes <mgcse@hotmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: some ipk contents missed in rootfs - fuse_2.7.4
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
X-List-Received-Date: Wed, 04 Jan 2012 13:35:13 -0000
Content-Type: text/plain; charset=UTF-8

         Hi all,

         I am using classic oe. I try to compile fuse_2.7.4 and everything
ok but I think "fuse-utils" package contents are not included ro rootfs.
"fuse-utils" is in my PACKAGES variable and it is generated, I can see it
under directories below with other PACKAGES ipks.

tmp/deploy/ipk/armv6/fuse-utils_2.7.4-r0_armv6.ipk
tmp/work/armv6-oe-linux-gnueabi/fuse-2.7.4-r0/staging-pkg/deploy/ipk/armv6/fuse-utils_2.7.4-r0_armv6.ipk

$ *dpkg -c  fuse-utils_2.7.4-r0_armv6.ipk*

drwxr-xr-x root/root         0 2012-01-04 15:07 ./
drwxr-xr-x root/root         0 2012-01-04 15:07 ./sbin/
-rwxr-xr-x root/root      5816 2012-01-04 15:07 ./sbin/mount.fuse
drwxr-xr-x root/root         0 2012-01-04 15:07 ./usr/
drwxr-xr-x root/root         0 2012-01-04 15:07 ./usr/bin/
-rwxr-xr-x root/root      8060 2012-01-04 15:07 ./usr/bin/ulockmgr_server
-rwsr-xr-x root/root     18296 2012-01-04 15:07 ./usr/bin/fusermount

         When I check PACKAGES in environments I can see all packages are
correctly assigned to it.

$ *bitbake -e fuse | grep PACKAGES=*
# PACKAGES=fuse-utils-dbg fuse-utils libulockmgr libulockmgr-dev
libulockmgr-dbg ${PN}-dbg ${PN} ${PN}-doc ${PN}-dev ${PN}-static
${PN}-locale
PACKAGES="fuse-utils-dbg fuse-utils libulockmgr libulockmgr-dev
libulockmgr-dbg fuse-dbg fuse fuse-doc fuse-dev fuse-static fuse-locale

         Is there any idea, why fuse-utils package contents are not
included to rootfs but other packages' contents are added?

         I tried too many thing since yesterday :)

         All recommendations are wellcome.

Thanks,
Regards

-- 
MahmutG

