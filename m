Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <vadmium@gmail.com>) id 1PW6Ii-0002JJ-QB
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Dec 2010 12:59:12 +0100
Received: by wwi17 with SMTP id 17so6972726wwi.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Dec 2010 03:59:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:sender:received
	:in-reply-to:references:date:x-google-sender-auth:message-id:subject
	:from:to:content-type;
	bh=yTffIKmlMKx2gZ3HA9Mk5r1DZfp4tFM0Ue6pir5gJb4=;
	b=lrWDX7vrDqWBHZ++Ny4ZekyCuFKRStbwxQf0BbGqGsdqTLHbhl+zhD7BFTgbgkLCwY
	bEo9iX81woCJr9+4gZP/RzBxOrD7sPtrIbASN/2qO2/1/+dnqymhMb++3TQIfF4egJM1
	FBoAPsUUc/x1QpWtMtJIU4cEu1tetOW9HjnL4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	b=SHJ3Ej5tmWa6KK0q1DvEHz49IP4c4KzPzHRzF6i7bRTOn1jO2gajM8xnsy4PNFIcRb
	jlcn8llEQ7iFhqY+8ulx48vk/vHrbGwVeMzbjestFEVl4AuXRu1fV7VQ9xy+/R0rWh+2
	lmPxAXc9aGmSGbfaGiw9HfN3kHeGSrPC8aLe0=
MIME-Version: 1.0
Received: by 10.216.48.6 with SMTP id u6mr10056883web.77.1293191942462; Fri,
	24 Dec 2010 03:59:02 -0800 (PST)
Sender: vadmium@gmail.com
Received: by 10.216.17.203 with HTTP; Fri, 24 Dec 2010 03:59:02 -0800 (PST)
In-Reply-To: <AANLkTinhwtWJfCFLWdB_QFVMWBYZi1G_C6sPt-qCAL8n@mail.gmail.com>
References: <AANLkTinhwtWJfCFLWdB_QFVMWBYZi1G_C6sPt-qCAL8n@mail.gmail.com>
Date: Fri, 24 Dec 2010 11:59:02 +0000
X-Google-Sender-Auth: m2XB5sbIltCxBonIeBLHXKXIosU
Message-ID: <AANLkTinVRRFpVYfTQHaBDn1qT3BMgekQ4GLbNvPDu9Qt@mail.gmail.com>
From: Martin Panter <vadmium+floss@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: QA issue with staging (workdir) for .la files in xmlrpc-c package
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
X-List-Received-Date: Fri, 24 Dec 2010 11:59:13 -0000
X-Groupsio-MsgNum: 27478
Content-Type: multipart/mixed; boundary=0016364c79dd5b5e72049826b607

--0016364c79dd5b5e72049826b607
Content-Type: text/plain; charset=UTF-8

On 23 December 2010 07:26, Martin Panter <vadmium+floss@gmail.com> wrote:
> I'm having trouble building "xmlrpc-c", which I think is required for
> rtorrent. It's failing at the "do_qa_staging" stage with the messages
> such as "QA Issue with staging: libxmlrpc.la failed sanity test
> (workdir)".

I think I've solved this problem. Half of my solution is to modify the
xmlrpc-c package's Make file to pass the library file names directly
instead of using the "-L<directory> -l<name>" method. The other half
is to force it to use the newer Libtool version instead of its own.
See patch #1 attached, though I'm not really an expert on Libtool or
Open embedded, so I can't say if it might break something else, and I
haven't even tested out the packages I built yet.

> Previously I thought I had another "QA issue" with this xmlrpc-c
> package, something about a "hash style", which I thought I solved by
> passing LADD='${LDFLAGS}' to the Make command. But recently when I
> removed this change I am not getting the earlier "hash style QA
> issue"; only this newer "workdir" one. But I may be confused.

Still confused why this other failure temporarily went away but when I
fixed the "workdir" issue above, this "GNU_HASH" one came back.
Solution I originally tried worked and is in patch #2 attached.

-Martin

--0016364c79dd5b5e72049826b607
Content-Type: text/plain; charset=UTF-8; name="1.xmlrpc-la-workdir.patch.txt"
Content-Disposition: attachment; filename="1.xmlrpc-la-workdir.patch.txt"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_gi2kbtq50

