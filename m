Received: from [93.97.173.237] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1LJUuI-0001mb-8i
	for openembedded-devel@openembedded.org; Sun, 04 Jan 2009 16:28:51 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id n04FMvex011459
	for <openembedded-devel@openembedded.org>; Sun, 4 Jan 2009 15:22:57 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 10962-08 for <openembedded-devel@openembedded.org>;
	Sun,  4 Jan 2009 15:22:53 +0000 (GMT)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id n04FMpJT011453
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>; Sun, 4 Jan 2009 15:22:51 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <c384c5ea0901040709h306a048bmf3fbfa0a0489d19a@mail.gmail.com>
References: <c384c5ea0901040709h306a048bmf3fbfa0a0489d19a@mail.gmail.com>
Date: Sun, 04 Jan 2009 15:23:18 +0000
Message-Id: <1231082598.5309.8.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: no /temp/run.do_package?
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
X-List-Received-Date: Sun, 04 Jan 2009 15:28:52 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi,

On Sun, 2009-01-04 at 16:09 +0100, Leon Woestenberg wrote:
> I wonder, why is there no do_package run script in the temp/ directory?
> 
> (I'm debugging the oprofile package for improper packaging.)

Its a python function, not a shell one. If you use bitbake trunk it will
make logs for both shell and python functions.

Cheers,

Richard





