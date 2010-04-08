Received: from mail-ww0-f47.google.com ([74.125.82.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <tarjei.knapstad@gmail.com>) id 1Nzo9v-00071y-2O
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 Apr 2010 11:36:24 +0200
Received: by wwb13 with SMTP id 13so106119wwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Apr 2010 02:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:received:message-id:subject:from:to:content-type;
	bh=crj+6BCSDwDdGOtsOqmVTVoKB5qjxMzKtoFBh5auzxs=;
	b=XnR2uwJPfaoBTA5rEI5GNyW2zJ4mgQasO2iTX6r8eY6id4Z/80qyLp5DeW2Lv/j5MF
	szSvvSPvEvj81z3LR0dZ3ESDo7Mh6ZLuRzTU9WknTPO9i7EzxD5XghrFLxYxgVYWYayB
	xABLcVo9XGQ9UxkEt/XSRNk+XWAyKNVTOju2I=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=F+fuom2dCoBN64+T2BLu6Dnz9Y17fkr1gFebxp918uHngCbgLwlJRukrclGDsUXQ9Q
	GefkHot41gr97BnXAowY0Kv9Yv1go3an00QNC/w3b/S3KpZIH9wwhTIoQEvvBlgQgewF
	8ceKBm9nnPF0xUchDtEZGwZAf/L/XRK2nvuZw=
MIME-Version: 1.0
Received: by 10.216.163.69 with HTTP; Thu, 8 Apr 2010 02:32:58 -0700 (PDT)
In-Reply-To: <y2iff5e09cc1004070419rc4d1a8b5pc70183541054163b@mail.gmail.com>
References: <y2iff5e09cc1004070419rc4d1a8b5pc70183541054163b@mail.gmail.com>
Date: Thu, 8 Apr 2010 11:32:58 +0200
Received: by 10.216.176.206 with SMTP id b56mr227754wem.63.1270719178052; Thu, 
	08 Apr 2010 02:32:58 -0700 (PDT)
Message-ID: <v2jff5e09cc1004080232n8689f7fcr6cc4155f260a33b9@mail.gmail.com>
From: Tarjei Knapstad <tarjei.knapstad@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.47
X-SA-Exim-Mail-From: tarjei.knapstad@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [SOLVED] Does anyone have a CUPS 1.4.x recipe?
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
X-List-Received-Date: Thu, 08 Apr 2010 09:36:24 -0000
X-Groupsio-MsgNum: 18480
Content-Type: multipart/mixed; boundary=001485f1e36e3796910483b65db9

--001485f1e36e3796910483b65db9
Content-Type: text/plain; charset=ISO-8859-1

On 7 April 2010 13:19, Tarjei Knapstad <tarjei.knapstad@gmail.com> wrote:
> Hi,
>
> I've been trying to build CUPS 1.4.2 and 1.4.3 on the OE unstable
> branch (Angstrom for a BeagleBoard) which seems to work fine after tweaking
> the recipes for 1.3.8 slightly. The cupsd daemon segfaults instantly
> however, and I'm having
> some trouble debugging the cause.
>
> Before I spend more time trying to get to the bottom of this, has
> anyone been able to successfully build and run CUPS 1.4.x on the BB
> and have a recipe they could share? I found a posting from Jay Snyder
> back in January, but couldn't find an actual commit anywhere:
> http://www.mail-archive.com/openembedded-devel@lists.openembedded.org/msg02702.html
>
> I have attached my attempt at a recipe (skips building manpages and
> testing the ppdc tools).
>

Finally figured it out. Seems like the Beagle is not too happy about
code compiled with the '-pie -fPIE' and '-fstack-protector' options.
After removing these from the configure script everything seems to be
running just fine.

Crude patch attached (should probably patch configure.in instead and
run autoreconf, but can't be bothered at the mo).

Regards,
--
Tarjei

--001485f1e36e3796910483b65db9
Content-Type: text/x-patch; charset=US-ASCII; name="configure.patch"
Content-Disposition: attachment; filename="configure.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_g7rdf6b61

LS0tIGN1cHMtMS40LjMvY29uZmlndXJlLm9yaWcJMjAxMC0wNC0wOCAxMToxNDoxOS4wOTIyOTYw
MTQgKzAyMDAKKysrIGN1cHMtMS40LjMvY29uZmlndXJlCTIwMTAtMDQtMDggMTE6MTk6MDIuNjYx
NDE3OTM4ICswMjAwCkBAIC0xMDk0MCwxMTQgKzEwOTQwLDYgQEAKICAgICAJCU9QVElNPSItZlBJ
QyAkT1BUSU0iCiAJZmkKIAotCSMgVGhlIC1mc3RhY2stcHJvdGVjdG9yIG9wdGlvbiBpcyBhdmFp
bGFibGUgd2l0aCBzb21lIHZlcnNpb25zIG9mCi0JIyBHQ0MgYW5kIGFkZHMgInN0YWNrIGNhbmFy
aWVzIiB3aGljaCBkZXRlY3Qgd2hlbiB0aGUgcmV0dXJuIGFkZHJlc3MKLQkjIGhhcyBiZWVuIG92
ZXJ3cml0dGVuLCBwcmV2ZW50aW5nIG1hbnkgdHlwZXMgb2YgZXhwbG9pdCBhdHRhY2tzLgotCXsg
ZWNobyAiJGFzX21lOiRMSU5FTk86IGNoZWNraW5nIGlmIEdDQyBzdXBwb3J0cyAtZnN0YWNrLXBy
b3RlY3RvciIgPiY1Ci1lY2hvICRFQ0hPX04gImNoZWNraW5nIGlmIEdDQyBzdXBwb3J0cyAtZnN0
YWNrLXByb3RlY3Rvci4uLiAkRUNIT19DIiA+JjY7IH0KLQlPTERDRkxBR1M9IiRDRkxBR1MiCi0J
Q0ZMQUdTPSIkQ0ZMQUdTIC1mc3RhY2stcHJvdGVjdG9yIgotCWNhdCA+Y29uZnRlc3QuJGFjX2V4
dCA8PF9BQ0VPRgotLyogY29uZmRlZnMuaC4gICovCi1fQUNFT0YKLWNhdCBjb25mZGVmcy5oID4+
Y29uZnRlc3QuJGFjX2V4dAotY2F0ID4+Y29uZnRlc3QuJGFjX2V4dCA8PF9BQ0VPRgotLyogZW5k
IGNvbmZkZWZzLmguICAqLwotCi1pbnQKLW1haW4gKCkKLXsKLQotICA7Ci0gIHJldHVybiAwOwot
fQotX0FDRU9GCi1ybSAtZiBjb25mdGVzdC4kYWNfb2JqZXh0IGNvbmZ0ZXN0JGFjX2V4ZWV4dAot
aWYgeyAoYWNfdHJ5PSIkYWNfbGluayIKLWNhc2UgIigoJGFjX3RyeSIgaW4KLSAgKlwiKiB8ICpc
YCogfCAqXFwqKSBhY190cnlfZWNobz1cJGFjX3RyeTs7Ci0gICopIGFjX3RyeV9lY2hvPSRhY190
cnk7OwotZXNhYwotZXZhbCAiZWNobyBcIlwkYXNfbWU6JExJTkVOTzogJGFjX3RyeV9lY2hvXCIi
KSA+JjUKLSAgKGV2YWwgIiRhY19saW5rIikgMj5jb25mdGVzdC5lcjEKLSAgYWNfc3RhdHVzPSQ/
Ci0gIGdyZXAgLXYgJ14gKisnIGNvbmZ0ZXN0LmVyMSA+Y29uZnRlc3QuZXJyCi0gIHJtIC1mIGNv
bmZ0ZXN0LmVyMQotICBjYXQgY29uZnRlc3QuZXJyID4mNQotICBlY2hvICIkYXNfbWU6JExJTkVO
TzogXCQ/ID0gJGFjX3N0YXR1cyIgPiY1Ci0gIChleGl0ICRhY19zdGF0dXMpOyB9ICYmIHsKLQkg
dGVzdCAteiAiJGFjX2Nfd2Vycm9yX2ZsYWciIHx8Ci0JIHRlc3QgISAtcyBjb25mdGVzdC5lcnIK
LSAgICAgICB9ICYmIHRlc3QgLXMgY29uZnRlc3QkYWNfZXhlZXh0ICYmCi0gICAgICAgJGFzX3Rl
c3RfeCBjb25mdGVzdCRhY19leGVleHQ7IHRoZW4KLSAgT1BUSU09IiRPUFRJTSAtZnN0YWNrLXBy
b3RlY3RvciIKLQkJeyBlY2hvICIkYXNfbWU6JExJTkVOTzogcmVzdWx0OiB5ZXMiID4mNQotZWNo
byAiJHtFQ0hPX1R9eWVzIiA+JjY7IH0KLWVsc2UKLSAgZWNobyAiJGFzX21lOiBmYWlsZWQgcHJv
Z3JhbSB3YXM6IiA+JjUKLXNlZCAncy9eL3wgLycgY29uZnRlc3QuJGFjX2V4dCA+JjUKLQotCXsg
ZWNobyAiJGFzX21lOiRMSU5FTk86IHJlc3VsdDogbm8iID4mNQotZWNobyAiJHtFQ0hPX1R9bm8i
ID4mNjsgfQotZmkKLQotcm0gLWYgY29yZSBjb25mdGVzdC5lcnIgY29uZnRlc3QuJGFjX29iamV4
dCBjb25mdGVzdF9pcGE4X2NvbmZ0ZXN0Lm9vIFwKLSAgICAgIGNvbmZ0ZXN0JGFjX2V4ZWV4dCBj
b25mdGVzdC4kYWNfZXh0Ci0JQ0ZMQUdTPSIkT0xEQ0ZMQUdTIgotCi0JIyBUaGUgLXBpZSBvcHRp
b24gaXMgYXZhaWxhYmxlIHdpdGggc29tZSB2ZXJzaW9ucyBvZiBHQ0MgYW5kIGFkZHMKLQkjIHJh
bmRvbWl6YXRpb24gb2YgYWRkcmVzc2VzLCB3aGljaCBhdm9pZHMgYW5vdGhlciBjbGFzcyBvZiBl
eHBsb2l0cwotCSMgdGhhdCBkZXBlbmQgb24gYSBmaXhlZCBhZGRyZXNzIGZvciBjb21tb24gZnVu
Y3Rpb25zLgotCXsgZWNobyAiJGFzX21lOiRMSU5FTk86IGNoZWNraW5nIGlmIEdDQyBzdXBwb3J0
cyAtcGllIiA+JjUKLWVjaG8gJEVDSE9fTiAiY2hlY2tpbmcgaWYgR0NDIHN1cHBvcnRzIC1waWUu
Li4gJEVDSE9fQyIgPiY2OyB9Ci0JT0xEQ0ZMQUdTPSIkQ0ZMQUdTIgotCUNGTEFHUz0iJENGTEFH
UyAtcGllIC1mUElFIgotCWNhdCA+Y29uZnRlc3QuJGFjX2V4dCA8PF9BQ0VPRgotLyogY29uZmRl
ZnMuaC4gICovCi1fQUNFT0YKLWNhdCBjb25mZGVmcy5oID4+Y29uZnRlc3QuJGFjX2V4dAotY2F0
ID4+Y29uZnRlc3QuJGFjX2V4dCA8PF9BQ0VPRgotLyogZW5kIGNvbmZkZWZzLmguICAqLwotCi1p
bnQKLW1haW4gKCkKLXsKLQotICA7Ci0gIHJldHVybiAwOwotfQotX0FDRU9GCi1ybSAtZiBjb25m
dGVzdC4kYWNfb2JqZXh0Ci1pZiB7IChhY190cnk9IiRhY19jb21waWxlIgotY2FzZSAiKCgkYWNf
dHJ5IiBpbgotICAqXCIqIHwgKlxgKiB8ICpcXCopIGFjX3RyeV9lY2hvPVwkYWNfdHJ5OzsKLSAg
KikgYWNfdHJ5X2VjaG89JGFjX3RyeTs7Ci1lc2FjCi1ldmFsICJlY2hvIFwiXCRhc19tZTokTElO
RU5POiAkYWNfdHJ5X2VjaG9cIiIpID4mNQotICAoZXZhbCAiJGFjX2NvbXBpbGUiKSAyPmNvbmZ0
ZXN0LmVyMQotICBhY19zdGF0dXM9JD8KLSAgZ3JlcCAtdiAnXiAqKycgY29uZnRlc3QuZXIxID5j
b25mdGVzdC5lcnIKLSAgcm0gLWYgY29uZnRlc3QuZXIxCi0gIGNhdCBjb25mdGVzdC5lcnIgPiY1
Ci0gIGVjaG8gIiRhc19tZTokTElORU5POiBcJD8gPSAkYWNfc3RhdHVzIiA+JjUKLSAgKGV4aXQg
JGFjX3N0YXR1cyk7IH0gJiYgewotCSB0ZXN0IC16ICIkYWNfY193ZXJyb3JfZmxhZyIgfHwKLQkg
dGVzdCAhIC1zIGNvbmZ0ZXN0LmVycgotICAgICAgIH0gJiYgdGVzdCAtcyBjb25mdGVzdC4kYWNf
b2JqZXh0OyB0aGVuCi0gIFBJRUZMQUdTPSItcGllIC1mUElFIgotCQl7IGVjaG8gIiRhc19tZTok
TElORU5POiByZXN1bHQ6IHllcyIgPiY1Ci1lY2hvICIke0VDSE9fVH15ZXMiID4mNjsgfQotZWxz
ZQotICBlY2hvICIkYXNfbWU6IGZhaWxlZCBwcm9ncmFtIHdhczoiID4mNQotc2VkICdzL14vfCAv
JyBjb25mdGVzdC4kYWNfZXh0ID4mNQotCi0JeyBlY2hvICIkYXNfbWU6JExJTkVOTzogcmVzdWx0
OiBubyIgPiY1Ci1lY2hvICIke0VDSE9fVH1ubyIgPiY2OyB9Ci1maQotCi1ybSAtZiBjb3JlIGNv
bmZ0ZXN0LmVyciBjb25mdGVzdC4kYWNfb2JqZXh0IGNvbmZ0ZXN0LiRhY19leHQKLQlDRkxBR1M9
IiRPTERDRkxBR1MiCi0KIAlpZiB0ZXN0ICJ4JHdpdGhfb3B0aW0iID0geDsgdGhlbgogCQkjIEFk
ZCB1c2VmdWwgd2FybmluZyBvcHRpb25zIGZvciB0cmFja2luZyBkb3duIHByb2JsZW1zLi4uCiAJ
CU9QVElNPSItV2FsbCAtV25vLWZvcm1hdC15MmsgJE9QVElNIgo=

--001485f1e36e3796910483b65db9--
