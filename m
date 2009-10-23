Received: from [206.190.36.126] (helo=web53903.mail.re2.yahoo.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <cwoloszynski@yahoo.com>) id 1N1PrD-0005ve-Gs
	for Openembedded-devel@openembedded.org; Fri, 23 Oct 2009 21:31:30 +0200
Received: (qmail 79970 invoked by uid 60001); 23 Oct 2009 19:30:24 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024;
	t=1256326224; bh=6x8tRCBF+ANIvxkemx+FHtQiianfntB4yZdycedol6g=;
	h=Message-ID:X-YMail-OSG:Received:X-Mailer:Date:From:Subject:To:MIME-Version:Content-Type;
	b=UwtF+FAcjrpY03WOj15FkJkMe1DpWkQyx1oHiAE0wnBF+AFESBbqJqtPDOu6E9D/h12/fWF2IwP3Bfhk2yjXOLHv8TZQwP964zJwmG1UWUsTdYGoFpMJ/u1pXKKuvn3/u6ykNasnepf1eNU8pEWgWKSfw/wdPSyW+lmix+sre48=
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=s1024; d=yahoo.com;
	h=Message-ID:X-YMail-OSG:Received:X-Mailer:Date:From:Subject:To:MIME-Version:Content-Type;
	b=SfSTQCayjHSnMdkTF1ZVWZkPnsBh6l/WOezk72Lp0rl0mkedDQyu1/8FiCWJDAdF2OMUnrBlr4sAfPpEMpe/ptFo9sy5StY0qisR6YxzalhaB40BzSHVlPrgDG+j/mR0I9hGC0iDwUr3CZg8m6UgWH6rakXkx4LTx7sY5QX3ROg=;
Message-ID: <381446.79903.qm@web53903.mail.re2.yahoo.com>
X-YMail-OSG: FD0N0OIVM1nwCr2GDCGdt2IB58dMyAbUuy_EsiCjcdvpT7spGj50WmvrSSqavbyehPX7IfXVpY7gB8JqTYrcSo1bWmNvXVZGejgM_x67p2PtpEee_uPvxHg3Dndl6t15iquXmE_KZ6Gl1Ceudde3LCerQshjSe2Jxu7gVJTRyA7lcpydHiEje.I61h.egPHo7BVZby9F0dvmc.YDiBmt8S9ZfFrEy4GKkq_tepknSqoPPOILM1b4ROZjeZIYilXWbk306dTZPEIl91l6HTJMvKjUGZF2qCI.ZL0jn.UfHyZ5eVqydZ0U9qvtZMnmCxb1CEIGmRtgQglQAAIvy0uu878YqLbsv6L3UmmWr3uTJo.pVeLQEVOSF_.eRsrynfakcJawPMLInMRWD2rERd2Xos.KTZzD
Received: from [68.100.74.251] by web53903.mail.re2.yahoo.com via HTTP;
	Fri, 23 Oct 2009 12:30:23 PDT
X-Mailer: YahooMailRC/182.10 YahooMailWebService/0.7.347.3
Date: Fri, 23 Oct 2009 12:30:23 -0700 (PDT)
From: Charlie Woloszynski <cwoloszynski@yahoo.com>
To: Openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 206.190.36.126
X-SA-Exim-Mail-From: cwoloszynski@yahoo.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: omap3-console-image broken?
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
X-List-Received-Date: Fri, 23 Oct 2009 19:31:30 -0000
Content-Type: text/plain; charset=us-ascii

I am trying to build an omap3-console-image, but i get the following error.  

I have done a 'git pull' for org.openembedded.dev this morning


NOTE: Running task 1038 of 4072 (ID: 1010, /home/charlie/pixhawk.oe/org.openembedded.dev/recipes/linux/linux-omap3_2.6.29.bb, do_fetch)
fatal: Not a git repository
NOTE: Task failed: Fetch failed: Fetch command export HOME=/home/charlie; export PATH=/home/charlie/pixhawk.oe/tmp/staging/i686-linux/usr/bin/overo-angstrom-linux-gnueabi:/home/charlie/pixhawk.oe/tmp/staging/i686-linux/usr/bin/armv7a-angstrom-linux-gnueabi:/home/charlie/pixhawk.oe/tmp/staging/i686-linux/usr/sbin:/home/charlie/pixhawk.oe/tmp/staging/i686-linux/usr/bin:/home/charlie/pixhawk.oe/tmp/cross/armv7a/bin:/home/charlie/pixhawk.oe/tmp/staging/i686-linux/sbin:/home/charlie/pixhawk.oe/tmp/staging/i686-linux/bin:/home/charlie/pixhawk.oe/bitbake/bin:/home/charlie/pixhawk.oe/bitbake/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games; git fetch git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap-2.6.git master failed with signal 128, output:
fatal: Not a git repository

ERROR: TaskFailed event exception, aborting
ERROR: Build of /home/charlie/pixhawk.oe/org.openembedded.dev/recipes/linux/linux-omap3_2.6.29.bb do_fetch failed
ERROR: Task 1010 (/home/charlie/pixhawk.oe/org.openembedded.dev/recipes/linux/linux-omap3_2.6.29.bb, do_fetch) failed
NOTE: Tasks Summary: Attempted 1037 tasks of which 1032 didn't need to be rerun and 1 failed.
ERROR: '/home/charlie/pixhawk.oe/org.openembedded.dev/recipes/linux/linux-omap3_2.6.29.bb' failed

Any ideas on how to address this?

Charlie


      


