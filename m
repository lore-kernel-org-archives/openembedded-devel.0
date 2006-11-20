Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <openembedded@hrw.one.pl>) id 1Gm5bn-0004BM-UH
	for openembedded-devel@openembedded.org; Mon, 20 Nov 2006 10:38:36 +0100
Received: (qmail 21358 invoked by uid 813007); 20 Nov 2006 09:35:56 -0000
X-clamdmail: clamdmail 0.18a
Received: from v813.rev.tld.pl (HELO ?192.168.1.90?)
	(marcin@hrw.one.pl@195.149.226.213)
	by smtp.host4.kei.pl with ESMTPA; 20 Nov 2006 09:35:56 -0000
From: Marcin Juszkiewicz <openembedded@hrw.one.pl>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Nov 2006 10:35:54 +0100
User-Agent: KMail/1.9.5
References: <1163904090.7453.9.camel@inkdev>
In-Reply-To: <1163904090.7453.9.camel@inkdev>
Organization: OpenEmbedded
MIME-Version: 1.0
Message-Id: <200611201035.55298.openembedded@hrw.one.pl>
Subject: Re: Failure building hostap-modules-0.4.7
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
X-List-Received-Date: Mon, 20 Nov 2006 09:38:36 -0000
Content-Type: text/plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia niedziela, 19 listopada 2006 03:41, Peter Bell napisa=B3:

> I've just started trying to use oe, and am attempting to build a
> distribution for the Freescale MX31ADS development board.

Please update your metadata and rebuild. I removed 'hostap-modules'=20
dependency from 'hostap-utils' so your config should be buildable.

Revision: e7c3c58ffc25bb74008c4dda3d77ba4eae16e8f0
Ancestor: 73d70f59f2e6cdd251e1e656d513bb2feb1a7656
Author: hrw@openembedded.org
Date: 2006-11-20T09:29:50
Branch: org.openembedded.dev

Modified files:
        packages/hostap/hostap-utils.inc
        packages/hostap/hostap-utils_0.3.7.bb
        packages/hostap/hostap-utils_0.4.0.bb

ChangeLog:

hostap-utils: removed rrecommending hostap-modules
=2D most of our target devices run kernels newer then 2.6.14 so they have
  hostap modules from kernel as kernel-module-hostap*
=2D hostap modules and utils are now both added into dependency of task-base
  for machines with pcmcia or pci feature

=2D-=20
JID: hrw-jabber.org
OpenEmbedded developer/consultant

           Despair is just another word for 'not enough coffee'=20
           		Wally




