Received: from [66.249.92.168] (helo=ug-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <pmiscml@gmail.com>) id 1JOGsq-00072b-Fx
	for openembedded-devel@openembedded.org; Sun, 10 Feb 2008 19:26:33 +0100
Received: by ug-out-1314.google.com with SMTP id q7so179763uge.0
	for <openembedded-devel@openembedded.org>;
	Sun, 10 Feb 2008 10:26:46 -0800 (PST)
Received: by 10.67.116.2 with SMTP id t2mr8087134ugm.62.1202668006612;
	Sun, 10 Feb 2008 10:26:46 -0800 (PST)
Received: from widy.localdomain ( [78.164.233.103])
	by mx.google.com with ESMTPS id r38sm1439203ugc.55.2008.02.10.10.26.44
	(version=SSLv3 cipher=OTHER); Sun, 10 Feb 2008 10:26:45 -0800 (PST)
Date: Sun, 10 Feb 2008 20:29:52 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
To: Richard Purdie <rpurdie@rpsys.net>
Message-ID: <20080210202952.2b510465@widy.localdomain>
In-Reply-To: <1202583333.7981.17.camel@dax.rpnet.com>
References: <20080129014117.60ed9f77@widy.localdomain>
	<1201565225.4687.98.camel@localhost.localdomain>
	<20080209134850.13fe8d93@widy.localdomain>
	<1202583333.7981.17.camel@dax.rpnet.com>
X-Mailer: Claws Mail 3.0.2 (GTK+ 2.12.5; i686-pc-linux-gnu)
Mime-Version: 1.0
Cc: openembedded-devel@openembedded.org
Subject: Re: [RFC] Setting default IMAGE_FSTYPES to tar.gz in bitbake.conf
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
X-List-Received-Date: Sun, 10 Feb 2008 18:26:34 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hello,

On Sat, 09 Feb 2008 18:55:33 +0000
Richard Purdie <rpurdie@rpsys.net> wrote:

[]

> The DISTRO can override the machine if it wishes now with no change to
> OE, that is up to the distros concerned. That doesn't stop machines
> from having sane defaults.
> 
> > Well, as usual, thoughts aloud. I'm going to add 
> > IMAGE_FSTYPES ?= "jffs2" to the machines from your 1st list to get
> > matter going.
> 
> ok.
> 

Done, so are we ready for this patch now?


@@ -541,7 +545,7 @@ DL_DIR ?= "${TMPDIR}/downloads" 
 ################################################################## 
  
 DL_DIR ?= "${TMPDIR}/downloads" 
-IMAGE_FSTYPES ?= "jffs2" 
+IMAGE_FSTYPES ?= "tar.gz" 
 PCMCIA_MANAGER ?= "pcmcia-cs" 
 DEFAULT_TASK_PROVIDER ?= "task-base" 
 MACHINE_TASK_PROVIDER ?= "${DEFAULT_TASK_PROVIDER}" 


> Cheers,
> 
> Richard



-- 
Best regards,
 Paul                          mailto:pmiscml@gmail.com


