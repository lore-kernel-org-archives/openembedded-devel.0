Received: from [66.249.92.175] (helo=ug-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <pmiscml@gmail.com>) id 1JQ5na-0000aS-5j
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Feb 2008 20:00:46 +0100
Received: by ug-out-1314.google.com with SMTP id i24so1630387ugd.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Feb 2008 11:00:20 -0800 (PST)
Received: by 10.150.54.6 with SMTP id c6mr1128867yba.77.1203100562769;
	Fri, 15 Feb 2008 10:36:02 -0800 (PST)
Received: from widy.localdomain ( [88.252.162.97])
	by mx.google.com with ESMTPS id h1sm9002478nfh.20.2008.02.15.10.35.59
	(version=SSLv3 cipher=OTHER); Fri, 15 Feb 2008 10:36:01 -0800 (PST)
Date: Fri, 15 Feb 2008 20:36:18 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20080215203618.39582412@widy.localdomain>
In-Reply-To: <47B5C6DB.6030500@gmx.net>
References: <20080215175032.545c9b9a@widy.localdomain>
	<47B5C6DB.6030500@gmx.net>
X-Mailer: Claws Mail 3.0.2 (GTK+ 2.12.5; i686-pc-linux-gnu)
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 66.249.92.175
X-SA-Exim-Mail-From: pmiscml@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: theBohemian@gmx.net
Subject: Re: [RFC] PKGPV/PKGPR of the PKG fame
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
X-List-Received-Date: Fri, 15 Feb 2008 19:00:46 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hello,

On Fri, 15 Feb 2008 18:07:39 +0100
Robert Schuster <theBohemian@gmx.net> wrote:

> Hi,
> while I like the general idea the proposed implemented is not so nice
> IMHO because
> 	- it works only for ipk packaging (should be agnostic)

That's just a sample of implementation. As it is now, it seems that
each format-specific package class needs to handle it on its own.

> 	- for dependency resolution the original version values are
> used

If you mean version under which this package will be dependent
upon, then for sure yes, I didn't even consider that area. My usecase
is to create "proxy" packages which would already fit into existing
dependency chains - just exactly need to set PV to match external
expectations.

> 
> IMHO this stuff should be done in packaging.bbclass instead.
> 
> Regards
> Robert
> 
[]

-- 
Best regards,
 Paul                          mailto:pmiscml@gmail.com


