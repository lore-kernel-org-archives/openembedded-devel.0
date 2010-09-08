Received: from smtp2.nedap.com ([213.160.213.92] helo=smtp.nedap.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jaap.dejong@nedap.com>) id 1OtFhr-0008GK-2U
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Sep 2010 10:08:37 +0200
Received: from nvs0066.nedap.local ([10.91.8.1]) by smtp.nedap.com with
	Microsoft SMTPSVC(6.0.3790.1830); Wed, 8 Sep 2010 10:07:53 +0200
X-TM-IMSS-Message-ID: <0043f60200000339@nedap.com>
Received: from [10.2.40.10] ([10.2.40.10]) by nedap.com ([10.91.8.1]) with
	ESMTP (TREND IMSS SMTP Service 7.0) id 0043f60200000339 for
	<jaap.dejong@nedap.com>; Wed, 8 Sep 2010 10:07:52 +0100
Message-ID: <4C874458.3060101@nedap.com>
Date: Wed, 08 Sep 2010 10:07:52 +0200
From: Jaap de Jong <jaap.dejong@nedap.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.11) Gecko/20100713 Lightning/1.0b1 Thunderbird/3.0.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-OriginalArrivalTime: 08 Sep 2010 08:07:53.0772 (UTC)
	FILETIME=[F03A9EC0:01CB4F2C]
X-SA-Exim-Connect-IP: 213.160.213.92
X-SA-Exim-Mail-From: jaap.dejong@nedap.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: cmake-native trouble making
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
X-List-Received-Date: Wed, 08 Sep 2010 08:08:38 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

During a clean build (tmp removed) I get this error

$ bitbake cmake-native
////
| [ 87%] Building CXX object 
Source/CMakeFiles/CPackLib.dir/CPack/cmCPackNSISGenerator.o
| /usr/bin/ld: cannot find -ltinfo
| collect2: ld returned 1 exit status
| make[2]: *** [bin/ccmake] Error 1
| make[1]: *** [Source/CMakeFiles/ccmake.dir/all] Error 2
| make[1]: *** Waiting for unfinished jobs....
////

Is cmake-native_2.8.2.bb missing this line:

     RDEPENDS = "ncurses-terminfo"




