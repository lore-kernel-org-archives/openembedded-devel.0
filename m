Return-Path: <uol@pengutronix.de>
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
	[85.220.165.71])
	by mail.openembedded.org (Postfix) with ESMTP id EF2CA7E68A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Jun 2019 13:29:27 +0000 (UTC)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
	by metis.ext.pengutronix.de with esmtps
	(TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
	(envelope-from <uol@pengutronix.de>)
	id 1hg7zM-0003DN-FE; Wed, 26 Jun 2019 15:29:28 +0200
Received: from uol by dude.hi.pengutronix.de with local (Exim 4.92)
	(envelope-from <uol@pengutronix.de>)
	id 1hg7zK-0002XT-P8; Wed, 26 Jun 2019 15:29:26 +0200
References: <6ry31owmw8.fsf@pengutronix.de>
User-agent: mu4e 1.1.0; emacs 26.1
From: Ulrich =?utf-8?Q?=C3=96lmann?= <u.oelmann@pengutronix.de>
To: openembedded-devel@lists.openembedded.org
In-reply-to: <6ry31owmw8.fsf@pengutronix.de>
Date: Wed, 26 Jun 2019 15:29:26 +0200
Message-ID: <6rv9wswk3t.fsf@pengutronix.de>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: uol@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
	SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-devel@lists.openembedded.org
Cc: Maksim Sisov <msisov@igalia.com>, Denis Carikli <denis@eukrea.com>,
	Raphael Kubo da Costa <raphael.kubo.da.costa@intel.com>,
	Eric =?utf-8?Q?B=C3=A9nard?= <eric@eukrea.com>,
	=?utf-8?Q?S=C3=B8ren?= Andersen <san@skov.dk>
Subject: Re: [meta-browser] host leaking wayland-scanner?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 26 Jun 2019 13:29:28 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Again it's me with another small question regarding meta-browser's
maintainership - I got the following back from our mail delivery system:

    From: Mail Delivery System <Mailer-Daemon@pengutronix.de>
    To: uol@pengutronix.de
    Subject: Mail delivery failed: returning message to sender
    Date: Wed 26.06.2019
    Flags: seen
    Maildir: /
    Message-Id: E1hg7dM-00010M-3n@metis.ext.pengutronix.de
    Attachments: [1]Re- [meta-browser] host leaking wayland-scanner?.eml

    This message was created automatically by mail delivery software.

    A message that you sent could not be delivered to one or more of its
    recipients. This is a permanent error. The following address(es) failed:

      denis@eukrea.com
        host mx1.ovh.net [188.165.47.122]
        SMTP error from remote mail server after RCPT TO:<denis@eukrea.com>:
        554 5.7.1 <denis@eukrea.com>: Relay access denied
      eric@eukrea.com
        host mx1.ovh.net [188.165.47.122]
        SMTP error from remote mail server after RCPT TO:<eric@eukrea.com>:
        554 5.7.1 <eric@eukrea.com>: Relay access denied

Are Denis Carikli and Eric B=C3=A9nard still actively maintaining meta-
browser? (Their last commits are from 2012-07-12 and 2013-03-08
respectively). As both are listed as maintainers in [6] I would like to
ask if a patch to update the README file is welcome? Are there other
maintainers that shall be listed there instead?

Best regards
Ulrich


[6] https://github.com/OSSystems/meta-browser/blob/master/README

On Wed, Jun 26 2019 at 14:29 +0200, Ulrich =C3=96lmann <u.oelmann@pengutron=
ix.de> wrote:
> Hi developers of meta-browser,
>
> while building meta-browser's latest chromium-ozone-wayland recipe (my
> meta-browser's current state is [1], integrated into a customer's thud
> based Yocto-BSP) I faced the following problem (excerpt from log.do_com-
> pile)
>
>   [9109/37430] python ../../third_party/wayland/wayland_scanner_wrapper.p=
y third_party/wayland-protocols/src/unstable/linux-dmabuf/linux-dmabuf-unst=
able-v1.xml --src-root ../../ --root-gen-dir gen --cmd /usr/bin/wayland-sca=
nner
>   FAILED: gen/third_party/wayland-protocols/src/unstable/linux-dmabuf/lin=
ux-dmabuf-unstable-v1-protocol.c gen/third_party/wayland-protocols/src/unst=
able/linux-dmabuf/linux-dmabuf-unstable-v1-client-protocol.h gen/third_part=
y/wayland-protocols/src/unstable/linux-dmabuf/linux-dmabuf-unstable-v1-serv=
er-protocol.h
>   python ../../third_party/wayland/wayland_scanner_wrapper.py third_party=
/wayland-protocols/src/unstable/linux-dmabuf/linux-dmabuf-unstable-v1.xml -=
-src-root ../../ --root-gen-dir gen --cmd /usr/bin/wayland-scanner
>   Traceback (most recent call last):
>     File "../../third_party/wayland/wayland_scanner_wrapper.py", line 48,=
 in <module>
