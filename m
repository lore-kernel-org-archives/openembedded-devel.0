Received: from [207.164.182.72] (helo=smtp.cbnco.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <msmith@cbnco.com>) id 1MLRpJ-0001SD-Je
	for openembedded-devel@lists.openembedded.org;
	Tue, 30 Jun 2009 03:08:01 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 741E04F3632
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Jun 2009 20:56:16 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 11216-02 for <openembedded-devel@lists.openembedded.org>; 
	Mon, 29 Jun 2009 20:56:16 -0400 (EDT)
Received: from juice.ott.cti.com (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTPSA id 437A34F3443
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Jun 2009 20:56:16 -0400 (EDT)
Date: Mon, 29 Jun 2009 20:56:16 -0400 (EDT)
From: Michael Smith <msmith@cbnco.com>
X-X-Sender: michael@juice.ott.cti.com
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <200906291204.20912.marcin@juszkiewicz.com.pl>
Message-ID: <Pine.LNX.4.64.0906292052420.3731@juice.ott.cti.com>
References: <1246138179-23626-1-git-send-email-msmith@cbnco.com>
	<200906291204.20912.marcin@juszkiewicz.com.pl>
MIME-Version: 1.0
X-Virus-Scanned: amavisd-new at cbnco.com
Subject: Re: [PATCH 1/2] source-checker: usability tweaks
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
X-List-Received-Date: Tue, 30 Jun 2009 01:08:01 -0000
Content-Type: MULTIPART/MIXED; BOUNDARY="346837782-586138529-1246323185=:3731"
Content-ID: <Pine.LNX.4.64.0906292053110.3731@juice.ott.cti.com>

--346837782-586138529-1246323185=:3731
Content-Type: TEXT/PLAIN; CHARSET=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <Pine.LNX.4.64.0906292053111.3731@juice.ott.cti.com>

On Mon, 29 Jun 2009, Marcin Juszkiewicz wrote:

> Dnia sobota, 27 czerwca 2009 o 23:29:38 Michael Smith napisa=C5=82(a):
>> send usage to stderr;=20
> NACK - most of tools which I use use stdout for --help/usage stuff.

OK, right, errors should go to stderr and usage to stdout.

>>  accept --inplace option to read and write from the same file.
> OSError: [Errno 18] Invalid cross-device link

Yes, the tmpfile needs to be in the same directory as the checksums.ini.=20
I'll fix that. I think os.rename is still the right way to do it (it's=20
guaranteed to be atomic, or fall flat on its face :).

Mike

--346837782-586138529-1246323185=:3731--
