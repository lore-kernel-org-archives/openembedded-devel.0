Return-Path: <mail@webthatworks.it>
Received: from smtp205.alice.it (smtp205.alice.it [82.57.200.101])
	by mail.openembedded.org (Postfix) with ESMTP id EDCC776AE2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Oct 2015 19:48:18 +0000 (UTC)
Received: from caronte.home.webthatworks.it (87.9.24.216) by smtp205.alice.it
	(8.6.060.28)
	id 55F9735707F18C79 for openembedded-devel@lists.openembedded.org;
	Tue, 20 Oct 2015 21:48:17 +0200
Received: from dawn.webthatworks.it (dawn.home.webthatworks.it [192.168.1.12])
	by caronte.home.webthatworks.it (Postfix) with ESMTP id DE8146FE032F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Oct 2015 21:48:16 +0200 (CEST)
Received: from [IPv6:::1] (localhost [IPv6:::1])
	by dawn.webthatworks.it (Postfix) with ESMTP id D57941FE27
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Oct 2015 21:49:55 +0200 (CEST)
To: openembedded-devel@lists.openembedded.org
From: Ivan Sergio Borgonovo <mail@webthatworks.it>
X-Enigmail-Draft-Status: N1110
Organization: http://www.WebThatWorks.it
Message-ID: <56269AE3.5020604@webthatworks.it>
Date: Tue, 20 Oct 2015 21:49:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.3.0
MIME-Version: 1.0
Subject: building meta-toolchain-qt5 without opengl
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
X-List-Received-Date: Tue, 20 Oct 2015 19:48:19 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

I've tested all I could add back to RDEPENDS and in fact I could add
more than what I've done in my previous patch proposal.

All qmlplugins and qt3d stuff had to be removed and that seems reasonable.

The only thing I was not able to add back was qttools-plugins that
failed to bake with

no package provides qttools-plugins

If now things sound more reasonable to people more knowledgeable than me
that can justify why qttools-plugins can't be baked I'll repost the
patch in the hope it gets accepted and will make things easier to people
having to solve the same problem after me.

thanks

-- 
Ivan Sergio Borgonovo
http://www.webthatworks.it


