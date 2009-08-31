Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1Mi5QP-0008Q0-A8
	for openembedded-devel@openembedded.org; Mon, 31 Aug 2009 13:51:58 +0200
Received: (qmail 7779 invoked by uid 813007); 31 Aug 2009 11:33:23 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 31 Aug 2009 11:33:23 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 31 Aug 2009 13:33:19 +0200
User-Agent: KMail/1.12.0 (Linux/2.6.31-rc6-00243-g53bc5c0; KDE/4.3.0; x86_64; ;
	)
References: <1251504044-2315-1-git-send-email-raj.khem@gmail.com>
	<1251620948.4215.673.camel@lenovo.internal.reciva.com>
	<20090830094809.GB26823@gmail.com>
In-Reply-To: <20090830094809.GB26823@gmail.com>
MIME-Version: 1.0
Message-Id: <200908311333.20189.marcin@juszkiewicz.com.pl>
Subject: Re: [PATCH] sane-toolchain-eglibc.inc: Set TARGET_OS	= linux-gnuspe for e500
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
X-List-Received-Date: Mon, 31 Aug 2009 11:52:03 -0000
Content-Type: Text/Plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: 7bit

What about using MACHINE_FEATURES (or CPU_FEATURES) for things like eabi/spe?

TARGET_OS = "linux-"
if ARCH in [ppc,powerpc] and MACHINE_FEATURES.find('spe') then

  if LIBC=uclibc then
    TARGET_OS += "uclibc"
  fi

  TARGET_OS += "gnuspe"
fi

Same for adding eabi:

TARGET_OS = "linux-"
if ARCH in [arm,armeb] and MACHINE_FEATURES.find('eabi') then

  if LIBC=uclibc then
    TARGET_OS += "uclibc"
  fi

  TARGET_OS += "gnueabi"
fi

spe/eabi can be added to MACHINE_FEATURES in conf/machine/include/tune-* files 
and distros can choose do they support it or not by DISTRO_FEATURES (examples 
needs to be changed then to use COMBINED_FEATURES variable). This way no one 
has to change XY files just because he has new board with ppc500v2 core, we do 
not have to remember about armv4 devices which are not capable of EABI with 
gcc 4.3.x and older (but if they will support EABI in future we just change 
tune-strongarm.inc file).

Regards, 
-- 
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




