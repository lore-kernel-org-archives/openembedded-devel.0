Received: from smtp2.nedap.com ([213.160.213.92] helo=smtp.nedap.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jaap.dejong@nedap.com>) id 1OfrqZ-0001W8-1D
	for openembedded-devel@lists.openembedded.org;
	Mon, 02 Aug 2010 12:05:21 +0200
Received: from nvs0066.nedap.local ([10.91.8.1]) by smtp.nedap.com with
	Microsoft SMTPSVC(6.0.3790.1830); Mon, 2 Aug 2010 12:00:32 +0200
X-TM-IMSS-Message-ID: <45f3d6eb00015f51@nedap.com>
Received: from [10.2.40.10] ([10.2.40.10]) by nedap.com ([10.91.8.1]) with
	ESMTP (TREND IMSS SMTP Service 7.0) id 45f3d6eb00015f51 for
	<jaap.dejong@nedap.com>; Mon, 2 Aug 2010 12:00:26 +0100
Message-ID: <4C56973F.9090208@nedap.com>
Date: Mon, 02 Aug 2010 12:00:31 +0200
From: Jaap de Jong <jaap.dejong@nedap.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.11) Gecko/20100713 Lightning/1.0b1 Thunderbird/3.0.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-OriginalArrivalTime: 02 Aug 2010 10:00:32.0895 (UTC)
	FILETIME=[8BB230F0:01CB3229]
X-SA-Exim-Connect-IP: 213.160.213.92
X-SA-Exim-Mail-From: jaap.dejong@nedap.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: PREMIRRORS trouble
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
X-List-Received-Date: Mon, 02 Aug 2010 10:07:48 -0000
X-List-Received-Date: Mon, 02 Aug 2010 10:07:48 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi!

I've run into some problems using PRE_MIRRORS.
If I remove the line from build/conf/site.conf everything is OK.

     PREMIRRORS = "(ftp|http|https)://.*/.* http://myServer/sources/"

Thanks!
Jaap

$ bitbake at91bootstrap
NOTE: Handling BitBake files: - (8448/8448) [100 %]
NOTE: Parsing finished. 7634 cached, 474 parsed, 340 skipped, 1 masked.
NOTE: Resolving any missing task queue dependencies
NOTE: Preparing runqueue
NOTE: Executing runqueue
NOTE: Running task 342 of 539 (ID: 6, 
/unstable/org.openembedded.dev/recipes/at91bootstrap/at91bootstrap_2.10.bb, 
do_setscene)
NOTE: Running task 524 of 539 (ID: 5, 
/unstable/org.openembedded.dev/recipes/at91bootstrap/at91bootstrap_2.10.bb, 
do_fetch)
NOTE: Task failed: Unknown fetch Error: too many values to unpack
ERROR: TaskFailed event exception, aborting
ERROR: Build of 
/unstable/org.openembedded.dev/recipes/at91bootstrap/at91bootstrap_2.10.bb 
do_fetch failed
ERROR: Task 5 
(/unstable/org.openembedded.dev/recipes/at91bootstrap/at91bootstrap_2.10.bb, 
do_fetch) failed
NOTE: Tasks Summary: Attempted 523 tasks of which 522 didn't need to be 
rerun and 1 failed.
ERROR: 
'/unstable/org.openembedded.dev/recipes/at91bootstrap/at91bootstrap_2.10.bb' 
failed



