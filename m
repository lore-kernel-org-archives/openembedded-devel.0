Received: from smtp.cbnco.com ([207.164.182.72])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <msmith@cbnco.com>) id 1NRt58-0007aW-Cu
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Jan 2010 20:59:18 +0100
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 8FCA0610C0A
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Jan 2010 14:57:12 -0500 (EST)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 05115-06 for <openembedded-devel@lists.openembedded.org>; 
	Mon,  4 Jan 2010 14:57:12 -0500 (EST)
Received: from [172.20.22.83] (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTPSA id 6885C60F0D2
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Jan 2010 14:57:12 -0500 (EST)
Message-ID: <4B424818.3030603@cbnco.com>
Date: Mon, 04 Jan 2010 14:57:12 -0500
From: Michael Smith <msmith@cbnco.com>
User-Agent: Thunderbird 2.0.0.23 (X11/20090812)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1262450620.5161.33.camel@gnutoo-desktop>
In-Reply-To: <1262450620.5161.33.camel@gnutoo-desktop>
X-Virus-Scanned: amavisd-new at cbnco.com
X-SA-Exim-Connect-IP: 207.164.182.72
X-SA-Exim-Mail-From: msmith@cbnco.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: DOLT(doltlibtool)
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
X-List-Received-Date: Mon, 04 Jan 2010 19:59:18 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

GNUtoo wrote:

> So far I identified 4 software using dolt:
> *abiword 2.8.1
> *goffice 0.7.4
> *xf86-video-intel 2.9.1
> *gmime 2.4.10

Also xserver-xorg (patched in c10e9906a2ecea7e9c04bf967a8882d6b4cd1077), 
cairo (b57a5b04cd35c935bd7ed46ec8db07ec7c0766db), and webkit 
(c70445331f91cb7f02503e7567927b9b6e40e6bb).

The real fix is to get upstream dolt.m4 updated with this patch:

http://lists.x.org/archives/xorg/2009-May/045835.html

Mike


