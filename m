Return-Path: <olof.johansson@axis.com>
Received: from ra.se.axis.com (ra.se.axis.com [195.60.68.13])
	by mail.openembedded.org (Postfix) with ESMTP id 46A016C04D
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Sep 2013 15:54:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by ra.se.axis.com (Postfix) with ESMTP id 02F71349616
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Sep 2013 17:54:54 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at ra.se.axis.com
Received: from ra.se.axis.com ([127.0.0.1])
	by localhost (ra.se.axis.com [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id X799djSwE2BM
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Sep 2013 17:54:53 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by ra.se.axis.com (Postfix) with ESMTP id EC65834960D
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Sep 2013 17:54:52 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id CE70A71C
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Sep 2013 17:54:52 +0200 (CEST)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
	by boulder.se.axis.com (Postfix) with ESMTP id C3318218
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Sep 2013 17:54:52 +0200 (CEST)
Received: from xmail2.se.axis.com (xmail2.se.axis.com [10.0.5.74])
	by thoth.se.axis.com (Postfix) with ESMTP id C1B563404E
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Sep 2013 17:54:52 +0200 (CEST)
Received: from axis.com (10.92.17.1) by xmail2.se.axis.com (10.0.5.74) with
	Microsoft SMTP Server (TLS) id 8.2.255.0; Tue, 3 Sep 2013 17:54:52 +0200
Date: Tue, 3 Sep 2013 17:54:51 +0200
From: Olof Johansson <olof.johansson@axis.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Message-ID: <20130903155450.GE12638@axis.com>
References: <1378222415-13643-1-git-send-email-erp@movis.dk>
	<20130903154414.GD12638@axis.com> <522604DB.4040602@movis.dk>
MIME-Version: 1.0
In-Reply-To: <522604DB.4040602@movis.dk>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-perl] libwww-perl_5.834: added
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
X-List-Received-Date: Tue, 03 Sep 2013 15:54:56 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On 13-09-03 17:48 +0200, Emil R. Petersen wrote:
> Oh? Well I wouldn't have added them if I thought they were core modules.
> 
> MIME::Base64 has it's own CPAN entry: 
> https://metacpan.org/release/MIME-Base64

Many of the core modules have a dual life, both in core and on
CPAN.

> And does not appear, immediately, to be part of the core distribution?

There's a command called "corelist" that is really useful to
determine if a module is core or not. Not only does it say if its
core or not, but also what perl version introduced it as a core
module.

$ corelist MIME::Base64

MIME::Base64 was first released with perl v5.7.3


Regards,
-- 
olofjn

