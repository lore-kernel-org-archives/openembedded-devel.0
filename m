Received: from mail.reciva.com ([82.71.203.194] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1Nev7p-0002yv-DR
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Feb 2010 19:47:56 +0100
Received: from [85.210.8.8] (helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1Nev5N-0005fJ-2O
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Feb 2010 18:45:21 +0000
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <89CD81306A03F24FAEA2177A341C2C613B8764@XMB-RCD-209.cisco.com>
References: <89CD81306A03F24FAEA2177A341C2C613B8764@XMB-RCD-209.cisco.com>
Date: Tue, 09 Feb 2010 18:45:15 +0000
Message-ID: <1265741115.6761.30.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-Broken-Reverse-DNS: no host name found for IP address 85.210.8.8
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: philb@gnu.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: initramfs image with secondary cramfs inside
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
X-List-Received-Date: Tue, 09 Feb 2010 18:47:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2010-02-08 at 18:37 -0600, John Van Horne (vanhorj) wrote:
> The system I'm working on boots up with an initramfs image which
> contains a very minimal file system. During the boot process, a second
> file system image, in cramfs format, is mounted and used as the root
> file system. Does anyone have any experience using OE to build such an
> image? My approach to this was to have a recipe for the cramfs image and
> a recipe for the initramfs image, and to list the cramfs image as a
> dependency of the initramfs recipe. Both of these recipes inherit the
> image class. However, running bitbake on the initramfs recipe fails
> because the cramfs do_rootfs and do_deploy_to tasks have not run. After
> running bitbake with debug info turned on, it seems that the initramfs
> recipe depends upon the do_populate_stage task of cramfs, but not
> do_rootfs and do_deploy_to. Could anyone offer any insight into why this
> is?

The default is to depend on populate_staging because the output from
that task is, in general, what other packages need in order to build.
But you can make your recipe depend on another task if you want; try (in
your initramfs recipe):

do_fetch[depends] = "cramfs-image:do_rootfs"

p.




