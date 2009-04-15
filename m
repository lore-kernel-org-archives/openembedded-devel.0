Received: from [85.199.173.110] (helo=mx51.mymxserver.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <hs4233@mail.mn-solutions.de>) id 1Ltz4S-00043p-C7
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Apr 2009 08:58:10 +0200
Received: from localhost (localhost [127.0.0.1])
	by localhost.mx51.mymxserver.com (Postfix) with ESMTP id 7BB773A005;
	Wed, 15 Apr 2009 08:54:23 +0200 (CEST)
X-Virus-Scanned: by Mittwald Mailscanner
Received: from mx51.mymxserver.com ([127.0.0.1])
	by localhost (mx51.mymxserver.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wFyvykby4BFr; Wed, 15 Apr 2009 08:54:23 +0200 (CEST)
Received: from lin01.mn-solutions.de (pD95F99E0.dip0.t-ipconnect.de
	[217.95.153.224])
	by mx51.mymxserver.com (Postfix) with ESMTP id 2D4A03A003;
	Wed, 15 Apr 2009 08:54:23 +0200 (CEST)
Received: by lin01.mn-solutions.de (Postfix, from userid 116)
	id B6D651E02E6; Wed, 15 Apr 2009 08:54:22 +0200 (CEST)
Received: from mnz66.mn-solutions.de (mnz66.mn-solutions.de [192.168.233.66])
	by lin01.mn-solutions.de (Postfix) with ESMTP id 523201E0211;
	Wed, 15 Apr 2009 08:54:14 +0200 (CEST)
From: Holger Schurig <hs4233@mail.mn-solutions.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 15 Apr 2009 08:54:04 +0200
User-Agent: KMail/1.9.7
References: <20090414234609.GA27890@denix.org>
	<1239752998-7677-1-git-send-email-denis@denix.org>
	<gs3vuj$8tl$1@ger.gmane.org>
In-Reply-To: <gs3vuj$8tl$1@ger.gmane.org>
MIME-Version: 1.0
Message-Id: <200904150854.04328.hs4233@mail.mn-solutions.de>
X-SA-Exim-Connect-IP: 85.199.173.110
X-SA-Exim-Mail-From: hs4233@mail.mn-solutions.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=AWL,BAYES_00,RDNS_NONE
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@openembedded.org, Koen Kooi <k.kooi@student.utwente.nl>
Subject: Re: [PATCH] udev 124: add cache invalidation logic on kernel change or its bootargs/cmdline
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
X-List-Received-Date: Wed, 15 Apr 2009 06:58:10 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

> On 15-04-09 01:49, Denys Dmytriyenko wrote:
> > +			mv /tmp/uname /etc/uname
> > +			mv /tmp/cmdline /etc/cmdline
>
> I think we should put those in /etc/udev or /var/lib/udev if
> udev will be the only consumer.

+1, e.g.

/etc/udev/saved.uname
/etc/udev/saved.cmdline


