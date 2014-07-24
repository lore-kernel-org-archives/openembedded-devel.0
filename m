Return-Path: <dv@pseudoterminal.org>
X-Greylist: delayed 445 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 24 Jul 2014 12:00:14 UTC
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 359347054E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Jul 2014 12:00:14 +0000 (UTC)
Received: from [10.1.14.248] (vpn.streamunlimited.com [91.114.0.140])
	by ptmx.org (Postfix) with ESMTPSA id 6714E30203
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Jul 2014 13:52:47 +0200 (CEST)
Message-ID: <53D0F38E.2040209@pseudoterminal.org>
Date: Thu, 24 Jul 2014 13:52:46 +0200
From: Carlos Rafael Giani <dv@pseudoterminal.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: git directory in WORKDIR question
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
X-List-Received-Date: Thu, 24 Jul 2014 12:00:18 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

When I use a git:// URL in SRC_URI , that git repository is cloned over 
to the WORKDIR , and ends up in a directory called "git".
In other words, the sources are at $WORKDIR/git .

Can I instruct OE to use another name? Like, $WORKDIR/my_name instead of 
$WORKDIR/git ?

cheers

