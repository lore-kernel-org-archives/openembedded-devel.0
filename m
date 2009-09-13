Received: from [209.85.219.219] (helo=mail-ew0-f219.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1MmyC4-0005IV-9v
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Sep 2009 01:09:19 +0200
Received: by ewy19 with SMTP id 19so2562140ewy.20
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Sep 2009 16:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:cc:content-type;
	bh=bv3/XiVQS8yyqO9wyZ+rp6pNlCNoIn+9PS0PIdmN8Jk=;
	b=M653NBKnWUjfhK+vnAnpYH3Kmh+Gsi5tug43EzLVeryy/9Mx7E5KYeJ6k+0sv+CLMk
	Tx7szSeKnW/nhfOcG39So6oArFhtCBWpLtbApNBx2QLyQKfWwxerS9tOq1lxU9K7yZ1j
	jFoAPzuqCfMu2kewgFEDEhWKSUZ3fzL9A39GM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	b=IQboWZx86VKujc2iQxbVkeUfi4nld+e5eIsaiuTuxev/8GcIFK8qDpKTWC6n5PdnUC
	mg2LYqp0AkfR7w2SbGLeZ0s0tgaJl0SLPrXnZK/vANQmwyepQv8+QpAwjGCueQo5XvlW
	6ERwTcfOIoKGwpuyUodgXuON59cstROfGJyVs=
MIME-Version: 1.0
Received: by 10.216.10.3 with SMTP id 3mr1270867weu.60.1252883325663; Sun, 13 
	Sep 2009 16:08:45 -0700 (PDT)
In-Reply-To: <1252881838-19764-1-git-send-email-Martin.Jansa@gmail.com>
References: <1252881838-19764-1-git-send-email-Martin.Jansa@gmail.com>
Date: Mon, 14 Sep 2009 01:08:45 +0200
Message-ID: <141020e30909131608u56b25755vb7df93dd97296256@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: bitbake-dev@lists.berlios.de, openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.219.219
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH] Allow % as wildcard in the end of PREFERRED_VERSION_pkg
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
X-List-Received-Date: Sun, 13 Sep 2009 23:09:19 -0000
X-Groupsio-MsgNum: 13083
Content-Type: multipart/mixed; boundary=001485f6305e923ba904737da137

--001485f6305e923ba904737da137
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Sep 14, 2009 at 12:43 AM, Martin Jansa <martin.jansa@gmail.com>wrote:

> ---
>  lib/bb/providers.py |   13 ++++++++++++-
>  1 files changed, 12 insertions(+), 1 deletions(-)
>

As I'm not python programmer, I should at least test it better :/ sorry for
that noise.
true->True, false->False

better version in attachment

--001485f6305e923ba904737da137
Content-Type: application/octet-stream; 
	name="0001-Allow-as-wildcard-in-the-end-of-PREFERRED_VERSION_pk.patch"
Content-Disposition: attachment; 
	filename="0001-Allow-as-wildcard-in-the-end-of-PREFERRED_VERSION_pk.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_fzkeb1a10

