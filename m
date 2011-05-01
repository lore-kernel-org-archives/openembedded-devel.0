Received: from ibawizard.net
	([82.208.49.253] helo=mengele.ibawizard.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ynezz@mengele.ibawizard.net>) id 1QGaVs-0006jf-J1
	for openembedded-devel@lists.openembedded.org;
	Sun, 01 May 2011 19:32:56 +0200
Received: by mengele.ibawizard.net (Postfix, from userid 1002)
	id 3B9131D360AA; Sun,  1 May 2011 19:30:16 +0200 (CEST)
Date: Sun, 1 May 2011 19:30:15 +0200
From: Petr =?iso-8859-2?Q?=A9tetiar?= <ynezz@true.cz>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110501173015.GI27708@ibawizard.net>
References: <1304243449-12028-1-git-send-email-heroor@ti.com>
MIME-Version: 1.0
In-Reply-To: <1304243449-12028-1-git-send-email-heroor@ti.com>
User-Agent: Mutt/1.5.18 (2008-05-17)
Cc: Siddharth Heroor <heroor@ti.com>
Subject: Re: [PATCH 1/2] zeromq: Add zeromq socket library.
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
X-List-Received-Date: Sun, 01 May 2011 17:32:56 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Siddharth Heroor <heroor@gmail.com> [2011-05-01 15:20:48]:

Hi,

> +PR = "r1"
> +
> +SRC_URI = "http://download.zeromq.org/zeromq-${PV}.tar.gz"
> +
> +inherit autotools

for version 2.1.1 I've needed also the following:

	DEPENDS += "util-linux-ng"

	do_configure_prepend() {
        	./autogen.sh
	}

It's not needed anymore?

-- ynezz


