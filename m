Received: from mail-bw0-f50.google.com ([209.85.214.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Ps4st-0007mr-BI
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Feb 2011 03:55:23 +0100
Received: by bwz2 with SMTP id 2so3044597bwz.9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Feb 2011 18:54:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:date:x-google-sender-auth
	:message-id:subject:from:to:content-type;
	bh=gIbKX9zPHfzOfVh0+DSuWnybs0OvB+1mS/j/FSGnnbM=;
	b=YQAAuHrj04JcXk9XawuPzx4pfKBsSujgHaoM+7+xx38TIc+6m70wZFZJ1+ov0mCDlr
	NrCYUYU70Kjst2qtVRuD8HlNgvvTIK87jjp8j/cXMlMW/Gh8xiH2vGobUzukZo4XZ6QH
	ZUZyhI8BDz/ZzPYTBXK2mIXChz60CVR4emB18=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type;
	b=CO/NK0FF24sR7/Ew3u4OElN0yn2O5r1r2uFE0o/wqO8nLxoSqposHLzBYIxmQ/lKgW
	vcM9SyJa2lXM2EzLW6x4GVES1lLNqZx7HacHWS8txssf+4rni1HuBaiBhgSxPt5Dw2tj
	69fqEzLsgBpIlfJeXrv18z2bpzJKBDOC20+ig=
MIME-Version: 1.0
Received: by 10.204.15.83 with SMTP id j19mr3077194bka.105.1298429642751; Tue,
	22 Feb 2011 18:54:02 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.119.207 with HTTP; Tue, 22 Feb 2011 18:54:02 -0800 (PST)
Date: Wed, 23 Feb 2011 02:54:02 +0000
X-Google-Sender-Auth: B6MHkK5bZ0X62GjQrMCmU6RqD8k
Message-ID: <AANLkTimGuqfEAYzvk3+4aH=rPWHb=Q2gNY4zWLwhAuRi@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: libcap2 build failure
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
X-List-Received-Date: Wed, 23 Feb 2011 02:55:23 -0000
X-Groupsio-MsgNum: 29581
Content-Type: multipart/mixed; boundary=00032555adf29f3fbc049cea354c

--00032555adf29f3fbc049cea354c
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello,

Today I tryed to build from scratch with current OE and found this:


| i586-oe-linux-gcc -march=3Dpentium -fexpensive-optimizations
-fomit-frame-pointer -frename-registers -Os
-I/home/otavio/hacking/embedded-linux/tmp/work/i586-oe-linux/libcap2-2.16-r=
3/libcap-2.16/libcap/include
-Dlinux -fPIC -Wall -Wwrite-strings -Wpointer-arith -Wcast-qual
-Wcast-align -Wstrict-prototypes -Wmissing-prototypes -Wnested-externs
-Winline -Wshadow -g
-I/home/otavio/hacking/embedded-linux/tmp/work/i586-oe-linux/libcap2-2.16-r=
3/libcap-2.16/libcap/include
-I/home/otavio/hacking/embedded-linux/tmp/work/i586-oe-linux/libcap2-2.16-r=
3/libcap-2.16/libcap/include
-Dlinux -fPIC -Wall -Wwrite-strings -Wpointer-arith -Wcast-qual
-Wcast-align -Wstrict-prototypes -Wmissing-prototypes -Wnested-externs
-Winline -Wshadow -g
-I/home/otavio/hacking/embedded-linux/tmp/work/i586-oe-linux/libcap2-2.16-r=
3/libcap-2.16/progs/../libcap/include
-I/home/otavio/hacking/embedded-linux/tmp/work/i586-oe-linux/libcap2-2.16-r=
3/libcap-2.16/progs/../libcap/include
-c capsh.c -o capsh.o
| In file included from
/home/otavio/hacking/embedded-linux/tmp/sysroots/i586-oe-linux/usr/include/=
bits/sigcontext.h:28:0,
|                  from
/home/otavio/hacking/embedded-linux/tmp/sysroots/i586-oe-linux/usr/include/=
signal.h:339,
|                  from
/home/otavio/hacking/embedded-linux/tmp/sysroots/i586-oe-linux/usr/include/=
sys/wait.h:31,
|                  from capsh.c:19:
| /home/otavio/hacking/embedded-linux/tmp/sysroots/i586-oe-linux/usr/includ=
e/asm/sigcontext.h:28:2:
error: expected specifier-qualifier-list before '__u64'
| /home/otavio/hacking/embedded-linux/tmp/sysroots/i586-oe-linux/usr/includ=
e/asm/sigcontext.h:191:2:
error: expected specifier-qualifier-list before '__u64'
| make[1]: *** [capsh.o] Error 1
| make[1]: Leaving directory
`/home/otavio/hacking/embedded-linux/tmp/work/i586-oe-linux/libcap2-2.16-r3=
/libcap-2.16/progs'

I am attaching the full log. Someone has any clue?

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br

--00032555adf29f3fbc049cea354c
Content-Type: application/octet-stream; name="log.do_compile.8294"
Content-Disposition: attachment; filename="log.do_compile.8294"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_gkhngppx0

KyBkb19jb21waWxlCisgYmFzZV9kb19jb21waWxlCisgJ1snIC1lIE1ha2VmaWxlIC1vIC1lIG1h
a2VmaWxlIC1vIC1lIEdOVW1ha2VmaWxlICddJworIG9lX3J1bm1ha2UKKyBvZW5vdGUgbWFrZSAt
aiA0IFNZU1RFTV9IRUFERVJTPS9ob21lL290YXZpby9oYWNraW5nL2VtYmVkZGVkLWxpbnV4L3Rt
cC9zeXNyb290cy9pNTg2LW9lLWxpbnV4L3Vzci9pbmNsdWRlCisgZWNobyBOT1RFOiAnbWFrZSAt
aiA0IFNZU1RFTV9IRUFERVJTPS9ob21lL290YXZpby9oYWNraW5nL2VtYmVkZGVkLWxpbnV4L3Rt
cC9zeXNyb290cy9pNTg2LW9lLWxpbnV4L3Vzci9pbmNsdWRlJwpOT1RFOiBtYWtlIC1qIDQgU1lT
VEVNX0hFQURFUlM9L2hvbWUvb3RhdmlvL2hhY2tpbmcvZW1iZWRkZWQtbGludXgvdG1wL3N5c3Jv
b3RzL2k1ODYtb2UtbGludXgvdXNyL2luY2x1ZGUKKyBtYWtlIC1qIDQgU1lTVEVNX0hFQURFUlM9
L2hvbWUvb3RhdmlvL2hhY2tpbmcvZW1iZWRkZWQtbGludXgvdG1wL3N5c3Jvb3RzL2k1ODYtb2Ut
bGludXgvdXNyL2luY2x1ZGUKbWFrZSAtQyBsaWJjYXAgYWxsCm1ha2VbMV06IEVudGVyaW5nIGRp
cmVjdG9yeSBgL2hvbWUvb3RhdmlvL2hhY2tpbmcvZW1iZWRkZWQtbGludXgvdG1wL3dvcmsvaTU4
Ni1vZS1saW51eC9saWJjYXAyLTIuMTYtcjMvbGliY2FwLTIuMTYvbGliY2FwJwptYWtlWzFdOiBO
b3RoaW5nIHRvIGJlIGRvbmUgZm9yIGBhbGwnLgptYWtlWzFdOiBMZWF2aW5nIGRpcmVjdG9yeSBg
L2hvbWUvb3RhdmlvL2hhY2tpbmcvZW1iZWRkZWQtbGludXgvdG1wL3dvcmsvaTU4Ni1vZS1saW51
eC9saWJjYXAyLTIuMTYtcjMvbGliY2FwLTIuMTYvbGliY2FwJwptYWtlIC1DIHBhbV9jYXAgYWxs
Cm1ha2VbMV06IEVudGVyaW5nIGRpcmVjdG9yeSBgL2hvbWUvb3RhdmlvL2hhY2tpbmcvZW1iZWRk
ZWQtbGludXgvdG1wL3dvcmsvaTU4Ni1vZS1saW51eC9saWJjYXAyLTIuMTYtcjMvbGliY2FwLTIu
MTYvcGFtX2NhcCcKbWFrZSB0ZXN0Y29tcGlsZQptYWtlWzJdOiBFbnRlcmluZyBkaXJlY3Rvcnkg
YC9ob21lL290YXZpby9oYWNraW5nL2VtYmVkZGVkLWxpbnV4L3RtcC93b3JrL2k1ODYtb2UtbGlu
dXgvbGliY2FwMi0yLjE2LXIzL2xpYmNhcC0yLjE2L3BhbV9jYXAnCm1ha2VbMl06IGB0ZXN0Y29t
cGlsZScgaXMgdXAgdG8gZGF0ZS4KbWFrZVsyXTogTGVhdmluZyBkaXJlY3RvcnkgYC9ob21lL290
YXZpby9oYWNraW5nL2VtYmVkZGVkLWxpbnV4L3RtcC93b3JrL2k1ODYtb2UtbGludXgvbGliY2Fw
Mi0yLjE2LXIzL2xpYmNhcC0yLjE2L3BhbV9jYXAnCm1ha2VbMV06IExlYXZpbmcgZGlyZWN0b3J5
IGAvaG9tZS9vdGF2aW8vaGFja2luZy9lbWJlZGRlZC1saW51eC90bXAvd29yay9pNTg2LW9lLWxp
bnV4L2xpYmNhcDItMi4xNi1yMy9saWJjYXAtMi4xNi9wYW1fY2FwJwptYWtlIC1DIHByb2dzIGFs
bAptYWtlWzFdOiBFbnRlcmluZyBkaXJlY3RvcnkgYC9ob21lL290YXZpby9oYWNraW5nL2VtYmVk
ZGVkLWxpbnV4L3RtcC93b3JrL2k1ODYtb2UtbGludXgvbGliY2FwMi0yLjE2LXIzL2xpYmNhcC0y
LjE2L3Byb2dzJwppNTg2LW9lLWxpbnV4LWdjYyAtbWFyY2g9cGVudGl1bSAtZmV4cGVuc2l2ZS1v
cHRpbWl6YXRpb25zIC1mb21pdC1mcmFtZS1wb2ludGVyIC1mcmVuYW1lLXJlZ2lzdGVycyAtT3Mg
LUkvaG9tZS9vdGF2aW8vaGFja2luZy9lbWJlZGRlZC1saW51eC90bXAvd29yay9pNTg2LW9lLWxp
bnV4L2xpYmNhcDItMi4xNi1yMy9saWJjYXAtMi4xNi9saWJjYXAvaW5jbHVkZSAtRGxpbnV4IC1m
UElDIC1XYWxsIC1Xd3JpdGUtc3RyaW5ncyAtV3BvaW50ZXItYXJpdGggLVdjYXN0LXF1YWwgLVdj
YXN0LWFsaWduIC1Xc3RyaWN0LXByb3RvdHlwZXMgLVdtaXNzaW5nLXByb3RvdHlwZXMgLVduZXN0
ZWQtZXh0ZXJucyAtV2lubGluZSAtV3NoYWRvdyAtZyAgLUkvaG9tZS9vdGF2aW8vaGFja2luZy9l
bWJlZGRlZC1saW51eC90bXAvd29yay9pNTg2LW9lLWxpbnV4L2xpYmNhcDItMi4xNi1yMy9saWJj
YXAtMi4xNi9saWJjYXAvaW5jbHVkZSAtSS9ob21lL290YXZpby9oYWNraW5nL2VtYmVkZGVkLWxp
bnV4L3RtcC93b3JrL2k1ODYtb2UtbGludXgvbGliY2FwMi0yLjE2LXIzL2xpYmNhcC0yLjE2L2xp
YmNhcC9pbmNsdWRlIC1EbGludXggLWZQSUMgLVdhbGwgLVd3cml0ZS1zdHJpbmdzIC1XcG9pbnRl
ci1hcml0aCAtV2Nhc3QtcXVhbCAtV2Nhc3QtYWxpZ24gLVdzdHJpY3QtcHJvdG90eXBlcyAtV21p
c3NpbmctcHJvdG90eXBlcyAtV25lc3RlZC1leHRlcm5zIC1XaW5saW5lIC1Xc2hhZG93IC1nICAt
SS9ob21lL290YXZpby9oYWNraW5nL2VtYmVkZGVkLWxpbnV4L3RtcC93b3JrL2k1ODYtb2UtbGlu
dXgvbGliY2FwMi0yLjE2LXIzL2xpYmNhcC0yLjE2L3Byb2dzLy4uL2xpYmNhcC9pbmNsdWRlIC1J
L2hvbWUvb3RhdmlvL2hhY2tpbmcvZW1iZWRkZWQtbGludXgvdG1wL3dvcmsvaTU4Ni1vZS1saW51
eC9saWJjYXAyLTIuMTYtcjMvbGliY2FwLTIuMTYvcHJvZ3MvLi4vbGliY2FwL2luY2x1ZGUgLWMg
Y2Fwc2guYyAtbyBjYXBzaC5vCkluIGZpbGUgaW5jbHVkZWQgZnJvbSAvaG9tZS9vdGF2aW8vaGFj
a2luZy9lbWJlZGRlZC1saW51eC90bXAvc3lzcm9vdHMvaTU4Ni1vZS1saW51eC91c3IvaW5jbHVk
ZS9iaXRzL3NpZ2NvbnRleHQuaDoyODowLAogICAgICAgICAgICAgICAgIGZyb20gL2hvbWUvb3Rh
dmlvL2hhY2tpbmcvZW1iZWRkZWQtbGludXgvdG1wL3N5c3Jvb3RzL2k1ODYtb2UtbGludXgvdXNy
L2luY2x1ZGUvc2lnbmFsLmg6MzM5LAogICAgICAgICAgICAgICAgIGZyb20gL2hvbWUvb3Rhdmlv
L2hhY2tpbmcvZW1iZWRkZWQtbGludXgvdG1wL3N5c3Jvb3RzL2k1ODYtb2UtbGludXgvdXNyL2lu
Y2x1ZGUvc3lzL3dhaXQuaDozMSwKICAgICAgICAgICAgICAgICBmcm9tIGNhcHNoLmM6MTk6Ci9o
b21lL290YXZpby9oYWNraW5nL2VtYmVkZGVkLWxpbnV4L3RtcC9zeXNyb290cy9pNTg2LW9lLWxp
bnV4L3Vzci9pbmNsdWRlL2FzbS9zaWdjb250ZXh0Lmg6Mjg6MjogZXJyb3I6IGV4cGVjdGVkIHNw
ZWNpZmllci1xdWFsaWZpZXItbGlzdCBiZWZvcmUgJ19fdTY0JwovaG9tZS9vdGF2aW8vaGFja2lu
Zy9lbWJlZGRlZC1saW51eC90bXAvc3lzcm9vdHMvaTU4Ni1vZS1saW51eC91c3IvaW5jbHVkZS9h
c20vc2lnY29udGV4dC5oOjE5MToyOiBlcnJvcjogZXhwZWN0ZWQgc3BlY2lmaWVyLXF1YWxpZmll
ci1saXN0IGJlZm9yZSAnX191NjQnCm1ha2VbMV06ICoqKiBbY2Fwc2gub10gRXJyb3IgMQptYWtl
WzFdOiBMZWF2aW5nIGRpcmVjdG9yeSBgL2hvbWUvb3RhdmlvL2hhY2tpbmcvZW1iZWRkZWQtbGlu
dXgvdG1wL3dvcmsvaTU4Ni1vZS1saW51eC9saWJjYXAyLTIuMTYtcjMvbGliY2FwLTIuMTYvcHJv
Z3MnCm1ha2U6ICoqKiBbYWxsXSBFcnJvciAyCisgZGllICdvZV9ydW5tYWtlIGZhaWxlZCcKKyBv
ZWZhdGFsICdvZV9ydW5tYWtlIGZhaWxlZCcKKyBlY2hvIEZBVEFMOiAnb2VfcnVubWFrZSBmYWls
ZWQnCkZBVEFMOiBvZV9ydW5tYWtlIGZhaWxlZAorIGV4aXQgMQo=

--00032555adf29f3fbc049cea354c--
