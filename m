Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <coolaj86@gmail.com>) id 1PBEC4-0008Tr-0C
	for openembedded-devel@lists.openembedded.org;
	Thu, 28 Oct 2010 00:10:09 +0200
Received: by fxm3 with SMTP id 3so1294267fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Oct 2010 15:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:from:date
	:message-id:subject:to:content-type;
	bh=H9Jt4uNn8SPgcKeH7lQ8KMUOl5+xJ8fzlAVZ2ZZOits=;
	b=rOtJJtGcdgiw+znx0XlRBJBLyqK2CnpB8m5L45vgOeZWA2dlTGmjZ69oJpqpWqMdJT
	Cn/EFmyXH3xfrgEvXRH31idTv6p3dp98TcgwIkywtgTWtm0MNohN7JKGtK8QBZJO/WXt
	CBnqPmgspt+/1QT0OAc9yr8EcD9t2tMmlNjRg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:from:date:message-id:subject:to:content-type;
	b=Yb5gNsPntdZ2QOVTh/sAGmfs+ow4ccBxl/MXLq1FZMQkdra+NcY8QYRhykKDbwvtYT
	EP4EikXAvkJnpfUSxEdysWiAa8dNmvWK8w/csw10C2pxc+7FgM/fz37+JbGVmDD08pRo
	5OiDdv7MIG+JGZU/6RBPXKTS2kTHGSVMUxGug=
Received: by 10.223.96.204 with SMTP id i12mr2920088fan.145.1288217352859;
	Wed, 27 Oct 2010 15:09:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.112.201 with HTTP; Wed, 27 Oct 2010 15:08:52 -0700 (PDT)
From: AJ ONeal <coolaj86@gmail.com>
Date: Wed, 27 Oct 2010 16:08:52 -0600
Message-ID: <AANLkTikG3t-cDmFcGfcdiOiNJha1yKYU9Gmn5Kfep+p5@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: coolaj86@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: netpbm fails: 'struct jpeg_decompress_struct' has no member named 'min_DCT_scaled_size'
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
X-List-Received-Date: Wed, 27 Oct 2010 22:10:10 -0000
Content-Type: text/plain; charset=ISO-8859-1

The netpbm in the repo is out-of-date with the libjpeg in the repo.


| arm-angstrom-linux-gnueabi-gcc -march=armv7-a -mtune=cortex-a8 -mfpu=neon
-mfloat-abi=softfp -mthumb-interwork -mno-thumb -c
-I/mnt/local/overo-coolaj86/tmp/work/armv7a-angstrom-linux-gnueabi/netpbm-10.28-r8/netpbm-10.28/converter/ppm/ppmtompeg
-I.
-I/mnt/local/overo-coolaj86/tmp/work/armv7a-angstrom-linux-gnueabi/netpbm-10.28-r8/netpbm-10.28/converter/ppm/ppmtompeg/headers
-DNDEBUG \
|
-isystem/mnt/local/overo-coolaj86/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include
-isystem/mnt/local/overo-coolaj86/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include
-fexpensive-optimizations -frename-registers -fomit-frame-pointer -O2
-ggdb2   -o jpeg.o jpeg.c


| jpeg.c: In function 'ReadJPEG':
| jpeg.c:484: error: 'struct jpeg_decompress_struct' has no member named
'min_DCT_scaled_size'



| make[3]: *** [jpeg.o] Error 1
| make[3]: Leaving directory
`/mnt/local/overo-coolaj86/tmp/work/armv7a-angstrom-linux-gnueabi/netpbm-10.28-r8/netpbm-10.28/converter/ppm/ppmtompeg'
| make[2]: *** [ppmtompeg/all] Error 2
| make[2]: Leaving directory
`/mnt/local/overo-coolaj86/tmp/work/armv7a-angstrom-linux-gnueabi/netpbm-10.28-r8/netpbm-10.28/converter/ppm'
| make[1]: *** [ppm/all] Error 2
| make[1]: Leaving directory
`/mnt/local/overo-coolaj86/tmp/work/armv7a-angstrom-linux-gnueabi/netpbm-10.28-r8/netpbm-10.28/converter'
| make: *** [converter/all] Error 2
| FATAL: oe_runmake failed
NOTE: Task failed:
/mnt/local/overo-coolaj86/tmp/work/armv7a-angstrom-linux-gnueabi/netpbm-10.28-r8/temp/log.do_compile.8537

AJ ONeal

