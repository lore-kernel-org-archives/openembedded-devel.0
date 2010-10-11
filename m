Received: from li38-254.members.linode.com ([207.192.74.254]
	helo=masterfoo.zenlinux.com) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sgarman@zenlinux.com>) id 1P5MS0-0005jy-AK
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Oct 2010 19:46:18 +0200
Received: from [192.168.1.12] (c-76-105-143-140.hsd1.or.comcast.net
	[76.105.143.140])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id C437E30461
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Oct 2010 13:45:44 -0400 (EDT)
Message-ID: <4CB34D47.1020702@zenlinux.com>
Date: Mon, 11 Oct 2010 10:45:43 -0700
From: Scott Garman <sgarman@zenlinux.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.9pre) Gecko/20100217 Lightning/1.0b1 Shredder/3.0.3pre
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1286775778-1446-1-git-send-email-sgarman@zenlinux.com>
	<1286786195.3835.13.camel@mattotaupa>
In-Reply-To: <1286786195.3835.13.camel@mattotaupa>
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: C437E30461.2F5A2
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: sgarman@zenlinux.com
X-SA-Exim-Connect-IP: 207.192.74.254
X-SA-Exim-Mail-From: sgarman@zenlinux.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] cpio: update 2.5 to 2.11
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
X-List-Received-Date: Mon, 11 Oct 2010 17:46:18 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/11/2010 01:36 AM, Paul Menzel wrote:
> Am Sonntag, den 10.10.2010, 22:42 -0700 schrieb Scott Garman:
>> Signed-off-by: Scott Garman<sgarman@zenlinux.com>
>
> I build tested your patch for minimal-eglibc for `MACHINE =
> "beagleboard"`.

Thanks!

>> diff --git a/recipes/cpio/cpio-2.11/statdef.patch b/recipes/cpio/cpio-2.11/statdef.patch
>> new file mode 100644
>> index 0000000..059976c
>> --- /dev/null
>> +++ b/recipes/cpio/cpio-2.11/statdef.patch
>> @@ -0,0 +1,15 @@
>> +# Avoid multiple stat definitions
>> +# Patch taken from cpio mailing list posting 2010-03-19
>> +#
>> +# Signed-off-by: Scott Garman<sgarman@zenlinux.com>
>
> Please include the link to that message in the archive.

Will do, respin on its way shortly...

Scott

-- 
Scott Garman
sgarman at zenlinux dot com


