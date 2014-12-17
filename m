Return-Path: <olof.johansson@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4E96B7267C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Dec 2014 18:51:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 0D7E21807F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Dec 2014 19:51:19 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id SVD6g85B-GEx
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Dec 2014 19:51:13 +0100 (CET)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bastet.se.axis.com (Postfix) with ESMTP id D43F01802D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Dec 2014 19:51:13 +0100 (CET)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id B3BE41008
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Dec 2014 19:51:13 +0100 (CET)
Received: from seth.se.axis.com (seth.se.axis.com [10.0.2.172])
	by boulder.se.axis.com (Postfix) with ESMTP id A614BD5B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Dec 2014 19:51:13 +0100 (CET)
Received: from xmail2.se.axis.com (xmail2.se.axis.com [10.0.5.74])
	by seth.se.axis.com (Postfix) with ESMTP id A43D43E33A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Dec 2014 19:51:13 +0100 (CET)
Received: from lnxolofjn.se.axis.com (10.92.17.1) by xmail2.se.axis.com
	(10.0.5.74) with Microsoft SMTP Server id 8.3.342.0; Wed, 17 Dec 2014
	19:51:13 +0100
Received: by lnxolofjn.se.axis.com (Postfix, from userid 20466)	id 6A2E59C9F2; 
	Wed, 17 Dec 2014 19:51:13 +0100 (CET)
Date: Wed, 17 Dec 2014 19:51:13 +0100
From: Olof Johansson <olof.johansson@axis.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Message-ID: <20141217185113.GP18828@axis.com>
References: <1418662550-13436-1-git-send-email-akuster808@gmail.com>
	<548F8C66.5080005@windriver.com> <5490A9D4.8040806@gmail.com>
MIME-Version: 1.0
In-Reply-To: <5490A9D4.8040806@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-perl][PATCH 1/4] lib-perl: move package from meta-security to meta-perl
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
X-List-Received-Date: Wed, 17 Dec 2014 18:51:27 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On 14-12-16 22:53 +0100, akuster808 wrote:
> It looks like on cpan.org it is refereed to a just 'lib'.
> 
> I can rename it to that.

Even if it looks ugly, the consistent name would be liblib-perl
(lib${lower cased module namespace with - instead of ::}-perl)
and it would have my vote.

-- 
olofjn

