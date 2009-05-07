Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1M29Uc-0002D7-GD
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 May 2009 21:42:54 +0200
Received: from 79-79-173-112.dynamic.dsl.as9105.com ([79.79.173.112]
	helo=[192.168.2.155])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1M29Oe-0004on-H4
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 May 2009 20:36:44 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <be7a9f3d0905071226m78b94d44u50a4e63c927200f5@mail.gmail.com>
References: <4A03277B.1090402@cbnco.com>
	<1241720835-17998-1-git-send-email-msmith@cbnco.com>
	<1241720835-17998-2-git-send-email-msmith@cbnco.com>
	<c384c5ea0905071218v3978ea4cpe791a5283f05c2df@mail.gmail.com>
	<be7a9f3d0905071226m78b94d44u50a4e63c927200f5@mail.gmail.com>
Date: Thu, 07 May 2009 19:36:41 +0100
Message-Id: <1241721401.23982.109.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: Re: [PATCH 2/3] grub: use ${libdir}, not /usr/lib
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
X-List-Received-Date: Thu, 07 May 2009 19:42:54 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2009-05-07 at 16:26 -0300, Otavio Salvador wrote:
> On Thu, May 7, 2009 at 4:18 PM, Leon Woestenberg
> <leon.woestenberg@gmail.com> wrote:
> > Why do we install menu.cfg in ${libdir} anyway?
> >
> > All desktop distro's I have seen have the menu.lst in /boot/grub/ on the rootfs.
> 
> I second this change; it makes easier for people to find it.

Yes, agreed.  Possibly even more important: having the file in /boot be
a symlink to something in /usr will lose if /boot and /usr are on
different filesystems since grub won't be able to find the file at run
time.  I guess this situation probably doesn't arise all that often on
embedded systems but it's certainly meant to work (per FHS) and it seems
a shame to break it for no good reason.

p.




