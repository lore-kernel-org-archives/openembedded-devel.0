Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <needemesleepe@gmail.com>) id 1QKcvT-0004QH-Rl
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 May 2011 22:56:04 +0200
Received: by pvc30 with SMTP id 30so905921pvc.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 May 2011 13:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:date:message-id:subject:from:to
	:content-type; bh=gHpl+trJRugjufGfrJOGKZGVAxrTZrha+XWfpqlOr7s=;
	b=FkYjjSqO6vpselXDvuzVN7m5eBr2jf5PtZXY56F+TR8Jcqg7oN/Fo1vg5eIzUu3zRS
	1G6akFLedbRiokkZaozxftJo0mKiopDyz3vTaRFvyMVUFxeAcGDGr6qekVXUrxoJ4yaC
	dyZxd2z29n46+P/1P77zA8xLYfLSkoFC5DvH8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=hUFxi1OJoWMerblIRYE/j84guG7jCRIaJcp2x7S6LiVUKCCEYsKeZgEnWrER41dPAK
	JPzVxo51wq8AnOzF1iWj0gvaH1A9mcDh1e5bxwx1O7DIuBt3bi96v2wdq/cfsXlQlWcs
	Gl9473NKPRHOlopYK+8gmpMbnIJ/zGPUcPQfA=
MIME-Version: 1.0
Received: by 10.68.68.212 with SMTP id y20mr910846pbt.184.1305233595064; Thu,
	12 May 2011 13:53:15 -0700 (PDT)
Received: by 10.68.41.97 with HTTP; Thu, 12 May 2011 13:53:15 -0700 (PDT)
Date: Thu, 12 May 2011 16:53:15 -0400
Message-ID: <BANLkTimHpb2Jyf=QYk_p0VL95jdNQJGCog@mail.gmail.com>
From: Martin Bures <needemesleepe@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: wpa-supplicant-0.7.inc patch
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
X-List-Received-Date: Thu, 12 May 2011 20:56:04 -0000
X-Groupsio-MsgNum: 31951
Content-Type: multipart/mixed; boundary=001517478b74c860bd04a31a60c0

--001517478b74c860bd04a31a60c0
Content-Type: text/plain; charset=ISO-8859-1

The wpa-supplicant recipe does not place dbus configuration files even
though dbus is enabled in the .config.

The following patch fixes this for me.

Best Regards,
martin.

--001517478b74c860bd04a31a60c0
Content-Type: text/x-patch; charset=US-ASCII; 
	name="wpa-supplicant-dbus-placement-fix.patch"
Content-Disposition: attachment; 
	filename="wpa-supplicant-dbus-placement-fix.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_gnm6e0df0

