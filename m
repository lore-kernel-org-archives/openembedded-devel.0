Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@DResearch.DE>) id 1Nr7LJ-0007BT-AG
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Mar 2010 11:16:19 +0100
Received: from exchange.intern.dresearch.de (unknown [192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id E1B70491264
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Mar 2010 11:13:13 +0100 (CET)
Received: from [127.0.0.1] ([10.32.10.2]) by exchange.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.3959); Mon, 15 Mar 2010 11:13:35 +0100
Message-ID: <4B9E0843.30005@dresearch.de>
Date: Mon, 15 Mar 2010 11:13:23 +0100
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Thunderbird 2.0.0.23 (Windows/20090812)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-OriginalArrivalTime: 15 Mar 2010 10:13:35.0137 (UTC)
	FILETIME=[2C1DD910:01CAC428]
X-SA-Exim-Connect-IP: 87.193.137.100
X-SA-Exim-Mail-From: sledz@DResearch.DE
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: SRC_URI fetching problem
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
X-List-Received-Date: Mon, 15 Mar 2010 10:16:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

I work at a recipe for rsyslog (http://www.rsyslog.com) and hit a
problem with the wget fetcher.

The download uri for rsyslog-5.4.0.tar.gz does not contain the archive
name itself but is http://www.rsyslog.com/Downloads-req-getit-lid-197.phtml.

If i set

SRC_URI = "http://www.rsyslog.com/Downloads-req-getit-lid-197.phtml"
SRC_URI[archive.md5sum] = "291882229d50496f42bd63174076dd37"
SRC_URI[archive.sha256sum] = "d9cd21d2fcd45fcae65eb0a51927c40315cca02afdc62478abd950febfcf7228"

the fetch stage results in an error even though the archive is
downloaded. :(

---------------------->snip<-----------------------------
> bitbake -b /home/sledz/work/openembedded/recipes/rsyslog/rsyslog_5.4.0.bb -c fetch
NOTE: Preparing runqueue
NOTE: Executing runqueue
NOTE: Running task 2 of 2 (ID: 1, /home/sledz/work/openembedded/recipes/rsyslog/rsyslog_5.4.0.bb, do_fetch)
NOTE: fetch http://www.rsyslog.com/Downloads-req-getit-lid-197.phtml
--2010-03-15 11:09:05--  http://www.rsyslog.com/Downloads-req-getit-lid-197.phtml
Resolving www.rsyslog.com... 85.10.198.18
Connecting to www.rsyslog.com|85.10.198.18|:80... connected.
HTTP request sent, awaiting response... 302 Found
Location: http://download.rsyslog.com/rsyslog/rsyslog-5.4.0.tar.gz [following]
--2010-03-15 11:09:05--  http://download.rsyslog.com/rsyslog/rsyslog-5.4.0.tar.gz
Resolving download.rsyslog.com... 85.10.198.18
Reusing existing connection to www.rsyslog.com:80.
HTTP request sent, awaiting response... 200 OK
Length: 2124201 (2.0M) [application/x-gzip]
Saving to: `/home/sledz/sources/rsyslog-5.4.0.tar.gz'

100%[==================================================================================================================================================================>] 2,124,201   1.19M/s   in 1.7s

2010-03-15 11:09:07 (1.19 MB/s) - `/home/sledz/sources/rsyslog-5.4.0.tar.gz' saved [2124201/2124201]

NOTE: fetch http://mirrors.openembedded.org//Downloads-req-getit-lid-197.phtml
--2010-03-15 11:09:07--  http://mirrors.openembedded.org//Downloads-req-getit-lid-197.phtml
Resolving mirrors.openembedded.org... 82.197.159.157
Connecting to mirrors.openembedded.org|82.197.159.157|:80... connected.
HTTP request sent, awaiting response... 404 Not Found
2010-03-15 11:09:07 ERROR 404: Not Found.

NOTE: fetch http://sources.openembedded.org//Downloads-req-getit-lid-197.phtml
--2010-03-15 11:09:07--  http://sources.openembedded.org//Downloads-req-getit-lid-197.phtml
Resolving sources.openembedded.org... 140.211.169.165
Connecting to sources.openembedded.org|140.211.169.165|:80... connected.
HTTP request sent, awaiting response... 404 Not Found
2010-03-15 11:09:07 ERROR 404: Not Found.

NOTE: fetch http://www.angstrom-distribution.org/unstable/sources/Downloads-req-getit-lid-197.phtml
--2010-03-15 11:09:07--  http://www.angstrom-distribution.org/unstable/sources/Downloads-req-getit-lid-197.phtml
Resolving www.angstrom-distribution.org... 188.40.83.200
Connecting to www.angstrom-distribution.org|188.40.83.200|:80... connected.
HTTP request sent, awaiting response... 404 Not Found
2010-03-15 11:09:07 ERROR 404: Not Found.

NOTE: Task failed: Fetch failed: http://www.rsyslog.com/Downloads-req-getit-lid-197.phtml
ERROR: TaskFailed event exception, aborting
ERROR: Build of /home/sledz/work/openembedded/recipes/rsyslog/rsyslog_5.4.0.bb do_fetch failed
ERROR: Task 1 (/home/sledz/work/openembedded/recipes/rsyslog/rsyslog_5.4.0.bb, do_fetch) failed
NOTE: Tasks Summary: Attempted 1 tasks of which 1 didn't need to be rerun and 1 failed.
ERROR: '/home/sledz/work/openembedded/recipes/rsyslog/rsyslog_5.4.0.bb' failed
---------------------->snip<-----------------------------

Steffen



