Received: from [206.46.173.13] (helo=vms173013pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1MJEZs-0000QM-GH
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Jun 2009 00:34:56 +0200
Received: from gandalf.denix.org ([71.251.63.232]) by vms173013.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KLP0024KQ6U4XA3@vms173013.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	23 Jun 2009 17:23:19 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 8836B14AF5F; Tue,
	23 Jun 2009 18:23:18 -0400 (EDT)
Date: Tue, 23 Jun 2009 18:23:18 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090623222318.GB32082@denix.org>
References: <200906230940.05121.marcin@juszkiewicz.com.pl>
	<1245747417-11163-1-git-send-email-marcin@juszkiewicz.com.pl>
	<h1q6bq$a5v$7@ger.gmane.org>
MIME-version: 1.0
In-reply-to: <h1q6bq$a5v$7@ger.gmane.org>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: [STABLE][PATCH 052/125] evtest: Fixed GNU_HASH QA error.
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
X-List-Received-Date: Tue, 23 Jun 2009 22:34:56 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Jun 23, 2009 at 11:13:30AM +0200, Koen Kooi wrote:
> On 23-06-09 10:56, Marcin Juszkiewicz wrote:
>> From: Theodore A. Roth<taroth@gmail.com>
>>
>> Signed-off-by: Theodore A. Roth<taroth@gmail.com>
>> Acked-by: Denys Dmytriyenko<denis@denix.org>
>> Signed-off-by: Marcin Juszkiewicz<marcin@juszkiewicz.com.pl>
>
> Even though it lacks a PR bump:
> Acked-by: Koen Kooi <koen@openembedded.org>

Acked-by: Denys Dmytriyenko <denis@denix.org>

>> ---
>>   recipes/evtest/evtest_1.23.bb |    2 ++
>>   1 files changed, 2 insertions(+), 0 deletions(-)
>>
>> diff --git a/recipes/evtest/evtest_1.23.bb b/recipes/evtest/evtest_1.23.bb
>> index 4c5d195..6cf87be 100644
>> --- a/recipes/evtest/evtest_1.23.bb
>> +++ b/recipes/evtest/evtest_1.23.bb
>> @@ -11,6 +11,8 @@ PR = "r0"
>>   SRC_URI = "http://beagleboard.googlecode.com/files/evtest.c"
>>   S = "${WORKDIR}"
>>
>> +TARGET_CC_ARCH += "${LDFLAGS}"
>> +
>>   do_compile() {
>>       ${CC} evtest.c -o evtest -I${STAGING_INCDIR} -L${STAGING_LIBDIR}
>>   }
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


