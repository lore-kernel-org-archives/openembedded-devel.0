Return-Path: <olof.johansson@axis.com>
Received: from anubis.se.axis.com (anubis.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 498886E987
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Jan 2014 17:27:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by anubis.se.axis.com (Postfix) with ESMTP id AD8211A0EE
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Jan 2014 18:27:09 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at anubis.se.axis.com
Received: from anubis.se.axis.com ([127.0.0.1])
	by localhost (anubis.se.axis.com [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id TYN+zgwWAeE3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Jan 2014 18:27:07 +0100 (CET)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by anubis.se.axis.com (Postfix) with ESMTP id 8832E1A0F7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Jan 2014 18:26:49 +0100 (CET)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 69FB3A0B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Jan 2014 18:26:49 +0100 (CET)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
	by boulder.se.axis.com (Postfix) with ESMTP id 5F11F9D3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Jan 2014 18:26:49 +0100 (CET)
Received: from xmail2.se.axis.com (xmail2.se.axis.com [10.0.5.74])
	by thoth.se.axis.com (Postfix) with ESMTP id 5DA823404E
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Jan 2014 18:26:49 +0100 (CET)
Received: from axis.com (10.92.17.1) by xmail2.se.axis.com (10.0.5.74) with
	Microsoft SMTP Server (TLS) id 8.2.255.0;
	Fri, 31 Jan 2014 18:26:49 +0100
Date: Fri, 31 Jan 2014 18:26:48 +0100
From: Olof Johansson <olof.johansson@axis.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Message-ID: <20140131172647.GE23583@axis.com>
References: <1391181100-32525-1-git-send-email-ticotimo@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1391181100-32525-1-git-send-email-ticotimo@gmail.com>
Thread-Topic: [oe] [meta-perl][PATCH 1/9] perl-module-metadata: add 1.000019
Accept-Language: en-US, sv-SE
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [meta-perl][PATCH 1/9] perl-module-metadata: add 1.000019
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
X-List-Received-Date: Fri, 31 Jan 2014 17:27:14 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
Content-Language: en-US

On 14-01-31 16:11 +0100, Tim Orling wrote:
> This module provides a standard way to gather metadata about a
> .pm file through (mostly) static analysis and (some) code
> execution. When determining the version of a module, the
> $VERSION assignment is "eval"ed, as is traditional in the CPAN
> toolchain.

For me, it seems strange to skip out the first part of the module
name, just because it's part of the recipe perl-module- prefix. I
agree it's a bit ugly to call it perl-module-module-metadata, but
I think it would cause less confusion.

On the other hand, the naming convention within meta-perl seems
to be consistently lib<module name>-perl, like it is in Debian.
Same for oecore, except the core modules provided by the perl
recipe. This would make the proper name for this recipe be
libmodule-metadata-perl. Why use the perl-module- prefix?

Regards,
-- 
olofjn

