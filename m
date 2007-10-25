Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <openembedded@haerwu.biz>) id 1Il8kF-00089E-LW
	for openembedded-devel@openembedded.org; Thu, 25 Oct 2007 21:51:55 +0200
Received: (qmail 30660 invoked by uid 813007); 25 Oct 2007 19:44:31 -0000
X-clamdmail: clamdmail 0.18a
Received: from v813.rev.tld.pl (HELO home.lan)
	(marcin@hrw.one.pl@195.149.226.213)
	by smtp.host4.kei.pl with ESMTPA; 25 Oct 2007 19:44:31 -0000
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 25 Oct 2007 21:44:30 +0200
User-Agent: KMail/1.9.7
References: <E1Il7zj-0002lu-Uj@linuxtogo.org>
In-Reply-To: <E1Il7zj-0002lu-Uj@linuxtogo.org>
X-PRIORITY: 2 (High)
Priority: urgent
MIME-Version: 1.0
Message-Id: <200710252144.30914.openembedded@haerwu.biz>
Subject: Re: [oe-commits] org.oe.dev linux.inc: build mkimage unconditionally
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 25 Oct 2007 19:51:57 -0000
Content-Type: text/plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia czwartek, 25 pa=BCdziernika 2007, koen commit napisa=B3:
> linux.inc: build mkimage unconditionally
> * see comment inside the file

> Author: koen@openembedded.org
> Branch: org.openembedded.dev
> Revision: cc0f788a513b8c6fcf2e55f8c9e0fb35c6f5c016

> packages/linux/linux.inc

> @@ -47,7 +35,7 @@ do_configure_prepend() {
>          #
>          if [ "${TARGET_OS}" =3D "linux-gnueabi" -o  "${TARGET_OS}" =3D "=
linux-uclibcgnueabi" ]; then=20
>                  echo "CONFIG_AEABI=3Dy"  >> ${S}/.config=20
> -                echo "CONFIG_OABI_COMPAT=3Dy"    >> ${S}/.config=20
> +                echo "# CONFIG_OABI_COMPAT is not set"             >> ${=
S}/.config else
>                  echo "# CONFIG_AEABI is not set"        >> ${S}/.config=
=20
>                  echo "# CONFIG_OABI_COMPAT is not set"  >> ${S}/.config=
=20

Please revert this part - we want OABI support in EABI kernels.


=2D-=20
JID: hrw-jabber.org
OpenEmbedded developer/consultant

  Problemy z matematyk=B1? Zadzwo=F1! 0-800-[(10x)(13i)^2]-[sin(xy)/2.362x]




