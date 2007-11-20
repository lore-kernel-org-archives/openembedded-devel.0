Received: from [193.201.35.47] (helo=bq8.dotserv.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <eha@doredevelopment.dk>) id 1IuMko-0004O9-8A
	for openembedded-devel@openembedded.org; Tue, 20 Nov 2007 07:38:41 +0100
Received: from [192.168.2.90] (0x55532124.adsl.cybercity.dk [85.83.33.36])
	by bq8.dotserv.com (8.13.1/8.13.1) with ESMTP id lAK6aPYr026666
	for <openembedded-devel@openembedded.org>;
	Tue, 20 Nov 2007 07:36:31 +0100
From: Esben Haabendal <eha@doredevelopment.dk>
To: openembedded-devel@openembedded.org
In-Reply-To: <20071119224008.CD638401CA7@tinman.treke.net>
References: <20071119224008.CD638401CA7@tinman.treke.net>
Organization: Dore Development ApS
Date: Tue, 20 Nov 2007 07:36:25 +0100
Message-Id: <1195540585.11106.5.camel@localhost>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
Subject: Host dependency vs. -native packages balance
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
X-List-Received-Date: Tue, 20 Nov 2007 06:38:48 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi

Not having looked at the details of this bug, it seems like a good
example of how more host dependency creep into OE.

I think it raises two questions:

1. Where do we want the balance between dependency on host installed
libraries and tools vs. OE provided -native packages?

2. How can we better handle or track the actual host dependency of
current OE?

The current situation is that some (maybe even most) host dependencies
are discussed on the RequiredSoftware  and OEandYourDistro pages. They
are clearly not up-to-date and comments in bugzilla such as the one
below are a bit harder to find.

/Esben

On Mon, 2007-11-19 at 14:40 -0800, bugzilla-daemon@tinman.treke.net
wrote:
> http://bugs.openembedded.org/show_bug.cgi?id=3085
> 
> 
> Junqian Gordon Xu <xjqian@gmail.com> changed:
> 
>            What    |Removed                     |Added
> ----------------------------------------------------------------------------
>              Status|NEW                         |RESOLVED
>          Resolution|                            |WORKSFORME
> 
> 
> 
> 
> --- Comment #4 from Junqian Gordon Xu <xjqian@gmail.com>  2007-11-19 14:40:08 ---
> Confirmed that installing gfortran or the old g77 on the host solves this.
> Close as WFM.
> 
> 
-- 
Esben Haabendal
Embedded Software Consultant, Dore Development ApS
Phone: +45 5192 5393  Email: eha@doredevelopment.dk



