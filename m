Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1POXhl-0002s3-Lj
	for openembedded-devel@lists.openembedded.org;
	Fri, 03 Dec 2010 16:37:50 +0100
Received: by ywp4 with SMTP id 4so1172385ywp.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 Dec 2010 07:36:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=BCy09Anm/Oc+ylaayJPtirzkMnXjsIMx1r6cPOyzg0s=;
	b=bZWvv1hSzq52Tcp+w6d1HHDwf/GyHH0/K1X83jvst7tIjGzGJ67Qb08xfWN3Uh/VjH
	QGnLG+ZDDJ3mzgC7aQPmz4Hu/aMsBFnJYTcH0+TU63aZMtpyPcRKTw8NQp7QGe5/dVxs
	km/ibzsf2qcr9PnQl35aLOOKkYVDEwQ9Pk6xY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=Gq6KymXnhyFqBvQ/HLHOsymFruPOg1qy76PFbAkcfxO/pRkXgsbKCVClfoN3VIIc6D
	XOHESLgF5hHc5HCsdZMSmdoYsvJi8786Vuk3HvCIy4HMxKsDxwC5IQHQf2lFAOSsBkiK
	L+YyqCgMhC7VxIBvCtalx3udpTVcv4pz6zQUM=
MIME-Version: 1.0
Received: by 10.231.35.5 with SMTP id n5mr1932704ibd.182.1291390584727; Fri,
	03 Dec 2010 07:36:24 -0800 (PST)
Received: by 10.231.200.140 with HTTP; Fri, 3 Dec 2010 07:36:24 -0800 (PST)
Date: Fri, 3 Dec 2010 16:36:24 +0100
Message-ID: <AANLkTim=weStfsykRNc7_bAZG6KExZt9sS_O15WH9F5=@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: release 2010-12: tar error
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
X-List-Received-Date: Fri, 03 Dec 2010 15:37:50 -0000
Content-Type: text/plain; charset=ISO-8859-1

Not sure if this is reproducible or a race but when building console-image
for minimal for calamari I got:

ERROR: Function staging_packager failed
NOTE: Task failed: ('function staging_packager failed',
'/home/hudson/jobs/FM_TEST/workspace/tmp/work/calamari-oe-linux-gnuspe/linux-2.6.30-r6/temp/log.staging_packager.27026')
ERROR: Task 601
(/home/hudson/jobs/FM_TEST/workspace/openembedded/recipes/linux/linux_2.6.30.bb,
do_package_stage) failed with 256
NOTE: oestats: task failed, see
http://tinderbox.openembedded.net/packages/1176040/
ERROR: Logfile of failure stored in:
/home/hudson/jobs/FM_TEST/workspace/tmp/work/calamari-oe-linux-gnuspe/linux-2.6.30-r6/temp/log.staging_packager.27026
Log data follows:
| tar: .: file changed as we read it

NOTE: package linux-2.6.30-r6: task do_package_stage: Failed

Didn't have time to dig into this. Sry.

Frans

