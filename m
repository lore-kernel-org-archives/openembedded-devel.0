Received: from [206.46.173.5] (helo=vms173005pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1MMCsC-0002RR-SX
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Jul 2009 05:22:09 +0200
Received: from gandalf.denix.org ([71.251.63.232]) by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KM400JE9WSWMFN7@vms173005.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	01 Jul 2009 22:10:08 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id DA6DD14AF5F; Wed,
	01 Jul 2009 23:10:07 -0400 (EDT)
Date: Wed, 01 Jul 2009 23:10:07 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090702031007.GN20815@denix.org>
References: <200907011819.54127.marcin@juszkiewicz.com.pl>
	<1246474518-16737-5-git-send-email-marcin@juszkiewicz.com.pl>
	<h2gcmv$bts$9@ger.gmane.org>
MIME-version: 1.0
In-reply-to: <h2gcmv$bts$9@ger.gmane.org>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: [STABLE][PATCH 105/125] at2440evb.conf: Add AT2440EVB	machine config.
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
X-List-Received-Date: Thu, 02 Jul 2009 03:22:09 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Jul 01, 2009 at 09:16:47PM +0200, Koen Kooi wrote:
> On 01-07-09 20:55, Marcin Juszkiewicz wrote:
>> From: Ramax Lo<ramaxlo@gmail.com>
>>
>> Signed-off-by: Marcin Juszkiewicz<marcin@juszkiewicz.com.pl>
>
> Acked-by: Koen Kooi <koen@openembedded.org>

Acked-by: Denys Dmytriyenko <denis@denix.org>

>> ---
>>   conf/machine/at2440evb.conf |   19 +++++++++++++++++++
>>   1 files changed, 19 insertions(+), 0 deletions(-)
>>   create mode 100644 conf/machine/at2440evb.conf
>>
>> diff --git a/conf/machine/at2440evb.conf b/conf/machine/at2440evb.conf
>> new file mode 100644
>> index 0000000..f3fa5ed
>> --- /dev/null
>> +++ b/conf/machine/at2440evb.conf
>> @@ -0,0 +1,19 @@
>> +#@TYPE: Machine
>> +#@Name: Avantech AT2440EVB Dev Board
>> +#@DESCRIPTION: Machine configuration for Avantech AT2440EVB Dev Board
>> +
>> +
>> +TARGET_ARCH = "arm"
>> +
>> +PREFERRED_PROVIDER_virtual/kernel = "linux"
>> +
>> +# used by sysvinit_2
>> +SERIAL_CONSOLE = "115200 ttySAC0"
>> +
>> +IMAGE_FSTYPES = "tar.gz"
>> +KERNEL_IMAGETYPE = "uImage"
>> +UBOOT_ENTRYPOINT = "30008000"
>> +
>> +MACHINE_FEATURES = "kernel26 screen touchscreen"
>> +
>> +require conf/machine/include/tune-arm920t.inc
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


