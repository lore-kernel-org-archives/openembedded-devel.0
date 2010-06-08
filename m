Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ryan@trolocsis.com>) id 1OM4it-00035k-1L
	for openembedded-devel@lists.openembedded.org;
	Tue, 08 Jun 2010 21:44:32 +0200
Received: by gyg10 with SMTP id 10so3662657gyg.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Jun 2010 12:40:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.91.19.34 with SMTP id w34mr8637303agi.179.1276026009204; Tue, 
	08 Jun 2010 12:40:09 -0700 (PDT)
Received: by 10.90.117.19 with HTTP; Tue, 8 Jun 2010 12:40:09 -0700 (PDT)
Date: Tue, 8 Jun 2010 14:40:09 -0500
Message-ID: <AANLkTim3_p-OVwfb4ulBCm2vR19uCH1eYAZlHLQVM_BG@mail.gmail.com>
From: Ryan Phillips <ryan@trolocsis.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: ryan@trolocsis.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: sean_hudson@dell.com
Subject: [PATCH] Change wget fetcher to use the runfetchcmd
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
X-List-Received-Date: Tue, 08 Jun 2010 19:44:32 -0000
X-Groupsio-MsgNum: 20018
Content-Type: multipart/mixed; boundary=001485f7bf2000ba64048889f523

--001485f7bf2000ba64048889f523
Content-Type: text/plain; charset=ISO-8859-1

Hi All,

We were having problems with wget fetching through our proxy. One of
the problems stemmed from quoting around the environment variables,
and the other appears to be from legacy code not calling into
runfetchcmd within the wget fetcher.

Regards,
Ryan Phillips

--001485f7bf2000ba64048889f523
Content-Type: application/octet-stream; 
	name="0001-Change-wget-fetcher-to-use-the-runfetchcmd.patch"
Content-Disposition: attachment; 
	filename="0001-Change-wget-fetcher-to-use-the-runfetchcmd.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_ga74lzm50

