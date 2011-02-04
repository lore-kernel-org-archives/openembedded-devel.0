Received: from einhorn.in-berlin.de ([192.109.42.8] ident=root)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch.de>) id 1PlNUf-00089k-Kb
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Feb 2011 16:22:41 +0100
X-Envelope-From: sledz@dresearch.de
Received: from mobil-400-586.intern.dresearch.de
	(p57A227EA.dip0.t-ipconnect.de [87.162.39.234])
	(authenticated bits=0)
	by einhorn.in-berlin.de (8.13.6/8.13.6/Debian-1) with ESMTP id
	p14FLiYH001272
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Fri, 4 Feb 2011 16:21:44 +0100
Received: from mobil-400-586.intern.dresearch.de (localhost [IPv6:::1])
	by mobil-400-586.intern.dresearch.de (Postfix) with ESMTP id 62FE92E97E;
	Fri,  4 Feb 2011 16:21:43 +0100 (CET)
Message-ID: <4D4C1986.8090908@dresearch.de>
Date: Fri, 04 Feb 2011 16:21:42 +0100
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.16) Gecko/20101125 SUSE/3.0.11 Lightning/1.0b1
	Thunderbird/3.0.11
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTi=QkexH5odXt9-6a9SFe=hhyv=tsiBXOhHt-u9p@mail.gmail.com>
In-Reply-To: <AANLkTi=QkexH5odXt9-6a9SFe=hhyv=tsiBXOhHt-u9p@mail.gmail.com>
X-Scanned-By: MIMEDefang_at_IN-Berlin_e.V. on 192.109.42.8
Subject: Re: testing branch 2011-02-03
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
X-List-Received-Date: Fri, 04 Feb 2011 15:22:41 -0000
X-Groupsio-MsgNum: 28823
Content-Type: multipart/mixed; boundary="------------060707010009000502050505"

--------------060707010009000502050505
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02/04/2011 02:08 PM, Cliff Brake wrote:
> master has been merged to testing-next and is ready for clean builds.

