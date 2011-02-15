Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PpEil-0005zh-RZ
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Feb 2011 07:49:12 +0100
Received: by iwn8 with SMTP id 8so5547929iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Feb 2011 22:48:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=0EK7iZQ0ya1sUd8pprhtLgNY9mxBn/b3tPCMMYr22SM=;
	b=WgIT/orl3ibETGiLtVKHtXZPFHO6UjIc9kG/ao9hc21ZQvMdHsOb/x9a9S895+E86Y
	gPT0awS31vzApLg7cBowz4wxgtfHNnTTtAoX6ND1B7kk4jt+xosx+fedfUMZ5QZonPud
	KiJxmpFM9liB+ZmzJsBoTNbypI9JBhady3FQ8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=ZoWxwZzzXJn9EvO+7L/oYivwtDFbAn+pSam+gC4G80htWUfOTlvyUYFXhnPtzZ839Y
	DyTx/5cSr4K5jKmcgh/eFIkBaXdeV8v2SOWcRhUSrYgMdrcUqxWRD1muHBZpuPL3CDll
	g+ffKXB44RfGIXh6yL5zkV50LlPjx8qjGCu3M=
MIME-Version: 1.0
Received: by 10.42.180.131 with SMTP id bu3mr6119127icb.366.1297752481484;
	Mon, 14 Feb 2011 22:48:01 -0800 (PST)
Received: by 10.231.30.73 with HTTP; Mon, 14 Feb 2011 22:48:01 -0800 (PST)
Date: Tue, 15 Feb 2011 07:48:01 +0100
Message-ID: <AANLkTi=bPrL+J+sA6wR+BEK9GuLxbMJRohVAPie-_u_i@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: git head: build of rpm-native fails
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
X-List-Received-Date: Tue, 15 Feb 2011 06:49:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

Yesterday I tried whether I could cross compile a helloworld.rpm to
try on a fedora-arm box, but I failed in building rpm-native.
This issue was verified by Jay. His log:
http://tinderbox.openembedded.net/public/logs/task/25555153.txt

apparently this is the failing part is:

file -C -m ./magic.mime
./magic.mime, 187: Warning: string extension `B' invalid
./magic.mime, 401: Warning: string extension `B' invalid
./magic.mime, 618: Warning: string extension `B' invalid
./magic.mime, 623: Warning: string extension `B' invalid
./magic.mime, 627: Warning: string extension `B' invalid
./magic.mime, 628: Warning: string extension `B' invalid
./magic.mime, 672: Warning: no need to escape `#'
./magic.mime, 674: Warning: no need to escape `#'
file: could not find any magic files!
make[4]: *** [magic.mime.mgc] =C3=90=C5=BE=C3=91=CB=86=C3=90=C2=B8=C3=90=C2=
=B1=C3=90=C2=BA=C3=90=C2=B0 1
make[4]: *** =C3=90=C5=BE=C3=90=C2=B6=C3=90=C2=B8=C3=90=C2=B4=C3=90=C2=B0=
=C3=90=C2=BD=C3=90=C2=B8=C3=90=C2=B5 =C3=90=C2=B7=C3=90=C2=B0=C3=90=C2=B2=
=C3=90=C2=B5=C3=91=E2=82=AC=C3=91=CB=86=C3=90=C2=B5=C3=90=C2=BD=C3=90=C2=B8=
=C3=91=C2=8F =C3=90=C2=B7=C3=90=C2=B0=C3=90=C2=B4=C3=90=C2=B0=C3=90=C2=BD=
=C3=90=C2=B8=C3=90=C2=B9..

I tried the command in a devshell and there it also fails, but I have
not really an idea what is wrong (and I don't know too much about RPM
anyway)
Suggestions? Fixes ?

Frans