>       main(sys.argv)
>     File "../../third_party/wayland/wayland_scanner_wrapper.py", line 40,=
 in main
>       generate_code(cmd, "code", protocol_path, out_base_name + "-protoco=
l.c")
>     File "../../third_party/wayland/wayland_scanner_wrapper.py", line 18,=
 in generate_code
>       ret =3D subprocess.call([wayland_scanner_cmd, code_type, path_in, p=
ath_out])
>     File "<UNDISCLOSED_PATH>/build/YOCTO.BSP/tmp/work/cortexa9hf-neon-pmc=
-linux-gnueabi/chromium-ozone-wayland/75.0.3770.100-r0/recipe-sysroot-nativ=
e/usr/lib/python2.7/subprocess.py", line 172, in call
>       return Popen(*popenargs, **kwargs).wait()
>     File "<UNDISCLOSED_PATH>/build/YOCTO.BSP/tmp/work/cortexa9hf-neon-pmc=
-linux-gnueabi/chromium-ozone-wayland/75.0.3770.100-r0/recipe-sysroot-nativ=
e/usr/lib/python2.7/subprocess.py", line 394, in __init__
>       errread, errwrite)
>     File "<UNDISCLOSED_PATH>/build/YOCTO.BSP/tmp/work/cortexa9hf-neon-pmc=
-linux-gnueabi/chromium-ozone-wayland/75.0.3770.100-r0/recipe-sysroot-nativ=
e/usr/lib/python2.7/subprocess.py", line 1047, in _execute_child
>       raise child_exception
>   OSError: [Errno 2] No such file or directory
>
> which seems to come from my build host not providing '/usr/bin/wayland-
> scanner' and which suggests that we have a host tool leakage here. This
> all originally results from Chromium's commit [2], particularly [3].
>
> Unfortunately up to now I am not familiar with Google's build tool 'GN'
> (see [4]), so I can't present a solution straightaway. But I would like
> to start working on a patch now, hence my questions are:
>
>   - did anyone notice the same issue?
>   - is my analysis correct that [3] has to be patched somehow and the
>     recipe [5] lacks a dependency on wayland-native?
>
> Best regards
> Ulrich
>
>
> P.S.: Sending this message a second time as I have not been subscribed
> to the oe-devel list before so that the original mail got rejected.
>
>
> [1] e0d1e299d691 ("chromium: fix "pure virtual method called" problem.")
> [2] https://chromium.googlesource.com/chromium/src/+/a64f758399d26a1c80ab=
0d3dfecee3abf0714305
>     a64f758399d2 ("Run wayland-scanner as part of build")
> [3] https://chromium.googlesource.com/chromium/src/+/a64f758399d26a1c80ab=
0d3dfecee3abf0714305/third_party/wayland/features.gni#12
> [4] https://gn.googlesource.com/gn/
> [5] https://github.com/OSSystems/meta-browser/blob/master/recipes-browser=
/chromium/chromium-ozone-wayland_75.0.3770.100.bb
--=20
Pengutronix e.K.                           | Ulrich =C3=96lmann            =
   |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

