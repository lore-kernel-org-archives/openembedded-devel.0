Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1OvTpa-0004KY-6t
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 Sep 2010 13:37:48 +0200
Received: (qmail 30590 invoked by uid 1003); 14 Sep 2010 11:36:55 -0000
Received: from pool-96-240-180-126.ronkva.east.verizon.net (HELO
	?192.168.1.167?) (philip@opensdr.com@96.240.180.126)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	14 Sep 2010 11:36:55 -0000
Message-ID: <4C8F5E55.9010906@balister.org>
Date: Tue, 14 Sep 2010 07:36:53 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.9) Gecko/20100907 Fedora/3.1.3-1.fc13 Thunderbird/3.1.3
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTi=6fss18KJvTBYf3oV1MXkgJwT7cqTRz4rK+aTx@mail.gmail.com>
In-Reply-To: <AANLkTi=6fss18KJvTBYf3oV1MXkgJwT7cqTRz4rK+aTx@mail.gmail.com>
X-SA-Exim-Connect-IP: 216.168.135.169
X-SA-Exim-Mail-From: philip@balister.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: testing branch 2010-09-13
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
X-List-Received-Date: Tue, 14 Sep 2010 11:37:48 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/13/2010 02:21 PM, Cliff Brake wrote:
> last weeks testing cycle was a success.
>
> http://wiki.openembedded.net/index.php/Testing#Testing_Log
>
> Firefox is failing in some configurations if the same version of
> firefox is installed on the host system -- it would be nice to get
> this resolved this week.
>
> testing-next branch has been updated and is ready for clean builds.

Next error on F13. Sorry I don't have time to debug these. I'm just 
trying to get in the rhythm. I also need to report this to tinderbox. 
Not sure why it is touching build machine files.

Philip

| /usr/lib/gcc/x86_64-redhat-linux/4.4.4/../../../../lib64/libgnutls.so: 
undefined reference to `gcry_cipher_setkey@GCRYPT_1.2'
| /usr/lib/gcc/x86_64-redhat-linux/4.4.4/../../../../lib64/libgnutls.so: 
undefined reference to `gcry_cipher_setiv@GCRYPT_1.2'
| collect2: ld returned 1 exit status
| make[1]: *** [qemu-system-mips] Error 1
| make: *** [subdir-mips-softmmu] Error 2
| /usr/lib/gcc/x86_64-redhat-linux/4.4.4/../../../../lib64/libgnutls.so: 
undefined reference to `gcry_cipher_setkey@GCRYPT_1.2'
| /usr/lib/gcc/x86_64-redhat-linux/4.4.4/../../../../lib64/libgnutls.so: 
undefined reference to `gcry_cipher_setiv@GCRYPT_1.2'
| collect2: ld returned 1 exit status
| make[1]: *** [qemu-system-mips64el] Error 1
| make: *** [subdir-mips64el-softmmu] Error 2
| /usr/lib/gcc/x86_64-redhat-linux/4.4.4/../../../../lib64/libgnutls.so: 
undefined reference to `gcry_cipher_setkey@GCRYPT_1.2'
| /usr/lib/gcc/x86_64-redhat-linux/4.4.4/../../../../lib64/libgnutls.so: 
undefined reference to `gcry_cipher_setiv@GCRYPT_1.2'
| collect2: ld returned 1 exit status
| make[1]: *** [qemu-system-mipsel] Error 1
| make: *** [subdir-mipsel-softmmu] Error 2
| FATAL: oe_runmake failed
NOTE: package qemu-native-0.12.5-r0: task do_compile: Failed


