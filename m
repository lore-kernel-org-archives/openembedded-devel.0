Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PUD3A-0001gu-61
	for openembedded-devel@lists.openembedded.org;
	Sun, 19 Dec 2010 07:47:20 +0100
Received: by gyh20 with SMTP id 20so830642gyh.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Dec 2010 22:47:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=550XymH3v50tmPCI+Wlt/vrKAnOKbC8NGJy24wI2zTc=;
	b=dGI7fpUmDgL7iDaAACFbFUgS+wozkYAFVY507tmx5/aS6uHGg8CWEo8njDpxUShE+u
	gA1HVmSS4tRSw0oxGuKsZ4eUsXKzdNUD8ceDrRvOzIdRF+KG9pGpXmmyzNi7GonUr/ZR
	Wz3odIts1vZ5G1gx8iAkwxilhbb7JUoeOOKaY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=fL9rMkwS+YPHJyen19c5/1nCXFLCya2Gr/M5q8FTnhP8Ho2LY2wi+fI48DYI+5j6EV
	OmVJ07NavsqHsAZzajJ5UlF3jObp0EUkoc6MBcm3AGkugGul/cz6XBDuc3JY4ucKaOaZ
	rF5Zj7oCabNYLQnx5fdINcAu4otfvMLvhtRVs=
Received: by 10.90.97.19 with SMTP id u19mr4022041agb.166.1292741233768; Sat,
	18 Dec 2010 22:47:13 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.86.4 with HTTP; Sat, 18 Dec 2010 22:46:53 -0800 (PST)
In-Reply-To: <4D0C8BCC.9050800@eukrea.com>
References: <1292667009.12094.13.camel@mattotaupa>
	<4D0C8BCC.9050800@eukrea.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 18 Dec 2010 22:46:53 -0800
Message-ID: <AANLkTik2cV=NMv1=Xj1gd6pBaL-kVVo7=tUH9gmqTxCE@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: minimal{, -uclibc}: linux-omap-psp_2.6.32: task `do_compileconfigs` fails
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
X-List-Received-Date: Sun, 19 Dec 2010 06:47:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 18, 2010 at 2:24 AM, Eric B=C3=A9nard <eric@eukrea.com> wrote:
> Hi,
>
> On 18/12/2010 11:10, Paul Menzel wrote:
>>
>> Error: selected processor does not support ARM mode `smc #0'
>
> this seems to be a known problem with gcc 4.5 :
> https://bugs.launchpad.net/ubuntu/+source/gcc-4.5/+bug/669912
>
Eric

Its not a gcc problem to clarify. Its just that older compilers did
not differentiate security extentions presence.
http://kernel.ubuntu.com/git?p=3Dubuntu/ubuntu-natty.git;a=3Dcommitdiff;h=
=3D1ebe13dea156358f1044a7a755f02945ad3890e4;hp=3Df31ff7673ef77d04e74e1a1e45=
bb2940781f35f0

http://kernel.ubuntu.com/git?p=3Dubuntu/ubuntu-natty.git;a=3Dcommitdiff;h=
=3D99340d7b23f3df75d9b752fb25088a10064cd0a6;hp=3D9523bd6810e0229a8147e8c3d6=
498e2f40b38974

are the fixes you should apply to kernel.

> Eric
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


