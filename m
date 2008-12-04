Received: from [216.145.245.200] (helo=mx04.dls.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mwester@dls.net>) id 1L8HlL-00026F-GJ
	for openembedded-devel@openembedded.org; Thu, 04 Dec 2008 18:13:15 +0100
Received: from [209.242.7.188] (helo=[192.168.231.111])
	by mx04.dls.net with esmtpa (Exim 4.69)
	(envelope-from <mwester@dls.net>) id 1L8Hhr-000079-VY
	for openembedded-devel@openembedded.org; Thu, 04 Dec 2008 11:09:40 -0600
Message-ID: <49380EAC.5020809@dls.net>
Date: Thu, 04 Dec 2008 11:09:00 -0600
From: "Mike (mwester)" <mwester@dls.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.8.1.18) Gecko/20081105 Thunderbird/2.0.0.18 Mnenhy/0.7.5.666
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <gh8v57$5nk$1@ger.gmane.org> <49380C4F.1050809@dls.net>
In-Reply-To: <49380C4F.1050809@dls.net>
Subject: Re: invalidating udev cache, how?
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
X-List-Received-Date: Thu, 04 Dec 2008 17:13:15 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Mike (mwester) wrote:

> A slight improvement would be to make the dev.tar file dependent upon
> the bootargs; i.e. invalidate /etc/dev.tar file if the boot command line
> doesn't match the current command line.  This could be a very fast
> operation, just "cmp /proc/cmdline /etc/dev_cmdline" or similar.

As I consider this further, we could actually just save and compare
/proc/atags if that's present on the device in question (falling back to
/proc/cmdline if not present).  That would catch *any* changes passed in
to the kernel via the bootloader.

Flashing a new kernel would seem to be another logical place to
invalidate the cache, so adding a comparison of "uname -rv" would be a
reasonable way to catch that.

Mike (mwester)


