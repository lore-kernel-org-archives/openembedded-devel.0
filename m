Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch-fe.de>) id 1QP7Dp-00084U-6v
	for openembedded-devel@lists.openembedded.org;
	Wed, 25 May 2011 08:05:33 +0200
Received: by wwi18 with SMTP id 18so3155864wwi.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 May 2011 23:02:31 -0700 (PDT)
Received: by 10.216.239.73 with SMTP id b51mr4118526wer.60.1306303351017;
	Tue, 24 May 2011 23:02:31 -0700 (PDT)
Received: from [10.32.10.2] (p57A203AD.dip0.t-ipconnect.de [87.162.3.173])
	by mx.google.com with ESMTPS id e7sm135213wbh.12.2011.05.24.23.02.28
	(version=SSLv3 cipher=OTHER); Tue, 24 May 2011 23:02:29 -0700 (PDT)
Message-ID: <4DDC9B74.2000600@dresearch-fe.de>
Date: Wed, 25 May 2011 08:02:28 +0200
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; de;
	rv:1.9.2.17) Gecko/20110414 Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1306159627-10568-1-git-send-email-sledz@dresearch-fe.de>
	<1306270689.22299.12.camel@mattotaupa>
In-Reply-To: <1306270689.22299.12.camel@mattotaupa>
Cc: Paul Menzel <paulepanter@users.sourceforge.net>
Subject: Re: [PATCH] apr-util: disable odbc support to avoid QA error
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
X-List-Received-Date: Wed, 25 May 2011 06:05:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Am 24.05.2011 22:58, schrieb Paul Menzel:
> Am Montag, den 23.05.2011, 16:07 +0200 schrieb Steffen Sledz:
>> The odbc checker part of the configure script seems to be buggy and
>> may add host pathes to compiler and linker options:
> 
> s/patches/paths/

s/pathes/paths/  ;-)

>> --------->snip<--------
>>  checking for odbc_config... /usr/bin/odbc_config
>>    adding "-I/usr/include" to CPPFLAGS
>>    adding "-L/usr/lib" to LDFLAGS
>>    setting LIBS to "-L/usr/lib -lodbc"
>> --------->snip<--------
> 
> Why is that a QA error? I would have guessed that the compilation would
> fail.

I'm not at the HEAD of org.openembedded.dev but i got this fatal without my patch:

--------->snip<--------
FATAL: This autoconf log indicates errors, it looked at host includes.
Rerun configure task after fixing this. The path was '/home/sledz/work/HydraIP/OE/tmp.6/work/armv5te-angstrom-linux-gnueabi/apr-util-1.3.10-r0/apr-util-1.3.10'
ERROR: Error in executing python function in: /home/sledz/work/openembedded/recipes/apr/apr-util_1.3.10.bb
ERROR: Exception:<type 'exceptions.SystemExit'> Message:1
ERROR: Printing the environment of the function
ERROR: Function do_qa_configure failed
ERROR: TaskFailed event exception, aborting
ERROR: Build of /home/sledz/work/openembedded/recipes/apr/apr-util_1.3.10.bb do_qa_configure failed
NOTE: package apr-util-1.3.10-r0: task do_configure: Succeeded
ERROR: Task 12 (/home/sledz/work/openembedded/recipes/apr/apr-util_1.3.10.bb, do_qa_configure) failed with 256
ERROR: '/home/sledz/work/openembedded/recipes/apr/apr-util_1.3.10.bb' failed
NOTE: Running task 625 of 635 (ID: 12, /home/sledz/work/openembedded/recipes/apr/apr-util_1.3.10.bb, do_qa_configure)
NOTE: package apr-util-1.3.10-r0: task do_qa_configure: Started
FATAL: This autoconf log indicates errors, it looked at host includes.
Rerun configure task after fixing this. The path was '/home/sledz/work/HydraIP/OE/tmp.6/work/armv5te-angstrom-linux-gnueabi/apr-util-1.3.10-r0/apr-util-1.3.10'
ERROR: '/home/sledz/work/openembedded/recipes/apr/apr-util_1.3.10.bb' failed
--------->snip<--------

> Anyway, since `odbc_config` does not seem to be packaged for
> OpenEmbedded, disabling that option seems like a sane thing.
> 
> Acked-by: Paul Menzel <paulepanter@users.sourceforge.net>

Thanx and pushed.

Steffen

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058


