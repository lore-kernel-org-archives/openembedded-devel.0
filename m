Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1OmSeh-0001cn-Pd
	for openembedded-devel@lists.openembedded.org;
	Fri, 20 Aug 2010 16:33:19 +0200
Received: (qmail 23200 invoked by uid 1003); 20 Aug 2010 14:33:04 -0000
Received: from 207.47.37.61.static.nextweb.net (HELO ?192.168.0.121?)
	(philip@opensdr.com@207.47.37.61)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	20 Aug 2010 14:33:04 -0000
Message-ID: <4C6E920E.4030806@balister.org>
Date: Fri, 20 Aug 2010 07:32:46 -0700
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.7) Gecko/20100720 Fedora/3.1.1-1.fc13 Thunderbird/3.1.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1282294508.6198.27.camel@dpdev>
In-Reply-To: <1282294508.6198.27.camel@dpdev>
X-SA-Exim-Connect-IP: 216.168.135.169
X-SA-Exim-Mail-From: philip@balister.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: udev hangs on boot
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
X-List-Received-Date: Fri, 20 Aug 2010 14:33:22 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/20/2010 01:55 AM, Dimitris Papastamos wrote:
> Hello,
>
> I've built the standard console-image for the SMDK6410 platform using
> the configuration provided by oe. The problem is that when I boot the
> image over the network, and then mount the rootfs over nfs, the system
> hangs before even entering runlevel 5. If I chmod -x udev udev-cache in
> the init scripts then I can get a usable system which I can ssh into.
> I've also tried to use a snapshot from Linus's git however the same
> problem appeared.

Look in /etc/network/interfaces (I think, not at a desk where I can 
check) and comment out the line auto eth0. I think the bootscripts take 
the interface down and up and that is bad if you are using root over nfs.

Philip


>
> I am using the latest snapshot of oe as of now and bitbake 1.8.18. The
> version of udev appears to be 151. My target distro is angstrom-2008.1.
> I've also tried to build a base-image and a bootstrap-image and I had
> the same problem.
>
> I've attached my oe kernel configuration, my oe local.conf as well as
> the boot process log.
>
> Thanks,
> Dimitrios
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


