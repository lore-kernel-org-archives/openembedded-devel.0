Received: from mail-bw0-f217.google.com ([209.85.218.217])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <tasskjapp@gmail.com>) id 1NAh4w-0001d6-RO
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Nov 2009 10:44:01 +0100
Received: by bwz9 with SMTP id 9so903316bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Nov 2009 01:42:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=l59UYlgcLGskKHI4l5NXNKGwtfkB6MucpVgGOSww3mg=;
	b=et8hDzJwPOpOBsTFmuEPWQCStqOis6H+eHmtoR8AxzPzDJMlCxvBEwS1Z6Nt0zTCku
	Wv1MDEasCvz9opxrw4/ncRnAfz/+GvHSXz9fQECDSTvgmQz5/WZ97BZvCuV36fzbuv8b
	Q9jNLyV68pX6U14ne1FSYN4flU/Bxi7J4HUgo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=Oe6eJYj1l3d38GCIQpiZGFBFTtcNEIz65Jei0UqETNotXUOKEFcKdWT1Lh+Srs4Nii
	a3heLJzupTbliEMDRavszy/Hr4WsBqDD9P+EzJBUuj5uYujkwtZR+qA/aMpKfyiyEvu9
	eHXEdlOFLBCR59GCi3SyTVtpo/ATT/W9er+S0=
MIME-Version: 1.0
Received: by 10.223.132.207 with SMTP id c15mr2997229fat.56.1258537345203; 
	Wed, 18 Nov 2009 01:42:25 -0800 (PST)
Date: Wed, 18 Nov 2009 10:42:24 +0100
Message-ID: <ec7df6a60911180142j65980c0bnaf494f4c76fbe980@mail.gmail.com>
From: Tasslehoff Kjappfot <tasskjapp@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.218.217
X-SA-Exim-Mail-From: tasskjapp@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Proposed patch for usb-gadget
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
X-List-Received-Date: Wed, 18 Nov 2009 09:44:02 -0000
X-Groupsio-MsgNum: 14400
Content-Type: multipart/mixed; boundary=0023545bd49465c2760478a20f9f

--0023545bd49465c2760478a20f9f
Content-Type: text/plain; charset=ISO-8859-1

usb-gadget failed when MODULE_OPTIONS contained more than one option. Here's
the patch I used to make it work.

- Tasslehoff

--0023545bd49465c2760478a20f9f
Content-Type: text/x-patch; charset=US-ASCII; 
	name="0001-fix-usage-of-MODULE_OPTIONS-in-modprobe.patch"
Content-Disposition: attachment; 
	filename="0001-fix-usage-of-MODULE_OPTIONS-in-modprobe.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_g25wnhqn0

RnJvbSBhZTZkOTkwNmJkNGJmYjVjMDY0Y2RjMTJjNDE0N2U5NWEwZTUxNjY5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpEYXRlOiBXZWQsIDE4IE5vdiAyMDA5IDEwOjI4OjI4ICswMTAwClN1Ympl
Y3Q6IFtQQVRDSF0gZml4IHVzYWdlIG9mIE1PRFVMRV9PUFRJT05TIGluIG1vZHByb2JlCgotLS0K
IHVzYi1nYWRnZXQgfCAgIDIwICsrKysrKysrKystLS0tLS0tLS0tCiAxIGZpbGVzIGNoYW5nZWQs
IDEwIGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3VzYi1nYWRn
ZXQgYi91c2ItZ2FkZ2V0CmluZGV4IDNmMjVlZGMuLjhkYTg4YWQgMTAwNzU1Ci0tLSBhL3VzYi1n
YWRnZXQKKysrIGIvdXNiLWdhZGdldApAQCAtMjMsMTYgKzIzLDE2IEBAIGdvKCkgewogCXRlc3Qg
LWUgIiRDT05GX0ZJTEUiICYmIC4gIiRDT05GX0ZJTEUiIAogCQogCWNhc2UgIiRVU0JfTU9ERSIg
aW4KLQluZXR3b3JraW5nKQlzZXR1cF91c2IgZ19ldGhlciAiJE1PRFVMRV9PUFRJT05TIiA7Owot
CXplcm8pCQlzZXR1cF91c2IgZ196ZXJvICIkTU9EVUxFX09QVElPTlMiIDs7Ci0JbWlkaSkJCXNl
dHVwX3VzYiBnX21pZGkgIiRNT0RVTEVfT1BUSU9OUyIgOzsKLQlwcmludGVyKQlzZXR1cF91c2Ig
Z19wcmludGVyICIkTU9EVUxFX09QVElPTlMiIDs7Ci0JZ2FkZ2V0ZnMpIAlzZXR1cF91c2IgZ2Fk
Z2V0ZnMgIiRNT0RVTEVfT1BUSU9OUyIgOzsKLQljb21wb3NpdGUpCXNldHVwX3VzYiBnX2NkYyAi
JE1PRFVMRV9PUFRJT05TIiA7OwotCXNlcmlhbCkJCXNldHVwX3VzYiBnX3NlcmlhbCAiJE1PRFVM
RV9PUFRJT05TIiA7OwotCXN0b3JhZ2UpCXNldHVwX3VzYiBnX2ZpbGVfc3RvcmFnZSAiJE1PRFVM
RV9PUFRJT05TIiA7OworCW5ldHdvcmtpbmcpCXNldHVwX3VzYiBnX2V0aGVyIDs7CisJemVybykJ
CXNldHVwX3VzYiBnX3plcm8gOzsKKwltaWRpKQkJc2V0dXBfdXNiIGdfbWlkaSA7OworCXByaW50
ZXIpCXNldHVwX3VzYiBnX3ByaW50ZXIgOzsKKwlnYWRnZXRmcykgCXNldHVwX3VzYiBnYWRnZXRm
cyA7OworCWNvbXBvc2l0ZSkJc2V0dXBfdXNiIGdfY2RjIDs7CisJc2VyaWFsKQkJc2V0dXBfdXNi
IGdfc2VyaWFsIDs7CisJc3RvcmFnZSkJc2V0dXBfdXNiIGdfZmlsZV9zdG9yYWdlIDs7CiAJaG9z
dG1vZGUpCXVubG9hZF91c2JfZ2FkZ2V0cwotCQkJc2V0dXBfdXNiIG9oY2lfaGNkICIkTU9EVUxF
X09QVElPTlMiIDs7CisJCQlzZXR1cF91c2Igb2hjaV9oY2QgOzsKIAlub25lKQkJdW5sb2FkX3Vz
Yl9nYWRnZXRzIDs7CiAJZXNhYwkJCiAJCQpAQCAtNDQsNyArNDQsNyBAQCBzZXR1cF91c2IoKSB7
CiAJdGhlbgogCQl1bmxvYWRfdXNiX2dhZGdldHMKIAkJZWNobyAiTG9hZGluZyBbJDFdIgotCQlt
b2Rwcm9iZSAiJDEiICIkTU9EVUxFX09QVElPTlMiCisJCW1vZHByb2JlICIkMSIgJE1PRFVMRV9P
UFRJT05TCiAJZWxzZQogCQllY2hvICJBbHJlYWR5IGxvYWRlZDogWyQxXSIKIAlmaQotLSAKMS42
LjMuMwoK

--0023545bd49465c2760478a20f9f--
