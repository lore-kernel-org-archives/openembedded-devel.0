Received: from [209.85.128.191] (helo=fk-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <pmiscml@gmail.com>) id 1JQQJJ-00042v-LK
	for openembedded-devel@lists.openembedded.org;
	Sat, 16 Feb 2008 17:54:50 +0100
Received: by fk-out-0910.google.com with SMTP id 18so1379618fks.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Feb 2008 08:54:20 -0800 (PST)
Received: by 10.78.124.9 with SMTP id w9mr5800130huc.24.1203180860234;
	Sat, 16 Feb 2008 08:54:20 -0800 (PST)
Received: from widy.localdomain ( [88.231.76.37])
	by mx.google.com with ESMTPS id d24sm762144nfh.29.2008.02.16.08.54.15
	(version=SSLv3 cipher=OTHER); Sat, 16 Feb 2008 08:54:19 -0800 (PST)
Date: Sat, 16 Feb 2008 18:54:45 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20080216185445.22199031@widy.localdomain>
In-Reply-To: <200802161730.36669.openembedded@haerwu.biz>
References: <E1JQBXb-0008Gs-HR@linuxtogo.org>
	<200802161730.36669.openembedded@haerwu.biz>
X-Mailer: Claws Mail 3.0.2 (GTK+ 2.12.5; i686-pc-linux-gnu)
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 209.85.128.191
X-SA-Exim-Mail-From: pmiscml@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [oe-commits] org.oe.dev devimage 0.1: Up a usb0 on load, now that we're modular.
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
X-List-Received-Date: Sat, 16 Feb 2008 16:54:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello,

On Sat, 16 Feb 2008 17:30:35 +0100
Marcin Juszkiewicz <openembedded@haerwu.biz> wrote:

> Dnia Saturday, 16 of February 2008, pfalcon commit napisa=C5=82:
> > devimage 0.1: Up a usb0 on load, now that we're modular.
>=20
> > +modprobe g_ether
> > +ifconfig usb0 192.168.2.202
>=20
> I am curious when someone will push usb0 to 192.168.3.202... Please
> use netbase standard: 192.168.0.202 in your recipe.

192.168.0.0/24, 192.168.1.0/24 are not good choices as those are
oftentimes refer to existing networks (yes, those vendors love to use
"standard" values too). 2 is of course not good either, something more
random should be used. Which exactly should be subject of RFC. (And
no, this is not related to netbase which offers some value for user to
edit. This one is not supposed to be editable by end user.)

[]


--=20
Best regards,
 Paul                          mailto:pmiscml@gmail.com


