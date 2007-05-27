Received: from [64.233.166.178] (helo=py-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <pmiscml@gmail.com>) id 1HsOR4-0007O8-TO
	for openembedded-devel@lists.openembedded.org;
	Sun, 27 May 2007 21:29:51 +0200
Received: by py-out-1112.google.com with SMTP id f47so2514944pye
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 May 2007 12:28:27 -0700 (PDT)
Received: by 10.64.251.9 with SMTP id y9mr9233777qbh.1180294106731;
	Sun, 27 May 2007 12:28:26 -0700 (PDT)
Received: from cube ( [82.193.98.15])
	by mx.google.com with ESMTP id r15sm3388177nza.2007.05.27.12.28.25;
	Sun, 27 May 2007 12:28:26 -0700 (PDT)
Date: Sun, 27 May 2007 22:28:20 +0300
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Priority: 3 (Normal)
Message-ID: <277782266.20070527222820@gmail.com>
To: Marcin Juszkiewicz <openembedded@hrw.one.pl>
In-Reply-To: <200705271638.03886.openembedded@hrw.one.pl>
References: <200705271638.03886.openembedded@hrw.one.pl>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: RFC: MACHINE_ namespace
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
X-List-Received-Date: Sun, 27 May 2007 19:29:51 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Marcin,

Sunday, May 27, 2007, 5:38:03 PM, you wrote:

> During usage of progear device (now packed due to lack of space) I found
> a problems related to how we use machine configs and X11.

> 1. We have "alsa" as one of machine features but no way to control kernel
> modules for it - all are added into machine config as 
> MACHINE_EXTRA_RRECOMMENDS. Same goes to other features.

> 2. Progear device use X.org instead of KDrive so I had to create own 
> images for it because by default we do not have a way to tell which X 
> drivers need to be present in images.


> Proposed solution is adding MACHINE_ namespaces:

> MACHINE_KERNEL_ALSA   = "kernel-module-snd-ali5451"
> MACHINE_KERNEL_PCMCIA = "kernel-module-yenta-socket"

        This sounds good, especially if we anticipate from the start
that there may be several modules there. And generally, we need to add
more modules into task-base subtasks, targetting at aim when machine
configs will truly contain only machine-specific bits (like hardware
drivers), while other modules will be in task-base.

[]

-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



