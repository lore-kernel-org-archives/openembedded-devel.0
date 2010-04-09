Received: from office.altell.ru ([80.246.246.162])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1O0CQl-0002mk-0p
	for openembedded-devel@lists.openembedded.org;
	Fri, 09 Apr 2010 13:31:23 +0200
Received: from keemun.localnet (unknown [192.168.1.169])
	by mail.altell.local (Postfix) with ESMTPS id 74A056826F
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Apr 2010 15:27:54 +0400 (MSD)
From: Roman I Khimov <khimov@altell.ru>
Organization: Altell Ltd.
To: openembedded-devel@lists.openembedded.org
Date: Fri, 9 Apr 2010 15:26:53 +0400
User-Agent: KMail/1.12.4 (Linux/2.6.31.12-0.2-desktop; KDE/4.3.5; x86_64; ; )
References: <r2u48239d391004090326qb2a80dd6ic11530d737c6edde@mail.gmail.com>
	<201004091439.53806.khimov@altell.ru>
	<k2j48239d391004090353mcc7c01a0o4bc58d8c1efd5c27@mail.gmail.com>
In-Reply-To: <k2j48239d391004090353mcc7c01a0o4bc58d8c1efd5c27@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <201004091526.53400.khimov@altell.ru>
X-Altell-MailScanner-ID: 74A056826F.16E22
X-Altell-MailScanner: Found to be clean
X-Altell-MailScanner-From: khimov@altell.ru
X-SA-Exim-Connect-IP: 80.246.246.162
X-SA-Exim-Mail-From: khimov@altell.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: postinst scripts and opkg configure
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
X-List-Received-Date: Fri, 09 Apr 2010 11:31:23 -0000
Content-Type: Text/Plain;
  charset="koi8-r"
Content-Transfer-Encoding: quoted-printable

=F7 =D3=CF=CF=C2=DD=C5=CE=C9=C9 =CF=D4 =F0=D1=D4=CE=C9=C3=C1 09 =C1=D0=D2=
=C5=CC=D1 2010 14:53:22 =C1=D7=D4=CF=D2 Sergey Lapin =CE=C1=D0=C9=D3=C1=CC:
> On Fri, Apr 9, 2010 at 2:39 PM, Roman I Khimov <khimov@altell.ru> wrote:
> > =F7 =D3=CF=CF=C2=DD=C5=CE=C9=C9 =CF=D4 =F0=D1=D4=CE=C9=C3=C1 09 =C1=D0=
=D2=C5=CC=D1 2010 14:26:22 =C1=D7=D4=CF=D2 Sergey Lapin =CE=C1=D0=C9=D3=C1=
=CC:
> >> So, with recent images I have to run all postinst scripts again on
> >> device for services
> >> like udev or dropbear to work. These packages get 'installed' status,
> >> so postinst
> >> scripts won't normally run during 'opkg configure', but /etc/rc*d
> >> links are not created for them during
> >> image build. Any ideas on fixing, or what is really being wrong here?
> >
> > Do "set -e" in the beginning of postinst if it can only do its job on
> > target. I have some patches adding that in queue.
>=20
> I can't understand why creation of links won't work on host,
> because that will be a problem for filesystems like squashfs.

Actually, update-rc.d scripts should work on build host (that "$OPT" in scr=
ipt=20
is exactly for that purpose) and so are update-alternatives (thanks to=20
OPKG_OFFLINE_ROOT magic), so there might be something wrong with your setup.

What I was talking about is something more like postfix.


