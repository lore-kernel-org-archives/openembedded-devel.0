Return-Path: <tomas@novotny.cz>
Received: from kazi.fit.vutbr.cz (kazi.fit.vutbr.cz [147.229.8.12])
	by mail.openembedded.org (Postfix) with ESMTP id 087526F7D8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Mar 2014 09:08:22 +0000 (UTC)
Received: from pcnovotny-t.fit.vutbr.cz (pcnovotny-t.fit.vutbr.cz
	[147.229.13.172]) (authenticated bits=0)
	by kazi.fit.vutbr.cz (8.14.7/8.14.6) with ESMTP id s2D98LnS054989
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Mar 2014 10:08:22 +0100 (CET)
Date: Thu, 13 Mar 2014 10:08:33 +0100
From: Tomas Novotny <tomas@novotny.cz>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140313100833.1910da0b@pcnovotny-t.fit.vutbr.cz>
X-Mailer: Claws Mail 3.9.2 (GTK+ 2.24.22; x86_64-suse-linux-gnu)
Mime-Version: 1.0
X-Scanned-By: MIMEDefang 2.74 on 147.229.8.12
Subject: Correct versioning of unversioned source in git
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 13 Mar 2014 09:08:26 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

	Hi all,

there is a recipe sunxi-board-fex in meta-sunxi layer. That recipe fetches
sources from unversioned git which contains definitions of some boards (in
fact it is something like a store).
	I'm not sure with correct versioning in OE. Is that:
PV = "1.0+git${SRCPV}"
SRCREV = "<some_gitrev_I_want>"
correct? Will be change of SRCREV (only) catched by build system (I'm curious
how OE handles age of the rev in git)?
	Or do I need to raise PV to 1.1 and so on with every change to SRCREV?
	Thanks,

	Tomas

