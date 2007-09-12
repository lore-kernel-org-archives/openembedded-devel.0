Received: from [194.158.229.24] (helo=mail-ps.sunrise.ch)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <dv@vollmann.ch>) id 1IVRj2-00088R-9f
	for openembedded-devel@openembedded.org; Wed, 12 Sep 2007 14:53:48 +0200
Received: from octo.vollmann.ch (212.98.43.140) by mail-ps.sunrise.ch (8.0.010)
	id 46CB80E3003CF043 for openembedded-devel@openembedded.org;
	Wed, 12 Sep 2007 14:50:40 +0200
Received: from octo (localhost [127.0.0.1])
	by octo.vollmann.ch (8.11.2/8.11.2) with SMTP id l8CCrnn09380;
	Wed, 12 Sep 2007 14:53:49 +0200
Sender: dv@vollmann.ch
Message-ID: <46E7E15C.3FA5AC70@vollmann.ch>
Date: Wed, 12 Sep 2007 14:53:48 +0200
From: Detlef Vollmann <dv@vollmann.ch>
Organization: vollmann engineering gmbh
X-Mailer: Mozilla 3.04 (X11; U; Linux 2.4.21 i686)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <HOECLKEKOHLAMMGDLLBHOENOMDAA.skoroneos@digital-opsis.com>
Subject: Re: Cached MD5 sums
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
X-List-Received-Date: Wed, 12 Sep 2007 12:53:48 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Stelios Koroneos wrote:
> 
> We had a similar problem when the sources resided in an nfs mount.
> Is this the case with your sourse/md5 files ?
Interesing hint.
I don't have an NFS mount now.  But I'm inside of a chroot environment
and previously had an NFS mount from outside the chroot into
inside (on the same machine and even the same physical filesystem).
But I got locking problems and decided to move the DL_DIR into
the chroot.  But probably there's still some wrong info in
the cache, but it still complains about not being able to lock,
though a can lock on exactly the same file inside the same chroot
using my own test program.  I had to hack bitbake (remove the
locking) to get around this).

> If yes you need to have statd running on *both* client and server machines
> In debian/ubuntu just install the nfs-common package and it solves the issue
For real NFS mount from one machine to the other I never had
problems, and probably I should do just that and start completely
fresh...

Thanks again,
  Detlef

-- 
Detlef Vollmann   vollmann engineering gmbh
Linux and C++ for Embedded Systems    http://www.vollmann.ch/


