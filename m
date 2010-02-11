Received: from mail-fx0-f227.google.com ([209.85.220.227])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcosmamorim@gmail.com>) id 1NfekP-00059M-A6
	for Openembedded-devel@lists.openembedded.org;
	Thu, 11 Feb 2010 20:30:48 +0100
Received: by fxm27 with SMTP id 27so472568fxm.27
	for <Openembedded-devel@lists.openembedded.org>;
	Thu, 11 Feb 2010 11:28:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=CK1zezINPowDsfQMZW06CkSqo7/D0yrKmcw+3h3/iPQ=;
	b=Ya4o/kx4OaPtCoifKlJPtseRx0vfCQvmXIR+CHEWIyjrk9GqpapJIGImksSl3AH8PT
	TbhqbGqLBf4NhomPf0SAOKOEIlaE2CVg8QlsWuh3dDVRShqagATIg4VN22xWztv4unPp
	cJ+q0K/HfYmPDO+WJBSKAfncaYH8O6Ql+Mz8c=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=h9hNBBReddmgcVWmlvdgnR8XJBpnrhli7UUeRcwyXH0zEHLUnxDmQeQ4wNsBsWLAdX
	ODp73pCmkHx90ktnw84RnT8FMywDkmb0gnFsTvnQ8FR5URj2MzPTU+IOec3JLy+A7nEK
	pdW3ZBbuV/GKkPVQUoe6xCg9xn9LbAfj2dqZ4=
MIME-Version: 1.0
Received: by 10.223.94.200 with SMTP id a8mr321622fan.86.1265916490585; Thu, 
	11 Feb 2010 11:28:10 -0800 (PST)
Date: Thu, 11 Feb 2010 17:28:10 -0200
Message-ID: <b8e1ecc81002111128p36334dbct630b611cc455ded8@mail.gmail.com>
From: Marcos Amorim <marcosmamorim@gmail.com>
To: Openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.220.227
X-SA-Exim-Mail-From: marcosmamorim@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Fix URI perl-native
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
X-List-Received-Date: Thu, 11 Feb 2010 19:30:48 -0000
X-Groupsio-MsgNum: 16694
Content-Type: multipart/mixed; boundary=001517473392bc976f047f5826f4

--001517473392bc976f047f5826f4
Content-Type: text/plain; charset=ISO-8859-1

Set new URI to perl-native-5.8


Marcos Amorim

--001517473392bc976f047f5826f4
Content-Type: text/x-patch; charset=US-ASCII; name="0018-perl-native-Change-URI.patch"
Content-Disposition: attachment; 
	filename="0018-perl-native-Change-URI.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_g5jy5eua0

RnJvbSBiNTNjYjkwYmUzNjdlZGU1NjkxZTE2OTQ2NWFjM2JlZTIxZDM0MmIyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBNYXJjb3MgQW1vcmltIDxtYXJjb3NtYW1vcmltQDJtaS5jb20u
YnI+CkRhdGU6IFRodSwgMTEgRmViIDIwMTAgMTc6MTU6MjkgLTAyMDAKU3ViamVjdDogW1BBVENI
XSBwZXJsLW5hdGl2ZTogQ2hhbmdlIFVSSQoKLS0tCiByZWNpcGVzL3BlcmwvcGVybC1uYXRpdmVf
NS44LjguYmIgfCAgICAyICstCiAxIGZpbGVzIGNoYW5nZWQsIDEgaW5zZXJ0aW9ucygrKSwgMSBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9yZWNpcGVzL3BlcmwvcGVybC1uYXRpdmVfNS44Ljgu
YmIgYi9yZWNpcGVzL3BlcmwvcGVybC1uYXRpdmVfNS44LjguYmIKaW5kZXggZTNkNzM4NC4uMGZi
NmRiMyAxMDA2NDQKLS0tIGEvcmVjaXBlcy9wZXJsL3BlcmwtbmF0aXZlXzUuOC44LmJiCisrKyBi
L3JlY2lwZXMvcGVybC9wZXJsLW5hdGl2ZV81LjguOC5iYgpAQCAtNyw3ICs3LDcgQEAgUFIgPSAi
cjEzIgogCiBGSUxFU0RJUiA9ICIke0Bvcy5wYXRoLmRpcm5hbWUoYmIuZGF0YS5nZXRWYXIoJ0ZJ
TEUnLGQsMSkpfS9wZXJsLSR7UFZ9IgogCi1TUkNfVVJJID0gImh0dHA6Ly9mdHAuZnVuZXQuZmkv
cHViL0NQQU4vc3JjL3BlcmwtJHtQVn0udGFyLmd6IFwKK1NSQ19VUkkgPSAiaHR0cDovL2Z0cC5m
dW5ldC5maS9wdWIvQ1BBTi9zcmMvNS4wL3BlcmwtJHtQVn0udGFyLmd6IFwKICAgICAgICAgICAg
ZmlsZTovL3BlcmwtNS44LjgtZ2NjLTQuMi5wYXRjaDtwYXRjaD0xIFwKICAgICAgICAgICAgZmls
ZTovL0NvbmZpZ3VyZS1tdWx0aWxpYi5wYXRjaDtwYXRjaD0xIFwKICAgICAgICAgICAgZmlsZTov
L3BlcmwtY29uZmlncG0tc3dpdGNoLnBhdGNoO3BhdGNoPTEgXAotLSAKMS42LjMuMwoK

--001517473392bc976f047f5826f4--
