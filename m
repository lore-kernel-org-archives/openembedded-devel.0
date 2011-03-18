Received: from familie-heinold.de
	([85.214.48.103] helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1Q0bQg-0007C3-I0
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Mar 2011 16:21:11 +0100
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 2723C11000BA
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Mar 2011 16:15:15 +0100 (CET)
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 7F9B811000A8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Mar 2011 16:15:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.1
Received: from rhein.familie-heinold.de (g225075198.adsl.alicedsl.de
	[92.225.75.198]) by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Mar 2011 16:15:11 +0100 (CET)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id CF9343C0BB; Fri, 18 Mar 2011 16:14:35 +0100 (CET)
Date: Fri, 18 Mar 2011 16:14:35 +0100
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110318151435.GA31039@mail.familie-heinold.de>
References: <1293311973.4089.26.camel@mattotaupa>
	<1300451882.3830.54.camel@mattotaupa>
MIME-Version: 1.0
In-Reply-To: <1300451882.3830.54.camel@mattotaupa>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: [PATCH] xbmc: add `libass` to `DEPENDS`
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
X-List-Received-Date: Fri, 18 Mar 2011 15:21:11 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Paul,

the problem is this

do_configure() {
        if [ -e bootstrap.angstrom ] ; then
                sh bootstrap.angstrom
        else
                sh bootstrap
        fi
        oe_runconf
}


which prevents the autoreconf run and so the regenerating of libtool stuff, which results
in that the configure option --with-sysrootdir is not available. I cannt see how
your patch is fixing that.

Bye Henning


