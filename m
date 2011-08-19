Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QuI8c-0006tt-SD
	for openembedded-devel@lists.openembedded.org;
	Fri, 19 Aug 2011 08:01:03 +0200
Received: by gxk3 with SMTP id 3so1931696gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Aug 2011 22:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=5CEUme7V9ZADab1lqJcF9bvVx8eQKVbT9Dpp2OelqSc=;
	b=UEUs5f6nwK8nzmdXIR9oBiNqzXGNcN+TbkZUdj7ZKvXPHjqBZnaenldEkTDTqLDnBW
	7hu3RbXH9TcTLH+ujoGPguI0ftfiXQM6nhK3P9gfJLm74F9Hh6CB9m7k04/p9CGPZJQE
	4etmOH/QWygAn13oKNCtUYvrK20u2M5QJ9usc=
Received: by 10.236.182.4 with SMTP id n4mr4153288yhm.90.1313733379869;
	Thu, 18 Aug 2011 22:56:19 -0700 (PDT)
Received: from [192.168.1.70] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id b4sm500947iba.32.2011.08.18.22.56.18
	(version=SSLv3 cipher=OTHER); Thu, 18 Aug 2011 22:56:19 -0700 (PDT)
Message-ID: <4E4DFAFF.7090006@gmail.com>
Date: Thu, 18 Aug 2011 22:56:15 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; rv:6.0) Gecko/20110812 Thunderbird/6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4E4CF6A7.6020901@ra.rockwell.com>
In-Reply-To: <4E4CF6A7.6020901@ra.rockwell.com>
Subject: Re: inetlib_1.1.1.bb (classpathx) doesn't install inetlib.jar to the sysroot
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
X-List-Received-Date: Fri, 19 Aug 2011 06:01:03 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 8/18/2011 4:25 AM, Miroslav Kes wrote:
> I have experienced this error when building the gnumail:
>
> $ cat log.do_configure
> ...
> checking if
> /home/mkes/sources/linux/platform/oebase/builds/beagleboard_gnu/build/tmp/sysroots/i686-linux/usr/bin/javac
> works... yes
> checking for fastjar... fastjar
> checking for
> /home/mkes/sources/linux/platform/oebase/builds/beagleboard_gnu/build/tmp/sysroots/java/activation.jar...
> yes
> checking for
> /home/mkes/sources/linux/platform/oebase/builds/beagleboard_gnu/build/tmp/sysroots/java/inetlib.jar...
> configure: error: can't find inetlib.jar in specified path
>
> Really, the inetlib_1.1.1.bb doesn't install the jar to the
> ${TMPDIR/sysroots/java. The logs show that the oe_jarinstall() is never
> called with the -s option.
>
> I have created a local overlay and added a call to the the java_stage i.e.
>
> do_install_append() {
>    java_install
>    java_stage
> }
>
> This fixed the problem.

can you post a patch for this please ?

>
> Regards
>
> Mira Kes
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



