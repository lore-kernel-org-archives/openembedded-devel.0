Received: from smtp3.nedap.com ([87.249.123.12] helo=smtp.nedap.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jaap.dejong@nedap.com>) id 1Oj55y-0000nS-Dx
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Aug 2010 08:47:33 +0200
Received: from nvs0066.nedap.local ([10.91.8.1]) by smtp.nedap.com with
	Microsoft SMTPSVC(6.0.3790.1830); Wed, 11 Aug 2010 08:47:15 +0200
X-TM-IMSS-Message-ID: <1e1e9fdc00006cc5@nedap.com>
Received: from [10.2.40.10] ([10.2.40.10]) by nedap.com ([10.91.8.1]) with
	ESMTP (TREND IMSS SMTP Service 7.0) id 1e1e9fdc00006cc5 for
	<jaap.dejong@nedap.com>; Wed, 11 Aug 2010 08:47:18 +0100
Message-ID: <4C624772.8000607@nedap.com>
Date: Wed, 11 Aug 2010 08:47:14 +0200
From: Jaap de Jong <jaap.dejong@nedap.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.11) Gecko/20100713 Lightning/1.0b1 Thunderbird/3.0.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-OriginalArrivalTime: 11 Aug 2010 06:47:15.0068 (UTC)
	FILETIME=[0891FBC0:01CB3921]
X-SA-Exim-Connect-IP: 87.249.123.12
X-SA-Exim-Mail-From: jaap.dejong@nedap.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: problem building openjdk-6
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
X-List-Received-Date: Wed, 11 Aug 2010 06:47:33 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

since a day or 6/7 ago I can't build openjdk-6 anymore.
This is the latest patch that builds fine; later fail...

    commit 13423cbf48e09af101dacba5e23695091582fc92
    Author: Robert Schuster <robertschuster@fsfe.org>
    Date:   Thu Jul 22 12:13:29 2010 +0200

         jamvm-native 1.5.4: New version.

Any clue?
Thanks!
Jaap de Jong



| 4380. WARNING in src/org/apache/xalan/xslt/Process.java (at line 757)
|     PrintWriter resultWriter;
|                 ^^^^^^^^^^^^
| The local variable resultWriter is never read
| ----------
| 4380 problems (3888 errors, 492 warnings)
NOTE: Task failed: 
/media/OpenEmbedded/unstable/tmp/work/armv5te-angstrom-linux-gnueabi/xalan-j-2.7.1-r2/temp/log.do_compile.4145
ERROR: TaskFailed event exception, aborting
ERROR: Build of 
/media/OpenEmbedded/unstable/org.openembedded.dev/recipes/xalan-j/xalan-j_2.7.1.bb 
do_compile failed
ERROR: Task 1879 
(/media/OpenEmbedded/unstable/org.openembedded.dev/recipes/xalan-j/xalan-j_2.7.1.bb, 
do_compile) failed
NOTE: Waiting for 2 active tasks to finish