RnJvbSBmYmE3NjRhNDA3ZDcyYTY5N2M3YzZkYTQzYzVmNzhjYWVlNjUyMWM2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBSeWFuIFBoaWxsaXBzIDxyeWFuX2RfcGhpbGxpcHNAZGVsbC5j
b20+CkRhdGU6IFR1ZSwgOCBKdW4gMjAxMCAxNDoyMDo1NSAtMDUwMApTdWJqZWN0OiBbUEFUQ0hd
IENoYW5nZSB3Z2V0IGZldGNoZXIgdG8gdXNlIHRoZSBydW5mZXRjaGNtZAoKKiBGaXhlcyBwcm94
eSBzdXBwb3J0IHRvIGhvbm9yIHN0YW5kYXJkIHByb3h5IGVudmlyb25tZW50IHZhcmlhYmxlcy4K
KiBRdW90ZSBlbnZpcm9ubWVudCB2YXJpYWJsZXMKLS0tCiBsaWIvYmIvZmV0Y2gvX19pbml0X18u
cHkgfCAgICAzICsrLQogbGliL2JiL2ZldGNoL3dnZXQucHkgICAgIHwgICAyOCArKysrLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMjUg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvbGliL2JiL2ZldGNoL19faW5pdF9fLnB5IGIvbGli
L2JiL2ZldGNoL19faW5pdF9fLnB5CmluZGV4IDhjMGQ3ZWEuLmVlYjQwZTAgMTAwNjQ0Ci0tLSBh
L2xpYi9iYi9mZXRjaC9fX2luaXRfXy5weQorKysgYi9saWIvYmIvZmV0Y2gvX19pbml0X18ucHkK
QEAgLTExMiw2ICsxMTIsNyBAQCBkZWYgZmV0Y2hlcl9pbml0KGQpOgogCiBkZWYgaW5pdCh1cmxz
LCBkLCBzZXR1cCA9IFRydWUpOgogICAgIHVybGRhdGEgPSB7fQorCiAgICAgZm4gPSBiYi5kYXRh
LmdldFZhcignRklMRScsIGQsIDEpCiAgICAgaWYgZm4gaW4gdXJsZGF0YV9jYWNoZToKICAgICAg
ICAgdXJsZGF0YSA9IHVybGRhdGFfY2FjaGVbZm5dCkBAIC0yODEsNyArMjgyLDcgQEAgZGVmIHJ1
bmZldGNoY21kKGNtZCwgZCwgcXVpZXQgPSBGYWxzZSk6CiAgICAgZm9yIHZhciBpbiBleHBvcnR2
YXJzOgogICAgICAgICB2YWwgPSBkYXRhLmdldFZhcih2YXIsIGQsIFRydWUpCiAgICAgICAgIGlm
IHZhbDoKLSAgICAgICAgICAgIGNtZCA9ICdleHBvcnQgJyArIHZhciArICc9JXM7ICVzJyAlICh2
YWwsIGNtZCkKKyAgICAgICAgICAgIGNtZCA9ICdleHBvcnQgJyArIHZhciArICc9XCIlc1wiOyAl
cycgJSAodmFsLCBjbWQpCiAKICAgICBiYi5tc2cuZGVidWcoMSwgYmIubXNnLmRvbWFpbi5GZXRj
aGVyLCAiUnVubmluZyAlcyIgJSBjbWQpCiAKZGlmZiAtLWdpdCBhL2xpYi9iYi9mZXRjaC93Z2V0
LnB5IGIvbGliL2JiL2ZldGNoL3dnZXQucHkKaW5kZXggNDQyZmMzZS4uOGMwZWFiNyAxMDA2NDQK
LS0tIGEvbGliL2JiL2ZldGNoL3dnZXQucHkKKysrIGIvbGliL2JiL2ZldGNoL3dnZXQucHkKQEAg
LTMxLDYgKzMxLDcgQEAgZnJvbSAgIGJiIGltcG9ydCBkYXRhCiBmcm9tICAgYmIuZmV0Y2ggaW1w
b3J0IEZldGNoCiBmcm9tICAgYmIuZmV0Y2ggaW1wb3J0IEZldGNoRXJyb3IKIGZyb20gICBiYi5m
ZXRjaCBpbXBvcnQgdXJpX3JlcGxhY2UKK2Zyb20gICBiYi5mZXRjaCBpbXBvcnQgcnVuZmV0Y2hj
bWQKIAogY2xhc3MgV2dldChGZXRjaCk6CiAgICAgIiIiQ2xhc3MgdG8gZmV0Y2ggdXJscyB2aWEg
J3dnZXQnIiIiCkBAIC02NSwzMyArNjYsMTIgQEAgY2xhc3MgV2dldChGZXRjaCk6CiAgICAgICAg
ICAgICB1cmlfdHlwZSA9IHVyaV9kZWNvZGVkWzBdCiAgICAgICAgICAgICB1cmlfaG9zdCA9IHVy
aV9kZWNvZGVkWzFdCiAKLSAgICAgICAgICAgIGJiLm1zZy5ub3RlKDEsIGJiLm1zZy5kb21haW4u
RmV0Y2hlciwgImZldGNoICIgKyB1cmkpCiAgICAgICAgICAgICBmZXRjaGNtZCA9IGZldGNoY21k
LnJlcGxhY2UoIiR7VVJJfSIsIHVyaS5zcGxpdCgiOyIpWzBdKQogICAgICAgICAgICAgZmV0Y2hj
bWQgPSBmZXRjaGNtZC5yZXBsYWNlKCIke0ZJTEV9IiwgdWQuYmFzZW5hbWUpCi0gICAgICAgICAg
ICBodHRwcHJveHkgPSBOb25lCi0gICAgICAgICAgICBmdHBwcm94eSA9IE5vbmUKLSAgICAgICAg
ICAgIGlmIHVyaV90eXBlID09ICdodHRwJzoKLSAgICAgICAgICAgICAgICBodHRwcHJveHkgPSBk
YXRhLmdldFZhcigiSFRUUF9QUk9YWSIsIGQsIFRydWUpCi0gICAgICAgICAgICAgICAgaHR0cHBy
b3h5X2lnbm9yZSA9IChkYXRhLmdldFZhcigiSFRUUF9QUk9YWV9JR05PUkUiLCBkLCBUcnVlKSBv
ciAiIikuc3BsaXQoKQotICAgICAgICAgICAgICAgIGZvciBwIGluIGh0dHBwcm94eV9pZ25vcmU6
Ci0gICAgICAgICAgICAgICAgICAgIGlmIHVyaV9ob3N0LmVuZHN3aXRoKHApOgotICAgICAgICAg
ICAgICAgICAgICAgICAgaHR0cHByb3h5ID0gTm9uZQotICAgICAgICAgICAgICAgICAgICAgICAg
YnJlYWsKLSAgICAgICAgICAgIGlmIHVyaV90eXBlID09ICdmdHAnOgotICAgICAgICAgICAgICAg
IGZ0cHByb3h5ID0gZGF0YS5nZXRWYXIoIkZUUF9QUk9YWSIsIGQsIFRydWUpCi0gICAgICAgICAg
ICAgICAgZnRwcHJveHlfaWdub3JlID0gKGRhdGEuZ2V0VmFyKCJIVFRQX1BST1hZX0lHTk9SRSIs
IGQsIFRydWUpIG9yICIiKS5zcGxpdCgpCi0gICAgICAgICAgICAgICAgZm9yIHAgaW4gZnRwcHJv
eHlfaWdub3JlOgotICAgICAgICAgICAgICAgICAgICBpZiB1cmlfaG9zdC5lbmRzd2l0aChwKToK
LSAgICAgICAgICAgICAgICAgICAgICAgIGZ0cHByb3h5ID0gTm9uZQotICAgICAgICAgICAgICAg
ICAgICAgICAgYnJlYWsKLSAgICAgICAgICAgIGlmIGh0dHBwcm94eToKLSAgICAgICAgICAgICAg
ICBmZXRjaGNtZCA9ICJodHRwX3Byb3h5PSIgKyBodHRwcHJveHkgKyAiICIgKyBmZXRjaGNtZAot
ICAgICAgICAgICAgaWYgZnRwcHJveHk6Ci0gICAgICAgICAgICAgICAgZmV0Y2hjbWQgPSAiZnRw
X3Byb3h5PSIgKyBmdHBwcm94eSArICIgIiArIGZldGNoY21kCisKKyAgICAgICAgICAgIGJiLm1z
Zy5ub3RlKDEsIGJiLm1zZy5kb21haW4uRmV0Y2hlciwgImZldGNoICIgKyB1cmkpCiAgICAgICAg
ICAgICBiYi5tc2cuZGVidWcoMiwgYmIubXNnLmRvbWFpbi5GZXRjaGVyLCAiZXhlY3V0aW5nICIg
KyBmZXRjaGNtZCkKLSAgICAgICAgICAgIHJldCA9IG9zLnN5c3RlbShmZXRjaGNtZCkKLSAgICAg
ICAgICAgIGlmIHJldCAhPSAwOgotICAgICAgICAgICAgICAgIHJldHVybiBGYWxzZQorICAgICAg
ICAgICAgcnVuZmV0Y2hjbWQoZmV0Y2hjbWQsIGQpCiAKICAgICAgICAgICAgICMgU2FuaXR5IGNo
ZWNrIHNpbmNlIHdnZXQgY2FuIHByZXRlbmQgaXQgc3VjY2VlZCB3aGVuIGl0IGRpZG4ndAogICAg
ICAgICAgICAgIyBBbHNvLCB0aGlzIHVzZWQgdG8gaGFwcGVuIGlmIHNvdXJjZWZvcmdlIHNlbnQg
dXMgdG8gdGhlIG1pcnJvciBwYWdlCi0tIAoxLjcuMQoK

--001485f7bf2000ba64048889f523--
