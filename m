Received: from [207.164.182.72] (helo=smtp.cbnco.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <msmith@cbnco.com>) id 1MCEGc-00073I-JY
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Jun 2009 16:50:06 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 3B1AF4D0727
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Jun 2009 10:41:02 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 06624-02 for <openembedded-devel@lists.openembedded.org>; 
	Thu,  4 Jun 2009 10:41:02 -0400 (EDT)
Received: from [172.20.22.83] (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTPSA id F24274D0726
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Jun 2009 10:41:01 -0400 (EDT)
Message-ID: <4A27DCFD.6030808@cbnco.com>
Date: Thu, 04 Jun 2009 10:41:01 -0400
From: Michael Smith <msmith@cbnco.com>
User-Agent: Thunderbird 2.0.0.21 (X11/20090302)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1244114520.2611.114.camel@mill.internal.reciva.com>
In-Reply-To: <1244114520.2611.114.camel@mill.internal.reciva.com>
X-Virus-Scanned: amavisd-new at cbnco.com
Subject: Re: [patch] glibc: correct paths in FILES
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
X-List-Received-Date: Thu, 04 Jun 2009 14:50:07 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Phil Blundell wrote:
> It turns out that glibc-package contains a bunch of hard-coded
> references to /lib.  This patch replaces them with the appropriate
> ${base_libdir}.  Also, the globs in ${libc_baselibs} were a bit too
> permissive and would accept, for example, "libc.a" which isn't something
> that we want in the main library package.

Build and board tested with glibc 2.6.1. Getting rid of the .a files 
saved 3.9 MB out of my root image on x86.

I guess eglibc would need the same, but I haven't tried it.

Acked-By: Michael Smith <msmith@cbnco.com>

Mike


