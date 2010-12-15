Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <obi@opendreambox.org>) id 1PSv1G-0003A6-3J
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Dec 2010 18:20:02 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id ADD8D314BAE7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Dec 2010 18:18:24 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id DldOldeXvQZC
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Dec 2010 18:18:20 +0100 (CET)
Received: from [172.22.22.60] (ip-109-90-189-193.unitymediagroup.de
	[109.90.189.193])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.multimedia-labs.de (Postfix) with ESMTPSA id 0B9A7314BAEA
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Dec 2010 18:18:20 +0100 (CET)
Message-ID: <4D08F85B.30407@opendreambox.org>
Date: Wed, 15 Dec 2010 18:18:19 +0100
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1292416949-688-1-git-send-email-otavio@ossystems.com.br>	<1292417425-1328-1-git-send-email-otavio@ossystems.com.br>	<20101215130120.GB3238@jama>	<AANLkTin_QS4A+UM2Oj3K82i+rtC4Qd_aD=oTDQ3iZB7q@mail.gmail.com>
	<AANLkTikSQRgPsWPx2D8kc78T=gyK6HcQxfsDxzwy9_7J@mail.gmail.com>
In-Reply-To: <AANLkTikSQRgPsWPx2D8kc78T=gyK6HcQxfsDxzwy9_7J@mail.gmail.com>
X-SA-Exim-Connect-IP: 82.149.226.172
X-SA-Exim-Mail-From: obi@opendreambox.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] classes/gitpv.bbclass: use 'git describe' to for package version
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
X-List-Received-Date: Wed, 15 Dec 2010 17:20:02 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 12/15/2010 05:36 PM, Otavio Salvador wrote:
> On Wed, Dec 15, 2010 at 12:27, Otavio Salvador <otavio@ossystems.com.br> wrote:
>> about assign to PV ?= I agree however why someone might want to use it
>> only in PKGV?
> 
> ?= doesn't seem to work. PV is preset so it won't override it.
> 

How about PV .= "${@get_git_pv(d)}"?



