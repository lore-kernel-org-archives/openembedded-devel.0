Received: from mail.altenpts.nl ([195.86.56.45])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <bberg@mail.altenpts.nl>) id 1OoaxF-0001Nc-Nl
	for openembedded-devel@lists.openembedded.org;
	Thu, 26 Aug 2010 13:49:16 +0200
Received: from [89.146.6.202] ([89.146.6.202]) by mail.altenpts.nl
	for openembedded-devel@lists.openembedded.org;
	Thu, 26 Aug 2010 13:18:49 +0200
From: "Bas van den Berg" <bberg@mail.altenpts.nl>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100826111849.bf99cfff@mail.altenpts.nl>
Date: Thu, 26 Aug 2010 13:18:49 +0200
X-User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.8) Gecko/20100723 Ubuntu/10.04 (lucid) Firefox/3.6.8
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 195.86.56.45
X-SA-Exim-Mail-From: bberg@mail.altenpts.nl
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: stripping qt4-embedded
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
X-List-Received-Date: Thu, 26 Aug 2010 11:49:16 -0000
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

when building qt4-embedded, you get a lot of stuff by default:
        qt4-embedded-examples
        qt4-embedded-demos
       libqtwebkite4
          libqt... (many)

I tried changing the recipe to get rid of these, but to no effect. The rec=
ipes for
qt4 seems to be the most complex of all recipes ;], so no wonder..
Would the EXCLUDE like in the toolchain recipes work for qt4-embedded?
From fransmeulenbroeks@gmail.com Thu Aug 26 13:50:26 2010
Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OoayQ-00030D-0S
	for openembedded-devel@lists.openembedded.org;
	Thu, 26 Aug 2010 13:50:26 +0200
Received: by ywa8 with SMTP id 8so668327ywa.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Aug 2010 04:49:51 -0700 (PDT)
DKIM-Signature: v
