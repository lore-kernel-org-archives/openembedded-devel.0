Return-Path: <gstroz@uber.com>
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com
	[209.85.217.45])
	by mail.openembedded.org (Postfix) with ESMTP id EADD37C3DA
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Jan 2019 01:37:21 +0000 (UTC)
Received: by mail-vs1-f45.google.com with SMTP id h78so6800901vsi.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Jan 2019 17:37:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uber.com; s=google;
	h=mime-version:from:date:message-id:subject:to;
	bh=nH75Wudk1i5jTbltIVkZZwEiIuD4zAz6FeYoEE8x4Ys=;
	b=LeqMklNqWS/H3MXl2iDGuILaTuCAR4O/8Kw2juRaNOI24C4DQkKrXcAbsKcDOKbEKw
	eOHUaRaon8r5+nAnK9/200jpSij7k7Wr3YHwN1zi6pHSeYaKvpfxO9ZCR3uWqPINCuZc
	DQhgGxwBu1RgBjUZZP8/6nkVvobM2YsJn6pTk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=nH75Wudk1i5jTbltIVkZZwEiIuD4zAz6FeYoEE8x4Ys=;
	b=BLGWnQMfufjxqjSeUO8UM85nfEI7u6Ven5Yi/jQwm3rbnULxYHYuMuecnQbO2g2TOV
	o0iNnRWv4loS3NlwPmeJT3fA8qbldFYvfSUk5mJ2V1QXfJ+w4HMQBs3BS0klqZQSpujB
	DRlZLOXkDc6xESRXbXhzHXmU92kJ9lJBMGONweqyaua3Wsz5+BW++JjDbJvav7DIPowh
	IAu2yVBKko0EpNQEW/mTfwqi7vw9yR6Q1io2phIGv5tY6W6WIzU8LXo7EoQ4F6+cuzmC
	4ipU97+6tZo3lIdKUWTGojEiYSzMepEcrRMB9BhNjfN2QdUpnFpNPBbPQfCzGu0Hq5lZ
	j9Bw==
X-Gm-Message-State: AJcUukf5qm08k49V1hMbOJNd2XjyJNVQpX+qFllbGI3bSu7bbhJj5PdY
	9CMxzsF5m55MQAz8MahB7MyUz5V6N8yxKn2D5gB8vvyO
X-Google-Smtp-Source: ALg8bN5ghx8vHfAgeUcWIFCH89kx4ii2bB/OXrydEj5fOabTxlqR7Sk4wiIPPo+jjsymzENyzq58rBatciSIard+ktw=
X-Received: by 2002:a67:edd8:: with SMTP id e24mr5878845vsp.169.1548466642689; 
	Fri, 25 Jan 2019 17:37:22 -0800 (PST)
MIME-Version: 1.0
From: Glenn Stroz <gstroz@uber.com>
Date: Fri, 25 Jan 2019 20:37:11 -0500
Message-ID: <CAGvkhOL4gHu+S2p+Q=XaqT=xHb_mEvoNcTMg4kMRR7H_tevx7Q@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] libmbim: Upgrade to 1.18.0
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
X-List-Received-Date: Sat, 26 Jan 2019 01:37:23 -0000
X-Groupsio-MsgNum: 76138
Content-Type: multipart/mixed; boundary="0000000000002f8e600580527c32"

--0000000000002f8e600580527c32
Content-Type: text/plain; charset="UTF-8"

Required for the libqmi upgrade.

--0000000000002f8e600580527c32
Content-Type: text/x-patch; charset="US-ASCII"; name="0001-libmbim-Upgrade-to-1.18.0.patch"
Content-Disposition: attachment; 
	filename="0001-libmbim-Upgrade-to-1.18.0.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_jrct1s270>
X-Attachment-Id: f_jrct1s270

