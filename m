Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <vadmium@gmail.com>) id 1PeS3n-0004pE-R1
	for openembedded-devel@lists.openembedded.org;
	Sun, 16 Jan 2011 13:50:19 +0100
Received: by wwi17 with SMTP id 17so4166614wwi.24
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Jan 2011 04:49:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:date:x-google-sender-auth
	:message-id:subject:from:to:content-type;
	bh=n2YfPPP0m6M3XqQru4exnTnJnVdzGsz//PDFVOqNvIg=;
	b=BfSE+tyzxpEWLzYZQTmucFniCCL170iJWSHuVkTxCzhcAm9Uf9vBg8K0KS4mECFJg4
	TvYfIv7eegtVF5l+O3ZQdP1ojmZVAkUQhEWkrEUEEhDHStvJ5hFUi76vPCL1yYvwup1t
	Gpzq0xYSC7ji0WFYSR8A5k/EzLrPIB9zV7R3E=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type;
	b=VDggX9HZGRfevZDxi6zvdd1GplivCtrmARgHpTCp66MDorThLOcQbOldhOC4Z7YpgK
	IZJNUuRBrvvnucLm43ef3opl+vSYXKxgiUNaQyQ9hibzHM/Bt0d+QaLRAL7d8mRNuS/Q
	thdUcYxnmDwoGlpxgqOC3ubhfKydi6ud7JphE=
MIME-Version: 1.0
Received: by 10.216.48.6 with SMTP id u6mr2219657web.77.1295182183747; Sun, 16
	Jan 2011 04:49:43 -0800 (PST)
Sender: vadmium@gmail.com
Received: by 10.216.17.203 with HTTP; Sun, 16 Jan 2011 04:49:43 -0800 (PST)
Date: Sun, 16 Jan 2011 12:49:43 +0000
X-Google-Sender-Auth: _rUWkc1GuIEHQAZ1Th3XHdueZg4
Message-ID: <AANLkTi=mdky9Qrbh64tq4jnvvK=urkG5qTFY1swqOfF4@mail.gmail.com>
From: Martin Panter <vadmium+floss@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Fail if the cpio command is missing (v2)
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
X-List-Received-Date: Sun, 16 Jan 2011 12:50:19 -0000
X-Groupsio-MsgNum: 28073
Content-Type: multipart/mixed; boundary=0016364c79ddfb51d10499f619ae

--0016364c79ddfb51d10499f619ae
Content-Type: text/plain; charset=UTF-8

Slightly improved version to hide the usual output of the "type" command.

On 16 January 2011 12:33, Martin Panter <vadmium+floss@gmail.com> wrote:
> See attached patch.
> -Martin

--0016364c79ddfb51d10499f619ae
Content-Type: text/plain; charset=UTF-8; name="cpio-check.patch.txt"
Content-Disposition: attachment; filename="cpio-check.patch.txt"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_gizyg3nm1

