Received: from li38-254.members.linode.com ([207.192.74.254]
	helo=masterfoo.zenlinux.com) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sgarman@zenlinux.com>) id 1PIuaC-0004Yl-Ng
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Nov 2010 03:50:48 +0100
Received: from [127.0.0.1] (li38-254.members.linode.com [207.192.74.254])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id CC6643041C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Nov 2010 21:49:30 -0500 (EST)
Message-ID: <4CE493E2.3010509@zenlinux.com>
Date: Wed, 17 Nov 2010 18:48:02 -0800
From: Scott Garman <sgarman@zenlinux.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.12) Gecko/20101103 Fedora/1.0-0.33.b2pre.fc14
	Lightning/1.0b3pre Thunderbird/3.1.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1290046421-22553-1-git-send-email-sgarman@zenlinux.com>
	<4CE48CFF.7070406@balister.org>
In-Reply-To: <4CE48CFF.7070406@balister.org>
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: CC6643041C.E1B95
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: sgarman@zenlinux.com
X-SA-Exim-Connect-IP: 207.192.74.254
X-SA-Exim-Mail-From: sgarman@zenlinux.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] tar: upgrade to version 1.25
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
X-List-Received-Date: Thu, 18 Nov 2010 02:50:50 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/17/2010 06:18 PM, Philip Balister wrote:
> On 11/17/2010 06:13 PM, Scott Garman wrote:
>> Signed-off-by: Scott Garman<sgarman@zenlinux.com>
>> ---
>> recipes/tar/tar_1.23.bb | 6 ------
>> recipes/tar/tar_1.25.bb | 6 ++++++
>> 2 files changed, 6 insertions(+), 6 deletions(-)
>> delete mode 100644 recipes/tar/tar_1.23.bb
>> create mode 100644 recipes/tar/tar_1.25.bb
>>
>> diff --git a/recipes/tar/tar_1.23.bb b/recipes/tar/tar_1.23.bb
>> deleted file mode 100644
>> index dc37247..0000000
>> --- a/recipes/tar/tar_1.23.bb
>> +++ /dev/null
>> @@ -1,6 +0,0 @@
>> -require tar.inc
>> -
>> -PR = "${INC_PR}"
>> -
>> -SRC_URI[md5sum] = "41e2ca4b924ec7860e51b43ad06cdb7e"
>> -SRC_URI[sha256sum] =
>> "c9328372db62fbb1d94c9e4e3cefc961111af46de47085b635359c00a0eebe36"
>> diff --git a/recipes/tar/tar_1.25.bb b/recipes/tar/tar_1.25.bb
>> new file mode 100644
>> index 0000000..c611f77
>> --- /dev/null
>> +++ b/recipes/tar/tar_1.25.bb
>> @@ -0,0 +1,6 @@
>> +require tar.inc
>> +
>> +PR = "${INC_PR}"
>> +
>> +SRC_URI[md5sum] = "6e497f861c77bbba2f7da4e10270995b"
>> +SRC_URI[sha256sum] =
>> "f3f6ce41b8e0f327abd05c95990f113ddafbae131e10f79a99728ed46458494b"
>
>
> Acked-by: Philip Balister <philip@balister.org>
>
> Can you add tar-1.23 to the removal.txt file? Ask it be removed in a
> couple of months. This way we have a schedule to delete the older recipe.

Thanks for the quick ack, Philip. Question though on the removal.txt 
addition - this patch deletes the v1.23 version already. Does it need to 
be kept around instead? I would think not given that this is a pretty 
trivial update.

Perhaps you meant tar v1.18 and/or v1.20, which are still there?

Scott


