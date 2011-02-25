Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Pt2xx-0007y4-Rk
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Feb 2011 20:04:37 +0100
Received: by bwz10 with SMTP id 10so2292953bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Feb 2011 11:03:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:date:x-google-sender-auth
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=3Pkoogrjp/g5iHuLDY0Z4+nh58hdtdl67xpZwcIplJo=;
	b=xPdpFo1K5ujqQ+DnCS677CJGudq7sFC3Qlx3SoLFdPML5uDe8VgKfsY//1wqWVrRry
	AkHwVJOWrRgm1Jq67JqfbbqQGn/NjvsylD4rgxsy0PjLDLGwCUxeUad3Mn1bMApsdJE7
	bhujWJzLTP5Bhpwd40ZiUiNrSxGLFqpT98J1E=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	b=JJSS4RsbIudnTWlShaAvT6mczAZ22ABgSqqztQJ4b5hmyiYmyLKRSLICDjLENkaR0e
	f6zPgLKRcdlpuA8xIFt9n3EOoV2o/pMfxmI+w97Ew674iKPabd67ndFZUzvH7WsZjlXG
	2d37v1wfmvFmKBEE+/lTN2ukXHpJg1QB5Iz7I=
MIME-Version: 1.0
Received: by 10.204.12.84 with SMTP id w20mr2465035bkw.43.1298660590986; Fri,
	25 Feb 2011 11:03:10 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.119.207 with HTTP; Fri, 25 Feb 2011 11:03:10 -0800 (PST)
Date: Fri, 25 Feb 2011 19:03:10 +0000
X-Google-Sender-Auth: 277-DLSU-tICxM3n_gD73GxYgxY
Message-ID: <AANLkTiknqQ6xLj8LFv4=17ymwSbVhD3C9kVe2qkviXhX@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Missing GLIBC_<version> tags on binaries
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
X-List-Received-Date: Fri, 25 Feb 2011 19:04:37 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello,

I am fighting with an issue for last cuple of days and after checking
a lot of weird stuff it seems that the root cause of problem is a
linking issue.

I am having trouble with apps using semaphores. Those are lacking the
GLIBC_2.1 or similar tags and then doesn't work. I rebuilt the
application to check and it keep doing the linking wrong.

Any clue?

Distro: minimal
Machine: i586-generic

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


