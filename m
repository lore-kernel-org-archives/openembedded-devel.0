Received: from [207.164.182.72] (helo=smtp.cbnco.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <msmith@cbnco.com>) id 1Mbxpj-00009d-Hi
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 Aug 2009 16:32:43 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 4B67A53C1D6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Aug 2009 10:16:05 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 23943-10 for <openembedded-devel@lists.openembedded.org>; 
	Fri, 14 Aug 2009 10:16:05 -0400 (EDT)
Received: from [172.17.1.132] (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTPSA id 0F2B253A5F1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Aug 2009 10:16:05 -0400 (EDT)
Date: Fri, 14 Aug 2009 10:15:56 -0400
From: "Michael Smith" <msmith@cbnco.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
X-Mailer: LCG ProfiMail
Message-ID: <1058368180@msmith@cbnco.com>
In-Reply-To: <h63ngq$s80$1@ger.gmane.org>
X-Virus-Scanned: amavisd-new at cbnco.com
Subject: Re: [PATCH 2/4] gcc: fix libstdc/libgcc packaging on x86_64
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
X-List-Received-Date: Fri, 14 Aug 2009 14:32:43 -0000
Content-Type: text/plain; charset=utf-8; format=flowed

> From: Rolf Leggewie <no2spam@nospam.arcornews.de>
 
> Hardy is my main build machine.  I hope OE will continue to work with it.

Yes, I bumped a limited set of INC_PRs because the change affected only 
builds for x86_64 targets, and I think that usage is quite rare and 
probably limited to newer GCCs. I just didn't want to force everybody to 
rebuild when the vast majority are not building for 64.

It should in no way affect compatibility with other GCCs, other than that 
if someone is already using one to build for x86_64, their libgcc pkg will 
stay broken tilll they force a rebuild :)

Mike 


