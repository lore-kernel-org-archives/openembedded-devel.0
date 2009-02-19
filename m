Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <openembedded@haerwu.biz>) id 1La6ny-0006k0-Dv
	for openembedded-devel@openembedded.org; Thu, 19 Feb 2009 12:11:02 +0100
Received: (qmail 15346 invoked by uid 813007); 19 Feb 2009 11:08:40 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 19 Feb 2009 11:08:40 -0000
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Feb 2009 12:08:35 +0100
User-Agent: KMail/1.11.0 (Linux/2.6.29-rc2; KDE/4.2.0; x86_64; ; )
References: <gneadq$s6g$1@ger.gmane.org>
In-Reply-To: <gneadq$s6g$1@ger.gmane.org>
MIME-Version: 1.0
Message-Id: <200902191208.38328.openembedded@haerwu.biz>
Subject: Re: [RFC] removing DISTRO_* vars from task-boot
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
X-List-Received-Date: Thu, 19 Feb 2009 11:11:02 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Tuesday 17 of February 2009 13:26:34 Koen Kooi wrote:

> Lately I have been wondering how to change the /dev manager on a per
> image base, since I want udev for most images and busybox-mdev for
> special-purpose stuff. The catch is that I want to keep using
> task-boot for both.

> There are various ways we could attack this:
>
> 1) The image.bbclass way:

+1 for it

> 2) Make task-boot nostamp

No!

> 3) Have task-boot.bb create task-boot-mdev and task-boot-udev

sounds better then 2) but has same problems as 1) so I will not go that 
way.

> 4) Move the vars to RRECOMMENDS and filter them out with
> BAD_RECOMMENDATIONS

No!


Regards, 
-- 
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




