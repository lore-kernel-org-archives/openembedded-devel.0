Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <george.huntingtoniii@gmail.com>) id 1OJV0U-0001mN-OO
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Jun 2010 19:12:03 +0200
Received: by wyf22 with SMTP id 22so833002wyf.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Jun 2010 10:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=U8GidOa7VhUQbtqgo8xzguYoY+/M43JLQV5pd3cjmA4=;
	b=V9nsjLu03xC6eno507StXizNFqQe2OaiRRx0YUapLNdRxLdkqayI9h9ynabVIM+r9T
	BPNX2Q1N44gqJ0/jFY38fiMGkK2PxnSIQ4ATbCG4t+v4+eURKPrGo1zUezTbQziSW4QG
	1GTFSdqs8+Ij2/gQa6hDCR6Z8WjgLNrMaQPbI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=EgS8QljfsxLnfvVFK3Ncf7GsCsNhKFgnNF5i9gXhCa5GuaY3AiRr9nvbsoRu2U2EmJ
	i7qYUU+r1dQOdVuz4o59+DjFidtLxvu4TYekx9DEbCdJ2qwinxIdmCczcEoy6FmQARrV
	UEhclLhNPB6q8NOgrwXiEltKwbwIrRhltUaxw=
MIME-Version: 1.0
Received: by 10.216.90.8 with SMTP id d8mr5625645wef.52.1275412068326; Tue, 01 
	Jun 2010 10:07:48 -0700 (PDT)
Received: by 10.216.154.13 with HTTP; Tue, 1 Jun 2010 10:07:47 -0700 (PDT)
Date: Tue, 1 Jun 2010 13:07:47 -0400
Message-ID: <AANLkTinRTX7FdWmz7NLEF1W6wI5DeCL30C68WgT1BiNT@mail.gmail.com>
From: "George C. Huntington, III" <george.huntingtoniii@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: george.huntingtoniii@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: what is the "right" way to add a recipe for building some out of tree kernel modules
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
X-List-Received-Date: Tue, 01 Jun 2010 17:12:03 -0000
Content-Type: text/plain; charset=ISO-8859-1

I have some custom kernel modules, and i want to make a recipe for building
them and having a package to include in my custom image.
what is the "right" way to make my recipe and my Makefile/Kbuild file?

-thanks,
gchiii

