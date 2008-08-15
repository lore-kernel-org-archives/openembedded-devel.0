Received: from [209.85.146.183] (helo=wa-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1KTtwm-0002dM-1L
	for openembedded-devel@openembedded.org; Fri, 15 Aug 2008 09:42:08 +0200
Received: by wa-out-1112.google.com with SMTP id j5so873517wah.4
	for <openembedded-devel@openembedded.org>;
	Fri, 15 Aug 2008 00:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:mime-version:content-type;
	bh=hwBywCZY9Cdy2578r8B3kO1kH/vpf6aPdUmm5VPcyXQ=;
	b=sD7q3YVHWAM8aI1jiMCDyCDMFRSvVX1kl+YvWzfVb57oYO4qfNL6TPt/rs0jvNs8Ga
	mjc+qEHPQ0HjkHaqAmP6yAtYlzw6NZo2UQZYzoVW5WODMCR4PYgavHfBQut0j2VN3NM1
	K2DDYmBJ24omN587DC9VUwm4BZR8jpU9xZTTw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:mime-version:content-type;
	b=ACVi+wEIPMv7uRb9TxndDf9xjYG5ETfa6iEn8+whq6fuyuNiPygusFn1r6sUao2It8
	0vkm9BaKdTjknp6upnrn13Im+PF/fQTxxtTdj82W2Au7+eVN6TmYisNOCOwXc1rm1mEZ
	4tET+4lT/XQ5N3G+SSgjs/TmiadUnzgwy3LFw=
Received: by 10.115.22.1 with SMTP id z1mr2208394wai.99.1218786084484;
	Fri, 15 Aug 2008 00:41:24 -0700 (PDT)
Received: by 10.114.241.11 with HTTP; Fri, 15 Aug 2008 00:41:24 -0700 (PDT)
Message-ID: <19c1b8a90808150041s52abeb55m4bad75bcb03abd75@mail.gmail.com>
Date: Fri, 15 Aug 2008 00:41:24 -0700
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@openembedded.org
MIME-Version: 1.0
Subject: Disable objc for arm uclibc
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
X-List-Received-Date: Fri, 15 Aug 2008 07:42:08 -0000
X-Groupsio-MsgNum: 5752
Content-Type: multipart/mixed; 
	boundary="----=_Part_94055_5685580.1218786084485"

------=_Part_94055_5685580.1218786084485
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi

I am hitting a build issue while building gcc 4.2.4 for arm uclibc.
This patch disables objc selectively only for arm uclibc and avr
change is also merged in.

OK ?

Thx

-Khem

------=_Part_94055_5685580.1218786084485
Content-Type: application/octet-stream; name=diff
Content-Transfer-Encoding: base64
X-Attachment-Id: f_fjwhqy2y0
Content-Disposition: attachment; filename=diff

IwojIG9sZF9yZXZpc2lvbiBbNTE1NGJmYzEzZDc0M2UwMmZiMTE0ODAyOGFjYmQ5NmMxNjFlMzIz
NF0KIwojIHBhdGNoICJwYWNrYWdlcy9nY2MvZ2NjLWNvbmZpZ3VyZS1jb21tb24uaW5jIgojICBm
cm9tIFsyNTkxNWI5MzYyZjQ3Njk3Mjg5ZWUyOTM2NDY5ZTYzYWU3Y2U5ZWJlXQojICAgIHRvIFs3
OGI3OWEyNTllZDhlNDMwNTYyZjUxYzljMmVhZmNlYzIxYzY0M2QyXQojCj09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQotLS0gcGFja2Fn
ZXMvZ2NjL2djYy1jb25maWd1cmUtY29tbW9uLmluYwkyNTkxNWI5MzYyZjQ3Njk3Mjg5ZWUyOTM2
NDY5ZTYzYWU3Y2U5ZWJlCisrKyBwYWNrYWdlcy9nY2MvZ2NjLWNvbmZpZ3VyZS1jb21tb24uaW5j
CTc4Yjc5YTI1OWVkOGU0MzA1NjJmNTFjOWMyZWFmY2VjMjFjNjQzZDIKQEAgLTksMTAgKzksMTIg
QEAgSkFWQV9zaDMgPz0gIiIKIEpBVkFfYXJtZWIgPz0gIiIKIEpBVkFfbWlwc2VsID89ICIiCiBK
QVZBX3NoMyA/PSAiIgorT0JKQyA/PSAiLG9iamMiCitPQkpDX2xpbnV4LXVjbGliY2dudWVhYmkg
Pz0gIiIKK09CSkNfYXZyID89ICIiCiAjIGdjYyAzLnggZXhwZWN0cyAnZjc3JywgNC4wIGV4cGVj
dHMgJ2Y5NScsIDQuMSBhbmQgNC4yIGV4cGVjdCAnZm9ydHJhbicKIEZPUlRSQU4gPz0gIixmNzci
Ci1MQU5HVUFHRVMgPz0gImMsb2JqYyxjKyske0ZPUlRSQU59JHtKQVZBfSIKLUxBTkdVQUdFU19h
dnIzMiA9ICJjLGMrKyR7Rk9SVFJBTn0ke0pBVkF9IgorTEFOR1VBR0VTID89ICJjLGMrKyR7T0JK
Q30ke0ZPUlRSQU59JHtKQVZBfSIKIAogRVhUUkFfT0VDT05GX0JBU0UgPz0gIiIKIEVYVFJBX09F
Q09ORl9QQVRIUyA/PSAiIgo=

------=_Part_94055_5685580.1218786084485--
