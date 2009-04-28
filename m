Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1LyrfT-0004ZW-4R
	for openembedded-devel@openembedded.org; Tue, 28 Apr 2009 20:04:35 +0200
Received: (qmail 32049 invoked by uid 813007); 28 Apr 2009 17:59:19 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 28 Apr 2009 17:59:19 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 28 Apr 2009 19:59:17 +0200
User-Agent: KMail/1.11.2 (Linux/2.6.30-rc3-00005-g51bc6b7-dirty; KDE/4.2.2;
	x86_64; ; )
References: <1240829698-28666-1-git-send-email-marcin@juszkiewicz.com.pl>
	<200904281852.36370.khimov@altell.ru>
In-Reply-To: <200904281852.36370.khimov@altell.ru>
MIME-Version: 1.0
Message-Id: <200904281959.18598.marcin@juszkiewicz.com.pl>
Subject: Re: [PATCH 1/1] genext2fs: added 1.4.1 version
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
X-List-Received-Date: Tue, 28 Apr 2009 18:05:04 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia wtorek, 28 kwietnia 2009 o 16:52:35 Roman I Khimov napisa=C5=82(a):
> On Monday 27 April 2009 14:54:58 Marcin Juszkiewicz wrote:
> > Signed-off-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>

> > recipes/genext2fs/genext2fs-native_1.4.1.bb    | 10 ++

> Just FYI: this version (picked from .dev) broke my initrd for some
> reason (need to investigate further), generated FS wasn't usable on
> target device because any touch/mkdir/ln/everything changing FS
> resulted in "No space left on device" (4 Mb was actually available).

Thx for info - will look into this.

> At the same time mounting FS via loop worked on host system. Maybe it
> has something to do with kernel version (2.6.18 on target, 2.6.29 on
> host), maybe some defaults changed to something incompatible with
> older kernels, don't know yet.

2.6.26-rc4 failed too. 2.6.29 works - both for qemux86 target.

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




