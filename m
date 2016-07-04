Return-Path: <gyurco@freemail.hu>
Received: from mail-outd.mail.t-online.hu (mail-outd.mail.t-online.hu
	[195.228.240.61])
	by mail.openembedded.org (Postfix) with ESMTP id 9BB2A6011C
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Jul 2016 19:51:53 +0000 (UTC)
Received: from fsmeopfe.local (1F2EA8E2.dsl.pool.telekom.hu [31.46.168.226])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail02d.mail.t-online.hu (Postfix) with ESMTPSA id 3rjyMX47yTz10J;
	Mon,  4 Jul 2016 21:51:52 +0200 (CEST)
From: Szombathelyi =?ISO-8859-1?Q?Gy=F6rgy?= <gyurco@freemail.hu>
To: Joe MacDonald <Joe_MacDonald@mentor.com>
Date: Mon, 04 Jul 2016 21:51:51 +0200
Message-ID: <1493832.uVeKvIqOJk@gyurco.localdomain>
User-Agent: KMail/5.1.3 (Linux/4.6.3-300.fc24.x86_64; KDE/5.23.0; x86_64; ; )
In-Reply-To: <20160620140845.GA4931@mentor.com>
References: <1466276817-4209-1-git-send-email-gyurco@freemail.hu>
	<20160620140845.GA4931@mentor.com>
MIME-Version: 1.0
X-DCC--Metrics: mail02d.mail.t-online.hu 1307; Body=2 Fuz1=2 Fuz2=2
X-Spam-Probability: 1.60068625021e-11
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH] Samba: use only libsystemd
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 04 Jul 2016 19:51:55 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

On Monday, June 20, 2016 10:08:45 AM CEST Joe MacDonald wrote:
> Hi Gyorgy,
>=20
Hi Joe,

> [[oe] [meta-networking][PATCH] Samba: use only libsystemd] On 16.06.18 (S=
at=20
21:06) Gyorgy Szombathelyi wrote:
> > This patch was disappeared while moved to 4.4.2
>=20
> I can't find this patch in the git history, but I'm happy to merge it if
> you can provide a bit more detail on it.  Is it always valid to assume
> HAVE_LIBSYSTEMD will always mean HAVE_LIBSYSTEMD_JOURNAL and
> HAVE_LIBSYSTEMD_DAEMON?  Also, can you provide an upstream-status on
> this?
I found out the real history: since systemd-209, there's only one library=20
built, called libsystemd.so.

https://lists.freedesktop.org/archives/systemd-devel/2014-February/017146.h=
tml
 * The APIs "sd-journal.h", "sd-login.h", "sd-id128.h" are no
          longer found in individual libraries libsystemd-journal.so,
          libsystemd-login.so, libsystemd-id128.so. Instead, we have
          merged them into a single library, libsystemd.so, which
          provides all symbols.

Seems others are noticed it, too :)
http://firstyear.id.au/blog/html/2016/05/23/systemd_is_not_monolithic.html


> Thanks.
> -J.

Br,
Gy=F6rgy


