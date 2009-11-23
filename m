Received: from emailgateway.hillcrestlabs.com ([12.173.51.132])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Chris.Conroy@hillcrestlabs.com>) id 1NCaqM-0007lv-Rg
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Nov 2009 16:28:50 +0100
X-AuditID: 0a1e000a-b7b8cae000000d7b-4c-4b0aa9d54567
From: Chris Conroy <Chris.Conroy@hillcrestlabs.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1258901140-30575-1-git-send-email-bernhard.kaindl@gmx.net>
References: <1258901140-30575-1-git-send-email-bernhard.kaindl@gmx.net>
Date: Mon, 23 Nov 2009 10:26:48 -0500
Message-Id: <1258990008.8426.29.camel@conroy-linux>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.1 
X-Brightmail-Tracker: AAAAAA==
X-SA-Exim-Connect-IP: 12.173.51.132
X-SA-Exim-Mail-From: Chris.Conroy@hillcrestlabs.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] external-toolchain: Really accept toolchains built by meta-toolchain.bb
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
X-List-Received-Date: Mon, 23 Nov 2009 15:28:50 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sun, 2009-11-22 at 15:45 +0100, Bernhard Kaindl wrote:
> external-toolchain-generic,
> external-toolchain:
> 
> * The current external-toolchain recipes which are documented to accept
>   toolchains built by meta-toolchain actually do not accept such because
>   they expect ${prefix}/package-status to exist which is provieded by
>   the poky toolchains but not the current OE meta-toolchain package.
> 
>   Fix this by also looking for ${prefix}/usr/lib/opkg/status, which is the
>   package-status file of the OE meta-toolchain package.
> 
> * Also change the error message which is shown when neither file is found
>   more explicit.

What about changing the meta-toolchain to generate the environment-setup
script? While it's not important to have the script for normal building
of packages, I've found it helpful to be able to do a quick compile of a
test program here or there. Though, I understand that it might be
dangerous since some folks might think the environment-setup creates an
an entire cross building platform for them when they really want to stay
inside OE....

--Chris


