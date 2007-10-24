Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <openembedded@haerwu.biz>) id 1Ikdx4-0008Rs-4G
	for openembedded-devel@openembedded.org; Wed, 24 Oct 2007 12:59:06 +0200
Received: (qmail 18043 invoked by uid 813007); 24 Oct 2007 10:51:50 -0000
X-clamdmail: clamdmail 0.18a
Received: from v813.rev.tld.pl (HELO home.lan)
	(marcin@hrw.one.pl@195.149.226.213)
	by smtp.host4.kei.pl with ESMTPA; 24 Oct 2007 10:51:49 -0000
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 24 Oct 2007 12:51:45 +0200
User-Agent: KMail/1.9.7
References: <20071024095844.GA9952@lenovo>
In-Reply-To: <20071024095844.GA9952@lenovo>
MIME-Version: 1.0
Message-Id: <200710241251.46156.openembedded@haerwu.biz>
Subject: Re: [doc] defining OpenEmbedded
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 24 Oct 2007 10:59:06 -0000
Content-Type: text/plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia =B6roda, 24 pa=BCdziernika 2007, David Farning napisa=B3:

> In the first case, the term local.conf implies a configuration file
> that makes a program work correctly on a local machine.  OE uses the
> file local.conf to define the top level build parameters for a bitbake
> build.  That is pretty confusing.  It would be more clear if
> local.conf was called build.conf.

But there are auto.conf, local.conf and site.conf which define=20
configuration for build. Common use is that site.conf contain=20
informations like DL_DIR, preferred mirrors for GNU/SourceForge/Debian,=20
amount of make and BitBake threads, local.conf contain informations=20
related to build (DISTRO and some addons like rm_work, tinderbox) and=20
auto.conf contain only MACHINE setting (so it can be regenerated from=20
shell).

> In the second case referring to OE as a collection of metadata is
> confusing.  Metadata is data about the data.  OE is actually a
> collection of patches, task lists, and configuration files.  I was
> wondering if it would be more clear to refer to oe as either a ruleset
> or task lists.

OE is not task lists - it defines them but also define many other things.=20
Ruleset sounds for me like other name of 'task list'.

=2D-=20
JID: hrw-jabber.org
OpenEmbedded developer/consultant

    I used to think the brain is the most wonderfull organ in my body,=20
    till I realised what was telling me that




