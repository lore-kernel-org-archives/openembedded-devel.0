Received: from mail-ww0-f47.google.com ([74.125.82.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <nazgee@gmail.com>) id 1NpH38-0001Bm-UX
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Mar 2010 09:13:51 +0100
Received: by wwb31 with SMTP id 31so3678883wwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Mar 2010 00:10:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=UrrEJ7WK9Ecba3AzkdwRmtHLFMi/qB+Ty5mdvyqfEC8=;
	b=m7ZQxkhFK+10NGyZ0gECM8dm0M+ruE8HLRGNFcpcOGbH1j7IXJDp80oZhQXNAMGwbi
	2av7NOzIyel7vYwJaHf8IN6A9jbnwLjaQzb/gnKLSwEsXjyCC7lSn4dR+Y3toWWHxcFm
	/l3gJggwqucUu69Bgl0EQGmaTaeEd/CtZRiDE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=tty/K62EP7akt71WfWfwaYpiBDWpyLrMajZZN6LQ8YodaSXXFe/gRr6xZkBDudPl/L
	pLiDe/Qv/5lpAgHv7DcWcldKV78pLzfiCELqxJAyqiJrcUbFh/rKBSdtnbkj7Wn/F839
	S3wAeTcb9FRljAxKiahy+Z7dA9NUZftkANtTI=
MIME-Version: 1.0
Received: by 10.216.171.207 with SMTP id r57mr659683wel.146.1268208653800; 
	Wed, 10 Mar 2010 00:10:53 -0800 (PST)
In-Reply-To: <13c1beb11002250321g6099bc44oebd182fa8c4f8d1c@mail.gmail.com>
References: <13c1beb11002250321g6099bc44oebd182fa8c4f8d1c@mail.gmail.com>
Date: Wed, 10 Mar 2010 09:10:53 +0100
Message-ID: <13c1beb11003100010l6d97c26bs51faaa0dfa74d118@mail.gmail.com>
From: Michal Stawinski <nazgee@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.47
X-SA-Exim-Mail-From: nazgee@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH][mtd-utils][how to] Numonyx chip support
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
X-List-Received-Date: Wed, 10 Mar 2010 08:13:52 -0000
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable

Can anyone help me on this, please?
I am really into doing some more work, though I need your help to do this.
I've tried some googling and messing around with bb files, but I am more of
a C coder, and scripting/tools are not really my thing. Any help would be
apprecieated.

Maybe it is wrong mailing-list- should I be writing somewhere else?

TIA, Michal Stawinski

2010/2/25 Micha=B3 Stawinski <nazgee@gmail.com>

> Hi all,
> I am a newb in working with open projects, so please take it easy if I'll
> do something wrong.
>
> Below (and in the attachment) is "git format-patch" output.
> It introduces support for Numonyx memories, that have oobsize=3D64 and
> pagesize=3D4096, that are used e.g. in OMAP3, igep0020b machine.
>
> Solution is very straightforward, though you'll probably reject my patch,
> as diff contains full path to files that i altered (not relative to
> mtd-utils). I hope however, that you can tell me how to generate patches =
for
> sepcific packages correctly, so it won't contain whole path (e.g.
> a/build/tmp-igep0020/work/armv7a-angstrom-linux-gnueabi/mtd-utils-1.3.1-r=
0/git/nanddump.c)
>
> That is how I've done it:
> - "git pull"      //to update oe dev branch
> - bitbake mtd-utils      //to get *.c files refreshed
> - git checkout -b mtd_utils      //to create my new development branch
> - git add
> build/tmp-igep0020/work/armv7a-angstrom-linux-gnueabi/mtd-utils-1.3.1-r0/=
git/nanddump.c
> //to add files I am going to alter
> - git commit     //to create a starting point for my development
> - :::editing=3D>compiling=3D>testing:::
> - git commit     //to check in changes I've made
> - git format-patch HEAD^     //to create patch from changes I've made
>
> What am I doing wrong? Sources of packages like mitd-utils are not added =
to
> .git repository in OE tree, and when I add it manually to it (as above), =
and
> then create patch, whole path relative to OR root is generated, which mak=
es
> my patch useles to other builds than the one I did (IGEPv2).
>
> I really'd like to contribute, but I can't find any how-to realted to *.c
> sources editing (*.bb editing is straightforward, as these files are alre=
ady
> in oe git tree).
>
> //=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> ---
>  .../mtd-utils-1.3.1-r0/git/nanddump.c              |    1 +
>  .../mtd-utils-1.3.1-r0/git/nandwrite.c             |    1 +
>  2 files changed, 2 insertions(+), 0 deletions(-)
>
> diff --git
> a/build/tmp-igep0020/work/armv7a-angstrom-linux-gnueabi/mtd-utils-1.3.1-r=
0/git/nanddump.c
> b/build/tmp-igep0020/work/armv7a-angstrom-linux-gnueabi/mtd-utils-1.3.1-r=
0/git/nanddump.c
> index 6926c66..dfc15de 100644
> ---
> a/build/tmp-igep0020/work/armv7a-angstrom-linux-gnueabi/mtd-utils-1.3.1-r=
0/git/nanddump.c
> +++
> b/build/tmp-igep0020/work/armv7a-angstrom-linux-gnueabi/mtd-utils-1.3.1-r=
0/git/nanddump.c
> @@ -210,6 +210,7 @@ int main(int argc, char * const argv[])
>
>      /* Make sure device page sizes are valid */
>      if (!(meminfo.oobsize =3D=3D 128 && meminfo.writesize =3D=3D 4096) &=
&
> +            !(meminfo.oobsize =3D=3D 64 && meminfo.writesize =3D=3D 4096=
) &&
>              !(meminfo.oobsize =3D=3D 64 && meminfo.writesize =3D=3D 2048=
) &&
>              !(meminfo.oobsize =3D=3D 32 && meminfo.writesize =3D=3D 1024=
) &&
>              !(meminfo.oobsize =3D=3D 16 && meminfo.writesize =3D=3D 512)=
 &&
> diff --git
> a/build/tmp-igep0020/work/armv7a-angstrom-linux-gnueabi/mtd-utils-1.3.1-r=
0/git/nandwrite.c
> b/build/tmp-igep0020/work/armv7a-angstrom-linux-gnueabi/mtd-utils-1.3.1-r=
0/git/nandwrite.c
> index b77edd6..bd45879 100644
> ---
> a/build/tmp-igep0020/work/armv7a-angstrom-linux-gnueabi/mtd-utils-1.3.1-r=
0/git/nandwrite.c
> +++
> b/build/tmp-igep0020/work/armv7a-angstrom-linux-gnueabi/mtd-utils-1.3.1-r=
0/git/nandwrite.c
> @@ -294,6 +294,7 @@ int main(int argc, char * const argv[])
>      if (!(meminfo.oobsize =3D=3D 16 && meminfo.writesize =3D=3D 512) &&
>              !(meminfo.oobsize =3D=3D 8 && meminfo.writesize =3D=3D 256) =
&&
>              !(meminfo.oobsize =3D=3D 64 && meminfo.writesize =3D=3D 2048=
) &&
> +            !(meminfo.oobsize =3D=3D 64 && meminfo.writesize =3D=3D 4096=
) &&
>              !(meminfo.oobsize =3D=3D 128 && meminfo.writesize =3D=3D 409=
6)) {
>          fprintf(stderr, "Unknown flash (not normal NAND)\n");
>          close(fd);
> --
> 1.6.3.3
>