RnJvbSBiOGQ2YTUyMDcwZjY3ODM3MWFlZjE5NGZjMGRmMzdjNjkxMWUxOTUyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBNYXJ0aW4gQnVyZXMgPG1idXJlc0B6b2xsLmNvbT4KRGF0ZTog
VGh1LCAxMiBNYXkgMjAxMSAxNjozNToyOSAtMDQwMApTdWJqZWN0OiBbUEFUQ0hdIEZpeGVkIGlz
c3VlIHdoZXJlIGRidXMgY29uZmlndXJhdGlvbiBpcyBub3QgZGV0ZWN0ZWQuICBUaGlzIHByZXZl
bnRlZAogd3BhLXN1cHBsaWNhbnQgZGJ1cyBzdXBwb3J0IGZyb20gYmVpbmcgaW5jbHVkZWQuCgot
LS0KIHJlY2lwZXMvd3BhLXN1cHBsaWNhbnQvd3BhLXN1cHBsaWNhbnQtMC43LmluYyB8ICAgIDYg
KysrLS0tCiAxIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9yZWNpcGVzL3dwYS1zdXBwbGljYW50L3dwYS1zdXBwbGljYW50LTAuNy5p
bmMgYi9yZWNpcGVzL3dwYS1zdXBwbGljYW50L3dwYS1zdXBwbGljYW50LTAuNy5pbmMKaW5kZXgg
NzIyZjVmYS4uNmUyZjc1NCAxMDA2NDQKLS0tIGEvcmVjaXBlcy93cGEtc3VwcGxpY2FudC93cGEt
c3VwcGxpY2FudC0wLjcuaW5jCisrKyBiL3JlY2lwZXMvd3BhLXN1cHBsaWNhbnQvd3BhLXN1cHBs
aWNhbnQtMC43LmluYwpAQCAtNTAsMTUgKzUwLDE1IEBAIGRvX2luc3RhbGwgKCkgewogCWluc3Rh
bGwgLW0gNjAwICR7V09SS0RJUn0vZGVmYXVsdHMtc2FuZSAke0R9JHtzeXNjb25mZGlyfS9kZWZh
dWx0L3dwYQogCWluc3RhbGwgLW0gNjAwICR7V09SS0RJUn0vd3BhX3N1cHBsaWNhbnQuY29uZi1z
YW5lICR7RH0ke3N5c2NvbmZkaXJ9L3dwYV9zdXBwbGljYW50LmNvbmYKIAotCWlmIGdyZXAgLXEg
XkNPTkZJR19DVFJMX0lGQUNFX0RCVVM9eSAuY29uZmlnIHx8IGdyZXAgLXEgXkNPTkZJR19DVFJM
X0lGQUNFX0RCVVNfTkVXPXkgLmNvbmZpZzsgdGhlbgorCWlmIGdyZXAgLXEgXkNPTkZJR19DVFJM
X0lGQUNFX0RCVVM9eSAke1N9Ly5jb25maWcgfHwgZ3JlcCAtcSBeQ09ORklHX0NUUkxfSUZBQ0Vf
REJVU19ORVc9eSAke1N9Ly5jb25maWc7IHRoZW4KIAkJaW5zdGFsbCAtZCAke0R9LyR7c3lzY29u
ZmRpcn0vZGJ1cy0xL3N5c3RlbS5kCiAJCWluc3RhbGwgLW0gNjQ0ICR7U30vZGJ1cy9kYnVzLXdw
YV9zdXBwbGljYW50LmNvbmYgJHtEfS8ke3N5c2NvbmZkaXJ9L2RidXMtMS9zeXN0ZW0uZAogCQlp
bnN0YWxsIC1kICR7RH0vJHtkYXRhZGlyfS9kYnVzLTEvc3lzdGVtLXNlcnZpY2VzCi0JCWlmIGdy
ZXAgLXEgXkNPTkZJR19DVFJMX0lGQUNFX0RCVVM9eSAuY29uZmlnOyB0aGVuCisJCWlmIGdyZXAg
LXEgXkNPTkZJR19DVFJMX0lGQUNFX0RCVVM9eSAke1N9Ly5jb25maWc7IHRoZW4KIAkJCXNlZCAt
aSAtZSBzOi9zYmluOiR7c2JpbmRpcn06ZyAke1N9L2RidXMvZmkuZXBpdGVzdC5ob3N0YXAuV1BB
U3VwcGxpY2FudC5zZXJ2aWNlCiAJCQlpbnN0YWxsIC1tIDY0NCAke1N9L2RidXMvZmkuZXBpdGVz
dC5ob3N0YXAuV1BBU3VwcGxpY2FudC5zZXJ2aWNlICR7RH0vJHtkYXRhZGlyfS9kYnVzLTEvc3lz
dGVtLXNlcnZpY2VzCiAJCWZpCi0JCWlmIGdyZXAgLXEgXkNPTkZJR19DVFJMX0lGQUNFX0RCVVNf
TkVXPXkgLmNvbmZpZzsgdGhlbgorCQlpZiBncmVwIC1xIF5DT05GSUdfQ1RSTF9JRkFDRV9EQlVT
X05FVz15ICR7U30vLmNvbmZpZzsgdGhlbgogCQkJc2VkIC1pIC1lIHM6L3NiaW46JHtzYmluZGly
fTpnICR7U30vZGJ1cy9maS53MS53cGFfc3VwcGxpY2FudDEuc2VydmljZQogCQkJaW5zdGFsbCAt
bSA2NDQgJHtTfS9kYnVzL2ZpLncxLndwYV9zdXBwbGljYW50MS5zZXJ2aWNlICR7RH0vJHtkYXRh
ZGlyfS9kYnVzLTEvc3lzdGVtLXNlcnZpY2VzCiAJCWZpCi0tIAoxLjcuMC40Cgo=

--001517478b74c860bd04a31a60c0--
