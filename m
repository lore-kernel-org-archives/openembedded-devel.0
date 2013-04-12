Received: from mail.planet-school.de ([194.116.187.5]
	helo=turboconrad.planet-school.de)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lists@philipp-wagner.com>) id 1UQg6h-0000g8-8L
	for openembedded-devel@lists.openembedded.org;
	Fri, 12 Apr 2013 17:41:54 +0200
Received: from turboconrad.planet-school.de (srv004.service.ps-server.net
	[194.116.186.79])
	by turboconrad.planet-school.de (Postfix) with ESMTP id 7353AB6A005
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Apr 2013 17:24:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	srv004.service.ps-server.net
X-Spam-Level: 
X-Spam-Status: No, score=-101.1 required=5.0 tests=ALL_TRUSTED,AWL,
	LOCAL_USER_RULE autolearn=unavailable version=3.3.2
Received: from [129.187.155.160] (philipp.lis.ei.tum.de [129.187.155.160])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: lists@philipp-wagner.com)
	by turboconrad.planet-school.de (Postfix) with ESMTPSA id 587DEB6A004
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Apr 2013 17:24:20 +0200 (CEST)
Message-ID: <51682723.1030603@philipp-wagner.com>
Date: Fri, 12 Apr 2013 17:24:19 +0200
From: Philipp Wagner <lists@philipp-wagner.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130308 Thunderbird/17.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1365710654-22327-1-git-send-email-lists@philipp-wagner.com>
	<kk8mcf$sdd$1@ger.gmane.org>
In-Reply-To: <kk8mcf$sdd$1@ger.gmane.org>
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: [meta-oe][PATCH] Add dependencies on Perl and Bash to NTP recipe
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
X-List-Received-Date: Fri, 12 Apr 2013 15:41:54 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Am 12.04.2013 12:07, schrieb Koen Kooi:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Op 11-04-13 22:04, lists@philipp-wagner.com schreef:
>> From: Philipp Wagner <mail@philipp-wagner.com>
>>
>> do_rootfs gave errors about bash and perl not being found. This patch
>> adds the two packages to the runtime dependencies to fix this problem
>
> The bash dependencies need to get checked and changed to /bin/sh and perl
> scripts need to get split out into a seperate packages, dragging in perl and
> bash for ntp is unacceptable.

The bash dependency comes from osd_login (installed at
/sbin/osd_login) and start-statd (installed at /usr/sbin/start-statd).

The first one uses $BASHPID, and I'm not sure why $$ wasn't used.

The latter one (start-statd) uses the following shebang:
#!/bin/bash -p
I don't know if there's any POSIX equivalent that could be used.

All in all, I'm not familiar enough with the scripts (or with the 
differences between bash and POSIX shell behavior) to patch any of the 
scripts, so some help would be required here if the scripts should be 
changed.

As for the perl dependency, I just checked the RPM and it was not in 
there any more ... I'll double-check and come back with more details on 
this one.

Philipp


