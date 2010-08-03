Received: from li38-254.members.linode.com ([207.192.74.254]
	helo=masterfoo.zenlinux.com) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sgarman@zenlinux.com>) id 1OgJ5m-0006mT-9R
	for openembedded-devel@lists.openembedded.org;
	Tue, 03 Aug 2010 17:07:47 +0200
Received: from [192.168.1.12] (c-71-193-142-55.hsd1.or.comcast.net
	[71.193.142.55])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id B3CC130216
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Aug 2010 11:07:35 -0400 (EDT)
Message-ID: <4C583098.5050007@zenlinux.com>
Date: Tue, 03 Aug 2010 08:07:04 -0700
From: Scott Garman <sgarman@zenlinux.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.9pre) Gecko/20100217 Lightning/1.0b1 Shredder/3.0.3pre
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1280808074-13861-1-git-send-email-sgarman@zenlinux.com>
	<AANLkTimKyWgQyN0T6VExcAjE0=M2kuCLvbq-hEYJ70Fc@mail.gmail.com>
In-Reply-To: <AANLkTimKyWgQyN0T6VExcAjE0=M2kuCLvbq-hEYJ70Fc@mail.gmail.com>
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: B3CC130216.94E8E
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
Subject: Re: [PATCH] tar: Upgrade to v1.23
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
X-List-Received-Date: Tue, 03 Aug 2010 15:07:47 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/02/2010 11:14 PM, Frans Meulenbroeks wrote:
> 2010/8/3 Scott Garman<sgarman@zenlinux.com>
>
>> From: Scott Garman<scott.a.garman@intel.com>
>>
>> * Addresses CVE-2010-0624
>>
>
> Please have a look at http://wiki.openembedded.net/index.php/Commit_Policy
>
> And especially this section:

Hi Frans,

Thanks for sending me these pointers. However, I'm a bit unclear on what 
needs improvement. The subject line of this patch email corresponds to 
the first line of the commit message, doesn't it?

To go case-by-case:

>   * Have a clear commit message (example
> <http://wiki.openembedded.net/index.php/Commit_log_example>):
>      - The first line of commit is a summary of the changes.

Which in this case is:

tar: Upgrade to v1.23

>      - The first line should start with the name of the recipe the
> change affects.

tar: <- that's the name of the recipe

>      - The rest of the message should give more details on the change
> as appropriate.

Given how trivial the change is, there's not much else to say. I did 
make mention of the security advisory the upgrade fixes:

* Addresses CVE-2010-0624

>      - Mention the affected bug numbers if appropriate.

N/A

>      - Give credit where credit is due. If you commit someone else's
> work more or
>        less verbatim, you should use *git commit --author
> $mail-of-author*. If pulling
>        changes from somewhere like Poky or OpenMoko there is no problem with that
>        but mention where the changes came from.

Again, with something this trivial, I doubt anyone would consider me 
taking credit for something inappropriately.

>      - Include a Signed-off-by: line indicating the change has valid certificate
>        of origin as per the Linux kernel<http://lwn.net/Articles/139916/>

and indeed, I ended my commit with:

Signed-off-by: Scott Garman <sgarman@zenlinux.com>

I'm happy to respin the patch if needed, but I'm still unsure what needs 
to be changed.

Thanks,

Scott

-- 
Scott Garman
sgarman at zenlinux dot com


