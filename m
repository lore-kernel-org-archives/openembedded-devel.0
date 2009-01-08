Received: from [209.85.198.241] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ticktock35@gmail.com>) id 1LKwPo-00075G-R3
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 Jan 2009 16:03:47 +0100
Received: by rv-out-0708.google.com with SMTP id f25so10126649rvb.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Jan 2009 06:57:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=OLgrQL8+cxEvks6/XCJRHWG8LPnycvtiIC5mzEair8Y=;
	b=jmtVjq7STUfKPpS/Hgh+LiHK3Rjeyz2gbbV9mdQq6jkU/KMlulPLuFTQ5Zr1BdOLLb
	Gyk2KaLhOi+sH3Vpt/mpGDSna+0h4/MLrFpLCb5a1ReIPmrhYp3gfV8+gVjTNU44g4ZM
	GqxeClM45yMaKuQPOiCmMYidgYXQFHD6jZvT0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=f2PHn1GXSqTQRIFqxjH9MDBvyN09b9rff/sAi1ij/DtOGb9sI9gRpSQ3kbQMW9ujLO
	sw4/tCDb5JfwMzs2JhYIuPu1MDXSf225ScxqgH5YKnqfP4G9h1TCmfpeMVtGgVTeuPAs
	jPyDNZRui2xXZPg0RcXttcNNKxUPlfixt2Gn4=
Received: by 10.140.188.19 with SMTP id l19mr12159475rvf.216.1231426631160;
	Thu, 08 Jan 2009 06:57:11 -0800 (PST)
Received: by 10.141.133.13 with HTTP; Thu, 8 Jan 2009 06:57:11 -0800 (PST)
Message-ID: <565965130901080657i4789129fy971a69f0a929300c@mail.gmail.com>
Date: Thu, 8 Jan 2009 22:57:11 +0800
From: "Tick Chen" <ticktock35@gmail.com>
To: openembedded-devel@lists.openembedded.org, opkg-devel@googlegroups.com
In-Reply-To: <f96d234e0901080537k6c1dfa9bm77ca6c03c24f1a49@mail.gmail.com>
MIME-Version: 1.0
References: <f96d234e0901080537k6c1dfa9bm77ca6c03c24f1a49@mail.gmail.com>
Subject: Re: opkg-cl: corrupted double-linked list
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
X-List-Received-Date: Thu, 08 Jan 2009 15:05:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi Cliff,
  Would you like to compile a opkg with -g2 and test again?
Which branch and version on OE do you used and which version of
opkg-native do you compiled?

Thanks for reporting this.

Tick

