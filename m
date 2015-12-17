Return-Path: <oliver.staebler@bytesatwork.ch>
X-Greylist: delayed 519 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 17 Dec 2015 16:56:34 UTC
Received: from bytesatwork.ch (bytesatwork.ch [91.135.72.15])
	by mail.openembedded.org (Postfix) with ESMTP id EDE17605BB
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Dec 2015 16:56:34 +0000 (UTC)
Received: from stanley.bytesatwork.ch (unknown [95.143.48.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested) (Authenticated sender: oliver)
	by bytesatwork.ch (Postfix) with ESMTPSA id BF9FE180009F;
	Thu, 17 Dec 2015 17:47:32 +0100 (CET)
Date: Thu, 17 Dec 2015 17:48:16 +0100
From: Oliver =?utf-8?Q?St=C3=A4bler?= <oliver.staebler@bytesatwork.ch>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20151217164816.GA25851@stanley.bytesatwork.ch>
MIME-Version: 1.0
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Oliver St=E4bler <oliver.staebler@bytesatwork.ch>
Subject: [meta-webserver] nginx adds user but runs under another
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 17 Dec 2015 16:56:35 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi

The recipe for nginx creates a new user via useradd called 'www'.
But the nginx.conf configures the user to 'www-data'.

So, the nginx recipe does create a user but the binary runs under another user.

Is there a reason for this or is this a bug?

Thanks & Regards
Oliver

-- 
bytes at work
Technoparkstrasse 7
CH-8406 Winterthur
Switzerland

phone: +41 52 213 79 79

