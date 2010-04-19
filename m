Received: from mail-ew0-f211.google.com ([209.85.219.211])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickael.chazaux@gmail.com>) id 1O3qoF-00059q-5O
	for openembedded-devel@lists.openembedded.org;
	Mon, 19 Apr 2010 15:14:50 +0200
Received: by ewy3 with SMTP id 3so1063849ewy.26
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Apr 2010 06:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:date
	:x-google-sender-auth:received:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=cOL1r4v9RQhztwtb4xsaaW4dCimJADRngdav92xOi+k=;
	b=d0b7pRmysLPohbA/3cqgEHH+8Hpbk5FwFsObY9YCKhkD7mbeEPBBG2bcwJhupGwnCy
	EJ4xw/rfUdTzOnuY03QV9LxcwNgFFp/y59Z0lxSc8iPfAeWJxob7n6syXpl5nkxRFej9
	lCZdbW15tWQZ3Ct5wGTQQzfZevxcCfUrl37Mg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	b=qG712DMJpxwdycdSpUC4WoU7wPG+VETBtDViBJSTJGtBkABirB0Nt42CrZy8clUOjR
	movzxDfFxX90j6ydpOhJcg72qcHOR3rrF1ZBia1BXyejrQ23Tv3zMb+lNzWwVFWVO6Ot
	pI9ysUPWGJDdua7bgjTvSABI9pJ0AlYiZn5mk=
MIME-Version: 1.0
Sender: mickael.chazaux@gmail.com
Received: by 10.213.19.136 with HTTP; Mon, 19 Apr 2010 06:11:10 -0700 (PDT)
Date: Mon, 19 Apr 2010 15:11:10 +0200
X-Google-Sender-Auth: 0d5c2a1a408f0e83
Received: by 10.213.41.3 with SMTP id m3mr2678612ebe.40.1271682670454; Mon, 19 
	Apr 2010 06:11:10 -0700 (PDT)
Message-ID: <r2pbc36f8ed1004190611t60cb9126of30616c31b7e192f@mail.gmail.com>
From: Mickael Chazaux <mchazaux@adeneo-embedded.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.219.211
X-SA-Exim-Mail-From: mickael.chazaux@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: curl_7.20.0.bb cross linking failure
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
X-List-Received-Date: Mon, 19 Apr 2010 13:14:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

Curl fails because it uses the system's linker instead of the cross-linker.

/usr/bin/ld: .libs/file.o: Relocations in generic ELF (EM: 40)
/usr/bin/ld: .libs/file.o: Relocations in generic ELF (EM: 40)
.libs/file.o: could not read symbols: File in wrong format
collect2: ld returned 1 exit status
arm-angstrom-linux-gnueabi-libtool: install: error: relink
`libcurl.la' with the above command before installing it
make[2]: *** [install-libLTLIBRARIES] Error 1
make[2]: Leaving directory
`/home/mchazaux/projet/OE/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/c=
url-7.20.0-r3/curl-7.20.0/lib'
make[1]: *** [install-am] Error 2
make[1]: Leaving directory
`/home/mchazaux/projet/OE/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/c=
url-7.20.0-r3/curl-7.20.0/lib'
make: *** [install-recursive] Error 1
FATAL: oe_runmake failed

Do you have a clue on how to fix this issue ?

Regards,

Mickael Chazaux

Adeneo Embedded - Adetel Group

2, chemin du Ruisseau
69134 ECULLY - FRANCE
T=C3=A9l. : +33 (0)4 72 18 08 40 - Fax : +33 (0)4 72 18 08 41


