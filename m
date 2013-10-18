Return-Path: <olof.johansson@axis.com>
Received: from ra.se.axis.com (ra.se.axis.com [195.60.68.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9D39C6CD55
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Oct 2013 10:04:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by ra.se.axis.com (Postfix) with ESMTP id 12A8911F04
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Oct 2013 12:04:33 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at ra.se.axis.com
Received: from ra.se.axis.com ([127.0.0.1])
	by localhost (ra.se.axis.com [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 7iraPy9Hq97U
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Oct 2013 12:04:32 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by ra.se.axis.com (Postfix) with ESMTP id 7B004384EE2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Oct 2013 12:04:32 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 618BCA1B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Oct 2013 12:04:32 +0200 (CEST)
Received: from seth.se.axis.com (seth.se.axis.com [10.0.2.172])
	by boulder.se.axis.com (Postfix) with ESMTP id 563CD1FF
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Oct 2013 12:04:32 +0200 (CEST)
Received: from xmail2.se.axis.com (xmail2.se.axis.com [10.0.5.74])
	by seth.se.axis.com (Postfix) with ESMTP id 549A53E06F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Oct 2013 12:04:32 +0200 (CEST)
Received: from axis.com (10.92.17.1) by xmail2.se.axis.com (10.0.5.74) with
	Microsoft SMTP Server (TLS) id 8.2.255.0;
	Fri, 18 Oct 2013 12:04:31 +0200
Date: Fri, 18 Oct 2013 12:04:30 +0200
From: Olof Johansson <olof.johansson@axis.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Message-ID: <20131018100430.GQ20888@axis.com>
References: <1382081248-6370-1-git-send-email-olof.johansson@axis.com>
	<5260F68B.6090403@communistcode.co.uk>
	<20131018094408.GA21192@jama>
MIME-Version: 1.0
In-Reply-To: <20131018094408.GA21192@jama>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH] rsyslog: fix dependency name (json-c => libjson)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 18 Oct 2013 10:04:32 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Oct 18, 2013 at 09:51:23AM +0100, Jack Mitchell wrote:
> The rsyslogd patches shouldn't really have gone in yet... I've fired off
> a patch to oe-core to update libjson to the now named json-c, so if we
> could hold off for a few days that would be great. Otherwise, maybe
> temporarily revert the rsyslogd patches?

Ah, I didn't notice those patches. I see!


On 13-10-18 11:44 +0200, Martin Jansa wrote:
> Sorry about that, I was testing them together with json-c patch, so I
> haven't noticed, can we temporary take this patch and then revert it
> when (and if) libjson is renamed in oe-core (assuming that newer rsyslog
> works with older libjson-0.9.

Either way is fine by me. I can fix it locally for us until the
rename hits oecore.


Thanks,
-- 
olofjn

