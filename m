Received: from li38-254.members.linode.com ([207.192.74.254]
	helo=masterfoo.zenlinux.com) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sgarman@zenlinux.com>) id 1OCxAN-0002Fw-CA
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 May 2010 17:51:11 +0200
Received: from [192.168.1.12] (c-76-115-42-183.hsd1.or.comcast.net
	[76.115.42.183])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id A1F6A308C9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 May 2010 11:47:11 -0400 (EDT)
Message-ID: <4BED7085.9020608@zenlinux.com>
Date: Fri, 14 May 2010 08:47:17 -0700
From: Scott Garman <sgarman@zenlinux.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.9pre) Gecko/20100217 Lightning/1.0b1 Shredder/3.0.3pre
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <alpine.DEB.2.00.1005140557420.29014@lynx>
In-Reply-To: <alpine.DEB.2.00.1005140557420.29014@lynx>
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: A1F6A308C9.7C98C
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-From: sgarman@zenlinux.com
X-SA-Exim-Connect-IP: 207.192.74.254
X-SA-Exim-Mail-From: sgarman@zenlinux.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: numerous "strip command failed" ERRORs in building beagle image
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
X-List-Received-Date: Fri, 14 May 2010 15:51:12 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/14/2010 03:00 AM, Robert P. J. Day wrote:
>
>    obviously not fatal since the build kept chugging along, but there
> were a number of "ERROR"s of the following form:
>
>
> NOTE: Running task 3873 of 11130 (ID: 4231,
> /home/rpjday/oe/openembedded/recipes/xcb/libpthread-stubs_0.2.bb,
> do_patch)
> ERROR: runstrip: ''arm-angstrom-linux-gnueabi-strip'
> --remove-section=.comment --remove-section=.note
> '/home/rpjday/oe/angstrom-dev/work/beagleboard-angstrom-linux-gnueabi/linux-omap-psp-2.6.32-r75+gitr627293ad28604b22612f9a4a318f64cfab241e22/package/kernel/scripts/pnmtologo''
> strip command failed
> ERROR: runstrip: ''arm-angstrom-linux-gnueabi-strip'
> --remove-section=.comment --remove-section=.note
> '/home/rpjday/oe/angstrom-dev/work/beagleboard-angstrom-linux-gnueabi/linux-omap-psp-2.6.32-r75+gitr627293ad28604b22612f9a4a318f64cfab241e22/package/kernel/scripts/bin2c''
> strip command failed
> ... etc etc ...
>
>    normally, i don't care but i typically take anything labelled as an
> "ERROR" seriously so if it's genuinely not an error, perhaps it should
> be relabelled.  (suggested from a position of complete ignorance.)

This happens in the do_package task of many of the kernel builds. I was 
looking into it just the other night as it triggers BuildBot to think 
that the build failed (because it sees a non-zero exit status from this 
section).

Is it even necessary to stage the kernel scripts/ directory? That's the 
final thing happening in the do_install task in kernel.bbclass. Removing 
that line would be a one-liner patch fix to this issue.

Scott

-- 
Scott Garman
sgarman at zenlinux dot com