RnJvbSA1OGEwZDE2NTMwZDYxZDQzMGJjODY4NjYzMjkwZmFmYjU4MGRiOWRmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBNYXJ0aW4gSmFuc2EgPE1hcnRpbi5KYW5zYUBnbWFpbC5jb20+
CkRhdGU6IFdlZCwgMjYgQXVnIDIwMDkgMjE6NDk6MzMgKzAyMDAKU3ViamVjdDogW1BBVENIXSBB
bGxvdyAlIGFzIHdpbGRjYXJkIGluIHRoZSBlbmQgb2YgUFJFRkVSUkVEX1ZFUlNJT05fcGtnCgot
LS0KIGxpYi9iYi9wcm92aWRlcnMucHkgfCAgIDEzICsrKysrKysrKysrKy0KIDEgZmlsZXMgY2hh
bmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9saWIv
YmIvcHJvdmlkZXJzLnB5IGIvbGliL2JiL3Byb3ZpZGVycy5weQppbmRleCA4OTcwZmIzLi45Y2Y5
ZWRjIDEwMDY0NAotLS0gYS9saWIvYmIvcHJvdmlkZXJzLnB5CisrKyBiL2xpYi9iYi9wcm92aWRl
cnMucHkKQEAgLTYzLDcgKzYzLDE4IEBAIGRlZiBzb3J0UHJpb3JpdGllcyhwbiwgZGF0YUNhY2hl
LCBwa2dfcG4gPSBOb25lKToKIAogICAgIHJldHVybiB0bXBfcG4KIAorZGVmIGlzUHJlZmVycmVk
VmVyc2lvbihwZSwgcHYsIHByLCBwcmVmZXJyZWRfZSwgcHJlZmVycmVkX3YsIHByZWZlcnJlZF9y
KToKKyAgICAiIiIKKyAgICBDaGVjayBpZiB0aGUgdmVyc2lvbiBwZSxwdixwciBpcyB0aGUgcHJl
ZmVycmVkIG9uZS4KKyAgICBJZiB0aGVyZSBpcyBwcmVmZXJyZWQgdmVyc2lvbiBkZWZpbmVkIGFu
ZCBlbmRzIHdpdGggJyUnLCB0aGVuIHB2IGhhcyB0byBzdGFydCB3aXRoIHRoYXQgdmVyc2lvbiBh
ZnRlciByZW1vdmluZyB0aGUgJyUnIGluIHRoZSBlbmQsCisgICAgIiIiCiAKKyAgICBpZiAocHYg
PT0gcHJlZmVycmVkX3Ygb3IgKHByZWZlcnJlZF92ICE9IE5vbmUgYW5kIHByZWZlcnJlZF92LmVu
ZHN3aXRoKCclJykgYW5kIHB2LnN0YXJ0c3dpdGgocHJlZmVycmVkX3ZbOmxlbihwcmVmZXJyZWRf
diktMV0pKSk6CisgICAgICAgIGlmIChwciA9PSBwcmVmZXJyZWRfciBvciBwcmVmZXJyZWRfciA9
PSBOb25lKToKKyAgICAgICAgICAgIGlmIChwZSA9PSBwcmVmZXJyZWRfZSBvciBwcmVmZXJyZWRf
ZSA9PSBOb25lKToKKyAgICAgICAgICAgICAgICByZXR1cm4gVHJ1ZQorICAgIHJldHVybiBGYWxz
ZQorICAgIAogZGVmIGZpbmRQcmVmZXJyZWRQcm92aWRlcihwbiwgY2ZnRGF0YSwgZGF0YUNhY2hl
LCBwa2dfcG4gPSBOb25lLCBpdGVtID0gTm9uZSk6CiAgICAgIiIiCiAgICAgRmluZCB0aGUgZmly
c3QgcHJvdmlkZXIgaW4gcGtnX3BuIHdpdGggYSBQUkVGRVJSRURfVkVSU0lPTiBzZXQuCkBAIC05
Niw3ICsxMDcsNyBAQCBkZWYgZmluZFByZWZlcnJlZFByb3ZpZGVyKHBuLCBjZmdEYXRhLCBkYXRh
Q2FjaGUsIHBrZ19wbiA9IE5vbmUsIGl0ZW0gPSBOb25lKToKICAgICAgICAgZm9yIGZpbGVfc2V0
IGluIHBrZ19wbjoKICAgICAgICAgICAgIGZvciBmIGluIGZpbGVfc2V0OgogICAgICAgICAgICAg
ICAgIHBlLHB2LHByID0gZGF0YUNhY2hlLnBrZ19wZXB2cHJbZl0KLSAgICAgICAgICAgICAgICBp
ZiBwcmVmZXJyZWRfdiA9PSBwdiBhbmQgKHByZWZlcnJlZF9yID09IHByIG9yIHByZWZlcnJlZF9y
ID09IE5vbmUpIGFuZCAocHJlZmVycmVkX2UgPT0gcGUgb3IgcHJlZmVycmVkX2UgPT0gTm9uZSk6
CisgICAgICAgICAgICAgICAgaWYgaXNQcmVmZXJyZWRWZXJzaW9uKHBlLHB2LHByLHByZWZlcnJl
ZF9lLHByZWZlcnJlZF92LHByZWZlcnJlZF9yKToKICAgICAgICAgICAgICAgICAgICAgcHJlZmVy
cmVkX2ZpbGUgPSBmCiAgICAgICAgICAgICAgICAgICAgIHByZWZlcnJlZF92ZXIgPSAocGUsIHB2
LCBwcikKICAgICAgICAgICAgICAgICAgICAgYnJlYWsKLS0gCjEuNi40LjIKCg==

--001485f6305e923ba904737da137--
