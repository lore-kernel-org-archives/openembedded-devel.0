Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1PnCEO-0007Yd-I3
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Feb 2011 16:45:24 +0100
Received: by ewy28 with SMTP id 28so149419ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Feb 2011 07:44:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:date:x-google-sender-auth
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=iQpaH91f1VMddA7DTAU2KTNk9wwFEuor0cvXpEGqmAM=;
	b=vdAu+wopFGrw1iOhPlIXc6jAMO2ooFH7KaAvB3CYMl4Wowa+l9cfsDL+2U8qKMQZe1
	C+PtynTxHn8QIJlkvYUVnxYBH7jiKrMlCvFeNVmfe6cQO+vnGnGLhJg5+ylwZS9B+n/B
	AGSymsf9JY++HXc9TAVGJhASiWamO0eqQ3jYM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	b=nZwL8pj1oP0FNyrm8iYgqLN5a3LUrptCOsBOJXUeVz1MfBxF7ZOQh3kCfAVpiS66BH
	LCWtoQy6BjcAVnrM8DVBNCGlc0Mm1i0M1qwQkhdnO3b2cjPNkDXpdHQzqzKjB5Rc310G
	uX7VokKyTVhvQYFRKz0kHnWsUq42C0wAHTeF0=
MIME-Version: 1.0
Received: by 10.204.79.135 with SMTP id p7mr628006bkk.109.1297266259346; Wed,
	09 Feb 2011 07:44:19 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.56.135 with HTTP; Wed, 9 Feb 2011 07:44:19 -0800 (PST)
Date: Wed, 9 Feb 2011 15:44:19 +0000
X-Google-Sender-Auth: oiM0Oh0BxwM8RNGIPbM6E0tMjXQ
Message-ID: <AANLkTikHqrgZawN7dtKwrp65sY4RviZzb7t2Bg_k2vfK@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Pull request from O.S. Systems
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
X-List-Received-Date: Wed, 09 Feb 2011 15:45:24 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello,

I'd like to ask someone to pull from our tree.

The following changes since commit a25c44e70f3ece85b41e6c4e49c1a6867dc36a12=
:

  bug2v4l2: Fix recipe to atcually work. (2011-02-09 14:19:02 +0100)

are available in the git repository at:
  git://projetos.ossystems.com.br/git/users/otavio/org.openembedded.dev.git
master

Otavio Salvador (5):
      slang: fix 2.2.2 URL
      gitpkgv.bbclass: return None if repository does not exist
      libnewt: include latest fixes and allow python removal
      cmake-sdk: add 2.8.2 recipe
      tzcode-native: update to 2011b

 classes/gitpkgv.bbclass                            |    3 +
 recipes/cmake/cmake-sdk_2.8.2.bb                   |   12 +++
 recipes/newt/files/include-without-python.patch    |   71 ++++++++++++++++=
++++
 recipes/newt/files/support-DESTDIR.patch           |   12 ---
 recipes/newt/libnewt_0.52.12.bb                    |   18 +++--
 recipes/slang/slang_2.2.2.bb                       |    4 +-
 ...code-native_2011a.bb =3D> tzcode-native_2011b.bb} |   10 ++--
 7 files changed, 105 insertions(+), 25 deletions(-)
 create mode 100644 recipes/cmake/cmake-sdk_2.8.2.bb
 create mode 100644 recipes/newt/files/include-without-python.patch
 delete mode 100644 recipes/newt/files/support-DESTDIR.patch
 rename recipes/tzcode/{tzcode-native_2011a.bb =3D> tzcode-native_2011b.bb}=
 (51%)

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


