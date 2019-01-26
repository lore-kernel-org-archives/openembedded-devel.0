Return-Path: <gstroz@uber.com>
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com
	[209.85.217.54])
	by mail.openembedded.org (Postfix) with ESMTP id 53B837C3DD
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Jan 2019 01:47:36 +0000 (UTC)
Received: by mail-vs1-f54.google.com with SMTP id p74so6836530vsc.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Jan 2019 17:47:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uber.com; s=google;
	h=mime-version:from:date:message-id:subject:to;
	bh=vQTlru4ShfIsNTP6GmfmGQowwQH4LhQ32hv9Pn2X5eI=;
	b=jOsnI9+nxwfPZq5i3PK8nQAktKe+Znlqj+IKgg/u2zJh3bxZ9f9TVVL5oVRYzz8jBu
	4d207QFLwM4jOr/T6Q3NEXjJA+byCRqcaFn+3Kq3iI4pAPOUuCKUU2xkiDVjdoQzfaXJ
	Jx9nq+FG8f8n0cw2tuQK5DiqdlegYE5tZxcwk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=vQTlru4ShfIsNTP6GmfmGQowwQH4LhQ32hv9Pn2X5eI=;
	b=cSGzNtA9V3h4qwOQ8c2XH5z/x1fua95OdIPnDt9kd7t/iWuAr34rD2dLx3uPVf8rwj
	QwgNtkds3hX2dbE3YoxjgvH4XAQ/c5QgR7HHLe6bMYC6OxNlVvjX27w5rfmkDbDUEhcY
	auvkP5lY1fkAzyPnJnz5igdp30aGw/RDcUfOXclWYbNAZPlar4sMqf3QHtnPJv8DF7hY
	SeAe4c56cZ13WgHZtnuIZ+an/sbys96vermL80D9pWjTfy0sI5pDTVs45rHNoyWF4o+T
	OUd/5D8UGgxRrCJ9OwP1ECsHy5g6wAdSoSpxUDIcEbXkOKhauoSsDY8eL817bLJgu82b
	96yg==
X-Gm-Message-State: AJcUukeZga6iIbVuV56aDFLQrBMHuglnKChakuqRtPKQzdrOOSj8aSZZ
	yALWvPoEHBsfpcFSPPhMCVKlVWBT4dCQpmf2YMmPCUJb
X-Google-Smtp-Source: ALg8bN66m6kEbJhqDvgu5OYMqrfAHsfHhtsEfGmzQPn3DgUm30RyXfi3Ww3xhRSWgfhBQV8pRvU0FJ0mQZjU0CkMwSU=
X-Received: by 2002:a67:ffca:: with SMTP id w10mr5614119vsq.115.1548467256817; 
	Fri, 25 Jan 2019 17:47:36 -0800 (PST)
MIME-Version: 1.0
From: Glenn Stroz <gstroz@uber.com>
Date: Fri, 25 Jan 2019 20:47:25 -0500
Message-ID: <CAGvkhOLL7+hOZK16G5Om5fomaMGMVVr8jdfWKdBVNbWRhMsEYQ@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH v2] libmbim: Upgrade to 1.18.0
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
X-List-Received-Date: Sat, 26 Jan 2019 01:47:36 -0000
X-Groupsio-MsgNum: 76139
Content-Type: multipart/mixed; boundary="000000000000ca7442058052a02f"

--000000000000ca7442058052a02f
Content-Type: text/plain; charset="UTF-8"

Accidentally sent outdated patch. This is current. Verified it works
with both GCC and clang.

--000000000000ca7442058052a02f
Content-Type: text/x-patch; charset="US-ASCII"; name="0001-libmbim-Upgrade-to-1.18.0.patch"
Content-Disposition: attachment; 
	filename="0001-libmbim-Upgrade-to-1.18.0.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_jrctenul0>
X-Attachment-Id: f_jrctenul0

