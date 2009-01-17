Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <openembedded@haerwu.biz>) id 1LOHnH-0007hj-HL
	for openembedded-devel@openembedded.org; Sat, 17 Jan 2009 21:29:23 +0100
Received: (qmail 8430 invoked by uid 813007); 17 Jan 2009 20:22:33 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 17 Jan 2009 20:22:33 -0000
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 17 Jan 2009 21:22:24 +0100
User-Agent: KMail/1.11.0 (Linux/2.6.28; KDE/4.1.96; x86_64; ; )
References: <20090117123304.79177189331@amethyst.openembedded.net>
In-Reply-To: <20090117123304.79177189331@amethyst.openembedded.net>
MIME-Version: 1.0
Message-Id: <200901172122.25511.openembedded@haerwu.biz>
Subject: Re: [oe-commits] Tim 'timtim' Ellis : linux-orion: Add kernel for Marvell Orion based devices (replaces linux-linkstationarm) , initially supporting:
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
X-List-Received-Date: Sat, 17 Jan 2009 20:29:23 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Saturday 17 of January 2009 13:33:01 GIT User account wrote:
> Module: openembedded.git
> Branch: org.openembedded.dev
> Commit: 5f7f10f181bdc127786fce9a43e4ca71ae4ab03c
> URL:   
> http://gitweb.openembedded.net/?p=openembedded.git&a=commit;h=5f7f10f
>181bdc127786fce9a43e4ca71ae4ab03c
>
> Author: Tim 'timtim' Ellis <tim.ellis@foonas.org>
> Date:   Sat Jan 17 12:28:42 2009 +0000
>
> linux-orion: Add kernel for Marvell Orion based devices (replaces

Few problems:

1. KERNEL_IMAGETYPE = "uImage" - this should be rather in machine config 
2. You use linux-2.6.27.10.tar.bz2 - please change it to 2.6.27 tarball 
   with 2.6.27.10 patch added. It will save bandwidth for autobuilders 
   which usually have 2.6.27 already fetched for other devices.

This also shows that we should merge linux.inc more into 
kernel.bbclass...


Regards, 
-- 
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




