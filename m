Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1NPuQ1-0006e8-IW
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Dec 2009 10:00:40 +0100
Received: from tamarin.localnet (123-192-180-176.dynamic.kbronet.com.tw
	[123.192.180.176])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 9FAF11B10C03
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Dec 2009 08:55:29 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 Dec 2009 09:58:31 +0100
User-Agent: KMail/1.12.2 (Linux/2.6.31; KDE/4.3.2; i686; ; )
References: <> <200912300930.12895.holger+oe@freyther.de>
	<op.u5qsujbtmn1qzu@guohr-laptop-ubuntu>
In-Reply-To: <op.u5qsujbtmn1qzu@guohr-laptop-ubuntu>
MIME-Version: 1.0
Message-Id: <200912300958.31264.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] Remove the micro distro specific overridding of variables
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
X-List-Received-Date: Wed, 30 Dec 2009 09:00:40 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit

On Wednesday 30 December 2009 09:36:09 Guo Hongruan wrote:
> The micro/micro-uclibc specific check does cause the miss of the
> /etc/default directory, which is required by the following installation.
> So the installation of base-file failed when DISTRO=micro or
> DISTRO=micro-uclibc.
> 
> On my site, the following check did work. I have verified on qemux86,
> qemuarm and qemumips machine.
> 
> I am not sure the goal of this check.

I'm not really into this but you seem to just undo the goal. The goal for 
"micro" is to be as small as possible, so it is trying to reduce the size of 
every package in a way or another. For base-files it means to install less 
files.

Now the question we should ask could be:
	- Why is what I'm trying to build breaking and how can I fix it without
          blowing up "micro" to be full featured again.

z.


