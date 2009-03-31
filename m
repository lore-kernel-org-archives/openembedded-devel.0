Received: from [85.199.173.110] (helo=mx51.mymxserver.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <hs4233@mail.mn-solutions.de>) id 1LobBN-0004jL-O3
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 Mar 2009 12:27:01 +0200
Received: from localhost (localhost [127.0.0.1])
	by localhost.mx51.mymxserver.com (Postfix) with ESMTP id 8662514800A;
	Tue, 31 Mar 2009 12:24:50 +0200 (CEST)
X-Virus-Scanned: by Mittwald Mailscanner
Received: from mx51.mymxserver.com ([127.0.0.1])
	by localhost (mx51.mymxserver.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YFNWTa4tCUjP; Tue, 31 Mar 2009 12:24:50 +0200 (CEST)
Received: from lin01.mn-solutions.de (pD95F9924.dip0.t-ipconnect.de
	[217.95.153.36])
	by mx51.mymxserver.com (Postfix) with ESMTP id 0AD43148011;
	Tue, 31 Mar 2009 12:24:50 +0200 (CEST)
Received: by lin01.mn-solutions.de (Postfix, from userid 116)
	id 6536F1E0122; Tue, 31 Mar 2009 12:24:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.1.7-deb (2006-10-05) on 
	lin01.mn-logistik.de
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_00,
	SUBJECT_EXCESS_QP autolearn=ham version=3.1.7-deb
Received: from mnz66.mn-solutions.de (mnz66.mn-solutions.de [192.168.233.66])
	by lin01.mn-solutions.de (Postfix) with ESMTP id 2E7FF1E0100;
	Tue, 31 Mar 2009 12:24:45 +0200 (CEST)
From: Holger Schurig <hs4233@mail.mn-solutions.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 31 Mar 2009 12:23:56 +0200
User-Agent: KMail/1.9.7
References: <20090329131749.GA350@excalibur.local> <gqqk8b$2eb$1@ger.gmane.org>
	<20090331100626.GA25328@excalibur.local>
In-Reply-To: <20090331100626.GA25328@excalibur.local>
MIME-Version: 1.0
Message-Id: <200903311223.56846.hs4233@mail.mn-solutions.de>
Subject: Re: [PATCH] connman: Package python test scripts into	connman-test-utils
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
X-List-Received-Date: Tue, 31 Mar 2009 10:27:01 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

> > Yes, overrides work on RDEPENDS as well, so
> > RDEPENDS_${PN}-test-utils = "python-core python-dbus
> > python-b0rk" will work.
>
> Cool. Another bit I did not know from OE so far. Will make the
> changes and resend.

The way I designed the overrides years ago was that they can 
override *ANY* variable.

However, as I didn't follow OE/bitbake closely during the last 
years, it might be the case that there are now exceptions.


