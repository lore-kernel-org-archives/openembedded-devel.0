Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1Qn9Qm-0002Mq-2E
	for openembedded-devel@lists.openembedded.org;
	Sat, 30 Jul 2011 15:18:16 +0200
Received: (qmail invoked by alias); 30 Jul 2011 13:07:17 -0000
Received: from p4FDF1F3D.dip.t-dialin.net (EHLO localhost.localdomain)
	[79.223.31.61]
	by mail.gmx.net (mp054) with SMTP; 30 Jul 2011 15:07:17 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1+2RwYaaEG2nzFtDYnESJyCnKsRdwcnY5xkKzrmun
	sxQJt2uO//xsr7
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 30 Jul 2011 15:10:01 +0200
User-Agent: KMail/1.13.7 (Linux/2.6.35.13-92.fc14.x86_64; KDE/4.6.5; x86_64; ;
	)
MIME-Version: 1.0
Message-Id: <201107301510.01746.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: [RFC] oe style-guide change
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
X-List-Received-Date: Sat, 30 Jul 2011 13:18:16 -0000
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

working on xfce I face a problem with our style-guide (and I think there are 
other packets affected too e.g gnome recipes?):

In the xfce.bbclass there is a SRC_URI created from recipe name. This fits for 
95% of the recipes. Following style-guide [1] I would add patches by writing 
something like

SRC_URI += "foo.patch"
inherit xfce

Problem is that xfce.bbclass sets SRC_URI with

SRC_URI  = ...

Since I want to give recipes the chance to overwrite the suggestion coming from 
xfce.bbclass ( e.g thunar souce starts with capital letter ) I cannot write 
something like

SRC_URI =+ ..

in xfce.bbclass.

Therfore I suggest to have the style-guide changed so that we have

inherit ... 
SRC_URI
S

What do our gurus think about this?

Andreas

[1] http://wiki.openembedded.org/index.php/Styleguide


