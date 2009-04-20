Received: from [68.230.241.45] (helo=fed1rmmtao101.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1Lw1MR-00010b-ED
	for openembedded-devel@openembedded.org; Mon, 20 Apr 2009 23:49:07 +0200
Received: from fed1rmimpo01.cox.net ([70.169.32.71]) by fed1rmmtao101.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP id
	<20090420214444.QZGI27308.fed1rmmtao101.cox.net@fed1rmimpo01.cox.net>
	for <openembedded-devel@openembedded.org>;
	Mon, 20 Apr 2009 17:44:44 -0400
Received: from localhost ([68.230.63.214]) by fed1rmimpo01.cox.net with bizsmtp
	id hxkk1b0014dMFYL03xkkgM; Mon, 20 Apr 2009 17:44:44 -0400
X-Authority-Analysis: v=1.0 c=1 a=_DEFFWw-DLEA:10 a=04T3rcOHiHAA:10
	a=Q4-j1AaZAAAA:8 a=4HVRqb_MAAAA:8 a=OCGuPPFrAAAA:8 a=22pK5S-mAAAA:8
	a=EljLWo-0thAuju0tw18A:9 a=O-yGmAq5yuWSvtYjVQoA:7
	a=3Alfd9gE-7wIXirKKZPPkj2EBCkA:4 a=UcWZWmDdwLsA:10 a=k-kO48AawpMA:10
	a=1lW9Ty6GpaAA:10
X-CM-Score: 0.00
Date: Mon, 20 Apr 2009 14:44:43 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20090420214443.GG17629@smtp.west.cox.net>
References: <1240241104-21935-1-git-send-email-marcin@juszkiewicz.com.pl>
	<1240241104-21935-5-git-send-email-marcin@juszkiewicz.com.pl>
	<gsi84q$ec5$4@ger.gmane.org>
MIME-Version: 1.0
In-Reply-To: <gsi84q$ec5$4@ger.gmane.org>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: [STABLE][PATCH 1/1] e2fsprogs: fix compile to use 3 args	so it works.
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
X-List-Received-Date: Mon, 20 Apr 2009 21:49:07 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 20, 2009 at 06:33:30PM +0200, Koen Kooi wrote:
> Acked-by: Koen Kooi <koen@openembedded.org>

Acked-by: Tom Rini <trini@embeddedalley.com>

>
>
> On 20-04-09 17:24, Marcin Juszkiewicz wrote:
>> From: Carsten Haitzler<raster@openmoko.org>
>>
>> ---
>>   .../e2fsprogs/e2fsprogs-1.38/file-open-mode.patch  |   11 +++++++++++
>>   recipes/e2fsprogs/e2fsprogs-native_1.38.bb         |    5 +++--
>>   recipes/e2fsprogs/e2fsprogs_1.38.bb                |    5 +++--
>>   3 files changed, 17 insertions(+), 4 deletions(-)
>>   create mode 100644 recipes/e2fsprogs/e2fsprogs-1.38/file-open-mode.patch
>>
>> diff --git a/recipes/e2fsprogs/e2fsprogs-1.38/file-open-mode.patch b/recipes/e2fsprogs/e2fsprogs-1.38/file-open-mode.patch
>> new file mode 100644
>> index 0000000..97679d6
>> --- /dev/null
>> +++ b/recipes/e2fsprogs/e2fsprogs-1.38/file-open-mode.patch
>> @@ -0,0 +1,11 @@
>> +--- e2fsprogs-1.38/lib/ext2fs/ismounted.c~	2005-06-06 06:05:22.000000000 +1000
>> ++++ e2fsprogs-1.38/lib/ext2fs/ismounted.c	2009-04-03 15:07:35.000000000 +1100
>> +@@ -147,7 +147,7 @@
>> + is_root:
>> + #define TEST_FILE "/.ismount-test-file"		
>> + 		*mount_flags |= EXT2_MF_ISROOT;
>> +-		fd = open(TEST_FILE, O_RDWR|O_CREAT);
>> ++		fd = open(TEST_FILE, O_RDWR|O_CREAT, S_IRUSR|S_IWUSR);
>> + 		if (fd<  0) {
>> + 			if (errno == EROFS)
>> + 				*mount_flags |= EXT2_MF_READONLY;
>> diff --git a/recipes/e2fsprogs/e2fsprogs-native_1.38.bb b/recipes/e2fsprogs/e2fsprogs-native_1.38.bb
>> index 388c519..af49b0d 100644
>> --- a/recipes/e2fsprogs/e2fsprogs-native_1.38.bb
>> +++ b/recipes/e2fsprogs/e2fsprogs-native_1.38.bb
>> @@ -2,11 +2,12 @@ SECTION = "base"
>>   require e2fsprogs.inc
>>   inherit native
>>
>> -PR = "r2"
>> +PR = "r3"
>>
>>   SRC_URI += "file://no-hardlinks.patch;patch=1 \
>>   	    file://mkinstalldirs.patch;patch=1 \
>> -	   "
>> +            file://file-open-mode.patch;patch=1 \
>> +            "
>>
>>   EXTRA_OECONF = ""
>>
>> diff --git a/recipes/e2fsprogs/e2fsprogs_1.38.bb b/recipes/e2fsprogs/e2fsprogs_1.38.bb
>> index 5687556..8ec469a 100644
>> --- a/recipes/e2fsprogs/e2fsprogs_1.38.bb
>> +++ b/recipes/e2fsprogs/e2fsprogs_1.38.bb
>> @@ -1,10 +1,11 @@
>>   require e2fsprogs.inc
>>
>> -PR = "r19"
>> +PR = "r20"
>>
>>   SRC_URI += "file://no-hardlinks.patch;patch=1 \
>>   	    file://mkinstalldirs.patch;patch=1 \
>> -	   "
>> +            file://file-open-mode.patch;patch=1 \
>> +           "
>>
>>   TARGET_CC_ARCH += "${LDFLAGS}"
>>
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

-- 
Tom Rini


