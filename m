Subject: [meta-java] commit 90984a33f407265493d54a8240e7d78701b3fb50 breaks build on Ubuntu 16.04
To: openembedded-devel@lists.openembedded.org
From: =?UTF-8?B?VGhvbWFzIEvDtmxsZXI=?= <thomas.koeller@baslerweb.com>
X-Originating-Location: Hamburg, DE (31.18.20.213)
X-Originating-Platform: Linux Firefox 77
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 26 Jun 2020 05:03:23 -0700
Message-ID: <MKXl.1593173003991452078.9WGL@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="f039roreL7UezbQaSLpz"

--f039roreL7UezbQaSLpz
Content-Type: text/plain; charset="utf-8"; markup=markdown
Content-Transfer-Encoding: quoted-printable

I noticed that building the zeus branch on Ubuntu 16.04 does not work. AFAI=
K Ubuntu 16.04 is still listed as a supported build environment, so this sh=
ould be fixed.

The Problem is that Ubuntu 16.04 comes with gcc 5.4.0, which is too old to=
 understand -Wno-error=3Dstringop-overflow; this causes the configure step =
of icedtea7-native to fail.

--f039roreL7UezbQaSLpz
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<p>I noticed that building the zeus branch on Ubuntu 16.04 does not work. A=
FAIK Ubuntu 16.04 is still listed as a supported build environment, so this=
 should be fixed.</p>

<p>The Problem is that Ubuntu 16.04 comes with gcc 5.4.0, which is too old=
 to understand -Wno-error=3Dstringop-overflow; this causes the configure st=
ep of icedtea7-native to fail.</p>

--f039roreL7UezbQaSLpz--
