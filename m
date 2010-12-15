Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vadmium@gmail.com>) id 1PSnQv-0004YE-Lr
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Dec 2010 10:14:02 +0100
Received: by wwi17 with SMTP id 17so1215370wwi.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Dec 2010 01:12:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:sender:received
	:in-reply-to:references:date:x-google-sender-auth:message-id:subject
	:from:to:content-type;
	bh=mxS3w5VHpJj3LA9YCdRXhWzgDzE3Yj9/lGjgBJK7BhE=;
	b=WGGLujCzCeYBWfR63oTFebq/S2Wioxy0kVuMhNEQwDJdqnBt/Fbe2D1/JtKpqCgqSQ
	ST/YRSSuXzSwuYkMz82gtjy9TLjlYG51A7WirHioBcAtnXN0EMTSLxNOUM6LpFd6miGt
	HH+kj3Y8Ov7QW6guWIGZi4fA68TqLzFqAtt2E=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	b=v2BfhJdBr2+sdekXjXDgf9CGCMQeeRXpjQ2vqgnZzqgDyoUlS8QyGlHvU59aDNQclQ
	CRZauS3un9bJ/3cQz2EiFUNQ66P2e6YCvjPunef6BvmEumhXfUAyEwce/jNxVPlcOweI
	p4P3kzxq1ZU6QnLrJ6RjPOubyOAX1gLSpqOnM=
MIME-Version: 1.0
Received: by 10.216.70.83 with SMTP id o61mr45087wed.92.1292404344310; Wed, 15
	Dec 2010 01:12:24 -0800 (PST)
Sender: vadmium@gmail.com
Received: by 10.216.17.203 with HTTP; Wed, 15 Dec 2010 01:12:24 -0800 (PST)
In-Reply-To: <AANLkTimMz5m27fxSGVw-YyOAH2=Wbye2Ug71mZ9t+py1@mail.gmail.com>
References: <AANLkTimMz5m27fxSGVw-YyOAH2=Wbye2Ug71mZ9t+py1@mail.gmail.com>
Date: Wed, 15 Dec 2010 09:12:24 +0000
X-Google-Sender-Auth: 3dtiPbc-y2K1qGl2_drgS6Uiqdo
Message-ID: <AANLkTinQRHzSyLwso9MBC2JDRd76056_T2Nutfedtrn_@mail.gmail.com>
From: Martin Panter <vadmium+floss@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: vadmium@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Stop Libtool relinking against host's /usr/lib (file format not recognised)
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
X-List-Received-Date: Wed, 15 Dec 2010 09:14:02 -0000
Content-Type: text/plain; charset=UTF-8

On 15/12/2010, Martin Panter <vadmium+floss@gmail.com> wrote:
> So far in my attempt to build Angstrom for my Beagle board I've found
> two instances where Libtool is trying to "relink" against host
> libraries.
>
> The first looks like it's already been fixed in the past with a patch
> to Libtool (recipes/libtool/libtool-2.2.6b/cross_compile.patch), but
> at least for me that fix is being bypassed. The patch changes the
> ltmain.m4sh source file but in the Libtool tarball there is already an
> ltmain.sh generated file which seems to be used instead.
>
> It looks like running Libtool's "bootstrap" script regenerates
> libtool.sh, and I've changed my code to do this according to the
> attached "libtool-bootstrap.diff.txt".
>
> The second instance is with SDL which seems to provide its own Libtool
> script. It looks like Git commit
> a23202736001afe7f520ef64e2431d9f994130b8 (2010-11-14) removed a patch
> that previously fixed my problem, so I restored the relevant bit
> according to the attached "sdl-libtool-host-dir.diff.txt".
>
> The original problem that led me to this was that it was failing at a
> Free type "install" step. (And then later for the SDL install step.)
> For reference, the Free type messages were something like this,
> paraphrased to remove the ridiculously long path names:
>
> NOTE: make LIBTOOL=arm-angstrom-linux-gnueabi-libtool DESTDIR=${IMAGE}
> install
> . . .
> arm-angstrom-linux-gnueabi-libtool --mode=install
> ${SYS}/usr/bin/install -c ${OBJS}/libfreetype.la ${IMAGE}/usr/lib
> arm-angstrom-linux-gnueabi-libtool: install: warning: relinking
> `${OBJS}/libfreetype.la'
> arm-angstrom-linux-gnueabi-libtool: relink:
> arm-angstrom-linux-gnueabi-gcc . . . -L${SYS}/usr/lib
> -L${IMAGE}/usr/lib -L/usr/lib -lz . . .
> /usr/lib/libgcc_s.so: file not recognized: File format not recognized
>
> It turned out that on my host computer (Arch linux x68_64) I indeed
> have this /usr/lib/libgcc_s.so file. I temporarily moved it out of the
> way and the relink and install worked fine. The linker seemed to be
> trying to use that file because of the -L/usr/lib option passed to it,
> and one of the changes in cross_compile.patch removes that -L/usr/lib
> option.

PS: I think the same issue might be the cause of the problem mentioned
in the "gettext libtool ARM issue" thread. It also looks like it's
running a local version of Libtool, a -L/usr/lib option gets passed to
GCC, and then the "File format not recognized" error.
http://lists.linuxtogo.org/pipermail/openembedded-devel/2010-December/027797.html

> -Martin


