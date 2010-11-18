Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <coolaj86@gmail.com>) id 1PJAcA-0003hF-RM
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Nov 2010 20:57:51 +0100
Received: by fxm11 with SMTP id 11so1994198fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Nov 2010 11:56:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:from:date
	:message-id:subject:to:content-type;
	bh=aG2KYjyoSYW58RNo2mUKkGJJDk7bFmXrFzEEcTE6gac=;
	b=HEMg6FRqwPaY85N+snw37SmJaOIdZIu3uk8STqKGelJFhm+C9gvIR9CtsgRVa9XfeM
	H0PQgVU5c//X3MPbpKrbqBbcxD61GimK4L18/znn6YrJ/34FOvLKReMfXlB9UVyNQdgB
	A9U9k3SRSZNYoRxh5vCqx5W5bNehbx6t2u97I=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:from:date:message-id:subject:to:content-type;
	b=EYS3qQU0KvnOd6gNJzxDzXRFUF0wB0y2kpS8t9SmEl00ylJuRy1h6gjF+58LywmKOP
	VvsUWe60MlQCr1exM6p1OgT2dhkUVXNSmeZouZXS/YZhoBJVIKcohnWwLd8/+5Anc5UV
	GyRxDll/ykqmoPyUC6piwuW0JJ8REBumv2L1o=
Received: by 10.223.74.131 with SMTP id u3mr2076faj.99.1290110203137; Thu, 18
	Nov 2010 11:56:43 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.125.138 with HTTP; Thu, 18 Nov 2010 11:56:22 -0800 (PST)
From: AJ ONeal <coolaj86@gmail.com>
Date: Thu, 18 Nov 2010 12:56:22 -0700
Message-ID: <AANLkTik0thyw1SiJNdu9oDuPJtvpRY7Gfah8Z9z5ck7Y@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: coolaj86@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: bitbake ntpdate failure
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
X-List-Received-Date: Thu, 18 Nov 2010 19:57:51 -0000
Content-Type: text/plain; charset=ISO-8859-1

*| ntpdc.c:452: error: 'EAI_NODATA' undeclared (first use in this function)*


Full output:
https://gist.github.com/705497


Snippit:

| make[3]: Entering directory
`/mnt/local/overo-coolaj86/tmp/work/armv7a-angstrom-linux-gnueabi/ntp-4.2.0-r9/ntp-4.2.0/ntpdc'
| arm-angstrom-linux-gnueabi-gcc -march=armv7-a -mtune=cortex-a8 -mfpu=neon
-mfloat-abi=softfp -mthumb-interwork -mno-thumb -std=gnu99 -DHAVE_CONFIG_H
-I. -I.. -I../include
-isystem/mnt/local/overo-coolaj86/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include
-isystem/mnt/local/overo-coolaj86/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include
-fexpensive-optimizations -frename-registers -fomit-frame-pointer -O2 -ggdb2
-DPTYS_ARE_GETPT -DPTYS_ARE_SEARCHED -Wall -Wcast-qual -Wmissing-prototypes
-Wpointer-arith -Wshadow -Wstrict-prototypes -MT ntpdc.o -MD -MP -MF
.deps/ntpdc.Tpo -c -o ntpdc.o ntpdc.c
| ntpdc.c: In function 'openhost':
*| ntpdc.c:452: error: 'EAI_NODATA' undeclared (first use in this function)*
| ntpdc.c:452: error: (Each undeclared identifier is reported only once
| ntpdc.c:452: error: for each function it appears in.)
| make[3]: *** [ntpdc.o] Error 1
| make[3]: Leaving directory
`/mnt/local/overo-coolaj86/tmp/work/armv7a-angstrom-linux-gnueabi/ntp-4.2.0-r9/ntp-4.2.0/ntpdc'
| make[2]: *** [all] Error 2
| make[2]: Leaving directory
`/mnt/local/overo-coolaj86/tmp/work/armv7a-angstrom-linux-gnueabi/ntp-4.2.0-r9/ntp-4.2.0/ntpdc'
| make[1]: *** [all-recursive] Error 1
| make[1]: Leaving directory
`/mnt/local/overo-coolaj86/tmp/work/armv7a-angstrom-linux-gnueabi/ntp-4.2.0-r9/ntp-4.2.0'
| make: *** [all] Error 2
| FATAL: oe_runmake failed
NOTE: Task failed:
/mnt/local/overo-coolaj86/tmp/work/armv7a-angstrom-linux-gnueabi/ntp-4.2.0-r9/temp/log.do_compile.7879
ERROR: TaskFailed event exception, aborting

AJ ONeal

