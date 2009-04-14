Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Ltp20-0001hz-0f
	for openembedded-devel@openembedded.org; Tue, 14 Apr 2009 22:15:00 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LtoyP-00081X-Jv
	for openembedded-devel@openembedded.org; Tue, 14 Apr 2009 20:11:14 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 14 Apr 2009 20:11:13 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 14 Apr 2009 20:11:13 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 14 Apr 2009 22:11:02 +0200
Message-ID: <gs2qkm$l47$1@ger.gmane.org>
References: <1239739518-1325-1-git-send-email-dhuggins@cs.cmu.edu>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b4pre) Gecko/20090407 Shredder/3.0b3pre
In-Reply-To: <1239739518-1325-1-git-send-email-dhuggins@cs.cmu.edu>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.2
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW, RDNS_NONE, SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] Supply uclibc-thread-db package expected by task-sdk-base
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
X-List-Received-Date: Tue, 14 Apr 2009 20:15:00 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14-04-09 22:05, David Huggins-Daines wrote:
> Currently, building task-sdk-base (and by extension meta-toolchain) fails
> for uclibc targets.  This is because task-sdk-base depends on the thread
> debugging library uclibc-thread-db, but this is not built by the uclibc
> recipe unless PTHREADS_DEBUG_SUPPORT is enabled.  In addition, once it is
> built, if you are using Debian version numbers, it will be helpfully
> renamed to "libthread-db1" and the build will still fail.

> +# uclibc-thread-db will get renamed to libthread-db1, which we do not want
> +DEBIANNAME_uclibc-thread-db = "uclibc-thread-db"

Actually we *do* want the rename, and OE is perfectly capable of 
including a renamed package in a task.

regards,

Koen



