Received: from [209.85.210.193] (helo=mail-yx0-f193.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kirtibr@gmail.com>) id 1MVo2L-0004Xl-LF
	for openembedded-devel@lists.openembedded.org;
	Tue, 28 Jul 2009 16:52:17 +0200
Received: by yxe31 with SMTP id 31so90511yxe.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Jul 2009 07:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=X99exDxL76TOOFQm3Dd/veyDwBES+Fm6JGz3TUPzhig=;
	b=teZkq7Xj64dk8gzjPh37rKZGOloEjSxZDLld24qmvz1Sk8XugXYnTs+KLIPxH+vNHM
	YUuRpa6JUknlsMQiu72dZkgResyKzWmh+bizHgdyjYKcR2qJdtSD6lwC5IwIvuqKeT0z
	Q4+92XEXHL3y/wKmBaADDtQfdme+YssbRsbwQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=kHHTN1jZOA+j0IBqLqiv/nNFPuYbbHzaWaDX3uWv69u9MBEmCQ7ZU+pXsDjwSF/vzF
	ZZhFPg9rkygKJlQMAYJLGp5T68HNsjNi5zqZ8PXBwzyg1eeVzCmggK6eOm1OKablaVwS
	3T/5V41qO12umTK4/NHeFzhQhwYtf4seIjSSU=
MIME-Version: 1.0
Received: by 10.150.147.7 with SMTP id u7mr12902299ybd.37.1248791846758; Tue, 
	28 Jul 2009 07:37:26 -0700 (PDT)
Date: Tue, 28 Jul 2009 20:07:23 +0530
Message-ID: <64d5b90a0907280737i72902f27s65aa0c9a4e351a97@mail.gmail.com>
From: Kirtika Ruchandani <kirtibr@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Patch to get wvstreams recipe functional
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
X-List-Received-Date: Tue, 28 Jul 2009 14:52:18 -0000
X-Groupsio-MsgNum: 12115
Content-Type: multipart/mixed; boundary=000e0cd4ccf86cf284046fc5024d

--000e0cd4ccf86cf284046fc5024d
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Greetings,
Please find attached the quilt patches for the wvstreams 4.4.1 recipe.
The one in the OE tree currently doesn't build correctly.
It would be great if someone could test the above patches and check if the
build goes fine.
Regards,

-- 
Kirtika Ruchandani
Maemo Google Summer of Code  student
Sophomore, CS&E @ IIT-Madras
IRC: rkirti / oespirit
http://rkirti.wordpress.com

--000e0cd4ccf86cf284046fc5024d
Content-Type: text/x-patch; charset=US-ASCII; name="gcc4.3.patch"
Content-Disposition: attachment; filename="gcc4.3.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_fxoqcemt0

SW5kZXg6IHd2c3RyZWFtcy00LjQuMS9pbmNsdWRlL3d2c2VyaWFsaXplLmgKPT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQot
LS0gd3ZzdHJlYW1zLTQuNC4xLm9yaWcvaW5jbHVkZS93dnNlcmlhbGl6ZS5oCTIwMDktMDctMjgg
MTc6NDY6NTAuMDAwMDAwMDAwICswNTMwCisrKyB3dnN0cmVhbXMtNC40LjEvaW5jbHVkZS93dnNl
cmlhbGl6ZS5oCTIwMDktMDctMjggMTc6NDg6MzAuMDAwMDAwMDAwICswNTMwCkBAIC0zNDgsOCAr
MzQ4LDkgQEAKICAqICh6ZXJvKSBjaGFyYWN0ZXIuICBTZXJpYWxpemVkIFd2U3RyaW5ncyBhcmUg
Z3VhcmFudGVlZCBub3QgdG8gY29udGFpbiBudWwKICAqIGV4Y2VwdCBhcyB0aGUgbGFzdCBjaGFy
YWN0ZXIuCiAgKi8KKy8qTm8gc3RvcmFnZSBjbGFzcyBhbGxvd2VkIGhlcmUgYXMgcGVyIGdjYyA0
LjMgc3BlY3MqLwogdGVtcGxhdGUgPD4KLWV4dGVybiBXdlN0cmluZyBfd3ZfZGVzZXJpYWxpemU8
V3ZTdHJpbmc+KFd2QnVmICZidWYpOworV3ZTdHJpbmcgX3d2X2Rlc2VyaWFsaXplPFd2U3RyaW5n
PihXdkJ1ZiAmYnVmKTsKIAogCiAvKiogRGVzZXJpYWxpemUgYSBXdkJ1Zi4gKi8K

--000e0cd4ccf86cf284046fc5024d
Content-Type: text/x-patch; charset=US-ASCII; name="dont-forget-header.patch"
Content-Disposition: attachment; filename="dont-forget-header.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_fxoqcrhy1

SW5kZXg6IHd2c3RyZWFtcy00LjQuMS9pbmNsdWRlL3VuaWNvbmZrZXkuaAo9PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09Ci0t
LSB3dnN0cmVhbXMtNC40LjEub3JpZy9pbmNsdWRlL3VuaWNvbmZrZXkuaAkyMDA5LTA3LTI4IDE3
OjQyOjM5LjAwMDAwMDAwMCArMDUzMAorKysgd3ZzdHJlYW1zLTQuNC4xL2luY2x1ZGUvdW5pY29u
ZmtleS5oCTIwMDktMDctMjggMTc6NDI6NTUuMDAwMDAwMDAwICswNTMwCkBAIC05LDcgKzksNyBA
QAogCiAjaW5jbHVkZSAid3ZzdHJpbmcuaCIKICNpbmNsdWRlICJ3dmxpbmtsaXN0LmgiCi0KKyNp
bmNsdWRlIDxsaW1pdHMuaD4KIAogLy8gVGhlIFB5dGhvbiBoZWFkZXJzIHRyeSB0byAjZGVmaW5l
IEFOWSBhcyB2b2lkLiAgSWYgd2UncmUgYnVpbGRpbmcgUHl0aG9uCiAvLyB3cmFwcGVycywgZ2V0
IHJpZCBvZiB0aGF0Lgo=

--000e0cd4ccf86cf284046fc5024d--
