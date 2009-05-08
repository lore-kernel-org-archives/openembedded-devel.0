Received: from [83.222.23.61] (helo=relay1.mail.masterhost.ru)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1M2ISd-0006t4-Ly
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 May 2009 07:17:29 +0200
Received: from [UNAVAILABLE] ([84.17.11.114] helo=mate.localnet)
	by relay1.mail.masterhost.ru with esmtp 
	envelope from <khimov@altell.ru> authenticated with rik@osrc.info
	message id 1M2IMd-000CpE-9m
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 May 2009 09:11:15 +0400
From: Roman I Khimov <khimov@altell.ru>
Organization: Altell Ltd.
To: openembedded-devel@lists.openembedded.org
Date: Fri, 8 May 2009 09:11:10 +0400
User-Agent: KMail/1.11.2 (Linux/2.6.29; KDE/4.2.2; x86_64; ; )
References: <be7a9f3d0904270832j4832bc6fqcf058fdfc3d8479@mail.gmail.com>
	<1241079609-5912-4-git-send-email-khimov@altell.ru>
	<f96d234e0905071458l22022a9gd5b7e77a4607c3c0@mail.gmail.com>
In-Reply-To: <f96d234e0905071458l22022a9gd5b7e77a4607c3c0@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <200905080911.10487.khimov@altell.ru>
Subject: Re: [PATCH 4/4] remove install-native package
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
X-List-Received-Date: Fri, 08 May 2009 05:17:32 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Friday 08 May 2009 01:58:24 Cliff Brake wrote:
> We have run into several problems that may be related to this patch.
>
> bitbake libart-lgpl fails on a clean build with following message:

Please try either removing

export INSTALL = "${STAGING_BINDIR_NATIVE}/install-sh"

from recipe (recipes/gnome/libart-lgpl.inc), or setting it like this

export INSTALL = "${STAGING_BINDIR_NATIVE}/install"


