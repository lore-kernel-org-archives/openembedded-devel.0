Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1PewJE-0000ZB-Pf
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 Jan 2011 22:08:16 +0100
Received: (qmail invoked by alias); 17 Jan 2011 21:07:38 -0000
Received: from p5DE49076.dip.t-dialin.net (EHLO localhost.localdomain)
	[93.228.144.118]
	by mail.gmx.net (mp023) with SMTP; 17 Jan 2011 22:07:38 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX19rOL4AwWdrrHoT/fWdxEx5T1y4yOM4o7qClBLL1X
	VqdsFShcm4mP4x
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 17 Jan 2011 23:06:55 +0100
User-Agent: KMail/1.13.2 (Linux/2.6.34.7-56.fc13.i686.PAE; KDE/4.4.5; i686; ; )
References: <1295283968-2540-1-git-send-email-schnitzeltony@gmx.de>
	<AANLkTi=5rSdha0uH7QwETJaGo2TF_yY6GZL-iBgw4vZ4@mail.gmail.com>
In-Reply-To: <AANLkTi=5rSdha0uH7QwETJaGo2TF_yY6GZL-iBgw4vZ4@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <201101172306.55123.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: Re: [PATCH] clutter: configure all libs with "--disable-introspection"
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
X-List-Received-Date: Mon, 17 Jan 2011 21:08:16 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit

On Monday 17 January 2011 21:15:17 Khem Raj wrote:
> why do we need to disable it you did not explain

sorry but 

1. it is for the same reason as for all the other recipes disabling gobject-introspection: gobject-introspection does not cross-build.
2. As soon as gobject-introspection-native was built, all the clutter stuff fails to configure.

Do you wish a patch with updated description?

Regards

Andreas


