Received: from office.altell.ru ([80.246.246.162])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1O0BhA-00006j-C0
	for openembedded-devel@lists.openembedded.org;
	Fri, 09 Apr 2010 12:44:19 +0200
Received: from keemun.localnet (unknown [192.168.1.169])
	by mail.altell.local (Postfix) with ESMTPS id 964DD6826E
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Apr 2010 14:40:47 +0400 (MSD)
From: Roman I Khimov <khimov@altell.ru>
Organization: Altell Ltd.
To: openembedded-devel@lists.openembedded.org
Date: Fri, 9 Apr 2010 14:39:53 +0400
User-Agent: KMail/1.12.4 (Linux/2.6.31.12-0.2-desktop; KDE/4.3.5; x86_64; ; )
References: <r2u48239d391004090326qb2a80dd6ic11530d737c6edde@mail.gmail.com>
In-Reply-To: <r2u48239d391004090326qb2a80dd6ic11530d737c6edde@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <201004091439.53806.khimov@altell.ru>
X-Altell-MailScanner-ID: 964DD6826E.5E7E1
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
X-List-Received-Date: Fri, 09 Apr 2010 10:44:23 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

=D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=BE=D1=82 =
=D0=9F=D1=8F=D1=82=D0=BD=D0=B8=D1=86=D0=B0 09 =D0=B0=D0=BF=D1=80=D0=B5=D0=
=BB=D1=8F 2010 14:26:22 =D0=B0=D0=B2=D1=82=D0=BE=D1=80 Sergey Lapin =D0=BD=
=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB:
> So, with recent images I have to run all postinst scripts again on
> device for services
> like udev or dropbear to work. These packages get 'installed' status,
> so postinst
> scripts won't normally run during 'opkg configure', but /etc/rc*d
> links are not created for them during
> image build. Any ideas on fixing, or what is really being wrong here?

Do "set -e" in the beginning of postinst if it can only do its job on targe=
t.=20
I have some patches adding that in queue.


