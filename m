Received: from smtp.cbnco.com ([207.164.182.72])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <msmith@cbnco.com>) id 1OIlZH-0005oq-SW
	for openembedded-devel@lists.openembedded.org;
	Sun, 30 May 2010 18:40:57 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 3C43C6DD341
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 30 May 2010 12:27:45 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 30247-04 for <openembedded-devel@lists.openembedded.org>; 
	Sun, 30 May 2010 12:27:45 -0400 (EDT)
Received: from juice.ott.cti.com (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTPSA id 19D106DD2BC
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 30 May 2010 12:27:45 -0400 (EDT)
Date: Sun, 30 May 2010 12:27:45 -0400 (EDT)
From: Michael Smith <msmith@cbnco.com>
X-X-Sender: michael@juice.ott.cti.com
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <A24693684029E5489D1D202277BE89445316FB3A@dlee02.ent.ti.com>
Message-ID: <Pine.LNX.4.64.1005301226590.27172@juice.ott.cti.com>
References: <A24693684029E5489D1D202277BE89445316FB3A@dlee02.ent.ti.com>
MIME-Version: 1.0
X-Virus-Scanned: amavisd-new at cbnco.com
X-SA-Exim-Connect-IP: 207.164.182.72
X-SA-Exim-Mail-From: msmith@cbnco.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Examples of srctree and gitver
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
X-List-Received-Date: Sun, 30 May 2010 16:40:57 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Sun, 30 May 2010, Ambrose, Martin wrote:

> Are there any recipes/examples which use these classes?

Hi Martin,

I think you'll find srctree used mostly in out-of-tree stuff. Here's a 
sample.

inherit srctree gitver

# Strip off the leading 'v' from the Linux kernel git tags
GITVER_NO_V = "${@'${GITVER}'[1:]}"
PV = "${GITVER_NO_V}"

# Clean up between builds for different architectures
do_configure() {
    oe_runmake clean
}

do_compile() {
    oe_runmake
}

do_install() {
    # ...
}



Mike


