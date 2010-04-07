Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ryan@trolocsis.com>) id 1Nzc1J-0006vS-BE
	for openembedded-devel@lists.openembedded.org;
	Wed, 07 Apr 2010 22:38:42 +0200
Received: by gya1 with SMTP id 1so699323gya.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Apr 2010 13:35:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.90.70.4 with HTTP; Wed, 7 Apr 2010 13:35:18 -0700 (PDT)
In-Reply-To: <201004072220.23343.holger+oe@freyther.de>
References: <p2y46a47f951004071306meb244b2ge55fbff26849ccf@mail.gmail.com>
	<201004072220.23343.holger+oe@freyther.de>
Date: Wed, 7 Apr 2010 15:35:18 -0500
Received: by 10.91.162.16 with SMTP id p16mr2922390ago.101.1270672518662; Wed, 
	07 Apr 2010 13:35:18 -0700 (PDT)
Message-ID: <w2v46a47f951004071335x58520b7x5207a54dd49e265b@mail.gmail.com>
From: Ryan Phillips <ryan@trolocsis.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: ryan@trolocsis.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Problem with creating an SDK and host libraries
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
X-List-Received-Date: Wed, 07 Apr 2010 20:38:42 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Apr 7, 2010 at 3:20 PM, Holger Hans Peter Freyther
<holger+oe@freyther.de> wrote:
> On Wednesday 07 April 2010 22:06:17 Ryan Phillips wrote:
>> Hi All,
>>
>> I'm creating a powerpc 405 based meta-toolchain-sdk and the resulting
>> opkg-cl for x86_64 is linking to OpenSSL within my
>> $BUILD/tmp/staging/x86_64-linux/usr/lib/lib{ssl,crypto}...
>
> Oh, i recently upgraded opkg-sdk/curl-sdk and might have broken that. Your
> quick hack could be to go back to an older version (revert my commit) or help
> me to find out what is going on.
>
> One easy option would be to disable SSL. Could you help me to see who needs
> the SSL library? Is that curl?

Thanks for the quick response.

ldd /home/rphillips/sdk/build-cmc-angstrom/tmp/staging/x86_64-linux/usr/lib/libopkg.so.0
	linux-vdso.so.1 =>  (0x00007fff2efff000)
	libcurl.so.4 =>
/home/rphillips/sdk/build-cmc-angstrom/tmp/staging/x86_64-linux/usr/lib/libcurl.so.4
(0x00007f34932d1000)
	libldap_r-2.4.so.2 => /usr/lib/libldap_r-2.4.so.2 (0x00007f3493069000)
	librt.so.1 => /lib/librt.so.1 (0x00007f3492e60000)
	libz.so.1 => /home/rphillips/sdk/build-cmc-angstrom/tmp/staging/x86_64-linux/usr/lib/libz.so.1
(0x00007f3492c4a000)
	libssl.so.0.9.8 =>
/home/rphillips/sdk/build-cmc-angstrom/tmp/staging/x86_64-linux/usr/lib/libssl.so.0.9.8
(0x00007f34929e6000)
	libcrypto.so.0.9.8 =>
/home/rphillips/sdk/build-cmc-angstrom/tmp/staging/x86_64-linux/usr/lib/libcrypto.so.0.9.8
(0x00007f349261e000)
	libc.so.6 => /lib/libc.so.6 (0x00007f34922af000)
	liblber-2.4.so.2 => /usr/lib/liblber-2.4.so.2 (0x00007f34920a1000)
	libresolv.so.2 => /lib/libresolv.so.2 (0x00007f3491e87000)
	libsasl2.so.2 => /usr/lib/libsasl2.so.2 (0x00007f3491c6d000)
	libgnutls.so.26 => /usr/lib/libgnutls.so.26 (0x00007f34919cb000)
	libpthread.so.0 => /lib/libpthread.so.0 (0x00007f34917ae000)
	/lib64/ld-linux-x86-64.so.2 (0x00007f3493742000)
	libdl.so.2 => /lib/libdl.so.2 (0x00007f34915aa000)
	libtasn1.so.3 => /usr/lib/libtasn1.so.3 (0x00007f3491398000)
	libgcrypt.so.11 => /lib/libgcrypt.so.11 (0x00007f3491120000)
	libgpg-error.so.0 => /lib/libgpg-error.so.0 (0x00007f3490f1c000)

ldd /home/rphillips/sdk/build-cmc-angstrom/tmp/staging/x86_64-linux/usr/lib/libcurl.so.4
	linux-vdso.so.1 =>  (0x00007fff7d7cc000)
	libldap_r-2.4.so.2 => /usr/lib/libldap_r-2.4.so.2 (0x00007ff7af380000)
	librt.so.1 => /lib/librt.so.1 (0x00007ff7af178000)
	libz.so.1 => /home/rphillips/sdk/build-cmc-angstrom/tmp/staging/x86_64-linux/usr/lib/libz.so.1
(0x00007ff7aef61000)
	libc.so.6 => /lib/libc.so.6 (0x00007ff7aebf2000)
	liblber-2.4.so.2 => /usr/lib/liblber-2.4.so.2 (0x00007ff7ae9e4000)
	libresolv.so.2 => /lib/libresolv.so.2 (0x00007ff7ae7ca000)
	libsasl2.so.2 => /usr/lib/libsasl2.so.2 (0x00007ff7ae5b0000)
	libgnutls.so.26 => /usr/lib/libgnutls.so.26 (0x00007ff7ae30e000)
	libpthread.so.0 => /lib/libpthread.so.0 (0x00007ff7ae0f1000)
	/lib64/ld-linux-x86-64.so.2 (0x00007ff7af829000)
	libdl.so.2 => /lib/libdl.so.2 (0x00007ff7adeed000)
	libtasn1.so.3 => /usr/lib/libtasn1.so.3 (0x00007ff7adcdc000)
	libgcrypt.so.11 => /lib/libgcrypt.so.11 (0x00007ff7ada63000)
	libgpg-error.so.0 => /lib/libgpg-error.so.0 (0x00007ff7ad85f000)


