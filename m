Received: from [84.21.108.25] (helo=ns.penguin.cz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1MXyd0-0002uy-Bh
	for openembedded-devel@lists.openembedded.org;
	Mon, 03 Aug 2009 16:35:07 +0200
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id EDF1D1416BC5
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  3 Aug 2009 16:23:09 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at ns.penguin.cz
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (ns.penguin.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CSMemYFAsH8Z
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  3 Aug 2009 16:23:09 +0200 (CEST)
Received: from [10.20.1.86] (nat.scz.novell.com [213.151.88.252])
	by ns.penguin.cz (Postfix) with ESMTP id C0E111416BA5
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  3 Aug 2009 16:23:09 +0200 (CEST)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <7C16A480101D49679492E3351AC7450E@sg01.cassis>
References: <DAE7325AE217459DAF9E0769B867ED98@sg01.cassis>
	<h562kl$iuf$1@ger.gmane.org>
	<7C16A480101D49679492E3351AC7450E@sg01.cassis>
Date: Mon, 03 Aug 2009 16:19:38 +0200
Message-Id: <1249309178.3246.32.camel@hammer.suse.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.27.2 
Subject: Re: libtool/libltdl problem
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
X-List-Received-Date: Mon, 03 Aug 2009 14:35:10 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Leandro Q. Galvez wrote:
> Updating now... Can you tell me where the fix is? Just would like to know 
> because it seems that this error is so common.

It was my mistake in recipes/libtool/libtool*.bb:
ac_cv_path_... used a bash specific notation.
ac_cv_path_SED contained in typo.

It was broken by:
2e0fa4918d643ce6ec0299cd31cfe1c346e4bce3
My attempt to fix path to grep and sed (force paths from recipes instead
of checking grep and sed on host system) contained a bash specific
quotation and one ugly typo.

I hope that all these issues are fixed by:
1da1656c677dc3bf044f0e705ba6db8b5c825996
0131d2ec1d1e49a1facbc02234d5a70f8b67425e
f88d3e68e399069ba38f21cd4aa02b9dfcf487fc

These fixes should make libtool working again.

-- 
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