My first try with the new branch and minimal-image failed configuring libtool-native-2.2.6b-r28.1 with a perl version mismatch error (see attached log). :(

Build Configuration:
BB_VERSION        = "1.10.2"
METADATA_BRANCH   = "testing-next"
METADATA_REVISION = "f06b04c"
TARGET_ARCH       = "arm"
TARGET_OS         = "linux-gnueabi"
MACHINE           = "hipox"
DISTRO            = "angstrom"
DISTRO_VERSION    = "2010.7-test-20110204"
TARGET_FPU        = "soft"

openSUSE 11.3 32-bit

Steffen

PS: Unfortunately oe-stats did not mentioned the problem and stayed in status "Started".


--------------060707010009000502050505
Content-Type: text/plain;
 name="log.do_configure.9630"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="log.do_configure.9630"

YXV0b21ha2UgKEdOVSBhdXRvbWFrZSkgMS4xMS4xCkNvcHlyaWdodCAoQykgMjAwOSBGcmVlIFNv
ZnR3YXJlIEZvdW5kYXRpb24sIEluYy4KTGljZW5zZSBHUEx2Mis6IEdOVSBHUEwgdmVyc2lvbiAy
IG9yIGxhdGVyIDxodHRwOi8vZ251Lm9yZy9saWNlbnNlcy9ncGwtMi4wLmh0bWw+ClRoaXMgaXMg
ZnJlZSBzb2Z0d2FyZTogeW91IGFyZSBmcmVlIHRvIGNoYW5nZSBhbmQgcmVkaXN0cmlidXRlIGl0
LgpUaGVyZSBpcyBOTyBXQVJSQU5UWSwgdG8gdGhlIGV4dGVudCBwZXJtaXR0ZWQgYnkgbGF3LgoK
V3JpdHRlbiBieSBUb20gVHJvbWV5IDx0cm9tZXlAcmVkaGF0LmNvbT4KICAgICAgIGFuZCBBbGV4
YW5kcmUgRHVyZXQtTHV0eiA8YWRsQGdudS5vcmc+LgpBVVRPViBpcyAxLjExCk5PVEU6IEV4ZWN1
dGluZyBhdXRvcmVjb25mIC0tdmVyYm9zZSAtLWluc3RhbGwgLS1mb3JjZSAtLWV4Y2x1ZGU9bGli
dG9vbGl6ZSAtSSAvaG9tZS9zbGVkei93b3JrL09FLXRlc3RpbmcvdG1wLjYvd29yay9pNjg2LWxp
bnV4L2xpYnRvb2wtbmF0aXZlLTIuMi42Yi1yMjguMS9saWJ0b29sLTIuMi42Yi90ZXN0cy8gLUkv
aG9tZS9zbGVkei93b3JrL09FLXRlc3RpbmcvdG1wLjYvc3lzcm9vdHMvaTY4Ni1saW51eC91c3Iv
c2hhcmUvYWNsb2NhbC0xLjExIC1JIC9ob21lL3NsZWR6L3dvcmsvT0UtdGVzdGluZy90bXAuNi9z
eXNyb290cy9pNjg2LWxpbnV4L3Vzci9zaGFyZS9hY2xvY2FsCmF1dG9yZWNvbmY6IEVudGVyaW5n
IGRpcmVjdG9yeSBgLicKYXV0b3JlY29uZjogY29uZmlndXJlLmFjOiBub3QgdXNpbmcgR2V0dGV4
dAphdXRvcmVjb25mOiBydW5uaW5nOiBhY2xvY2FsIC1JIC9ob21lL3NsZWR6L3dvcmsvT0UtdGVz
dGluZy90bXAuNi93b3JrL2k2ODYtbGludXgvbGlidG9vbC1uYXRpdmUtMi4yLjZiLXIyOC4xL2xp
YnRvb2wtMi4yLjZiL3Rlc3RzLyAtSSAvaG9tZS9zbGVkei93b3JrL09FLXRlc3RpbmcvdG1wLjYv
c3lzcm9vdHMvaTY4Ni1saW51eC91c3Ivc2hhcmUvYWNsb2NhbC0xLjExIC1JIC9ob21lL3NsZWR6
L3dvcmsvT0UtdGVzdGluZy90bXAuNi9zeXNyb290cy9pNjg2LWxpbnV4L3Vzci9zaGFyZS9hY2xv
Y2FsIC1JIC9ob21lL3NsZWR6L3dvcmsvT0UtdGVzdGluZy90bXAuNi93b3JrL2k2ODYtbGludXgv
bGlidG9vbC1uYXRpdmUtMi4yLjZiLXIyOC4xL2xpYnRvb2wtMi4yLjZiL3Rlc3RzLyAtSSAvaG9t
ZS9zbGVkei93b3JrL09FLXRlc3RpbmcvdG1wLjYvc3lzcm9vdHMvaTY4Ni1saW51eC91c3Ivc2hh
cmUvYWNsb2NhbC0xLjExIC1JIC9ob21lL3NsZWR6L3dvcmsvT0UtdGVzdGluZy90bXAuNi9zeXNy
b290cy9pNjg2LWxpbnV4L3Vzci9zaGFyZS9hY2xvY2FsIC0tZm9yY2UgLUkgbGlibHRkbC9tNAph
dXRvcmVjb25mOiBjb25maWd1cmUuYWM6IHRyYWNpbmcKYXV0b3JlY29uZjogcnVubmluZzogL2hv
bWUvc2xlZHovd29yay9PRS10ZXN0aW5nL3RtcC42L3N5c3Jvb3RzL2k2ODYtbGludXgvdXNyL2Jp
bi9hdXRvY29uZiAtLWluY2x1ZGU9L2hvbWUvc2xlZHovd29yay9PRS10ZXN0aW5nL3RtcC42L3dv
cmsvaTY4Ni1saW51eC9saWJ0b29sLW5hdGl2ZS0yLjIuNmItcjI4LjEvbGlidG9vbC0yLjIuNmIv
dGVzdHMvIC0taW5jbHVkZT0vaG9tZS9zbGVkei93b3JrL09FLXRlc3RpbmcvdG1wLjYvc3lzcm9v
dHMvaTY4Ni1saW51eC91c3Ivc2hhcmUvYWNsb2NhbC0xLjExIC0taW5jbHVkZT0vaG9tZS9zbGVk
ei93b3JrL09FLXRlc3RpbmcvdG1wLjYvc3lzcm9vdHMvaTY4Ni1saW51eC91c3Ivc2hhcmUvYWNs
b2NhbCAtLWZvcmNlIC0td2FybmluZ3M9Y3Jvc3MKYXV0b3JlY29uZjogcnVubmluZzogL2hvbWUv
c2xlZHovd29yay9PRS10ZXN0aW5nL3RtcC42L3N5c3Jvb3RzL2k2ODYtbGludXgvdXNyL2Jpbi9h
dXRvaGVhZGVyIC0taW5jbHVkZT0vaG9tZS9zbGVkei93b3JrL09FLXRlc3RpbmcvdG1wLjYvd29y
ay9pNjg2LWxpbnV4L2xpYnRvb2wtbmF0aXZlLTIuMi42Yi1yMjguMS9saWJ0b29sLTIuMi42Yi90
ZXN0cy8gLS1pbmNsdWRlPS9ob21lL3NsZWR6L3dvcmsvT0UtdGVzdGluZy90bXAuNi9zeXNyb290
cy9pNjg2LWxpbnV4L3Vzci9zaGFyZS9hY2xvY2FsLTEuMTEgLS1pbmNsdWRlPS9ob21lL3NsZWR6
L3dvcmsvT0UtdGVzdGluZy90bXAuNi9zeXNyb290cy9pNjg2LWxpbnV4L3Vzci9zaGFyZS9hY2xv
Y2FsIC0tZm9yY2UgLS13YXJuaW5ncz1jcm9zcwphdXRvcmVjb25mOiBydW5uaW5nOiBhdXRvbWFr
ZSAtLWZvcmVpZ24gLS1hZGQtbWlzc2luZyAtLWNvcHkgLS1mb3JjZS1taXNzaW5nIC0td2Fybmlu
Z3M9Y3Jvc3MKYXV0b21ha2U6IHVua25vd24gd2FybmluZyBjYXRlZ29yeSBgY3Jvc3MnCmF1dG9y
ZWNvbmY6IHJ1bm5pbmc6IGdudS1jb25maWdpemUKUGVybCBsaWIgdmVyc2lvbiAoNS4xMC4xKSBk
b2Vzbid0IG1hdGNoIGV4ZWN1dGFibGUgdmVyc2lvbiAodjUuMTIuMSkgYXQgL2hvbWUvc2xlZHov
d29yay9PRS10ZXN0aW5nL3RtcC42L3N5c3Jvb3RzL2k2ODYtbGludXgvdXNyL2xpYi9wZXJsLzUu
MTAuMS9Db25maWcucG0gbGluZSA1MC4KQ29tcGlsYXRpb24gZmFpbGVkIGluIHJlcXVpcmUgYXQg
L2hvbWUvc2xlZHovd29yay9PRS10ZXN0aW5nL3RtcC42L3N5c3Jvb3RzL2k2ODYtbGludXgvdXNy
L2xpYi9wZXJsLzUuMTAuMS9GaWxlL0NvcHkucG0gbGluZSAxNC4KQkVHSU4gZmFpbGVkLS1jb21w
aWxhdGlvbiBhYm9ydGVkIGF0IC9ob21lL3NsZWR6L3dvcmsvT0UtdGVzdGluZy90bXAuNi9zeXNy
b290cy9pNjg2LWxpbnV4L3Vzci9saWIvcGVybC81LjEwLjEvRmlsZS9Db3B5LnBtIGxpbmUgMTQu
CkNvbXBpbGF0aW9uIGZhaWxlZCBpbiByZXF1aXJlIGF0IC9ob21lL3NsZWR6L3dvcmsvT0UtdGVz
dGluZy90bXAuNi9zeXNyb290cy9pNjg2LWxpbnV4L3Vzci9zaGFyZS9hdXRvY29uZi9BdXRvbTR0
ZS9GaWxlVXRpbHMucG0gbGluZSAxNjYuCkJFR0lOIGZhaWxlZC0tY29tcGlsYXRpb24gYWJvcnRl
ZCBhdCAvaG9tZS9zbGVkei93b3JrL09FLXRlc3RpbmcvdG1wLjYvc3lzcm9vdHMvaTY4Ni1saW51
eC91c3Ivc2hhcmUvYXV0b2NvbmYvQXV0b200dGUvRmlsZVV0aWxzLnBtIGxpbmUgMTY2LgpDb21w
aWxhdGlvbiBmYWlsZWQgaW4gcmVxdWlyZSBhdCAvaG9tZS9zbGVkei93b3JrL09FLXRlc3Rpbmcv
dG1wLjYvc3lzcm9vdHMvaTY4Ni1saW51eC91c3IvYmluL2dudS1jb25maWdpemUgbGluZSA0My4K
QkVHSU4gZmFpbGVkLS1jb21waWxhdGlvbiBhYm9ydGVkIGF0IC9ob21lL3NsZWR6L3dvcmsvT0Ut
dGVzdGluZy90bXAuNi9zeXNyb290cy9pNjg2LWxpbnV4L3Vzci9iaW4vZ251LWNvbmZpZ2l6ZSBs
aW5lIDQzLgphdXRvcmVjb25mOiBnbnUtY29uZmlnaXplIGZhaWxlZCB3aXRoIGV4aXQgc3RhdHVz
OiAyNTUKRkFUQUw6IGF1dG9yZWNvbmYgZXhlY3V0aW9uIGZhaWxlZC4KRVJST1I6IEZ1bmN0aW9u
IGRvX2NvbmZpZ3VyZSBmYWlsZWQK

--------------060707010009000502050505--
