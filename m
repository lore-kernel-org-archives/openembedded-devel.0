Received: from mail-fx0-f42.google.com ([209.85.161.42])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <coolaj86@gmail.com>) id 1PSFxW-0006ai-BS
	for openembedded-devel@lists.openembedded.org;
	Mon, 13 Dec 2010 22:29:26 +0100
Received: by fxm11 with SMTP id 11so6122564fxm.29
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Dec 2010 13:27:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:from:date
	:message-id:subject:to:content-type;
	bh=atwxJfxpTLc41rdOGVcZCcGd9MafmNkOZVcrUmPMWIc=;
	b=S72xomPyFN8LLrvRL5L8hVW/yZ7XMiZsg4zAyc5d32uWp/4/tdJA6bx2+Ex4S9VX6U
	ua9DP5V4yUehMC6x0hxaboB94jMi6paiSQ189i1knippsG8J05lmsMhoF0PK9apYoCXJ
	OA+Gsf50eFScKLd3olf/D9OBLB+SqPxt/0sBw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:from:date:message-id:subject:to:content-type;
	b=VvGx9MiLStq9GL4bzmMNVGg6e+uKomobSoxBpYvbHT1jbO6nCjY8NH22ITdHi2knBW
	HcwZuew4d2MBbhS2OCZ+Ke91f8ymdwF2BuEeyZH/fTEYCSg5NahebpO8gy1rpLHznQ0m
	YsPbPE3uP1p6jR52mruyUdhFa/L6U33go6CDc=
Received: by 10.223.74.197 with SMTP id v5mr4805236faj.84.1292275670721; Mon,
	13 Dec 2010 13:27:50 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.110.140 with HTTP; Mon, 13 Dec 2010 13:27:30 -0800 (PST)
From: AJ ONeal <coolaj86@gmail.com>
Date: Mon, 13 Dec 2010 14:27:30 -0700
Message-ID: <AANLkTik3B0Boi4PuUqZiSd8no_BwBoSzcgWVmFcKcY3L@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 209.85.161.42
X-SA-Exim-Mail-From: coolaj86@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: task-sdk-native hard-coded to depend on sysvinit
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
X-List-Received-Date: Mon, 13 Dec 2010 21:29:26 -0000
Content-Type: text/plain; charset=ISO-8859-1

Why should task-sdk-native depend on sysvinit in the first place?

And in the second place, isn't there something like virtual/init that it
should depend on instead?

opkg install task-sdk-native

Collected errors:
 * check_data_file_clashes: Package sysvinit wants to install file
/sbin/telinit
    But that file is already provided by package  * upstart-sysvcompat
 * check_data_file_clashes: Package sysvinit wants to install file
/sbin/killall5
    But that file is already provided by package  * sysvinit-utils
 * check_data_file_clashes: Package sysvinit wants to install file
/etc/init.d/rc
    But that file is already provided by package  * upstart-sysvcompat
 * check_data_file_clashes: Package sysvinit wants to install file
/etc/init.d/rcS
    But that file is already provided by package  * upstart-sysvcompat
 * check_data_file_clashes: Package sysvinit wants to install file
/etc/default/rcS
    But that file is already provided by package  * upstart-sysvcompat
 * opkg_install_cmd: Cannot install package task-sdk-native.


AJ ONeal

