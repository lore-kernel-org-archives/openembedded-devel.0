Received: from mail-iw0-f179.google.com ([209.85.223.179])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Njzet-0004sW-5G
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Feb 2010 19:39:02 +0100
Received: by iwn9 with SMTP id 9so3578850iwn.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Feb 2010 10:36:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=sXX65WB2eKBj+K9S+PlolCrpSc/Vb+2HCkChPTx1V74=;
	b=S2SITlLqXAwc2MJIsP5gHImHkXi6/Fo8Ub2f5UsbnnGwtk+jbRq9m8ef8+5bm5+e92
	+Zitocby+n4IvaZP0cN1VvVzVY6jxIZOpMk5PB65DIPQnr/XRguB9+nf9Iq4zqxfLyOc
	qSZoUaSc989jOlOOEXJizue6/y1noktO08db8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=pmoi2on0Lf54VvjC5Ojw2ovq2BIL2TOMz0o4Eua/MlNgBkgIbvw7wDaHJItLLNHfSH
	4QRp88+yIxCNOSUYL0BcWysH/RxMkI0FLVCMzDYvTSa7tBU7ycWeIx3OQ+xjJWx5s0fF
	gkSZ+m/TMH2iVP5njxg9sROhz7StLJlrY4JeY=
MIME-Version: 1.0
Received: by 10.231.146.203 with SMTP id i11mr369605ibv.19.1266950173569; Tue, 
	23 Feb 2010 10:36:13 -0800 (PST)
In-Reply-To: <f96d234e1002230827y25028493l7f25ab05b6fbac76@mail.gmail.com>
References: <f96d234e1002230827y25028493l7f25ab05b6fbac76@mail.gmail.com>
Date: Tue, 23 Feb 2010 10:36:13 -0800
Message-ID: <19c1b8a91002231036u46b1b35andf9fb71345805669@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.179
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: gettext native failure
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
X-List-Received-Date: Tue, 23 Feb 2010 18:39:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 23, 2010 at 8:27 AM, Cliff Brake <cliff.brake@gmail.com> wrote:
> make[4]: Entering directory
> `/scratch/oe/oe-from-scratch/tmp/work/x86_64-linux/gettext-native-0.17-r5=
/gettext-0.17/gettext-tools/src'
> =E2=88=98 /bin/sh ../x86_64-linux-libtool --tag=3DCC =C2=A0 --mode=3Dlink=
 gcc
> -std=3Dgnu99 =C2=A0-isystem/scratch/oe/oe-from-scratch/tmp/staging/x86_64=
-linux/usr/include
> -O2 -g =C2=A0-L/scratch/oe/oe-from-scratch/tmp/staging/x86_64-linux/usr/l=
ib
> -Wl,-rpath-link,/scratch/oe/oe-from-scratch/tmp/staging/x86_64-linux/usr/=
lib
> -Wl,-rpath,/scratch/oe/oe-from-scratch/tmp/staging/x86_64-linux/usr/lib
> -Wl,-O1 -o msgcmp msgcmp-msgcmp.o libgettextsrc.la
> =E2=88=98 x86_64-linux-libtool: link: gcc -std=3Dgnu99
> -isystem/scratch/oe/oe-from-scratch/tmp/staging/x86_64-linux/usr/include
> -O2 -g -Wl,-rpath-link
> -Wl,/scratch/oe/oe-from-scratch/tmp/staging/x86_64-linux/usr/lib
> -Wl,-rpath -Wl,/scratch/oe/oe-from-scratch/tmp/staging/x86_64-linux/usr/l=
ib
> -Wl,-O1 -o .libs/msgcmp msgcmp-msgcmp.o
> -L/scratch/oe/oe-from-scratch/tmp/staging/x86_64-linux/usr/lib
> ./.libs/libgettextsrc.so
> /scratch/oe/oe-from-scratch/tmp/work/x86_64-linux/gettext-native-0.17-r5/=
gettext-0.17/gettext-tools/gnulib-lib/.libs/libgettextlib.so
> /usr/lib/libcroco-0.6.so /usr/lib/libglib-2.0.so -lncurses -lc
> -Wl,-rpath -Wl,/scratch/oe/oe-from-scratch/tmp/staging/x86_64-linux/usr/l=
ib
> =E2=88=98 /usr/lib64/libxml2.so.2: undefined reference to `gzopen64'
> =E2=88=98 collect2: ld returned 1 exit status
>
> http://bugs.openembedded.org/show_bug.cgi?id=3D2679
>
> http://bugs.openembedded.org/show_bug.cgi?id=3D5139
>
> Looks like a classic case of using the staging libz, but libxml2 from
> the host. =C2=A0It appears that libxml2 cannot be built in OE until gette=
xt
> is built. =C2=A0Any thoughts on this one?


http://patchwork.openembedded.org/patch/185/

and then more detailed explanation is here
http://article.gmane.org/gmane.comp.handhelds.openembedded/22700/match=3Dli=
bxml2

IIRC when I tested it. It was not happening with gcc 4.4.x
Which version of gcc do you have on your build box.

>
> Thanks,
> Cliff
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