RnJvbSA5OWFmODkxYTM3YjIyY2Q3MzI0MDE4Yjc3OWU5OTQwNTBmYWE5ZmFhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBNYXJ0aW4gUGFudGVyIDx2YWRtaXVtIMOgIGdtYWlsLmNvbT4K
RGF0ZTogU3VuLCAxNiBKYW4gMjAxMSAwNDozODowMyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIElN
QUdFX0NNRDogRmFpbCBpZiB0aGUgY3BpbyBjb21tYW5kIGlzIG1pc3NpbmcKClByZXZpb3VzbHkg
bXkgY3Bpby5neiBpbWFnZSB3YXMgYW4gZW1wdHkgZ3ppcCBmaWxlIGJlY2F1c2UgdGhlIG1pc3Np
bmcgY3Bpbwpjb21tYW5kIHdhcyBpZ25vcmVkIGFuZCBnemlwIHdhcyBibGluZGx5IHJ1biB3aXRo
IG5vIGlucHV0LgotLS0KIGNvbmYvYml0YmFrZS5jb25mIHwgICAgNiArKystLS0KIDEgZmlsZXMg
Y2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Nv
bmYvYml0YmFrZS5jb25mIGIvY29uZi9iaXRiYWtlLmNvbmYKaW5kZXggMTdiOWIyOC4uMWE3NDAw
ZCAxMDA2NDQKLS0tIGEvY29uZi9iaXRiYWtlLmNvbmYKKysrIGIvY29uZi9iaXRiYWtlLmNvbmYK
QEAgLTM5MSw5ICszOTEsOSBAQCBJTUFHRV9DTURfdGFyID0gImNkICR7SU1BR0VfUk9PVEZTfSAm
JiB0YXIgLWN2ZiAke0RFUExPWV9ESVJfSU1BR0V9LyR7SU1BR0VfTkFNRQogSU1BR0VfQ01EX3Rh
ci5neiA9ICJjZCAke0lNQUdFX1JPT1RGU30gJiYgdGFyIC16Y3ZmICR7REVQTE9ZX0RJUl9JTUFH
RX0vJHtJTUFHRV9OQU1FfS5yb290ZnMudGFyLmd6IC4iCiBJTUFHRV9DTURfdGFyLmJ6MiA9ICJj
ZCAke0lNQUdFX1JPT1RGU30gJiYgdGFyIC1qY3ZmICR7REVQTE9ZX0RJUl9JTUFHRX0vJHtJTUFH
RV9OQU1FfS5yb290ZnMudGFyLmJ6MiAuIgogSU1BR0VfQ01EX2NwaW8gPSAiY2QgJHtJTUFHRV9S
T09URlN9ICYmIChmaW5kIC4gfCBjcGlvIC1vIC1IIG5ld2MgPiR7REVQTE9ZX0RJUl9JTUFHRX0v
JHtJTUFHRV9OQU1FfS5yb290ZnMuY3BpbykgJHtFWFRSQV9JTUFHRUNNRH0iCi1JTUFHRV9DTURf
Y3Bpby5neiA9ICJjZCAke0lNQUdFX1JPT1RGU30gJiYgKGZpbmQgLiB8IGNwaW8gLW8gLUggbmV3
YyB8IGd6aXAgLWMgLTkgPiR7REVQTE9ZX0RJUl9JTUFHRX0vJHtJTUFHRV9OQU1FfS5yb290ZnMu
Y3Bpby5neikgJHtFWFRSQV9JTUFHRUNNRH0iCi1JTUFHRV9DTURfY3Bpby5nei51LWJvb3QgPSAi
Y2QgJHtJTUFHRV9ST09URlN9ICYmIChmaW5kIC4gfCBjcGlvIC1vIC1IIG5ld2MgfCBnemlwIC1j
IC05ID4ke0RFUExPWV9ESVJfSU1BR0V9LyR7SU1BR0VfTkFNRX0ucm9vdGZzLmNwaW8uZ3opICR7
RVhUUkFfSU1BR0VDTUR9OyBta2ltYWdlIC1BICR7VUJPT1RfQVJDSH0gLU8gbGludXggLVQgcmFt
ZGlzayAtQyBnemlwIC1uICR7SU1BR0VfTkFNRX0gLWQgJHtERVBMT1lfRElSX0lNQUdFfS8ke0lN
QUdFX05BTUV9LnJvb3Rmcy5jcGlvLmd6ICR7REVQTE9ZX0RJUl9JTUFHRX0vJHtJTUFHRV9OQU1F
fS5yb290ZnMuY3Bpby5nei51LWJvb3QiCi1JTUFHRV9DTURfY3Bpby5sem1hID0gImNkICR7SU1B
R0VfUk9PVEZTfSAmJiAoZmluZCAuIHwgY3BpbyAtbyAtSCBuZXdjIHwgbHptYSAtYyAtOSA+JHtE
RVBMT1lfRElSX0lNQUdFfS8ke0lNQUdFX05BTUV9LnJvb3Rmcy5jcGlvLmx6bWEpICR7RVhUUkFf
SU1BR0VDTUR9IgorSU1BR0VfQ01EX2NwaW8uZ3ogPSAidHlwZSBjcGlvID4vZGV2L251bGw7IGNk
ICR7SU1BR0VfUk9PVEZTfSAmJiAoZmluZCAuIHwgY3BpbyAtbyAtSCBuZXdjIHwgZ3ppcCAtYyAt
OSA+JHtERVBMT1lfRElSX0lNQUdFfS8ke0lNQUdFX05BTUV9LnJvb3Rmcy5jcGlvLmd6KSAke0VY
VFJBX0lNQUdFQ01EfSIKK0lNQUdFX0NNRF9jcGlvLmd6LnUtYm9vdCA9ICJ0eXBlIGNwaW8gPi9k
ZXYvbnVsbDsgY2QgJHtJTUFHRV9ST09URlN9ICYmIChmaW5kIC4gfCBjcGlvIC1vIC1IIG5ld2Mg
fCBnemlwIC1jIC05ID4ke0RFUExPWV9ESVJfSU1BR0V9LyR7SU1BR0VfTkFNRX0ucm9vdGZzLmNw
aW8uZ3opICR7RVhUUkFfSU1BR0VDTUR9OyBta2ltYWdlIC1BICR7VUJPT1RfQVJDSH0gLU8gbGlu
dXggLVQgcmFtZGlzayAtQyBnemlwIC1uICR7SU1BR0VfTkFNRX0gLWQgJHtERVBMT1lfRElSX0lN
QUdFfS8ke0lNQUdFX05BTUV9LnJvb3Rmcy5jcGlvLmd6ICR7REVQTE9ZX0RJUl9JTUFHRX0vJHtJ
TUFHRV9OQU1FfS5yb290ZnMuY3Bpby5nei51LWJvb3QiCitJTUFHRV9DTURfY3Bpby5sem1hID0g
InR5cGUgY3BpbyA+L2Rldi9udWxsOyBjZCAke0lNQUdFX1JPT1RGU30gJiYgKGZpbmQgLiB8IGNw
aW8gLW8gLUggbmV3YyB8IGx6bWEgLWMgLTkgPiR7REVQTE9ZX0RJUl9JTUFHRX0vJHtJTUFHRV9O
QU1FfS5yb290ZnMuY3Bpby5sem1hKSAke0VYVFJBX0lNQUdFQ01EfSIKIElNQUdFX0NNRF91Ymkg
PSAiZWNobyBcW3ViaWZzXF0gPiB1YmluaXplLmNmZyA7IGVjaG8gbW9kZT11YmkgPj4gdWJpbml6
ZS5jZmcgOyBlY2hvIGltYWdlPSR7REVQTE9ZX0RJUl9JTUFHRX0vJHtJTUFHRV9OQU1FfS5yb290
ZnMudWJpZnMgPj4gdWJpbml6ZS5jZmcgOyBlY2hvIHZvbF9pZD0wID4+IHViaW5pemUuY2ZnIDsg
ZWNobyB2b2xfdHlwZT1keW5hbWljID4+IHViaW5pemUuY2ZnIDsgZWNobyB2b2xfbmFtZT0ke1VC
SV9WT0xOQU1FfSA+PiB1YmluaXplLmNmZyA7IGVjaG8gdm9sX2ZsYWdzPWF1dG9yZXNpemUgPj4g
dWJpbml6ZS5jZmc7bWtmcy51YmlmcyAtciAke0lNQUdFX1JPT1RGU30gLW8gJHtERVBMT1lfRElS
X0lNQUdFfS8ke0lNQUdFX05BTUV9LnJvb3Rmcy51YmlmcyAke01LVUJJRlNfQVJHU30gJiYgdWJp
bml6ZSAtbyAke0RFUExPWV9ESVJfSU1BR0V9LyR7SU1BR0VfTkFNRX0ucm9vdGZzLnViaSAke1VC
SU5JWkVfQVJHU30gdWJpbml6ZS5jZmciCiBJTUFHRV9DTURfdWJpZnMgPSAibWtmcy51YmlmcyAt
ciAke0lNQUdFX1JPT1RGU30gLW8gJHtERVBMT1lfRElSX0lNQUdFfS8ke0lNQUdFX05BTUV9LnVi
aWZzLmltZyAke01LVUJJRlNfQVJHU30iCiAKLS0gCjEuNy4xCgo=

--0016364c79ddfb51d10499f619ae--
