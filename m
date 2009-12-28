Received: from mail-iw0-f194.google.com ([209.85.223.194])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NPKkD-0002x8-Lk
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Dec 2009 19:55:08 +0100
Received: by iwn32 with SMTP id 32so7067387iwn.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Dec 2009 10:53:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=/0niuRono3vyeJZowvPUrcKW8+5uk61DYhkAvMlsvt8=;
	b=h++E1W2rFqn3Yh+csgYeacv6CI/Jc9JVfxQaxfuA4J2cW/W84oQFuWAnSVAhmt3zeS
	EfiIg/Z4+gQmRF7q/cmubqefGkKCC3S+2dg5reHZ05gZTvglYAZ62DkSihjXrfe9zOT2
	na3K3p0O4PPNXEMl0WKbIXSH/k4VL3sCuufjI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=QojqgouchUgpa8NYJO6Wn4Th1tteJ4sbicSzr/uaiTgblzEY3vMnn9b4tzYBQl+DJQ
	0PNdlc4k4S5PeowRqOSZtrsqizyV2hqRuI4ql/0QDVOzQ514fPShXNLviOXlPTABIdQL
	WXqS4969Sy3g8EvncfP6068kN2n5W34TYGPhg=
MIME-Version: 1.0
Received: by 10.231.167.212 with SMTP id r20mr5649862iby.7.1262026387992; Mon, 
	28 Dec 2009 10:53:07 -0800 (PST)
In-Reply-To: <op.u5mp87ximn1qzu@guohr-laptop-ubuntu>
References: <op.u5mp87ximn1qzu@guohr-laptop-ubuntu>
Date: Mon, 28 Dec 2009 10:53:07 -0800
Message-ID: <19c1b8a90912281053u2ebb8e62k313b1c41f99462f6@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.194
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: compilation of gcc-cross-intermediate-4.4.2 failed due to lack of fenv.h
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
X-List-Received-Date: Mon, 28 Dec 2009 18:55:08 -0000
X-Groupsio-MsgNum: 15263
Content-Type: multipart/mixed; boundary=001636c5a4bd8db4fb047bce6a09

--001636c5a4bd8db4fb047bce6a09
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 27, 2009 at 7:49 PM, Guo Hongruan <camelguo@gmail.com> wrote:
> Hi guys,
> =C2=A0 I found a build error when building openembedded using:
> 1. MACHINE =3D qemux86 DISTRO=3Dmicro-uclibc, see the follow url for deta=
iled.
> http://tinderbox.openembedded.net/packages/391641/
> 2. MACHINE =3D qemux86 DISTRO=3Dminimal-uclibc, see the following url for
> detailed
> http://tinderbox.openembedded.net/packages/391427/
>
> It seems that the comiler can not find the fenv.h which should be provide=
d
> by uclibc.
>
> /media/work-disk/workdir/oe-qemux86-micro-uclibc/work/i686-oe-linux-uclib=
c/gcc-cross-intermediate-4.4.2-r1.1/gcc-4.4.2/libgcc/config/libbid/bid_deci=
mal_globals.c:47:18:
> error: fenv.h: No such file or directory
>
> Any advice is welcome.

You can add --disable-decimal-float to the configure options if its missing=
.
try the attached patch.

or you can enable UCLIBC_HAS_FENV in the uclibc config file.

--001636c5a4bd8db4fb047bce6a09
Content-Type: application/octet-stream; name=diff
Content-Disposition: attachment; filename=diff
Content-Transfer-Encoding: base64
X-Attachment-Id: f_g3rlx9r00

ZGlmZiAtLWdpdCBhL3JlY2lwZXMvZ2NjL2djYy00LjQuMi5pbmMgYi9yZWNpcGVzL2djYy9nY2Mt
NC40LjIuaW5jCmluZGV4IDFlZjEzNTkuLjBjOWYzYzQgMTAwNjQ0Ci0tLSBhL3JlY2lwZXMvZ2Nj
L2djYy00LjQuMi5pbmMKKysrIGIvcmVjaXBlcy9nY2MvZ2NjLTQuNC4yLmluYwpAQCAtMzMsNCAr
MzMsNyBAQCBFWFRSQV9PRUNPTkZfQkFTRSA9ICIgLS1lbmFibGUtbGlic3NwIFwKIAkJICAgICAg
LS1kaXNhYmxlLWJvb3RzdHJhcCAtLWRpc2FibGUtbGliZ29tcCBcCiAJCSAgICAgIC0tZGlzYWJs
ZS1saWJtdWRmbGFwIgogCi1FWFRSQV9PRUNPTkZfYXBwZW5kX2xpbnV4LXVjbGliYyA9ICIgJHtA
YmFzZV9jb250YWlucygnVEFSR0VUX0FSQ0gnLCAncG93ZXJwYycsICctLWRpc2FibGUtZGVjaW1h
bC1mbG9hdCAtLXdpdGhvdXQtbG9uZy1kb3VibGUtMTI4JywgJycsZCl9IgorRVhUUkFfT0VDT05G
X2FwcGVuZF9saW51eC11Y2xpYmMgPSAiIC0tZGlzYWJsZS1kZWNpbWFsLWZsb2F0ICIKK0VYVFJB
X09FQ09ORl9hcHBlbmRfbGludXgtdWNsaWJjZWFiaSA9ICIgLS1kaXNhYmxlLWRlY2ltYWwtZmxv
YXQgIgorRVhUUkFfT0VDT05GX2FwcGVuZF9saW51eC11Y2xpYmNzcGUgPSAiIC0tZGlzYWJsZS1k
ZWNpbWFsLWZsb2F0ICIKK0VYVFJBX09FQ09ORl9hcHBlbmRfbGludXgtdWNsaWJjID0gIiAke0Bi
YXNlX2NvbnRhaW5zKCdUQVJHRVRfQVJDSCcsICdwb3dlcnBjJywgJy0td2l0aG91dC1sb25nLWRv
dWJsZS0xMjgnLCAnJyxkKX0iCg==

--001636c5a4bd8db4fb047bce6a09--