RnJvbSA2YzdlZWY3ZDZlZTFiOTk3MmViYjc1M2UyZjNiOGE4MTZkY2Y4ODg1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBHbGVubiBTdHJveiA8Z3N0cm96QHViZXIuY29tPgpEYXRlOiBG
cmksIDI1IEphbiAyMDE5IDIwOjMzOjU3IC0wNTAwClN1YmplY3Q6IFtQQVRDSF0gbGlibWJpbTog
VXBncmFkZSB0byAxLjE4LjAKClNpZ25lZC1vZmYtYnk6IEdsZW5uIFN0cm96IDxnc3Ryb3pAdWJl
ci5jb20+Ci0tLQogbWV0YS1vZS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9saWJtYmltL2xpYm1iaW0v
Y2xhbmcucGF0Y2ggIHwgMiArLQogLi4uL2xpYm1iaW0ve2xpYm1iaW1fMS4xNi4wLmJiID0+IGxp
Ym1iaW1fMS4xOC4wLmJifSAgICAgIHwgOCArKysrKy0tLQogMiBmaWxlcyBjaGFuZ2VkLCA2IGlu
c2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS1vZS9yZWNpcGVzLWNvbm5l
Y3Rpdml0eS9saWJtYmltL3tsaWJtYmltXzEuMTYuMC5iYiA9PiBsaWJtYmltXzEuMTguMC5iYn0g
KDc2JSkKCmRpZmYgLS1naXQgYS9tZXRhLW9lL3JlY2lwZXMtY29ubmVjdGl2aXR5L2xpYm1iaW0v
bGlibWJpbS9jbGFuZy5wYXRjaCBiL21ldGEtb2UvcmVjaXBlcy1jb25uZWN0aXZpdHkvbGlibWJp
bS9saWJtYmltL2NsYW5nLnBhdGNoCmluZGV4IDkyZTY1N2MwMC4uZDg4NTc4NDE4IDEwMDY0NAot
LS0gYS9tZXRhLW9lL3JlY2lwZXMtY29ubmVjdGl2aXR5L2xpYm1iaW0vbGlibWJpbS9jbGFuZy5w
YXRjaAorKysgYi9tZXRhLW9lL3JlY2lwZXMtY29ubmVjdGl2aXR5L2xpYm1iaW0vbGlibWJpbS9j
bGFuZy5wYXRjaApAQCAtNDUsNyArNDUsNyBAQCBJbmRleDogbGlibWJpbS0xLjE0LjAvbTQvY29t
cGlsZXItd2FybmluZ3MubTQKICAJCSAgICAgIC1XZGVjbGFyYXRpb24tYWZ0ZXItc3RhdGVtZW50
IC1Xc3RyaWN0LXByb3RvdHlwZXMgXAogQEAgLTE3LDIyICszNywyMyBAQCBpZiB0ZXN0ICIkR0ND
IiA9ICJ5ZXMiIC1hICIkc2V0X21vcmVfd2FyCiAgCQkgICAgICAtV21pc3NpbmctaW5jbHVkZS1k
aXJzIC1XYWdncmVnYXRlLXJldHVybiBcCi0gCQkgICAgICAtV2Zvcm1hdC1zZWN1cml0eTsgZG8K
KyAJCSAgICAgIC1XZm9ybWF0LXNlY3VyaXR5IC1XdHlwZS1saW1pdHM7IGRvCiAgCQlTQVZFX0NG
TEFHUz0iJENGTEFHUyIKIC0JCUNGTEFHUz0iJENGTEFHUyAkb3B0aW9uIgogKwkJQ0ZMQUdTPSIk
Q0ZMQUdTICRvcHRpb24gJFdFUlJPUiIKZGlmZiAtLWdpdCBhL21ldGEtb2UvcmVjaXBlcy1jb25u
ZWN0aXZpdHkvbGlibWJpbS9saWJtYmltXzEuMTYuMC5iYiBiL21ldGEtb2UvcmVjaXBlcy1jb25u
ZWN0aXZpdHkvbGlibWJpbS9saWJtYmltXzEuMTguMC5iYgpzaW1pbGFyaXR5IGluZGV4IDc2JQpy
ZW5hbWUgZnJvbSBtZXRhLW9lL3JlY2lwZXMtY29ubmVjdGl2aXR5L2xpYm1iaW0vbGlibWJpbV8x
LjE2LjAuYmIKcmVuYW1lIHRvIG1ldGEtb2UvcmVjaXBlcy1jb25uZWN0aXZpdHkvbGlibWJpbS9s
aWJtYmltXzEuMTguMC5iYgppbmRleCA1MjYwYzBmMTQuLjk1MmRjODJjNCAxMDA2NDQKLS0tIGEv
bWV0YS1vZS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9saWJtYmltL2xpYm1iaW1fMS4xNi4wLmJiCisr
KyBiL21ldGEtb2UvcmVjaXBlcy1jb25uZWN0aXZpdHkvbGlibWJpbS9saWJtYmltXzEuMTguMC5i
YgpAQCAtMTIsNyArMTIsOSBAQCBERVBFTkRTID0gImdsaWItMi4wIGdsaWItMi4wLW5hdGl2ZSBs
aWJndWRldiIKIGluaGVyaXQgYXV0b3Rvb2xzIHBrZ2NvbmZpZyBiYXNoLWNvbXBsZXRpb24KIAog
U1JDX1VSSSA9ICJodHRwOi8vd3d3LmZyZWVkZXNrdG9wLm9yZy9zb2Z0d2FyZS8ke0JQTn0vJHtC
UE59LSR7UFZ9LnRhci54eiBcCi0gICAgICAgICAgIGZpbGU6Ly9jbGFuZy5wYXRjaCBcCisgICAg
ZmlsZTovL3dhcm5pbmdzLnBhdGNoIFwKICIKLVNSQ19VUklbbWQ1c3VtXSA9ICI3NmVhNGQ4Mzgx
OTg5OTE5YjFkOWI5MWM4MThmZWQ4MCIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJjOGNhNTBiZWVk
ZGQ0YjQzMzA5ZGY1YjY5ODkxNzI2ODMwM2JmMTc2Y2VhNThmZTRmZTUzZDViZjBlOTNmYWMyIgor
U1JDX1VSSVttZDVzdW1dID0gIjg0MGNkMTMzYmMwZjcxNWE3ZWU0Nzk3ZGQ5YWM1NTYyIgorU1JD
X1VSSVtzaGEyNTZzdW1dID0gIjZjZjQwMTI4ZDgzZDA4Nzk0NmE3ZDg1NzdlNzM1NTI2MjAyZTAz
NGQ1MmY5MDA0NzczNTMyOTYwOTA5N2IyODIiCisKK1RPT0xDSEFJTiA9ICJjbGFuZyIKLS0gCjIu
MjAuMQoK

--0000000000002f8e600580527c32--
