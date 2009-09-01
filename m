Received: from [209.85.220.214] (helo=mail-fx0-f214.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1MiTr9-0001Kv-Lt
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Sep 2009 15:57:07 +0200
Received: by fxm10 with SMTP id 10so4993fxm.21
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Sep 2009 06:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type; bh=mGeyfk2HCJFY2rz5uRZLLa/9gUWnPLnDoMCg/wZ0yBI=;
	b=sF51dSr95s6e/Z3/9DJaRZRknliyVAIKSlrjNdtSYsbpJBAG7ZPua2P4gNHhfRzpe8
	zlt6HipH5/A8/oaiyn0n89kDQZqiBCQSazkkBdo/itypSymzhINhH12gAsIy/dl+VZ1p
	GZcRyHPMvy0VSgqV6s003G/9b+cDozW2BZtTo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	b=NZB3fNzfHcH2byc+0HXaGv0IlvC1e0gZGOVmdVkFbqfpPTUe4tu5HegD4pmo/YNLXz
	iZQgZOKT7ukvgkS8Fz0+L1nobjNjWPDLK5eVe0AH41NHkxhfA94BGhojQ2ut6ekklrs8
	NPZ7hKPg9pgIGjV/I5tubZoIT2ywv2syNDpmE=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.239.139.132 with SMTP id t4mr584455hbt.88.1251812308492; Tue, 
	01 Sep 2009 06:38:28 -0700 (PDT)
In-Reply-To: <b6ebd0a50908261905r7d839647k6fc53460301efca0@mail.gmail.com>
References: <b6ebd0a50908261905r7d839647k6fc53460301efca0@mail.gmail.com>
Date: Tue, 1 Sep 2009 10:38:28 -0300
X-Google-Sender-Auth: 9377ea0277ee7240
Message-ID: <be7a9f3d0909010638h75451d65la4a599a1583c3208@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: srctree & gitver
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
X-List-Received-Date: Tue, 01 Sep 2009 13:57:08 -0000
X-Groupsio-MsgNum: 12902
Content-Type: multipart/mixed; boundary=001485f723daf92203047284431f

--001485f723daf92203047284431f
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello Chris,

On Wed, Aug 26, 2009 at 11:05 PM, Chris Larson<clarson@kergoth.com> wrote:
[...]
> gitver facilitates extraction of version information from git. =A0By
> default, it runs 'git describe' to get the version. =A0If that fails, it
> will set the version to 0.0-<sha1 hash>. =A0This version is stored in
> the ${GITVER} variable, and can be used in the recipe's PV variable.
> When using this, it will automatically detect changes to .git/HEAD
> (i.e. commit your local changes, check out a different branch, ..) and
> invalidate the bitbake cache, pick up the new PV, and know that it
> needs to re-run the build steps.
[...]

In the line of your gitver class we've been using a bitbake change for
it already for some time.

What we did is to add a AUTOPV (as we have AUTOREV) to bitbake and use it i=
n OE.

I'm attaching the diff for it here.

--=20
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br

--001485f723daf92203047284431f
Content-Type: text/x-diff; charset=US-ASCII; name="autopv.patch"
Content-Disposition: attachment; filename="autopv.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_fz2ld81h0

ZGlmZiAtLWdpdCBhL2xpYi9iYi9mZXRjaC9fX2luaXRfXy5weSBiL2xpYi9iYi9mZXRjaC9fX2lu
aXRfXy5weQppbmRleCAxNmMzYTk2Li5jZjRiYzJjIDEwMDY0NAotLS0gYS9saWIvYmIvZmV0Y2gv
X19pbml0X18ucHkKKysrIGIvbGliL2JiL2ZldGNoL19faW5pdF9fLnB5CkBAIC0xOTcsNiArMTk3
LDIwIEBAIGRlZiBsb2NhbHBhdGhzKGQpOgogCiBzcmNyZXZfaW50ZXJuYWxfY2FsbCA9IEZhbHNl
CiAKK2RlZiBnZXRfc2NtcyhkLCB1cmxkYXRhLCByZXZfc3VwcG9ydF9vbmx5ID0gVHJ1ZSk6Cisg
ICAgc2NtcyA9IFtdCisgICAgZm9yIHUgaW4gdXJsZGF0YToKKyAgICAgICAgdWQgPSB1cmxkYXRh
W3VdCisgICAgICAgIGlmIG5vdCByZXZfc3VwcG9ydF9vbmx5IG9yIChyZXZfc3VwcG9ydF9vbmx5
IGFuZCB1ZC5tZXRob2Quc3VwcHBvcnRzX3NyY3JldigpKToKKyAgICAgICAgICAgIGlmIG5vdCB1
ZC5zZXR1cDoKKyAgICAgICAgICAgICAgICB1ZC5zZXR1cF9sb2NhbHBhdGgoZCkKKyAgICAgICAg
ICAgIHNjbXMuYXBwZW5kKHUpCisKKyAgICBpZiBsZW4oc2NtcykgPT0gMDoKKyAgICAgICAgYmIu
bXNnLmVycm9yKGJiLm1zZy5kb21haW4uRmV0Y2hlciwgIlNSQ1JFViB3YXMgdXNlZCB5ZXQgbm8g
dmFsaWQgU0NNIHdhcyBmb3VuZCBpbiBTUkNfVVJJIikKKworICAgIHJldHVybiBzY21zCisKIGRl
ZiBnZXRfc3JjcmV2KGQpOgogICAgICIiIgogICAgIFJldHVybiB0aGUgdmVyc2lvbiBzdHJpbmcg
Zm9yIHRoZSBjdXJyZW50IHBhY2thZ2UKQEAgLTIxOCwyMCArMjMyLDggQEAgZGVmIGdldF9zcmNy
ZXYoZCk6CiAgICAgaWYgYmIuZmV0Y2guc3JjcmV2X2ludGVybmFsX2NhbGw6CiAgICAgICAgIHJl
dHVybiAiU1JDUkVWSU5BQ1RJT04iCiAKLSAgICBzY21zID0gW10KLQotICAgICMgT25seSBjYWxs
IHNldHVwX2xvY2FscGF0aCBvbiBVUklzIHdoaWNoIHN1cHBwb3J0c19zcmNyZXYoKSAKICAgICB1
cmxkYXRhID0gaW5pdChiYi5kYXRhLmdldFZhcignU1JDX1VSSScsIGQsIDEpLnNwbGl0KCksIGQs
IEZhbHNlKQotICAgIGZvciB1IGluIHVybGRhdGE6Ci0gICAgICAgIHVkID0gdXJsZGF0YVt1XQot
ICAgICAgICBpZiB1ZC5tZXRob2Quc3VwcHBvcnRzX3NyY3JldigpOgotICAgICAgICAgICAgaWYg
bm90IHVkLnNldHVwOgotICAgICAgICAgICAgICAgIHVkLnNldHVwX2xvY2FscGF0aChkKQotICAg
ICAgICAgICAgc2Ntcy5hcHBlbmQodSkKLQotICAgIGlmIGxlbihzY21zKSA9PSAwOgotICAgICAg
ICBiYi5tc2cuZXJyb3IoYmIubXNnLmRvbWFpbi5GZXRjaGVyLCAiU1JDUkVWIHdhcyB1c2VkIHll
dCBubyB2YWxpZCBTQ00gd2FzIGZvdW5kIGluIFNSQ19VUkkiKQotICAgICAgICByYWlzZSBQYXJh
bWV0ZXJFcnJvcgorICAgIHNjbXMgPSBnZXRfc2NtcyhkLCB1cmxkYXRhKQogCiAgICAgYmIuZGF0
YS5zZXRWYXIoJ19fQkJfRE9OVF9DQUNIRScsJzEnLCBkKQogCkBAIC0yNTQsNiArMjU2LDI1IEBA
IGRlZiBnZXRfc3JjcmV2KGQpOgogCiAgICAgcmV0dXJuIGZvcm1hdAogCitkZWYgZGVzY3JpYmVf
cmV2aXNpb24oZCk6CisgICAgIiIiIAorICAgIFJldHVybiB0aGUgb3V0cHV0IG9mICdnaXQgZGVz
Y3JpYmUnIG9yICdOT19SRVZfREVTQ1InIGluIGNhc2Ugbm8KKyAgICB0YWcgaXMgZm91bmQuCisg
ICAgIiIiCisgICAgdXJsZGF0YSA9IGluaXQoYmIuZGF0YS5nZXRWYXIoJ1NSQ19VUkknLCBkLCAx
KS5zcGxpdCgpLCBkLCBGYWxzZSkKKyAgICBiYi5kYXRhLnNldFZhcignX19CQl9ET05UX0NBQ0hF
JywnMScsIGQpCisgICAgc2NtcyA9IGdldF9zY21zKGQsIHVybGRhdGEpCisgICAgc2NtID0gJycK
KyAgICBpZiBsZW4oc2NtcykgPT0gMToKKyAgICAgICAgc2NtID0gc2Ntc1swXQorICAgIGVsc2U6
CisgICAgICAgIGJiLm1zZy5lcnJvcihiYi5tc2cuZG9tYWluLkZldGNoZXIsICJkZXNjcmliZV9y
ZXZpc2lvbiBkb2VzIG5vdCBzdXBwb3J0IG11bHRpcGxlIFNDTXMuIikKKworICAgIHRyeTogCisg
ICAgICAgIHJldHVybiB1cmxkYXRhW3NjbV0ubWV0aG9kLmRlc2NyaWJlX3JldmlzaW9uKHNjbSwg
dXJsZGF0YVtzY21dLCBkKQorICAgIGV4Y2VwdCBOb01ldGhvZEVycm9yOgorICAgICAgICByZXR1
cm4gIk5PX1JFVl9ERVNDUiIKKwogZGVmIGxvY2FscGF0aCh1cmwsIGQsIGNhY2hlID0gVHJ1ZSk6
CiAgICAgIiIiCiAgICAgQ2FsbGVkIGZyb20gdGhlIHBhcnNlciB3aXRoIGNhY2hlPUZhbHNlIHNp
bmNlIHRoZSBjYWNoZSBpc24ndCByZWFkeSAKZGlmZiAtLWdpdCBhL2xpYi9iYi9mZXRjaC9naXQu
cHkgYi9saWIvYmIvZmV0Y2gvZ2l0LnB5CmluZGV4IDk3Y2QwYTIuLmUwYTU0MDAgMTAwNjQ0Ci0t
LSBhL2xpYi9iYi9mZXRjaC9naXQucHkKKysrIGIvbGliL2JiL2ZldGNoL2dpdC5weQpAQCAtMTQ5
LDYgKzE0OSwxNiBAQCBjbGFzcyBHaXQoRmV0Y2gpOgogICAgIGRlZiBfd2FudF9zb3J0YWJsZV9y
ZXZpc2lvbihzZWxmLCB1cmwsIHVkLCBkKToKICAgICAgICAgcmV0dXJuIGJiLmRhdGEuZ2V0VmFy
KCJCQl9HSVRfQ0xPTkVfRk9SX1NSQ1JFViIsIGQsIFRydWUpIG9yIEZhbHNlCiAKKyAgICBkZWYg
X2NocmVwbyhzZWxmLCByZXBvZGlyLCB1ZCwgZCk6CisgICAgICAgICMgQ2hlY2sgaWYgd2UgaGF2
ZSB0aGUgcmV2IGFscmVhZHkKKyAgICAgICAgaWYgbm90IG9zLnBhdGguZXhpc3RzKHJlcG9kaXIp
OgorICAgICAgICAgICAgcHJpbnQgIm5vIHJlcG8iCisgICAgICAgICAgICBzZWxmLmdvKE5vbmUs
IHVkLCBkKQorCisgICAgICAgIG9zLmNoZGlyKHJlcG9kaXIpCisgICAgICAgIGlmIG5vdCBzZWxm
Ll9jb250YWluc19yZWYodWQudGFnLCBkKToKKyAgICAgICAgICAgIHNlbGYuZ28oTm9uZSwgdWQs
IGQpCisKICAgICBkZWYgX3NvcnRhYmxlX3JldmlzaW9uKHNlbGYsIHVybCwgdWQsIGQpOgogICAg
ICAgICAiIiIKICAgICAgICAgVGhpcyBpcyBvbmx5IGNhbGxlZCB3aGVuIF93YW50X3NvcnRhYmxl
X3JldmlzaW9uIGNhbGxlZCB0cnVlCkBAIC0xNzAsMTQgKzE4MCw3IEBAIGNsYXNzIEdpdChGZXRj
aCk6CiAKICAgICAgICAgY3dkID0gb3MuZ2V0Y3dkKCkKIAotICAgICAgICAjIENoZWNrIGlmIHdl
IGhhdmUgdGhlIHJldiBhbHJlYWR5Ci0gICAgICAgIGlmIG5vdCBvcy5wYXRoLmV4aXN0cyhyZXBv
ZGlyKToKLSAgICAgICAgICAgIHByaW50ICJubyByZXBvIgotICAgICAgICAgICAgc2VsZi5nbyhO
b25lLCB1ZCwgZCkKLQotICAgICAgICBvcy5jaGRpcihyZXBvZGlyKQotICAgICAgICBpZiBub3Qg
c2VsZi5fY29udGFpbnNfcmVmKHVkLnRhZywgZCk6Ci0gICAgICAgICAgICBzZWxmLmdvKE5vbmUs
IHVkLCBkKQorICAgICAgICBzZWxmLl9jaHJlcG8ocmVwb2RpciwgdWQsIGQpCiAKICAgICAgICAg
b3V0cHV0ID0gcnVuZmV0Y2hjbWQoImdpdCByZXYtbGlzdCAlcyAtLSAyPiAvZGV2L251bGwgfCB3
YyAtbCIgJSB1ZC50YWcsIGQsIHF1aWV0PVRydWUpCiAgICAgICAgIG9zLmNoZGlyKGN3ZCkKQEAg
LTE4NywzICsxOTAsMjQgQEAgY2xhc3MgR2l0KEZldGNoKToKICAgICAgICAgcmV0dXJuIHNvcnRh
YmxlX3JldmlzaW9uCiAgICAgICAgIAogCisgICAgZGVmIGRlc2NyaWJlX3JldmlzaW9uKHNlbGYs
IHVybCwgdWQsIGQpOgorICAgICAgICBnaXRzcmNuYW1lID0gJyVzJXMnICUgKHVkLmhvc3QsIHVk
LnBhdGgucmVwbGFjZSgnLycsICcuJykpCisgICAgICAgIHJlcG9kaXIgPSBvcy5wYXRoLmpvaW4o
ZGF0YS5leHBhbmQoJyR7R0lURElSfScsIGQpLCBnaXRzcmNuYW1lKQorCisgICAgICAgICMgUnVu
dGltZSB3YXJuaW5nIG9uIHdyb25nbHkgY29uZmlndXJlZCBzb3VyY2VzCisgICAgICAgIGlmIHVk
LnRhZyA9PSAiMSI6CisgICAgICAgICAgICBiYi5tc2cuZXJyb3IoMSwgYmIubXNnLmRvbWFpbi5G
ZXRjaGVyLCAiU1JDUkVWIGlzICcxJy4gVGhpcyBpbmRpY2F0ZXMgYSBjb25maWd1cmF0aW9uIGVy
cm9yIG9mICVzIiAlIHVybCkKKyAgICAgICAgICAgIHJldHVybiAiMCsxIgorCisgICAgICAgIGN3
ZCA9IG9zLmdldGN3ZCgpCisKKyAgICAgICAgc2VsZi5fY2hyZXBvKHJlcG9kaXIsIHVkLCBkKQor
CisgICAgICAgIHJldl9kZXNjciA9ICcnCisgICAgICAgIHRyeToKKyAgICAgICAgICAgIHJldl9k
ZXNjciA9IHJ1bmZldGNoY21kKCJnaXQgZGVzY3JpYmUgJXMgMj4vZGV2L251bGwiICUgdWQudGFn
LCBkLCBxdWlldD1UcnVlKS5zdHJpcCgpCisgICAgICAgIGV4Y2VwdCBGZXRjaEVycm9yOgorICAg
ICAgICAgICAgcmV2X2Rlc2NyID0gIjAuMC4wLSVzLWclcyIgJSAocnVuZmV0Y2hjbWQoImdpdCBy
ZXYtbGlzdCAlcyAtLSAyPiAvZGV2L251bGwgfCB3YyAtbCIgJSB1ZC50YWcsIGQsIHF1aWV0PVRy
dWUpLnN0cmlwKCksCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBy
dW5mZXRjaGNtZCgiZ2l0IGRlc2NyaWJlICVzIC0tYWx3YXlzIDI+IC9kZXYvbnVsbCIgJSB1ZC50
YWcsIGQsIHF1aWV0PVRydWUpLnN0cmlwKCkpCisgICAgICAgIG9zLmNoZGlyKGN3ZCkKKyAgICAg
ICAgcmV0dXJuIHJldl9kZXNjci5yZXBsYWNlKCctJywgJy4nKQo=

--001485f723daf92203047284431f--