RnJvbSBiMWQ2ZDdhZTIyZjdlYmNkOTQzNDkzYzYwZTc4ZGVhMmY5YzAwYTMxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBHbGVubiBTdHJveiA8Z3N0cm96QHViZXIuY29tPgpEYXRlOiBG
cmksIDI1IEphbiAyMDE5IDIwOjMzOjU3IC0wNTAwClN1YmplY3Q6IFtQQVRDSF0gbGlibWJpbTog
VXBncmFkZSB0byAxLjE4LjAKClNpZ25lZC1vZmYtYnk6IEdsZW5uIFN0cm96IDxnc3Ryb3pAdWJl
ci5jb20+Ci0tLQogbWV0YS1vZS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9saWJtYmltL2xpYm1iaW0v
Y2xhbmcucGF0Y2ggICAgICB8IDIgKy0KIC4uLi9saWJtYmltL3tsaWJtYmltXzEuMTYuMC5iYiA9
PiBsaWJtYmltXzEuMTguMC5iYn0gICAgICAgICAgfCA0ICsrLS0KIDIgZmlsZXMgY2hhbmdlZCwg
MyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEtb2UvcmVjaXBlcy1j
b25uZWN0aXZpdHkvbGlibWJpbS97bGlibWJpbV8xLjE2LjAuYmIgPT4gbGlibWJpbV8xLjE4LjAu
YmJ9ICg4MiUpCgpkaWZmIC0tZ2l0IGEvbWV0YS1vZS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9saWJt
YmltL2xpYm1iaW0vY2xhbmcucGF0Y2ggYi9tZXRhLW9lL3JlY2lwZXMtY29ubmVjdGl2aXR5L2xp
Ym1iaW0vbGlibWJpbS9jbGFuZy5wYXRjaAppbmRleCA5MmU2NTdjMDAuLmQ4ODU3ODQxOCAxMDA2
NDQKLS0tIGEvbWV0YS1vZS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9saWJtYmltL2xpYm1iaW0vY2xh
bmcucGF0Y2gKKysrIGIvbWV0YS1vZS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9saWJtYmltL2xpYm1i
aW0vY2xhbmcucGF0Y2gKQEAgLTQ1LDcgKzQ1LDcgQEAgSW5kZXg6IGxpYm1iaW0tMS4xNC4wL200
L2NvbXBpbGVyLXdhcm5pbmdzLm00CiAgCQkgICAgICAtV2RlY2xhcmF0aW9uLWFmdGVyLXN0YXRl
bWVudCAtV3N0cmljdC1wcm90b3R5cGVzIFwKIEBAIC0xNywyMiArMzcsMjMgQEAgaWYgdGVzdCAi
JEdDQyIgPSAieWVzIiAtYSAiJHNldF9tb3JlX3dhcgogIAkJICAgICAgLVdtaXNzaW5nLWluY2x1
ZGUtZGlycyAtV2FnZ3JlZ2F0ZS1yZXR1cm4gXAotIAkJICAgICAgLVdmb3JtYXQtc2VjdXJpdHk7
IGRvCisgCQkgICAgICAtV2Zvcm1hdC1zZWN1cml0eSAtV3R5cGUtbGltaXRzOyBkbwogIAkJU0FW
RV9DRkxBR1M9IiRDRkxBR1MiCiAtCQlDRkxBR1M9IiRDRkxBR1MgJG9wdGlvbiIKICsJCUNGTEFH
Uz0iJENGTEFHUyAkb3B0aW9uICRXRVJST1IiCmRpZmYgLS1naXQgYS9tZXRhLW9lL3JlY2lwZXMt
Y29ubmVjdGl2aXR5L2xpYm1iaW0vbGlibWJpbV8xLjE2LjAuYmIgYi9tZXRhLW9lL3JlY2lwZXMt
Y29ubmVjdGl2aXR5L2xpYm1iaW0vbGlibWJpbV8xLjE4LjAuYmIKc2ltaWxhcml0eSBpbmRleCA4
MiUKcmVuYW1lIGZyb20gbWV0YS1vZS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9saWJtYmltL2xpYm1i
aW1fMS4xNi4wLmJiCnJlbmFtZSB0byBtZXRhLW9lL3JlY2lwZXMtY29ubmVjdGl2aXR5L2xpYm1i
aW0vbGlibWJpbV8xLjE4LjAuYmIKaW5kZXggNTI2MGMwZjE0Li45ZjU5YWQ2YjQgMTAwNjQ0Ci0t
LSBhL21ldGEtb2UvcmVjaXBlcy1jb25uZWN0aXZpdHkvbGlibWJpbS9saWJtYmltXzEuMTYuMC5i
YgorKysgYi9tZXRhLW9lL3JlY2lwZXMtY29ubmVjdGl2aXR5L2xpYm1iaW0vbGlibWJpbV8xLjE4
LjAuYmIKQEAgLTE0LDUgKzE0LDUgQEAgaW5oZXJpdCBhdXRvdG9vbHMgcGtnY29uZmlnIGJhc2gt
Y29tcGxldGlvbgogU1JDX1VSSSA9ICJodHRwOi8vd3d3LmZyZWVkZXNrdG9wLm9yZy9zb2Z0d2Fy
ZS8ke0JQTn0vJHtCUE59LSR7UFZ9LnRhci54eiBcCiAgICAgICAgICAgIGZpbGU6Ly9jbGFuZy5w
YXRjaCBcCiAiCi1TUkNfVVJJW21kNXN1bV0gPSAiNzZlYTRkODM4MTk4OTkxOWIxZDliOTFjODE4
ZmVkODAiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiYzhjYTUwYmVlZGRkNGI0MzMwOWRmNWI2OTg5
MTcyNjgzMDNiZjE3NmNlYTU4ZmU0ZmU1M2Q1YmYwZTkzZmFjMiIKK1NSQ19VUklbbWQ1c3VtXSA9
ICI4NDBjZDEzM2JjMGY3MTVhN2VlNDc5N2RkOWFjNTU2MiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9
ICI2Y2Y0MDEyOGQ4M2QwODc5NDZhN2Q4NTc3ZTczNTUyNjIwMmUwMzRkNTJmOTAwNDc3MzUzMjk2
MDkwOTdiMjgyIgotLSAKMi4yMC4xCgo=

--000000000000ca7442058052a02f--
