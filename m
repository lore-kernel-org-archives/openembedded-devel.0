Received: from [78.47.116.26] (helo=drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1MfTd6-0000jk-R8
	for openembedded-devel@lists.openembedded.org;
	Mon, 24 Aug 2009 09:06:12 +0200
Received: from andromeda.vanille.de (e180143051.adsl.alicedsl.de
	[85.180.143.51])
	by drlauer-research.com (Postfix) with ESMTP id 45415584627
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Aug 2009 09:27:44 +0200 (CEST)
From: "Michael 'Mickey' Lauer" <mickey@vanille-media.de>
Organization: Vanille-Media
To: openembedded-devel@lists.openembedded.org
Date: Mon, 24 Aug 2009 08:48:32 +0200
User-Agent: KMail/1.11.2 (Linux/2.6.28-15-generic; KDE/4.2.2; x86_64; ; )
References: <1251081101-18925-1-git-send-email-raj.khem@gmail.com>
	<200908240549.09079.holger+oe@freyther.de>
In-Reply-To: <200908240549.09079.holger+oe@freyther.de>
MIME-Version: 1.0
Message-Id: <200908240848.32719.mickey@vanille-media.de>
Subject: Re: [PATCH] base.bbclass: Replace os.system with subprocess call.
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
X-List-Received-Date: Mon, 24 Aug 2009 07:06:13 -0000
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

As a general reminder, please avoid import statements in functions. They're 
just wasting cycles. Put them into global scope.

:M:




