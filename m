Received: from [209.85.146.178] (helo=wa-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <raj.khem@gmail.com>) id 1IH7eJ-0007M2-DN
	for Openembedded-devel@lists.openembedded.org;
	Sat, 04 Aug 2007 02:37:43 +0200
Received: by wa-out-1112.google.com with SMTP id l24so1212314waf
	for <Openembedded-devel@lists.openembedded.org>;
	Fri, 03 Aug 2007 17:35:31 -0700 (PDT)
Received: by 10.114.254.1 with SMTP id b1mr3471073wai.1186187731227;
	Fri, 03 Aug 2007 17:35:31 -0700 (PDT)
Received: by 10.114.208.14 with HTTP; Fri, 3 Aug 2007 17:35:30 -0700 (PDT)
Message-ID: <19c1b8a90708031735x59bf4341u736aeb19977c34a0@mail.gmail.com>
Date: Fri, 3 Aug 2007 17:35:30 -0700
From: "Khem Raj" <raj.khem@gmail.com>
To: Openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Subject: PATCH: Use uImage make target for linux-omap1
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 04 Aug 2007 00:37:44 -0000
X-Groupsio-MsgNum: 2593
Content-Type: multipart/mixed; 
	boundary="----=_Part_86659_21075344.1186187730925"

------=_Part_86659_21075344.1186187730925
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello,

Current uImage generated for omap1 target did not boot on my target.
We are using manual method to create uImage.
This patch uses uImage KERNEL_IMAGETYPE for omap1 targets. I have
tested this on omap5912osk and the resulting uImage booted just fine.

If it is OK please consider this patch for applying.

Thanks

-Khem

------=_Part_86659_21075344.1186187730925
Content-Type: application/octet-stream; name=diff
Content-Transfer-Encoding: base64
X-Attachment-Id: f_f4xc5o7y
Content-Disposition: attachment; filename="diff"

IwojIG9sZF9yZXZpc2lvbiBbNzk1NGQ0Mjc1ZGMxODY1ZTAxMTQwNzEyNmNmZDQ1NWQ4OTdlNzU0
ZF0KIwojIHBhdGNoICJwYWNrYWdlcy9saW51eC9saW51eC1vbWFwMS5pbmMiCiMgIGZyb20gWzhm
YzFjNDY4NTg1MjQ0NjI0NGQ5MWE5MzkxMGVkNTg3YmRjNTJhYThdCiMgICAgdG8gW2M4MGU1NmEz
ZmYzYjY1YWVkY2I1NTdkYjYzZjM3Njc4YTMzYWJmZGNdCiMKPT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09Ci0tLSBwYWNrYWdlcy9saW51
eC9saW51eC1vbWFwMS5pbmMJOGZjMWM0Njg1ODUyNDQ2MjQ0ZDkxYTkzOTEwZWQ1ODdiZGM1MmFh
OAorKysgcGFja2FnZXMvbGludXgvbGludXgtb21hcDEuaW5jCWM4MGU1NmEzZmYzYjY1YWVkY2I1
NTdkYjYzZjM3Njc4YTMzYWJmZGMKQEAgLTcsOCArNyw3IEBAIGluaGVyaXQga2VybmVsCiAKIGlu
aGVyaXQga2VybmVsCiAKLUtFUk5FTF9JTUFHRVRZUEUgPSAidm1saW51eCIKLUtFUk5FTF9PVVRQ
VVQgPSAiJHtLRVJORUxfSU1BR0VUWVBFfSIKK0tFUk5FTF9JTUFHRVRZUEUgPSAidUltYWdlIgog
CiBtb2R1bGVfYXV0b2xvYWRfb2hjaS1oY2Rfb21hcDU5MTJvc2sgPSAib2hjaS1oY2QiCiAKQEAg
LTIyLDE1ICsyMSw5IEBAIGRvX2NvbmZpZ3VyZV9wcmVwZW5kKCkgewogCiAgICAgICAgIG9lX3J1
bm1ha2Ugb2xkY29uZmlnCiB9Ci0KIGRvX2RlcGxveSgpIHsKLSAgICAgICAgaWYgWyAiJHtNQUNI
SU5FfSIgPT0gIm9tYXA1OTEyb3NrIiBdOyB0aGVuCi0gICAgICAgICAgICAgICAgaW5zdGFsbCAt
ZCAke0RFUExPWV9ESVJfSU1BR0V9Ci0gICAgICAgICAgICAgICAgJHtPQkpDT1BZfSAtTyBiaW5h
cnkgLVIgLm5vdGUgLVIgLmNvbW1lbnQgLVMgJHtLRVJORUxfT1VUUFVUfSAke1N9L2xpbnV4LmJp
bgotICAgICAgICAgICAgICAgIGd6aXAgLWYgLTkgJHtTfS9saW51eC5iaW4KLSAgICAgICAgICAg
ICAgICBta2ltYWdlIC1BIGFybSAtTyBsaW51eCAtVCBrZXJuZWwgLUMgZ3ppcCAtYSAweDEwMDA4
MDAwIC1lIDB4MTAwMDgwMDAgLW4gIk9FIiAtZCAke1N9L2xpbnV4LmJpbi5neiAke0RFUExPWV9E
SVJfSU1BR0V9LyR7S0VSTkVMX0lNQUdFVFlQRX0tJHtLRVJORUxfVkVSU0lPTn0tJHtNQUNISU5F
fS0ke0RBVEVUSU1FfS5iaW4KLSAgICAgICAgICAgICAgICBybSAke1N9L2xpbnV4LmJpbi5negot
ICAgICAgICBmaQorICAgICAgICBpbnN0YWxsIC1kICR7REVQTE9ZX0RJUl9JTUFHRX0KKyAgICAg
ICAgaW5zdGFsbCAtbSAwNjQ0IGFyY2gvJHtBUkNIfS9ib290LyR7S0VSTkVMX0lNQUdFVFlQRX0g
JHtERVBMT1lfRElSX0lNQUdFfS8ke0tFUk5FTF9JTUFHRVRZUEV9LSR7UFZ9LSR7TUFDSElORX0t
JHtEQVRFVElNRX0KIH0KIAogZG9fZGVwbG95W2RpcnNdID0gIiR7U30iCg==

------=_Part_86659_21075344.1186187730925--
