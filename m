Received: from [206.46.173.7] (helo=vms173007pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1Lw1E7-0000eC-8J
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Apr 2009 23:40:31 +0200
Received: from gandalf.denix.org ([71.255.242.201]) by vms173007.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KIF006TY5BOGA2A@vms173007.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Mon,
	20 Apr 2009 16:35:49 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id C691D6B83A8; Mon,
	20 Apr 2009 17:35:47 -0400 (EDT)
Date: Mon, 20 Apr 2009 17:35:47 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090420213547.GE6379@denix.org>
References: <1240241104-21935-1-git-send-email-marcin@juszkiewicz.com.pl>
	<1240241104-21935-11-git-send-email-marcin@juszkiewicz.com.pl>
	<gsi85u$ec5$7@ger.gmane.org>
MIME-version: 1.0
In-reply-to: <gsi85u$ec5$7@ger.gmane.org>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: [STABLE][PATCH 1/1] irda-utils: add patch to use LDFLAGS	(fixes QA error)
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
X-List-Received-Date: Mon, 20 Apr 2009 21:40:31 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, Apr 20, 2009 at 06:34:06PM +0200, Koen Kooi wrote:
> Acked-by: Koen Kooi <koen@openembedded.org>

Acked-by: Denys Dmytriyenko <denis@denix.org>


> On 20-04-09 17:25, Marcin Juszkiewicz wrote:
>> From: Jeremy Lain??<jeremy.laine@m4x.org>
>>
>> ---
>>   recipes/irda-utils/irda-utils/ldflags.patch |   28 
>> +++++++++++++++++++++++++++
>>   recipes/irda-utils/irda-utils_0.9.16.bb     |    3 +-
>>   2 files changed, 30 insertions(+), 1 deletions(-)
>>   create mode 100644 recipes/irda-utils/irda-utils/ldflags.patch
>>
>> diff --git a/recipes/irda-utils/irda-utils/ldflags.patch 
>> b/recipes/irda-utils/irda-utils/ldflags.patch
>> new file mode 100644
>> index 0000000..bb4f5cd
>> --- /dev/null
>> +++ b/recipes/irda-utils/irda-utils/ldflags.patch
>> @@ -0,0 +1,28 @@
>> +diff -urN irda-utils-0.9.16.orig/irattach/Makefile 
>> irda-utils-0.9.16/irattach/Makefile
>> +--- irda-utils-0.9.16.orig/irattach/Makefile	2004-03-31 
>> 23:55:41.000000000 +0200
>> ++++ irda-utils-0.9.16/irattach/Makefile	2009-04-08 10:17:39.000000000 
>> +0200
>> +@@ -53,10 +53,10 @@
>> + all: $(TARGETS)
>> +
>> + irattach: irattach.o util.o
>> +-	$(CC) $(CFLAGS) irattach.o util.o -o $@
>> ++	$(CC) $(CFLAGS) $(LDFLAGS) irattach.o util.o -o $@
>> +
>> + dongle_attach: dongle_attach.o
>> +-	$(CC) $(CFLAGS) dongle_attach.o -o $@
>> ++	$(CC) $(CFLAGS) $(LDFLAGS) dongle_attach.o -o $@
>> +
>> + .c.o:
>> + 	$(CC) $(CFLAGS) $(INCLUDES) -c $<
>> +diff -urN irda-utils-0.9.16.orig/irdaping/Makefile 
>> irda-utils-0.9.16/irdaping/Makefile
>> +--- irda-utils-0.9.16.orig/irdaping/Makefile	2004-03-31 
>> 23:55:47.000000000 +0200
>> ++++ irda-utils-0.9.16/irdaping/Makefile	2009-04-08 10:17:57.000000000 
>> +0200
>> +@@ -52,7 +52,7 @@
>> + all:: irdaping
>> +
>> + irdaping: $(OBJS)
>> +-	$(CC) $(CFLAGS) $(OBJS) -o $@
>> ++	$(CC) $(CFLAGS) $(LDFLAGS) $(OBJS) -o $@
>> +
>> + .c.o:
>> + 	$(CC) $(CFLAGS) $(INCLUDES) -c $<
>> diff --git a/recipes/irda-utils/irda-utils_0.9.16.bb 
>> b/recipes/irda-utils/irda-utils_0.9.16.bb
>> index 19bcdf3..1d9d184 100644
>> --- a/recipes/irda-utils/irda-utils_0.9.16.bb
>> +++ b/recipes/irda-utils/irda-utils_0.9.16.bb
>> @@ -3,11 +3,12 @@ IrDA allows communication over Infrared with other 
>> devices \
>>   such as phones and laptops."
>>   SECTION = "base"
>>   LICENSE = "GPL"
>> -PR = "r8"
>> +PR = "r9"
>>
>>   SRC_URI = "${SOURCEFORGE_MIRROR}/irda/irda-utils-${PV}.tar.gz \
>>   	   file://configure.patch;patch=1 \
>>   	   file://m4.patch;patch=1 \
>> +	   file://ldflags.patch;patch=1 \
>>   	   file://init"
>>
>>   export SYS_INCLUDES="-I${STAGING_INCDIR}"
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


