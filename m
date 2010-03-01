Received: from mail-ww0-f47.google.com ([74.125.82.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <majo.huber@googlemail.com>) id 1Nm6w4-0007cn-8W
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Mar 2010 15:49:33 +0100
Received: by wwb13 with SMTP id 13so79338wwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Mar 2010 06:46:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=wGw7IUHLQ2ac0lT4dNqgsAMzthwReMM+NmjcjyWoGwY=;
	b=ZatHTGMQtJHYCEwTI6g9gOrNDRkdMtCLD1jaAdkTrsgKuyRLZRacwLaUMLQPMwJUGP
	QCwfyriP8rV3G+5c9TXBvg8UhsUXn0C4UfxrKV7xZ37ir0Gw7W8JmhJ8c5KucYpvAQpS
	987YPSI7pylljvtTb3tnt+bNbbwhEf1wnDDPQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=googlemail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=WmbikMwVedQoEVzIjx8p6jbahRddiSp0WE2+i3u6y9M2LnT1tv1TsWWEFwGkOMAJS8
	1hkRLtOPYwQzZuOJWfLKUSKEMy0IikNvzVM6n/dSWs+0wF5l2aJN/uAkzJ+R6TJ0YyRq
	ZJLqu7zNd1WJVqgupr3JIqoAHNpGmfnJgzSoE=
MIME-Version: 1.0
Received: by 10.216.170.198 with SMTP id p48mr1852188wel.133.1267454798191; 
	Mon, 01 Mar 2010 06:46:38 -0800 (PST)
Date: Mon, 1 Mar 2010 15:46:38 +0100
Message-ID: <40d782961003010646l58cccfd9w5acc940ac7634171@mail.gmail.com>
From: majo huber <majo.huber@googlemail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.47
X-SA-Exim-Mail-From: majo.huber@googlemail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_PASS autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: (No subject)
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
X-List-Received-Date: Mon, 01 Mar 2010 14:49:34 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi@all,

when compiling classpath I get the following error:

jm@pc-jm:~/localcvs/oe/stuff/openembedded$ bitbake classpath -c build
NOTE: Handling BitBake files: \ (8095/8095) [100 %]
NOTE: Parsing finished. 7448 cached, 317 parsed, 330 skipped, 0 masked.
NOTE: Resolving any missing task queue dependencies
NOTE: Preparing runqueue
NOTE: Executing runqueue
NOTE: Running task 1335 of 1946 (ID: 284,
/home/jm/localcvs/oe/stuff/openembedded/recipes/antlr/antlr-native_2.7.7.bb,
do_compile)
ERROR: function do_compile failed
ERROR: log data follows
(/home/jm/oe/tmp/work/i686-linux/antlr-native-2.7.7-r0/temp/log.do_compile.20706)
| Exception in thread "main" java.lang.NoClassDefFoundError:
org/eclipse/jdt/internal/compiler/batch/Main
|    <<No stacktrace available>>
| Caused by: java.lang.ClassNotFoundException:
org.eclipse.jdt.internal.compiler.batch.Main not found in
java.lang.ClassLoader$1{urls=[], parent=null}
|    at java.net.URLClassLoader.findClass(URLClassLoader.java:529)
|    at java.lang.ClassLoader.loadClass(ClassLoader.java:341)
|    at java.lang.ClassLoader$1.loadClass(ClassLoader.java:1112)
|    at java.lang.ClassLoader.loadClass(ClassLoader.java:293)
NOTE: Task failed:
/home/jm/oe/tmp/work/i686-linux/antlr-native-2.7.7-r0/temp/log.do_compile.20706
ERROR: TaskFailed event exception, aborting
ERROR: Build of
/home/jm/localcvs/oe/stuff/openembedded/recipes/antlr/antlr-native_2.7.7.bb
do_compile failed
ERROR: Task 284
(/home/jm/localcvs/oe/stuff/openembedded/recipes/antlr/antlr-native_2.7.7.bb,
do_compile) failed
NOTE: Tasks Summary: Attempted 1334 tasks of which 1334 didn't need to
be rerun and 1 failed.
ERROR: '/home/jm/localcvs/oe/stuff/openembedded/recipes/antlr/antlr-native_2.7.7.bb'
failed


Has anybody an idea how to resolve this issue?
I saw that the classpath has recently changed from 0.97 to 0.98
(according to git). And I'm pretty sure that I compiled this earlier
and had no problems. I'm no Java guy, so I don't really know where to
start. Is it possible that it has someting to do with the Host
platform (Ubuntu 9.10)?

Thanks in advance,
majo


