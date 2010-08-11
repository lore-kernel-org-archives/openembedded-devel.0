Received: from p3plsmtpa01-02.prod.phx3.secureserver.net ([72.167.82.82])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <mike@mwester.net>) id 1Oj2dF-0004dz-OT
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Aug 2010 06:09:39 +0200
Received: (qmail 26795 invoked from network); 11 Aug 2010 04:02:44 -0000
Received: from unknown (209.242.7.184)
	by p3plsmtpa01-02.prod.phx3.secureserver.net (72.167.82.82) with ESMTP;
	11 Aug 2010 04:02:44 -0000
Message-ID: <4C6220E9.50005@mwester.net>
Date: Tue, 10 Aug 2010 23:02:49 -0500
From: Mike Westerhof <mike@mwester.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.8.1.24) Gecko/20100228 Thunderbird/2.0.0.24 Mnenhy/0.7.6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4C61E523.7070405@gmail.com>
In-Reply-To: <4C61E523.7070405@gmail.com>
X-SA-Exim-Connect-IP: 72.167.82.82
X-SA-Exim-Mail-From: mike@mwester.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] Mass convert PREFERRED_VERSION_* to be weakly assigned.
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
X-List-Received-Date: Wed, 11 Aug 2010 04:09:39 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Graham Gower wrote:
> find conf -type f -exec sed -i -e 's/^PREFERRED_VERSION_\([^ \t]*\)\([ \t]*\)=/PREFERRED_VERSION_\1\2?=/' {} \;
> 
> Signed-off-by: Graham Gower <graham.gower@gmail.com>
> ---
>  conf/distro/amsdelta-oe.conf                       |    2 +-
>  conf/distro/angstrom-2008.1.conf                   |   10 +-
>  conf/distro/celinux-test.conf                      |   14 +-
>  conf/distro/chinook-compat.conf                    |  128 ++--
>  conf/distro/foonas.conf                            |    8 +-
>  conf/distro/gmustix.conf                           |   16 +-
>  .../include/angstrom-2008-preferred-versions.inc   |  114 ++--
>  ...gstrom-codec-engine-2.25-preferred-versions.inc |   22 +-
>  ...rom-codec-engine-2.25.01-preferred-versions.inc |   66 +-
>  ...rom-codec-engine-2.25.02-preferred-versions.inc |   66 +-
>  ...trom-codec-engine-latest-preferred-versions.inc |   66 +-
>  ...-engine-latestproduction-preferred-versions.inc |   66 +-
>  conf/distro/include/angstrom-jalimo.conf           |   20 +-
>  .../include/kaeilos-2009-preferred-versions.inc    |  116 ++--
>  conf/distro/include/maemo-preferred.inc            |   12 +-
>  conf/distro/include/oplinux.inc                    |    2 +-
>  conf/distro/include/preferred-gpe-versions-2.7.inc |    2 +-
>  conf/distro/include/preferred-om-2009-versions.inc |   54 +-
>  .../distro/include/preferred-opie-cvs-versions.inc |    2 +-
>  .../include/preferred-opie-versions-1.2.3.inc      |  384 ++++++------
>  .../include/preferred-opie-versions-1.2.4.inc      |  382 ++++++------
>  conf/distro/include/preferred-opie-versions.inc    |  382 ++++++------
>  conf/distro/include/preferred-shr-versions.inc     |   74 ++--
>  conf/distro/include/preferred-slugos-versions.inc  |    2 +-

NAK.  Please read the comments around that change in
preferred-slugos-versions.inc; it is required in order to override the
machine conf file's selection of the kernel.

-Mike (mwester)


