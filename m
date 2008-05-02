Received: from [82.119.242.94] (helo=mail.suse.cz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1JrtGY-0004f5-W4
	for openembedded-devel@lists.openembedded.org;
	Fri, 02 May 2008 13:17:27 +0200
Received: from [10.20.1.86] (hammer.suse.cz [10.20.1.86])
	by mail.suse.cz (Postfix) with ESMTP id 076DA6280C2
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 May 2008 13:16:49 +0200 (CEST)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1209037940.21700.107.camel@hammer.suse.cz>
References: <1209037940.21700.107.camel@hammer.suse.cz>
Date: Fri, 02 May 2008 13:20:40 +0200
Message-Id: <1209727240.4120.34.camel@hammer.suse.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.0 
Subject: Re: brokenness of native builds by cross-compile site scripts
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10b4
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
X-List-Received-Date: Fri, 02 May 2008 11:17:27 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Stanislav Brabec wrote:

> I have just searching for reason, why a lot of native build started to
> fail with strange errors.
> 
> I started with debugging of glib-2.0-native:
> /bin/sh: line 6: 20886 Segmentation fault      ./glib-genmarshal --nostdinc --prefix=g_cclosure_marshal ./gmarshal.list --header >> xgen-gmh
> 
> Looking info config.log:
> configure:1952: loading site script /OE/org.openembedded.dev/site/endian-little

Problem (partially) solved:
CONFIG_SITE must not be set, when running bitbake.

I don't know, why native class does not reset it as expected.

I started a shell from inside the run_do... script several week ago,
forgot about it and started bitbake inside.

-- 
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



