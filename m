Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <vadmium@gmail.com>) id 1PeRo9-0004WV-9k
	for openembedded-devel@lists.openembedded.org;
	Sun, 16 Jan 2011 13:34:09 +0100
Received: by wyb40 with SMTP id 40so4360540wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Jan 2011 04:33:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:date:x-google-sender-auth
	:message-id:subject:from:to:content-type;
	bh=BRfJW6IoRoVOsnCk0lIeRvDunmeB5iEJVF2X062iivI=;
	b=WxMnzl+j4E8xmeZhZoKGcehRUVuxoRIQWdB0mMMoHhwKD95o366eLsy6x4uJ68U0sg
	mtIneicEUGcM6iC43iyJsivw42aYPZTtH0MlZ9gr5tvS6EvkSAXKEJi9peetSyIdJYpI
	qN2uP92JOGw69meWns0oeK8LaspfbqqtYT0y8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type;
	b=jF+37Lu5qn9H7q33D6uuU9DyCaV942eVxGzksaFfextk15Py5w/LOgbortPr/jx4o5
	NJZ30hrQNvX9bIS80p3VIiXpBXWHLLiWqOwAX/wKvNfZOkh8lJQDqJzr1LXUKPX9JxH4
	mbRnAYTWfEcK0/aTAIkzO0iRtW/Sk9kGIv/A0=
MIME-Version: 1.0
Received: by 10.216.15.75 with SMTP id e53mr1254698wee.107.1295181212998; Sun,
	16 Jan 2011 04:33:32 -0800 (PST)
Sender: vadmium@gmail.com
Received: by 10.216.17.203 with HTTP; Sun, 16 Jan 2011 04:33:32 -0800 (PST)
Date: Sun, 16 Jan 2011 12:33:32 +0000
X-Google-Sender-Auth: ENHt8DY-6jI_zrPVuvo8iz3oh9c
Message-ID: <AANLkTimrd+dG3hrKP07H2UZMxn7SCz7ykJDKKwTUdF=k@mail.gmail.com>
From: Martin Panter <vadmium+floss@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Fail if the cpio command is missing
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
X-List-Received-Date: Sun, 16 Jan 2011 12:34:09 -0000
X-Groupsio-MsgNum: 28072
Content-Type: multipart/mixed; boundary=0016364d1dc91edd0f0499f5e020

--0016364d1dc91edd0f0499f5e020
Content-Type: text/plain; charset=UTF-8

See attached patch.
-Martin

--0016364d1dc91edd0f0499f5e020
Content-Type: text/plain; charset=UTF-8; name="cpio-check.patch.txt"
Content-Disposition: attachment; filename="cpio-check.patch.txt"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_gizy331n0