2009/1/8 Cliff Brake <cliff.brake@gmail.com>:
> Has anyone else seen this?
>
> I see it with x86 machine, but not cm-x270 machine.
>
> Thanks,
> Cliff
>
>
> NOTE: package console-image-1.0: started
> NOTE: package console-image-1.0-r0: task do_rootfs: started
> *** glibc detected *** opkg-cl: corrupted double-linked list:
> 0x000000000061a350 ***
> ======= Backtrace: =========
> /lib/libc.so.6[0x2b33164f14b2]
> /lib/libc.so.6[0x2b33164f1b88]
> /lib/libc.so.6(realloc+0x130)[0x2b33164f3ea0]
> /build/oe/build/build/angstrom-2008.1/tmp/staging/x86_64-linux/usr/lib/libopkg.so.0[0x2b33159a3f88]
> /build/oe/build/build/angstrom-2008.1/tmp/staging/x86_64-linux/usr/lib/libopkg.so.0[0x2b33159a45b4]
> /build/oe/build/build/angstrom-2008.1/tmp/staging/x86_64-linux/usr/lib/libopkg.so.0[0x2b331599b4cf]
> /build/oe/build/build/angstrom-2008.1/tmp/staging/x86_64-linux/usr/lib/libopkg.so.0(opkg_cmd_exec+0x26)[0x2b3315999736]
> /build/oe/build/build/angstrom-2008.1/tmp/staging/x86_64-linux/usr/lib/libopkg.so.0(opkg_op+0x1b7)[0x2b3315997527]
> /lib/libc.so.6(__libc_start_main+0xf4)[0x2b331649a1c4]
> opkg-cl[0x4005d9]
> ======= Memory map: ========
> 00400000-00401000 r-xp 00000000 fe:01 3795028
>  /build/oe/build/build/angstrom-2008.1/tmp/staging/x86_64-linux/usr/bin/opkg-cl
> 00600000-00601000 rw-p 00000000 fe:01 3795028
>  /build/oe/build/build/angstrom-2008.1/tmp/staging/x86_64-linux/usr/bin/opkg-cl
> 00601000-008d4000 rw-p 00601000 00:00 0                                  [heap]
> 2b3315569000-2b3315586000 r-xp 00000000 08:06 136585
>  /lib/ld-2.7.so
> 2b3315586000-2b3315589000 rw-p 2b3315586000 00:00 0
> 2b3315786000-2b3315788000 rw-p 0001d000 08:06 136585
>  /lib/ld-2.7.so
> 2b3315788000-2b3315792000 r-xp 00000000 fe:01 10829868
>  /build/oe/build/build/angstrom-2008.1/tmp/staging/x86_64-linux/usr/lib/libfakeroot-0.so
> 2b3315792000-2b3315991000 ---p 0000a000 fe:01 10829868
>  /build/oe/build/build/angstrom-2008.1/tmp/staging/x86_64-linux/usr/lib/libfakeroot-0.so
> 2b3315991000-2b3315992000 rw-p 00009000 fe:01 10829868
>  /build/oe/build/build/angstrom-2008.1/tmp/staging/x86_64-linux/usr/lib/libfakeroot-0.so
> 2b3315992000-2b33159bc000 r-xp 00000000 fe:01 3795116
>  /build/oe/build/build/angstrom-2008.1/tmp/staging/x86_64-linux/usr/lib/libopkg.so.0.0.0
> 2b33159bc000-2b3315bbb000 ---p 0002a000 fe:01 3795116
>  /build/oe/build/build/angstrom-2008.1/tmp/staging/x86_64-linux/usr/lib/libopkg.so.0.0.0
> 2b3315bbb000-2b3315bbd000 rw-p 00029000 fe:01 3795116
>  /build/oe/build/build/angstrom-2008.1/tmp/staging/x86_64-linux/usr/lib/libopkg.so.0.0.0
> 2b3315bbd000-2b3315bbe000 rw-p 2b3315bbd000 00:00 0
> 2b3315bbe000-2b3315bf8000 r-xp 00000000 fe:01 10829905
>  /build/oe/build/build/angstrom-2008.1/tmp/staging/x86_64-linux/usr/lib/libcurl.so.4.1.0
> 2b3315bf8000-2b3315df8000 ---p 0003a000 fe:01 10829905
>  /build/oe/build/build/angstrom-2008.1/tmp/staging/x86_64-linux/usr/lib/libcurl.so.4.1.0
> 2b3315df8000-2b3315dfa000 rw-p 0003a000 fe:01 10829905
>  /build/oe/build/build/angstrom-2008.1/tmp/staging/x86_64-linux/usr/lib/libcurl.so.4.1.0
> 2b3315e18000-2b3315e59000 r-xp 00000000 08:06 5636940
>  /usr/lib/libldap_r-2.4.so.2.0.5
> 2b3315e59000-2b3316059000 ---p 00041000 08:06 5636940
>  /usr/lib/libldap_r-2.4.so.2.0.5
> 2b3316059000-2b331605b000 rw-p 00041000 08:06 5636940
>  /usr/lib/libldap_r-2.4.so.2.0.5
> 2b331605b000-2b331605d000 rw-p 2b331605b000 00:00 0
> 2b331605d000-2b3316065000 r-xp 00000000 08:06 136604
>  /lib/librt-2.7.so
> 2b3316065000-2b3316264000 ---p 00008000 08:06 136604
>  /lib/librt-2.7.so
> 2b3316264000-2b3316266000 rw-p 00007000 08:06 136604
>  /lib/librt-2.7.so
> 2b3316266000-2b3316267000 rw-p 2b3316266000 00:00 0
> 2b3316267000-2b331627c000 r-xp 00000000 fe:01 10797074
>  /build/oe/build/build/angstrom-2008.1/tmp/staging/x86_64-linux/usr/lib/libz.so.1.2.3
> 2b331627c000-2b331647b000 ---p 00015000 fe:01 10797074
>  /build/oe/build/build/angstrom-2008.1/tmp/staging/x86_64-linux/usr/lib/libz.so.1.2.3
> 2b331647b000-2b331647c000 rw-p 00014000 fe:01 10797074
>  /build/oe/build/build/angstrom-2008.1/tmp/staging/x86_64-linux/usr/lib/libz.so.1.2.3
> 2b331647c000-2b33165d4000 r-xp 00000000 08:06 136588
>  /lib/libc-2.7.so
> 2b33165d4000-2b33167d4000 ---p 00158000 08:06 136588
>  /lib/libc-2.7.so
> 2b33167d4000-2b33167d7000 r--p 00158000 08:06 136588
>  /lib/libc-2.7.so
> 2b33167d7000-2b33167d9000 rw-p 0015b000 08:06 136588
>  /lib/libc-2.7.so
> 2b33167d9000-2b33167de000 rw-p 2b33167d9000 00:00 0
> 2b33167de000-2b33167e0000 r-xp 00000000 08:06 136591
>  /lib/libdl-2.7.so
> 2b33167e0000-2b33169e0000 ---p 00002000 08:06 136591
>  /lib/libdl-2.7.so
> 2b33169e0000-2b33169e2000 rw-p 00002000 08:06 136591
>  /lib/libdl-2.7.so
> 2b33169e2000-2b33169e3000 rw-p 2b33169e2000 00:00 0
> 2b33169e3000-2b33169f1000 r-xp 00000000 08:06 5636145
>  /usr/lib/liblber-2.4.so.2.0.5
> 2b33169f1000-2b3316bf0000 ---p 0000e000 08:06 5636145
>  /usr/lib/liblber-2.4.so.2.0.5
> 2b3316bf0000-2b3316bf1000 rw-p 0000d000 08:06 5636145
>  /usr/lib/liblber-2.4.so.2.0.5
> 2b3316bf1000-2b3316c03000 r-xp 00000000 08:06 136603     *** glibc
> detected *** opkg-cl: corrupted double-linked list: 0x000000000061a350
> ***
> ======= Backtrace: =========
> /lib/libc.so.6[0x2b610f5914b2]
> /lib/libc.so.6[0x2b610f591b88]
> /lib/libc.so.6(realloc+0x130)[0x2b610f593ea0]
> /build/oe/build/build/angstrom-2008.1/tmp/staging/x86_64-linux/usr/lib/libopkg.so.0[0x2b610ea43f88]
> /build/oe/build/build/angstrom-2008.1/tmp/staging/x86_64-linux/usr/lib/libopkg.so.0[0x2b610ea445b4]
> /build/oe/build/build/angstrom-2008.1/tmp/staging/x86_64-linux/usr/lib/libopkg.so.0[0x2b610ea3b4cf]
> /build/oe/build/build/angstrom-2008.1/tmp/staging/x86_64-linux/usr/lib/libopkg.so.0(opkg_cmd_exec+0x26)[0x2b610ea39736]
> /build/oe/build/build/angstrom-2008.1/tmp/staging/x86_64-linux/usr/lib/libopkg.so.0(opkg_op+0x1b7)[0x2b610ea37527]
> /lib/libc.so.6(__libc_start_main+0xf4)[0x2b610f53a1c4]
> opkg-cl[0x4005d9]
> ======= Memory map: ========
> 00400000-00401000 r-xp 00000000 fe:01 3795028
>  /build/oe/build/build/angstrom-2008.1/tmp/staging/x86_64-linux/usr/bin/opkg-cl
> 00600000-00601000 rw-p 00000000 fe:01 3795028
>  /build/oe/build/build/angstrom-2008.1/tmp/staging/x86_64-linux/usr/bin/opkg-cl
> 00601000-008d4000 rw-p 00601000 00:00 0                                  [heap]
> 2b610e609000-2b610e626000 r-xp 00000000 08:06 136585
>  /lib/ld-2.7.so
> 2b610e626000-2b610e629000 rw-p 2b610e626000 00:00 0
> 2b610e826000-2b610e828000 rw-p 0001d000 08:06 136585
>  /lib/ld-2.7.so
> 2b610e828000-2b610e832000 r-xp 00000000 fe:01 10829868
>  /build/oe/build/build/angstrom-2008.1/tmp/staging/x86_64-linux/usr/lib/libfakeroot-0.so
> 2b610e832000-2b610ea31000 ---p 0000a000 fe:01 10829868
>  /build/oe/build/build/angstrom-2008.1/tmp/staging/x86_64-linux/usr/lib/libfakeroot-0.so
> 2b610ea31000-2b610ea32000 rw-p 00009000 fe:01 10829868
>  /build/oe/build/build/angstrom-2008.1/tmp/staging/x86_64-linux/usr/lib/libfakeroot-0.so
> 2b610ea32000-2b610ea5c000 r-xp 00000000 fe:01 3795116
>  /build/oe/build/build/angstrom-2008.1/tmp/staging/x86_64-linux/usr/lib/libopkg.so.0.0.0
> 2b610ea5c000-2b610ec5b000 ---p 0002a000 fe:01 3795116
>  /build/oe/build/build/angstrom-2008.1/tmp/staging/x86_64-linux/usr/lib/libopkg.so.0.0.0
> 2b610ec5b000-2b610ec5d000 rw-p 00029000 fe:01 3795116
>  /build/oe/build/build/angstrom-2008.1/tmp/staging/x86_64-linux/usr/lib/libopkg.so.0.0.0
> 2b610ec5d000-2b610ec5e000 rw-p 2b610ec5d000 00:00 0
> 2b610ec5e000-2b610ec98000 r-xp 00000000 fe:01 10829905
>  /build/oe/build/build/angstrom-2008.1/tmp/staging/x86_64-linux/usr/lib/libcurl.so.4.1.0
> 2b610ec98000-2b610ee98000 ---p 0003a000 fe:01 10829905
>  /build/oe/build/build/angstrom-2008.1/tmp/staging/x86_64-linux/usr/lib/libcurl.so.4.1.0
> 2b610ee98000-2b610ee9a000 rw-p 0003a000 fe:01 10829905
>  /build/oe/build/build/angstrom-2008.1/tmp/staging/x86_64-linux/usr/lib/libcurl.so.4.1.0
> 2b610eeb8000-2b610eef9000 r-xp 00000000 08:06 5636940
>  /usr/lib/libldap_r-2.4.so.2.0.5
> 2b610eef9000-2b610f0f9000 ---p 00041000 08:06 5636940
>  /usr/lib/libldap_r-2.4.so.2.0.5
> 2b610f0f9000-2b610f0fb000 rw-p 00041000 08:06 5636940
>  /usr/lib/libldap_r-2.4.so.2.0.5
> 2b610f0fb000-2b610f0fd000 rw-p 2b610f0fb000 00:00 0
> 2b610f0fd000-2b610f105000 r-xp 00000000 08:06 136604
>  /lib/librt-2.7.so
> 2b610f105000-2b610f304000 ---p 00008000 08:06 136604
>  /lib/librt-2.7.so
> 2b610f304000-2b610f306000 rw-p 00007000 08:06 136604
>  /lib/librt-2.7.so
> 2b610f306000-2b610f307000 rw-p 2b610f306000 00:00 0
> 2b610f307000-2b610f31c000 r-xp 00000000 fe:01 10797074
>  /build/oe/build/build/angstrom-2008.1/tmp/staging/x86_64-linux/usr/lib/libz.so.1.2.3
> 2b610f31c000-2b610f51b000 ---p 00015000 fe:01 10797074
>  /build/oe/build/build/angstrom-2008.1/tmp/staging/x86_64-linux/usr/lib/libz.so.1.2.3
> 2b610f51b000-2b610f51c000 rw-p 00014000 fe:01 10797074
>  /build/oe/build/build/angstrom-2008.1/tmp/staging/x86_64-linux/usr/lib/libz.so.1.2.3
> 2b610f51c000-2b610f674000 r-xp 00000000 08:06 136588
>  /lib/libc-2.7.so
> 2b610f674000-2b610f874000 ---p 00158000 08:06 136588
>  /lib/libc-2.7.so
> 2b610f874000-2b610f877000 r--p 00158000 08:06 136588
>  /lib/libc-2.7.so
> 2b610f877000-2b610f879000 rw-p 0015b000 08:06 136588
>  /lib/libc-2.7.so
> 2b610f879000-2b610f87e000 rw-p 2b610f879000 00:00 0
> 2b610f87e000-2b610f880000 r-xp 00000000 08:06 136591
>  /lib/libdl-2.7.so
> 2b610f880000-2b610fa80000 ---p 00002000 08:06 136591
>  /lib/libdl-2.7.so
> 2b610fa80000-2b610fa82000 rw-p 00002000 08:06 136591
>  /lib/libdl-2.7.so
> 2b610fa82000-2b610fa83000 rw-p 2b610fa82000 00:00 0
> 2b610fa83000-2b610fa91000 r-xp 00000000 08:06 5636145
>  /usr/lib/liblber-2.4.so.2.0.5
> 2b610fa91000-2b610fc90000 ---p 0000e000 08:06 5636145
>  /usr/lib/liblber-2.4.so.2.0.5
> 2b610fc90000-2b610fc91000 rw-p 0000d000 08:06 5636145
>  /usr/lib/liblber-2.4.so.2.0.5
> 2b610fc91000-2b610fca3000 r-xp 00000000 08:06 136603     *** glibc
> detected *** opkg-cl: corrupted double-linked list: 0x000000000061a350
> ***
> ======= Backtrace: =========
> /lib/libc.so.6[0x2b8166ec24b2]
> /lib/libc.so.6[0x2b8166ec2b88]
> /lib/libc.so.6(realloc+0x130)[0x2b8166ec4ea0]
> /build/oe/build/build/angstrom-2008.1/tmp/staging/x86_64-linux/usr/lib/libopkg.so.0[0x2b8166374f88]
> /build/oe/build/build/angstrom-2008.1/tmp/staging/x86_64-linux/usr/lib/libopkg.so.0[0x2b81663755b4]
> /build/oe/build/build/angstrom-2008.1/tmp/staging/x86_64-linux/usr/lib/libopkg.so.0[0x2b816636c4cf]
> /build/oe/build/build/angstrom-2008.1/tmp/staging/x86_64-linux/usr/lib/libopkg.so.0(opkg_cmd_exec+0x26)[0x2b816636a736]
> /build/oe/build/build/angstrom-2008.1/tmp/staging/x86_64-linux/usr/lib/libopkg.so.0(opkg_op+0x1b7)[0x2b8166368527]
> /lib/libc.so.6(__libc_start_main+0xf4)[0x2b8166e6b1c4]
> opkg-cl[0x4005d9]
> ======= Memory map: ========
> 00400000-00401000 r-xp 00000000 fe:01 3795028
>  /build/oe/build/build/angstrom-2008.1/tmp/staging/x86_64-linux/usr/bin/opkg-cl
> 00600000-00601000 rw-p 00000000 fe:01 3795028
>  /build/oe/build/build/angstrom-2008.1/tmp/staging/x86_64-linux/usr/bin/opkg-cl
> 00601000-008d4000 rw-p 00601000 00:00 0                                  [heap]
> 2b8165f3a000-2b8165f57000 r-xp 00000000 08:06 136585
>  /lib/ld-2.7.so
> 2b8165f57000-2b8165f5a000 rw-p 2b8165f57000 00:00 0
> 2b8166157000-2b8166159000 rw-p 0001d000 08:06 136585
>  /lib/ld-2.7.so
> 2b8166159000-2b8166163000 r-xp 00000000 fe:01 10829868
>  /build/oe/build/build/angstrom-2008.1/tmp/staging/x86_64-linux/usr/lib/libfakeroot-0.so
> 2b8166163000-2b8166362000 ---p 0000a000 fe:01 10829868
>  /build/oe/build/build/angstrom-2008.1/tmp/staging/x86_64-linux/usr/lib/libfakeroot-0.so
> 2b8166362000-2b8166363000 rw-p 00009000 fe:01 10829868
>  /build/oe/build/build/angstrom-2008.1/tmp/staging/x86_64-linux/usr/lib/libfakeroot-0.so
> 2b8166363000-2b816638d000 r-xp 00000000 fe:01 3795116
>  /build/oe/build/build/angstrom-2008.1/tmp/staging/x86_64-linux/usr/lib/libopkg.so.0.0.0
> 2b816638d000-2b816658c000 ---p 0002a000 fe:01 3795116
>  /build/oe/build/build/angstrom-2008.1/tmp/staging/x86_64-linux/usr/lib/libopkg.so.0.0.0
> 2b816658c000-2b816658e000 rw-p 00029000 fe:01 3795116
>  /build/oe/build/build/angstrom-2008.1/tmp/staging/x86_64-linux/usr/lib/libopkg.so.0.0.0
> 2b816658e000-2b816658f000 rw-p 2b816658e000 00:00 0
> 2b816658f000-2b81665c9000 r-xp 00000000 fe:01 10829905
>  /build/oe/build/build/angstrom-2008.1/tmp/staging/x86_64-linux/usr/lib/libcurl.so.4.1.0
> 2b81665c9000-2b81667c9000 ---p 0003a000 fe:01 10829905
>  /build/oe/build/build/angstrom-2008.1/tmp/staging/x86_64-linux/usr/lib/libcurl.so.4.1.0
> 2b81667c9000-2b81667cb000 rw-p 0003a000 fe:01 10829905
>  /build/oe/build/build/angstrom-2008.1/tmp/staging/x86_64-linux/usr/lib/libcurl.so.4.1.0
> 2b81667e9000-2b816682a000 r-xp 00000000 08:06 5636940
>  /usr/lib/libldap_r-2.4.so.2.0.5
> 2b816682a000-2b8166a2a000 ---p 00041000 08:06 5636940
>  /usr/lib/libldap_r-2.4.so.2.0.5
> 2b8166a2a000-2b8166a2c000 rw-p 00041000 08:06 5636940
>  /usr/lib/libldap_r-2.4.so.2.0.5
> 2b8166a2c000-2b8166a2e000 rw-p 2b8166a2c000 00:00 0
> 2b8166a2e000-2b8166a36000 r-xp 00000000 08:06 136604
>  /lib/librt-2.7.so
> 2b8166a36000-2b8166c35000 ---p 00008000 08:06 136604
>  /lib/librt-2.7.so
> 2b8166c35000-2b8166c37000 rw-p 00007000 08:06 136604
>  /lib/librt-2.7.so
> 2b8166c37000-2b8166c38000 rw-p 2b8166c37000 00:00 0
> 2b8166c38000-2b8166c4d000 r-xp 00000000 fe:01 10797074
>  /build/oe/build/build/angstrom-2008.1/tmp/staging/x86_64-linux/usr/lib/libz.so.1.2.3
> 2b8166c4d000-2b8166e4c000 ---p 00015000 fe:01 10797074
>  /build/oe/build/build/angstrom-2008.1/tmp/staging/x86_64-linux/usr/lib/libz.so.1.2.3
> 2b8166e4c000-2b8166e4d000 rw-p 00014000 fe:01 10797074
>  /build/oe/build/build/angstrom-2008.1/tmp/staging/x86_64-linux/usr/lib/libz.so.1.2.3
> 2b8166e4d000-2b8166fa5000 r-xp 00000000 08:06 136588
>  /lib/libc-2.7.so
> 2b8166fa5000-2b81671a5000 ---p 00158000 08:06 136588
>  /lib/libc-2.7.so
> 2b81671a5000-2b81671a8000 r--p 00158000 08:06 136588
>  /lib/libc-2.7.so
> 2b81671a8000-2b81671aa000 rw-p 0015b000 08:06 136588
>  /lib/libc-2.7.so
> 2b81671aa000-2b81671af000 rw-p 2b81671aa000 00:00 0
> 2b81671af000-2b81671b1000 r-xp 00000000 08:06 136591
>  /lib/libdl-2.7.so
> 2b81671b1000-2b81673b1000 ---p 00002000 08:06 136591
>  /lib/libdl-2.7.so
> 2b81673b1000-2b81673b3000 rw-p 00002000 08:06 136591
>  /lib/libdl-2.7.so
> 2b81673b3000-2b81673b4000 rw-p 2b81673b3000 00:00 0
> 2b81673b4000-2b81673c2000 r-xp 000000NOTE: package
> console-image-1.0-r0: task do_rootfs: completed
>
>
> --
> =======================
> Cliff Brake
> http://bec-systems.com
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


