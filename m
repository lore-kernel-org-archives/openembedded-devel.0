Received: from [77.233.226.4] (helo=public.doredevelopment.dk)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eha@dev.doredevelopment.dk>) id 1Q0TjJ-0000eG-Ct
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Mar 2011 08:04:13 +0100
Received: from localhost (localhost [127.0.0.1])
	by public.doredevelopment.dk (Postfix) with ESMTP id 70B7B51B7;
	Fri, 18 Mar 2011 08:02:23 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at dev.doredevelopment.dk
Received: from public.doredevelopment.dk ([127.0.0.1])
	by localhost (public.doredevelopment.dk [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id pgryTaiRiLsX; Fri, 18 Mar 2011 08:02:21 +0100 (CET)
Received: from [192.168.18.101] (unknown [192.168.18.101])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by public.doredevelopment.dk (Postfix) with ESMTPS id 5224D462F;
	Fri, 18 Mar 2011 08:02:21 +0100 (CET)
From: Esben Haabendal <eha@dev.doredevelopment.dk>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1300325100-29332-1-git-send-email-denis@denix.org>
References: <1300325100-29332-1-git-send-email-denis@denix.org>
Organization: DoreDevelopment ApS
Date: Fri, 18 Mar 2011 08:02:20 +0100
Message-ID: <1300431741.2279.2.camel@eha>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: Re: [PATCH] cairo: disable native atomic operations, conflicts with libatomics-ops
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
X-List-Received-Date: Fri, 18 Mar 2011 07:04:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-03-16 at 21:25 -0400, Denys Dmytriyenko wrote:
> * Add --disable-atomic to configure, otherwise it finds previously
> staged libatomics-ops from pulseaudio, which doesn't have the
> necessary primitives: ....
> * From my previous builds I see that cairo used to build before
> libatomics-ops was staged, avoiding this issue.

The observant reader would note that this is another example where
per-recipe staging/sysroot would properly solve the problem.

/Esben



