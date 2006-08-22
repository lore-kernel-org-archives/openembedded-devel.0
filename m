Received: from [141.2.4.18] (helo=mail.tm.informatik.uni-frankfurt.de)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <mickey@tm.informatik.uni-frankfurt.de>)
	id 1GFeXS-0001ry-En for openembedded-devel@lists.openembedded.org;
	Wed, 23 Aug 2006 00:16:02 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.tm.informatik.uni-frankfurt.de (Postfix) with ESMTP id B9BFB98C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Aug 2006 00:14:37 +0200 (CEST)
Received: from mail.tm.informatik.uni-frankfurt.de ([127.0.0.1])
	by localhost (mail [127.0.0.1]) (amavisd-new, port 10024) with ESMTP
	id 07149-09 for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Aug 2006 00:14:37 +0200 (CEST)
Received: from [141.2.14.64] (gandalf.tm.informatik.uni-frankfurt.de
	[141.2.14.64])
	by mail.tm.informatik.uni-frankfurt.de (Postfix) with ESMTP id 9C00597B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Aug 2006 00:14:37 +0200 (CEST)
From: Michael 'Mickey' Lauer <mickey@tm.informatik.uni-frankfurt.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <E1GFeQg-0001om-Nn@linuxtogo.org>
References: <E1GFeQg-0001om-Nn@linuxtogo.org>
Organization: VanilleMedia
Date: Wed, 23 Aug 2006 00:14:37 +0200
Message-Id: <1156284877.17332.51.camel@gandalf.tm.informatik.uni-frankfurt.de>
Mime-Version: 1.0
X-Mailer: Evolution 2.7.2.1-3mdv2007.0 
X-Virus-Scanned: by amavisd-new at tm.informatik.uni-frankfurt.de
Subject: Re: [oe-commits] org.oe.dev task-angstrom: mask out broken packages
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: <openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 22 Aug 2006 22:16:02 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

> @@ -142,7 +142,7 @@ RDEPENDS_angstrom-task-office := "\
>      gnumeric \
>      abiword \
>      imposter \
> -    evince \
> +#    evince \
>      gqview"

Does that really work that way? Isn't '\' just concatenating the lines
so we end up with

angstrom-task-office = "gnumeric abiword imposter evince # gqview" which
isn't what we want or is it?

-- 
Regards,

Michael 'Mickey' Lauer | FreeLancer | http://www.Vanille-Media.de