RnJvbSA1Mjg2N2FkMDA4NDVhNGY2N2FjOWFlNGNmODMzNWZmMWY0YzNkYWFhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBNYXJ0aW4gUGFudGVyIDx2YWRtaXVtIMOgIGdtYWlsLmNvbT4K
RGF0ZTogRnJpLCAyNCBEZWMgMjAxMCAwMjowMDo0NCArMDAwMApTdWJqZWN0OiBbUEFUQ0ggMS8y
XSBYTUwtUlBDOiBBdm9pZCAiUUEgaXNzdWUiIHdoZXJlIGJ1aWxkIGRpcmVjdG9yeSBpcyBoYXJk
LWNvZGVkIGludG8gLmxhIGZpbGVzCgpBZGRzIGEgcGF0Y2ggdG8gYXZvaWQgdXNpbmcgLUwgbGlu
ayBmbGFncywgYW5kIGZvcmNlcyB0aGUgTWFrZSBmaWxlcyB0byB1c2UgYQpuZXdlciBleHRlcm5h
bCBMaWJ0b29sLgotLS0KIHJlY2lwZXMveG1scnBjLWMveG1scnBjLWMtMS4wNi40MS9saWItcGF0
aC5wYXRjaCB8ICAgNTggKysrKysrKysrKysrKysrKysrKysrKwogcmVjaXBlcy94bWxycGMtYy94
bWxycGMtY18xLjA2LjQxLmJiICAgICAgICAgICAgIHwgICAgOSArKystCiAyIGZpbGVzIGNoYW5n
ZWQsIDY2IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb25zKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQg
cmVjaXBlcy94bWxycGMtYy94bWxycGMtYy0xLjA2LjQxL2xpYi1wYXRoLnBhdGNoCgpkaWZmIC0t
Z2l0IGEvcmVjaXBlcy94bWxycGMtYy94bWxycGMtYy0xLjA2LjQxL2xpYi1wYXRoLnBhdGNoIGIv
cmVjaXBlcy94bWxycGMtYy94bWxycGMtYy0xLjA2LjQxL2xpYi1wYXRoLnBhdGNoCm5ldyBmaWxl
IG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAuLjFlYzE0OGIKLS0tIC9kZXYvbnVsbAorKysgYi9y
ZWNpcGVzL3htbHJwYy1jL3htbHJwYy1jLTEuMDYuNDEvbGliLXBhdGgucGF0Y2gKQEAgLTAsMCAr
MSw1OCBAQAorRG9uJ3QgdXNlIGJ1aWxkIGRpcmVjdG9yaWVzIGluIHRoZSBsaWJyYXJ5IHNlYXJj
aCBwYXRoIGJlY2F1c2UgaXQgYXBwYXJlbnRseQorY2F1c2VzIExpYnRvb2wgdG8gaGFyZC1jb2Rl
IHRoZSBidWlsZCBkaXJlY3RvcmllcyBpbnNpZGUgaW5zdGFsbGVkIC5sYSBmaWxlcywKK3RyaWdn
ZXJpbmcgIlFBIGlzc3VlcyIuIFVzZSB3aXRoIG5ld2VyIExpYnRvb2wuCistLS0geG1scnBjLWMt
MS4wNi40MS9zcmMvTWFrZWZpbGUKKysrKyB4bWxycGMtYy0xLjA2LjQxL3NyYy9NYWtlZmlsZQor
QEAgLTcsOCArNyw4IEBAIFZQQVRIID0gLjokKFNSQ0RJUikKKyAKKyBpbmNsdWRlICQoQlVJTERE
SVIpL01ha2VmaWxlLmNvbmZpZworIAorLUFCWVNTX0xJQkRJUiA9ICQoQlVJTERESVIpL2xpYi9h
Ynlzcy9zcmMvLmxpYnMKKy1MSUJVVElMX0xJQkRJUiA9ICQoQlVJTERESVIpL2xpYi9saWJ1dGls
Ly5saWJzCisrQUJZU1NfTElCID0gJChCVUlMRERJUikvbGliL2FieXNzL3NyYy9saWJ4bWxycGNf
YWJ5c3MubGEKKytMSUJVVElMX0xJQiA9ICQoQlVJTERESVIpL2xpYi9saWJ1dGlsL2xpYnhtbHJw
Y191dGlsLmxhCisgCisgZGVmYXVsdDogYWxsCisgCitAQCAtNzAsMTcgKzcwLDE3IEBAIGVuZGlm
CisgIyBtYXkgcmVxdWlyZSB0aGUgbmVjZXNzYXJ5IC1MIG9wdGlvbnMgaW4gYWRkaXRpb24uCisg
CisgTElCWE1MUlBDX0NMSUVOVF9PQkpTID0geG1scnBjX2NsaWVudC5sbyB4bWxycGNfY2xpZW50
X2dsb2JhbC5sbworLUxJQlhNTFJQQ19DTElFTlRfTElCREVQID0gLWx4bWxycGNfdXRpbCAtbHht
bHJwYworK0xJQlhNTFJQQ19DTElFTlRfTElCREVQID0gJChMSUJVVElMX0xJQikgbGlieG1scnBj
LmxhCisgCisgTElCWE1MUlBDX1NFUlZFUl9PQkpTID0gcmVnaXN0cnkubG8gc3lzdGVtX21ldGhv
ZC5sbworLUxJQlhNTFJQQ19TRVJWRVJfTElCREVQID0gLWx4bWxycGNfdXRpbCAtbHhtbHJwYwor
K0xJQlhNTFJQQ19TRVJWRVJfTElCREVQID0gJChMSUJVVElMX0xJQikgbGlieG1scnBjLmxhCisg
CisgTElCWE1MUlBDX1NFUlZFUl9BQllTU19PQkpTID0geG1scnBjX3NlcnZlcl9hYnlzcy5sbwor
IExJQlhNTFJQQ19TRVJWRVJfQUJZU1NfTElCREVQID0gXAorLSAgLWx4bWxycGNfdXRpbCAtbHht
bHJwY19zZXJ2ZXIgLUwkKEFCWVNTX0xJQkRJUikgLWx4bWxycGNfYWJ5c3MgLWx4bWxycGMKKysg
ICQoTElCVVRJTF9MSUIpIGxpYnhtbHJwY19zZXJ2ZXIubGEgJChBQllTU19MSUIpIGxpYnhtbHJw
Yy5sYQorIAorIExJQlhNTFJQQ19TRVJWRVJfQ0dJX09CSlMgPSB4bWxycGNfc2VydmVyX2NnaS5s
bworLUxJQlhNTFJQQ19TRVJWRVJfQ0dJX0xJQkRFUCA9IC1seG1scnBjX3V0aWwgLWx4bWxycGNf
c2VydmVyIC1seG1scnBjCisrTElCWE1MUlBDX1NFUlZFUl9DR0lfTElCREVQID0gJChMSUJVVElM
X0xJQikgbGlieG1scnBjX3NlcnZlci5sYSBsaWJ4bWxycGMubGEKKyAKKyBMSUJYTUxSUENfT0JK
UyA9IFwKKyAJdHJhY2UubG8gXAorQEAgLTk2LDcgKzk2LDcgQEAgTElCWE1MUlBDX09CSlMgPSBc
CisgCXhtbHJwY191dGY4LmxvIFwKKyAJeG1scnBjX2F1dGhjb29raWUubG8gXAorIAorLUxJQlhN
TFJQQ19MSUJERVAgPSAtbHhtbHJwY191dGlsICQoTElCWE1MX0xJQlMpCisrTElCWE1MUlBDX0xJ
QkRFUCA9ICQoTElCVVRJTF9MSUIpICQoTElCWE1MX0xJQlMpCisgCisgTElCX09CSlMgPSAkKExJ
QlhNTFJQQ19DTElFTlRfT0JKUykgJChMSUJYTUxSUENfU0VSVkVSX09CSlMpCisgCitAQCAtMTMz
LDkgKzEzMyw3IEBAIGFsbDogJChUQVJHRVRfTFRMSUJSQVJJRVMpICQoU1VCRElSUzolPSUKKyAK
KyBMREZMQUdTID0gJChMQUREKQorIAorLUxJQlBBVEhTID0gLUwubGlicyAtTCQoTElCVVRJTF9M
SUJESVIpCistCistTElCTERGTEFHUyA9ICQoTERGTEFHU19WRVJTSU5GTykgLXJwYXRoICQoTElC
SU5TVF9ESVIpICQoTElCUEFUSFMpICQoTEFERCkKKytMSUJMREZMQUdTID0gJChMREZMQUdTX1ZF
UlNJTkZPKSAtcnBhdGggJChMSUJJTlNUX0RJUikgJChMQUREKQorIAorIAorIGxpYnhtbHJwYy5s
YTogJChMSUJYTUxSUENfT0JKUykKZGlmZiAtLWdpdCBhL3JlY2lwZXMveG1scnBjLWMveG1scnBj
LWNfMS4wNi40MS5iYiBiL3JlY2lwZXMveG1scnBjLWMveG1scnBjLWNfMS4wNi40MS5iYgppbmRl
eCBlOWJiYzMxLi40NmQzYThkIDEwMDY0NAotLS0gYS9yZWNpcGVzL3htbHJwYy1jL3htbHJwYy1j
XzEuMDYuNDEuYmIKKysrIGIvcmVjaXBlcy94bWxycGMtYy94bWxycGMtY18xLjA2LjQxLmJiCkBA
IC0xNCwxMiArMTQsMTkgQEAgUEFSQUxMRUxfTUFLRSA9ICIiCiAKIGluaGVyaXQgYXV0b3Rvb2xz
IGJpbmNvbmZpZwogCisjIEVYVFJBX09FTUFLRSBvbmx5IHdvcmtzIGlmIGFmdGVyIGluaGVyaXQg
bGluZSBhYm92ZQorCisjIE9sZGVyIGludGVybmFsIExpYnRvb2wgZG9lc24ndCB3b3JrIHdpdGgg
bGliLXBhdGgucGF0Y2ggKGJlbG93KQorRVhUUkFfT0VNQUtFICs9ICJMSUJUT09MPScke0hPU1Rf
U1lTfS1saWJ0b29sJyIKKwogZG9fY29uZmlndXJlICgpIHsKIAlnbnUtY29uZmlnaXplCiAgICAg
ICAgIG9lX3J1bmNvbmYKIH0KIAotU1JDX1VSSSA9ICIke1NPVVJDRUZPUkdFX01JUlJPUn0vJHtQ
Tn0vJHtQfS50Z3oiCitTUkNfVVJJID0gIiR7U09VUkNFRk9SR0VfTUlSUk9SfS8ke1BOfS8ke1B9
LnRneiBcCisgICAgICAgIGZpbGU6Ly9saWItcGF0aC5wYXRjaCBcCisiCiBTUkNfVVJJW21kNXN1
bV0gPSAiMDJjNmI4OWI4ZmY5MTEzNDFiNmI2ZDRhNmM2MjFlYTkiCiBTUkNfVVJJW3NoYTI1NnN1
bV0gPSAiYTEzZjVlZjQwZWQ3NWQ4OTU0M2I5Y2QwODYxODUxMjFkZWFkOWZjN2RlODUwY2E0ZDJl
ZGQ5YTBjZWMxMjIwNSIKIAotLSAKMS43LjEKCg==

