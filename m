Received: from exprod5og112.obsmtp.com ([64.18.0.24])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martyn.welch@ge.com>) id 1Nte1k-0001UD-Ni
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Mar 2010 10:34:32 +0100
Received: from source ([12.43.191.1]) (using TLSv1) by
	exprod5ob112.postini.com ([64.18.4.12]) with SMTP
	ID DSNKS6c457/zh+J3RGg5zu8lF6Nw9/bJUVIy@postini.com;
	Mon, 22 Mar 2010 02:31:23 PDT
Received: from unknown (HELO alpmlip01.e2k.ad.ge.com) ([3.159.17.48])
	by Alpmlip08.e2k.ad.ge.com with ESMTP; 22 Mar 2010 05:31:18 -0400
Received: from es-j7s4d2j.amer.consind.ge.com ([3.138.54.92])
	by alpmlip01.e2k.ad.ge.com with ESMTP; 22 Mar 2010 05:31:18 -0400
From: Martyn Welch <martyn.welch@ge.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Mar 2010 09:34:33 +0000
Message-ID: <20100322092415.27540.53806.stgit@ES-J7S4D2J.amer.consind.ge.com>
User-Agent: StGIT/0.13
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 64.18.0.24
X-SA-Exim-Mail-From: martyn.welch@ge.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_MED autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [RFC] Enabling busybox-less builds
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
X-List-Received-Date: Mon, 22 Mar 2010 09:34:34 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

This patch series is my first attempt at providing a working busybox-less
build. I'd hoped to clean it up a bit more before posting this, but as hrw is
looking at this as well, I'll post it now for discussion.

To prototype this, we have created an alternative "busybox" package that,
rather than building a version of busybox, causes the build to depend on a
suite of other packages which provide the functionality provided in a standard
build by busybox. I'm sure this list isn't perfect, but it's working for us.

We had a bit of issue with the update-alternatives that we were using - it
seemed to need both of the alternatives in the same directory, hence some of
these patches moving the install location of apps around.

There is also a nasty cludge to provide the hwclock script that Marcin
identifed as a problem. I've been meaning to get the alternative busybox script
to provide this, but haven't got arround to it yet.

We also replaced ifupdown with the ubuntu version, it seems to be a little
different from the debian version and it resolved some issues for us.

Please let me know what you think,

Martyn

--
Martyn Welch (Principal Software Engineer)   |   Registered in England and
GE Intelligent Platforms                     |   Wales (3828642) at 100
T +44(0)127322748                            |   Barbirolli Square, Manchester,
E martyn.welch@ge.com                        |   M2 3AB  VAT:GB 927559189