RnJvbSBiNTA2ZGNiZDBhNWZhMmM4ZDE2MjY3ODQ4OTU2NDM0N2MzZGJjZjlhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBNYXJ0aW4gUGFudGVyIDx2YWRtaXVtIMOgIGdtYWlsLmNvbT4K
RGF0ZTogU3VuLCAxNiBKYW4gMjAxMSAwNDozODowMyArMDAwMApTdWJqZWN0OiBbUEFUQ0ggMy8z
XSBJTUFHRV9DTUQ6IEZhaWwgaWYgdGhlIGNwaW8gY29tbWFuZCBpcyBtaXNzaW5nCgpQcmV2aW91
c2x5IG15IGNwaW8uZ3ogd2FzIGFuIGVtcHR5IGd6aXAgZmlsZSBiZWNhdXNlIHRoZSBtaXNzaW5n
IGNwaW8gY29tbWFuZAp3YXMgaWdub3JlZC4KLS0tCiBjb25mL2JpdGJha2UuY29uZiB8ICAgIDYg
KysrLS0tCiAxIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9jb25mL2JpdGJha2UuY29uZiBiL2NvbmYvYml0YmFrZS5jb25mCmluZGV4
IDE3YjliMjguLjk4YTg2ZjIgMTAwNjQ0Ci0tLSBhL2NvbmYvYml0YmFrZS5jb25mCisrKyBiL2Nv
bmYvYml0YmFrZS5jb25mCkBAIC0zOTEsOSArMzkxLDkgQEAgSU1BR0VfQ01EX3RhciA9ICJjZCAk
e0lNQUdFX1JPT1RGU30gJiYgdGFyIC1jdmYgJHtERVBMT1lfRElSX0lNQUdFfS8ke0lNQUdFX05B
TUUKIElNQUdFX0NNRF90YXIuZ3ogPSAiY2QgJHtJTUFHRV9ST09URlN9ICYmIHRhciAtemN2ZiAk
e0RFUExPWV9ESVJfSU1BR0V9LyR7SU1BR0VfTkFNRX0ucm9vdGZzLnRhci5neiAuIgogSU1BR0Vf
Q01EX3Rhci5iejIgPSAiY2QgJHtJTUFHRV9ST09URlN9ICYmIHRhciAtamN2ZiAke0RFUExPWV9E
SVJfSU1BR0V9LyR7SU1BR0VfTkFNRX0ucm9vdGZzLnRhci5iejIgLiIKIElNQUdFX0NNRF9jcGlv
ID0gImNkICR7SU1BR0VfUk9PVEZTfSAmJiAoZmluZCAuIHwgY3BpbyAtbyAtSCBuZXdjID4ke0RF
UExPWV9ESVJfSU1BR0V9LyR7SU1BR0VfTkFNRX0ucm9vdGZzLmNwaW8pICR7RVhUUkFfSU1BR0VD
TUR9IgotSU1BR0VfQ01EX2NwaW8uZ3ogPSAiY2QgJHtJTUFHRV9ST09URlN9ICYmIChmaW5kIC4g
fCBjcGlvIC1vIC1IIG5ld2MgfCBnemlwIC1jIC05ID4ke0RFUExPWV9ESVJfSU1BR0V9LyR7SU1B
R0VfTkFNRX0ucm9vdGZzLmNwaW8uZ3opICR7RVhUUkFfSU1BR0VDTUR9IgotSU1BR0VfQ01EX2Nw
aW8uZ3oudS1ib290ID0gImNkICR7SU1BR0VfUk9PVEZTfSAmJiAoZmluZCAuIHwgY3BpbyAtbyAt
SCBuZXdjIHwgZ3ppcCAtYyAtOSA+JHtERVBMT1lfRElSX0lNQUdFfS8ke0lNQUdFX05BTUV9LnJv
b3Rmcy5jcGlvLmd6KSAke0VYVFJBX0lNQUdFQ01EfTsgbWtpbWFnZSAtQSAke1VCT09UX0FSQ0h9
IC1PIGxpbnV4IC1UIHJhbWRpc2sgLUMgZ3ppcCAtbiAke0lNQUdFX05BTUV9IC1kICR7REVQTE9Z
X0RJUl9JTUFHRX0vJHtJTUFHRV9OQU1FfS5yb290ZnMuY3Bpby5neiAke0RFUExPWV9ESVJfSU1B
R0V9LyR7SU1BR0VfTkFNRX0ucm9vdGZzLmNwaW8uZ3oudS1ib290IgotSU1BR0VfQ01EX2NwaW8u
bHptYSA9ICJjZCAke0lNQUdFX1JPT1RGU30gJiYgKGZpbmQgLiB8IGNwaW8gLW8gLUggbmV3YyB8
IGx6bWEgLWMgLTkgPiR7REVQTE9ZX0RJUl9JTUFHRX0vJHtJTUFHRV9OQU1FfS5yb290ZnMuY3Bp
by5sem1hKSAke0VYVFJBX0lNQUdFQ01EfSIKK0lNQUdFX0NNRF9jcGlvLmd6ID0gInR5cGUgY3Bp
bzsgY2QgJHtJTUFHRV9ST09URlN9ICYmIChmaW5kIC4gfCBjcGlvIC1vIC1IIG5ld2MgfCBnemlw
IC1jIC05ID4ke0RFUExPWV9ESVJfSU1BR0V9LyR7SU1BR0VfTkFNRX0ucm9vdGZzLmNwaW8uZ3op
ICR7RVhUUkFfSU1BR0VDTUR9IgorSU1BR0VfQ01EX2NwaW8uZ3oudS1ib290ID0gInR5cGUgY3Bp
bzsgY2QgJHtJTUFHRV9ST09URlN9ICYmIChmaW5kIC4gfCBjcGlvIC1vIC1IIG5ld2MgfCBnemlw
IC1jIC05ID4ke0RFUExPWV9ESVJfSU1BR0V9LyR7SU1BR0VfTkFNRX0ucm9vdGZzLmNwaW8uZ3op
ICR7RVhUUkFfSU1BR0VDTUR9OyBta2ltYWdlIC1BICR7VUJPT1RfQVJDSH0gLU8gbGludXggLVQg
cmFtZGlzayAtQyBnemlwIC1uICR7SU1BR0VfTkFNRX0gLWQgJHtERVBMT1lfRElSX0lNQUdFfS8k
e0lNQUdFX05BTUV9LnJvb3Rmcy5jcGlvLmd6ICR7REVQTE9ZX0RJUl9JTUFHRX0vJHtJTUFHRV9O
QU1FfS5yb290ZnMuY3Bpby5nei51LWJvb3QiCitJTUFHRV9DTURfY3Bpby5sem1hID0gInR5cGUg
Y3BpbzsgY2QgJHtJTUFHRV9ST09URlN9ICYmIChmaW5kIC4gfCBjcGlvIC1vIC1IIG5ld2MgfCBs
em1hIC1jIC05ID4ke0RFUExPWV9ESVJfSU1BR0V9LyR7SU1BR0VfTkFNRX0ucm9vdGZzLmNwaW8u
bHptYSkgJHtFWFRSQV9JTUFHRUNNRH0iCiBJTUFHRV9DTURfdWJpID0gImVjaG8gXFt1Ymlmc1xd
ID4gdWJpbml6ZS5jZmcgOyBlY2hvIG1vZGU9dWJpID4+IHViaW5pemUuY2ZnIDsgZWNobyBpbWFn
ZT0ke0RFUExPWV9ESVJfSU1BR0V9LyR7SU1BR0VfTkFNRX0ucm9vdGZzLnViaWZzID4+IHViaW5p
emUuY2ZnIDsgZWNobyB2b2xfaWQ9MCA+PiB1YmluaXplLmNmZyA7IGVjaG8gdm9sX3R5cGU9ZHlu
YW1pYyA+PiB1YmluaXplLmNmZyA7IGVjaG8gdm9sX25hbWU9JHtVQklfVk9MTkFNRX0gPj4gdWJp
bml6ZS5jZmcgOyBlY2hvIHZvbF9mbGFncz1hdXRvcmVzaXplID4+IHViaW5pemUuY2ZnO21rZnMu
dWJpZnMgLXIgJHtJTUFHRV9ST09URlN9IC1vICR7REVQTE9ZX0RJUl9JTUFHRX0vJHtJTUFHRV9O
QU1FfS5yb290ZnMudWJpZnMgJHtNS1VCSUZTX0FSR1N9ICYmIHViaW5pemUgLW8gJHtERVBMT1lf
RElSX0lNQUdFfS8ke0lNQUdFX05BTUV9LnJvb3Rmcy51YmkgJHtVQklOSVpFX0FSR1N9IHViaW5p
emUuY2ZnIgogSU1BR0VfQ01EX3ViaWZzID0gIm1rZnMudWJpZnMgLXIgJHtJTUFHRV9ST09URlN9
IC1vICR7REVQTE9ZX0RJUl9JTUFHRX0vJHtJTUFHRV9OQU1FfS51Ymlmcy5pbWcgJHtNS1VCSUZT
X0FSR1N9IgogCi0tIAoxLjcuMQoK

--0016364d1dc91edd0f0499f5e020--
