Return-Path: <henning@itconsulting-heinold.de>
Received: from mail.familie-heinold.de (familie-heinold.de [85.214.48.103])
	by mail.openembedded.org (Postfix) with ESMTP id D2BA37037A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Jul 2014 07:31:17 +0000 (UTC)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 384982232CC0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Jul 2014 09:31:16 +0200 (CEST)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 6085E2232CBF
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Jul 2014 09:31:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from mail.itconsulting-heinold.de
	(fb-n15-11.unbelievable-machine.net [94.198.62.204])
	by mail.familie-heinold.de (Postfix) with ESMTPSA
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Jul 2014 09:31:15 +0200 (CEST)
Date: Fri, 11 Jul 2014 09:31:09 +0200
From: Henning Heinold <henning@itconsulting-heinold.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140711073109.GA6407@mail.itconsulting-heinold.de>
References: <CAEaCVQiEEX45zS0PLGrExLxqLofDNht5c7MD9uBDbh4MpbskDA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAEaCVQiEEX45zS0PLGrExLxqLofDNht5c7MD9uBDbh4MpbskDA@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: systemd service failing at start
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 11 Jul 2014 07:31:21 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 10, 2014 at 08:43:02PM -0600, Eduardo Silva wrote:
> Hi,
> 
> For some reason the systemd service that i plan to use for Monkey HTTP
> Server in Yocto is not starting up when booting the core-image-sato image.
> Once is booting it hangs saying:
> 
>   [  OK  ] Stopped Monkey HTTP Server
>   [  ***   ] A Start job is running for Run pending postinsts (20min 12s...)
> 
> My service file looks like this:
> 
> --- start of monkey.service---
> 
> [Unit]
> Description=Monkey HTTP Server
> Requires=network.target remote-fs.target
> After=network.target remote-fs.target
> 
> [Service]
> Type=forking
> ExecStart=/usr/bin/monkey --daemon
> PIDFile=/var/run/monkey.pid.2001
> TimeoutSec=10
> 
> [Install]
> WantedBy=multi-user.target
> 
> -- end--
> 
> If i deploy Monkey RPM (cooked by bitbake) on the Sato image and i add this
> service once the system is up, systemd can start the service without
> problems, everything works: start, stop, status, etc. Do i am missing
> something that can be generating some problems on the first boot ?
> 
> thanks for your help
> 

What is systemd saying when you examine the status after boot?

Bye Henning

