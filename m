Received: from li38-254.members.linode.com ([207.192.74.254]
	helo=masterfoo.zenlinux.com) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sgarman@zenlinux.com>) id 1P0dE3-0008IA-Ri
	for openembedded-devel@lists.openembedded.org;
	Tue, 28 Sep 2010 18:40:20 +0200
Received: from [127.0.0.1] (li38-254.members.linode.com [207.192.74.254])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id 67B6F3041B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Sep 2010 12:40:02 -0400 (EDT)
Message-ID: <4CA21A60.6060408@zenlinux.com>
Date: Tue, 28 Sep 2010 09:40:00 -0700
From: Scott Garman <sgarman@zenlinux.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.12) Gecko/20100915 Thunderbird/3.0.8
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1285649277-7540-1-git-send-email-sgarman@zenlinux.com>
	<AANLkTinQgVoMYi6WvU-+xDrZMuo6XEF1LhRa65NLC+MV@mail.gmail.com>
In-Reply-To: <AANLkTinQgVoMYi6WvU-+xDrZMuo6XEF1LhRa65NLC+MV@mail.gmail.com>
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: 67B6F3041B.A54B7
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
Subject: Re: [PATCH] grep: update 2.6.3 to 2.7
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
X-List-Received-Date: Tue, 28 Sep 2010 16:40:20 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/28/2010 08:32 AM, Khem Raj wrote:
> On Mon, Sep 27, 2010 at 9:47 PM, Scott Garman<sgarman@zenlinux.com>  wrote:
>> Signed-off-by: Scott Garman<sgarman@zenlinux.com>
>> ---
>>   recipes/grep/grep-2.6.3/uclibc-fix.patch    |   50 ---------------------------
>>   recipes/grep/grep-2.7/uclibc_libiconv.patch |   18 ++++++++++
>>   recipes/grep/grep_2.6.3.bb                  |   45 ------------------------
>>   recipes/grep/grep_2.7.bb                    |   42 ++++++++++++++++++++++
>>   4 files changed, 60 insertions(+), 95 deletions(-)
>>   delete mode 100644 recipes/grep/grep-2.6.3/uclibc-fix.patch
>>   create mode 100644 recipes/grep/grep-2.7/uclibc_libiconv.patch
>>   delete mode 100644 recipes/grep/grep_2.6.3.bb
>>   create mode 100644 recipes/grep/grep_2.7.bb
>
> Please also do a build for uclibc based system if you have not done so.
> and see if new grep builds/works

Oh yes, I tested it by setting ANGSTROMLIBC to uclibc. I also check the 
output packages generated to make sure things look sane.

FWIW the Poky version of grep 2.7 I just added has been tested to build 
on 5 qemu machine arches (x86, x86-64, arm, mips, and ppc), and I even 
installed it in a QEMU session to ensure the command works interactively.

BTW, in this patch I am removing the uclibc patch included with grep 
2.6.3 as it is no longer needed with grep 2.7. However, a different 
patch was needed with grep 2.7 - so there in no intention of renaming 
the patch file in my commit, just to be clear.

v2 patch incoming shortly...

Thanks,

Scott


