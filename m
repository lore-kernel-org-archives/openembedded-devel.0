Received: from [83.151.25.170] (helo=srv043.dedi23.de)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <mickey@vanille-media.de>) id 1IVFQn-0001yf-PO
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Sep 2007 01:46:09 +0200
Received: by srv043.dedi23.de (Postfix, from userid 65534)
	id E4A4E28C013; Wed, 12 Sep 2007 01:39:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.1.7-deb (2006-10-05) on 
	srv043.dedi23.de
X-Spam-Level: ***
X-Spam-Status: No, score=3.9 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_NJABL_DUL,RCVD_IN_PBL,RCVD_IN_SORBS_DUL,
	REPTO_OVERQUOTE_THEBAT autolearn=no version=3.1.7-deb
Received: from PROMETHEUS (e180135170.adsl.alicedsl.de [85.180.135.170])
	by srv043.dedi23.de (Postfix) with ESMTP id 57BC328C012;
	Wed, 12 Sep 2007 01:39:22 +0200 (CEST)
Date: Wed, 12 Sep 2007 01:43:00 +0200
From: "Dr. Michael Lauer" <mickey@vanille-media.de>
X-Mailer: The Bat! (v3.99.3) Professional
Organization: Vanille-Media
X-Priority: 3 (Normal)
Message-ID: <1916151728.20070912014300@vanille-media.de>
To: Detlef Vollmann <dv@vollmann.ch>
In-Reply-To: <46E71524.4CAFCDBC@vollmann.ch>
References: <200709111318.52432.openembedded@haerwu.biz>
	<c384c5ea0709111037o723dda57x171c148a0f93a91a@mail.gmail.com>
	<1189545452.6163.65.camel@localhost.localdomain>
	<46E71524.4CAFCDBC@vollmann.ch>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Task-base is big :(
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
X-List-Received-Date: Tue, 11 Sep 2007 23:46:09 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Detlef Vollmann wrote:
> The difference to the original python .bb is the removing of
>  DEPEND: tk
>   This would build a whole X11 system, and I definitely don't want that.

Hmm, I'm sure it's just an example for you, but anyway I can't leave
it unsaid: Python's dependency on Tk just drags in libx11 and libxext
at build time -- I don't see this as being a problem, since they don't
end up the image unless you want to.

Regards,

:M:
-- 
Michael 'Mickey' Lauer | IT-Freelancer | http://www.vanille-media.de



