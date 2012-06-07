Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jayakumar.lkml@gmail.com>) id 1Scavr-0002eH-N9
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Jun 2012 13:31:15 +0200
Received: by lbol5 with SMTP id l5so421478lbo.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Jun 2012 04:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=RGc6sSpV20j+uOQyPD6KhoWiWEfSliMUSUkb38i0k3U=;
	b=CO8rt2ubxGC8wApU/rS0Ux+Z5e+oFSSGjpIVbzunFit9sKnk/iX31FGWPRnXC2tjhH
	0TISfVo4vztF9Hc9ISuPwCoa7amnFh6CzffzIVO/EnaP41b4o54kdc1/+OlCqiYCu337
	tCNxu+mhoQFuo1jm3R4PSsofgVxtLT2F29ZHn2OLofXW96kZlmfn/ZYnmOQHZJkSdP2/
	Ce/qU61J5Dj9mefuYiuLaAi+X+Qojgyaqu2n8XGxE11TGDBq1+vH34ZenPZWjqt52MNY
	5iUbZUsV8YA543KoehOTyTMlBkHBtLiNHZQx5Z1QKZNEw8DhiQYCKnTTGKNc8AHdK/ym
	1k2A==
MIME-Version: 1.0
Received: by 10.152.144.234 with SMTP id sp10mr2009623lab.51.1339068047177;
	Thu, 07 Jun 2012 04:20:47 -0700 (PDT)
Received: by 10.112.23.132 with HTTP; Thu, 7 Jun 2012 04:20:47 -0700 (PDT)
Date: Thu, 7 Jun 2012 19:20:47 +0800
Message-ID: <CADqH6VxvxeF=UoY+JuN_JP+McpWAf8FoB5HZ-aprDG3PfpkdqQ@mail.gmail.com>
From: Jaya Kumar <jayakumar.lkml@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: libcurl and __isoc99_sscanf@GLIBC_2.7
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
X-List-Received-Date: Thu, 07 Jun 2012 11:31:15 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi OE friends,

I observed something odd today.

~/oe/setup-scripts$ file
build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/curl-7.24.0-r0/package/usr/lib/libcurl.so.5.2.0
build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/curl-7.24.0-r0/package/usr/lib/libcurl.so.5.2.0:
ELF 32-bit LSB shared object, ARM, version 1 (SYSV), dynamically
linked, stripped

~/oe/setup-scripts$ readelf -a
build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/curl-7.24.0-r0/package/usr/lib/libcurl.so.5.2.0
| egrep GLIBC_2.7
    30: 00000000     0 FUNC    GLOBAL DEFAULT  UND __isoc99_sscanf@GLIBC_2.7 (7)
  01c:   2 (GNUTLS_1_4)    6 (GCRYPT_1.2)    7 (GLIBC_2.7)     2 (GNUTLS_1_4)
  0x0070:   Name: GLIBC_2.7  Flags: none  Version: 7

I was wondering if that is correct behavior? I don't have an
understanding of why sscanf seems to have a dependency on glibc 2.7. I
encountered this issue because I took the curl libs, unpacked them in
my metatoolchain libs, and then tried to link my app against it and
got:

arm-angstrom-linux-gnueabi-gcc -o curltest curltest.c
-I/home/test/oemetatoolchain/usr/include
-Wl,-rpath=/home/test/oemetatoolchain/usr/lib/:/home/test/oemetatoolchain/lib/
-lcurl
../../usr/lib//libcurl.so: undefined reference to `__isoc99_sscanf@GLIBC_2.7'
collect2: ld returned 1 exit status

So the only fault seems to be with sscanf. Other functions seem to be
fine, eg: sprintf:
   164: 00000000     0 FUNC    GLOBAL DEFAULT  UND sprintf@GLIBC_2.4 (3)

Suggestions or advice would be greatly appreciated.

Thanks,
jayakumar


