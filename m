Received: from smtp.cbnco.com ([207.164.182.72])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <msmith@cbnco.com>) id 1NWfKI-0005S3-9E
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Jan 2010 01:18:41 +0100
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id DF020623E3B
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Jan 2010 19:16:25 -0500 (EST)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 15881-01 for <openembedded-devel@lists.openembedded.org>; 
	Sun, 17 Jan 2010 19:16:25 -0500 (EST)
Received: from juice.ott.cti.com (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTPSA id B3BCC623D61
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Jan 2010 19:16:25 -0500 (EST)
Date: Sun, 17 Jan 2010 19:16:26 -0500 (EST)
From: Michael Smith <msmith@cbnco.com>
X-X-Sender: michael@juice.ott.cti.com
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <201001180046.29318.sgh@sgh.dk>
Message-ID: <Pine.LNX.4.64.1001171912530.12229@juice.ott.cti.com>
References: <201001172228.26477.sgh@sgh.dk>
	<Pine.LNX.4.64.1001171801430.12229@juice.ott.cti.com>
	<201001180046.29318.sgh@sgh.dk>
MIME-Version: 1.0
X-Virus-Scanned: amavisd-new at cbnco.com
X-SA-Exim-Connect-IP: 207.164.182.72
X-SA-Exim-Mail-From: msmith@cbnco.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Mesa packages and TLS
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
X-List-Received-Date: Mon, 18 Jan 2010 00:18:41 -0000
Content-Type: MULTIPART/MIXED;
	BOUNDARY="346837782-1462983748-1263773600=:12229"
Content-ID: <Pine.LNX.4.64.1001171913340.12229@juice.ott.cti.com>

--346837782-1462983748-1263773600=:12229
Content-Type: TEXT/PLAIN; CHARSET=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <Pine.LNX.4.64.1001171913341.12229@juice.ott.cti.com>

On Mon, 18 Jan 2010, S=C3=B8ren Holm wrote:

> i686
> angstrom.2008.1=20
> glibc must be 2.9 since I have not enforced anythin else.

OK, something must be broken there... glibc on i686 2.9 definitely has=20
TLS.

Which version of xserver-xorg? It also inherits glx-use-tls, so=20
_glapi_tls_Context should be there if you've rebuilt since August 24.

Mike

--346837782-1462983748-1263773600=:12229--
