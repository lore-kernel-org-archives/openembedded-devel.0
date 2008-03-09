Received: from [209.85.132.241] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1JYOjC-0001Z0-S6
	for openembedded-devel@lists.openembedded.org;
	Sun, 09 Mar 2008 17:50:30 +0100
Received: by an-out-0708.google.com with SMTP id b33so347833ana.83
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 09 Mar 2008 09:48:39 -0700 (PDT)
Received: by 10.100.119.17 with SMTP id r17mr9160748anc.42.1205081319062;
	Sun, 09 Mar 2008 09:48:39 -0700 (PDT)
Received: by 10.100.190.7 with HTTP; Sun, 9 Mar 2008 09:48:39 -0700 (PDT)
Message-ID: <c384c5ea0803090948n743bd9e0vfd3bee0eeffd80f2@mail.gmail.com>
Date: Sun, 9 Mar 2008 17:48:39 +0100
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <c384c5ea0803090942h63638a5j7dfbecaaf1b39a39@mail.gmail.com>
MIME-Version: 1.0
References: <c384c5ea0803090750jba077bld01cad88f051ba45@mail.gmail.com>
	<200803091716.40438.zecke@selfish.org>
	<c384c5ea0803090942h63638a5j7dfbecaaf1b39a39@mail.gmail.com>
X-SA-Exim-Connect-IP: 209.85.132.241
X-SA-Exim-Mail-From: leon.woestenberg@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [ANNOUNCE] witpa - content addressable package URL maintenance
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 09 Mar 2008 16:50:33 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello,

On Sun, Mar 9, 2008 at 5:42 PM, Leon Woestenberg
<leon.woestenberg@gmail.com> wrote:
>  >  > A package URL maintenance tool. See usage and example below. Would be
>  >  > neat to have this as a web service.
>  >
It's only proof-of-concept. I would like to see OpenEmbedded move away
from a single SRC_URI.

Is it possible to change the checksums.ini / fetcher / hash validation
code in OpenEmbedded/Bitbake to cope with multiple URLs?

Ideally, if the SRC_URI fails to fetch, its package filename has a
one-to-one mapping with the package hash-pair.
The package name and hash-pair are then used to find alternative URLs,
that match the hash-pair.

Regards,
-- 
Leon


