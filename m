Received: from mail.reciva.com ([82.71.203.194] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1NPLmU-0007jC-83
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Dec 2009 21:01:33 +0100
Received: from [85.210.12.93] (helo=[192.168.2.155])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1NPLka-0004NO-NW
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Dec 2009 19:59:32 +0000
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <op.u5mptvjzmn1qzu@guohr-laptop-ubuntu>
References: <op.u5mptvjzmn1qzu@guohr-laptop-ubuntu>
Date: Mon, 28 Dec 2009 19:59:29 +0000
Message-ID: <1262030369.28755.266.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-Broken-Reverse-DNS: no host name found for IP address 85.210.12.93
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: philb@gnu.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Install base-file failed due to lack of usbd
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
X-List-Received-Date: Mon, 28 Dec 2009 20:01:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2009-12-28 at 11:40 +0800, Guo Hongruan wrote:
> Hi guys,
>     the installation of base-file failed due to lack of usbd. I found this  
> bug when
> 1. MACHINE=qemumips and DISTRO=micro (using eglibc)
> 2. MACHINE=qemuarm and DISTRO=micro (using eglibc)
> 
> install: cannot create regular file  
> `/media/work-disk/workdir/oe-qemumips-micro-eglibc/work/qemumips-oe-linux/base-files-3.0.14-r89/image/etc/default/usbd':  
> No such file or directory

This is a bit weird, because the only install command that mentions usbd
is wrapped in an 'if [ ${DISTRO} != micro ] ...' conditional.  It also
worked fine for me last time I tried, and I test with qemuarm and micro
fairly often.  Do you have any local changes to your tree?

p.




