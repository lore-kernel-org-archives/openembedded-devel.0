Received: from mail-pz0-f178.google.com ([209.85.222.178])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OHMyf-0006kO-HL
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 May 2010 22:13:22 +0200
Received: by pzk8 with SMTP id 8so367935pzk.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 May 2010 13:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=sREc3TO9MeJmKgiENs6UMOPXdHkIJnYVj+JyKqIzzig=;
	b=rub6I38UUsoBylKiOGig3c2tFeUvC5c5o85XWXkFJg6hE/pgZt7XKkAc7ka/0F7kGm
	FDYtdmnNnj7YQWnx9yX1s/GEzOEjiCFN+nbwQ3AM60ADyEtu8tb1iwEWQ1t8BJbIaVJ2
	k5I+AUY/HvYTUMYuXPyiqhlxrOOy914FEMzO0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	b=QzcnKGnzPbcN7SoTAQhDeIWWRHLSF7VANi6ldlGEUESqLYu8DSsEVdmX+pWXDFDETW
	jQ3oNPADQPJ8/pN57ZYCZD/vppmbzP6e0G5vpY5BolNoQy079OWyuIYYN5czBhpog51s
	bscNOBcL4WMxLELat9sXKJvdffXJWnuzTseew=
Received: by 10.115.117.38 with SMTP id u38mr8033802wam.168.1274904552136;
	Wed, 26 May 2010 13:09:12 -0700 (PDT)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id c14sm3320681waa.13.2010.05.26.13.09.10
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 26 May 2010 13:09:10 -0700 (PDT)
Date: Wed, 26 May 2010 13:09:01 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100526200901.GB10091@gmail.com>
References: <AANLkTikuptIZDURk9aJb5xqB22op3_cnR1OU7iQ0JfY0@mail.gmail.com>
	<hso7dv$2lh$1@dough.gmane.org>
	<AANLkTinzfd9OTFGIFxcCCdaxgXZ3lJm1OorWVxg0njNG@mail.gmail.com>
	<AANLkTimLcmTnl-zjJR9SVHRaX7GlKjhYT_IMiOy-eQtJ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTimLcmTnl-zjJR9SVHRaX7GlKjhYT_IMiOy-eQtJ@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.222.178
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] Add lksctp tools
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
X-List-Received-Date: Wed, 26 May 2010 20:13:22 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On (23/05/10 15:50), João Henrique Freitas wrote:
> Hi,
> 
> Attached a unique patch.

same as cgreen. but it builds. I get these warnings. Are they ok ?

NOTE: the following files were installed but not shipped in any package:
NOTE:   /usr/lib/lksctp-tools/libwithsctp.so.1
NOTE:   /usr/lib/lksctp-tools/libwithsctp.so
NOTE:   /usr/lib/lksctp-tools/libwithsctp.so.1.0.7
NOTE:   /usr/lib/lksctp-tools/libwithsctp.a
NOTE:   /usr/lib/lksctp-tools/libwithsctp.la
NOTE:   /usr/share/lksctp-tools/checksctp.c
NOTE:   /usr/share/lksctp-tools/sctp_socket.c
NOTE:   /usr/share/lksctp-tools/sctp_bind.c
NOTE:   /usr/share/lksctp-tools/sctp_darn.c
NOTE:   /usr/share/lksctp-tools/sctp_load_libs.c
NOTE:   /usr/share/lksctp-tools/sctp_sockopt.c
NOTE:   /usr/share/lksctp-tools/sctp_socket.h
NOTE:   /usr/share/lksctp-tools/sctp_test.c
NOTE:   /usr/share/lksctp-tools/sctp_darn.h
NOTE:   /usr/bin/sctp_test
NOTE:   /usr/bin/sctp_darn
NOTE:   /usr/bin/checksctp
NOTE:   /usr/bin/withsctp


Thx
-Khem