--0016364c79dd5b5e72049826b607
Content-Type: text/plain; charset=UTF-8; name="2.xmlrpc-ldflags.patch.txt"
Content-Disposition: attachment; filename="2.xmlrpc-ldflags.patch.txt"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_gi2kc4fh1

RnJvbSBiNDZlOGU4Zjc2MmMwNzczNDdjNTI1YmY0NGUxMTUzM2RhZWE3MDM4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBNYXJ0aW4gUGFudGVyIDx2YWRtaXVtIMOgIGdtYWlsLmNvbT4K
RGF0ZTogVGh1LCAyMyBEZWMgMjAxMCAwNTowOTo0OCArMDAwMApTdWJqZWN0OiBbUEFUQ0ggMi8y
XSBYTUwtUlBDOiBGaXggYSAiUUEgaXNzdWUiIGFib3V0IG1pc3NpbmcgIkdOVV9IQVNIIgoKUGFz
cyBMREZMQUdTIHRvIHRoZSBNYWtlIGZpbGVzIHdoaWNoIGNvbnRhaW5zIHRoZSBmbGFncyB0byBz
dG9wIHRoaXMKLS0tCiByZWNpcGVzL3htbHJwYy1jL3htbHJwYy1jXzEuMDYuNDEuYmIgfCAgICAz
ICsrKwogMSBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDAgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvcmVjaXBlcy94bWxycGMtYy94bWxycGMtY18xLjA2LjQxLmJiIGIvcmVjaXBl
cy94bWxycGMtYy94bWxycGMtY18xLjA2LjQxLmJiCmluZGV4IDQ2ZDNhOGQuLmQ0OTZmYzMgMTAw
NjQ0Ci0tLSBhL3JlY2lwZXMveG1scnBjLWMveG1scnBjLWNfMS4wNi40MS5iYgorKysgYi9yZWNp
cGVzL3htbHJwYy1jL3htbHJwYy1jXzEuMDYuNDEuYmIKQEAgLTE5LDYgKzE5LDkgQEAgaW5oZXJp
dCBhdXRvdG9vbHMgYmluY29uZmlnCiAjIE9sZGVyIGludGVybmFsIExpYnRvb2wgZG9lc24ndCB3
b3JrIHdpdGggbGliLXBhdGgucGF0Y2ggKGJlbG93KQogRVhUUkFfT0VNQUtFICs9ICJMSUJUT09M
PScke0hPU1RfU1lTfS1saWJ0b29sJyIKIAorIyBUaGUgTWFrZSBmaWxlcyBzZWVtIHRvIG92ZXJ3
cml0ZSBMREZMQUdTIHdpdGggdGhlIGNvbnRlbnRzIG9mIExBREQKK0VYVFJBX09FTUFLRSArPSAi
TEFERD0nJHtMREZMQUdTfSciCisKIGRvX2NvbmZpZ3VyZSAoKSB7CiAJZ251LWNvbmZpZ2l6ZQog
ICAgICAgICBvZV9ydW5jb25mCi0tIAoxLjcuMQoK

--0016364c79dd5b5e72049826b607--
