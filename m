Received: from mailout-de.gmx.net ([213.165.64.23] helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <wohauser@gmx.de>) id 1Pa5dq-0002L8-4h
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Jan 2011 13:05:30 +0100
Received: (qmail invoked by alias); 04 Jan 2011 11:58:27 -0000
Received: from p549CCA5E.dip.t-dialin.net (EHLO [192.168.3.102])
	[84.156.202.94]
	by mail.gmx.net (mp057) with SMTP; 04 Jan 2011 12:58:27 +0100
X-Authenticated: #656260
X-Provags-ID: V01U2FsdGVkX19+7Gpv3uh+/Pzms9S5oX+6RC8qMfSGt5+rqm4yxx
	DaYgThsI0TEcyL
Message-ID: <4D230B5A.3030202@gmx.de>
Date: Tue, 04 Jan 2011 12:58:18 +0100
From: Wolfgang Hauser <wohauser@gmx.de>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; de-AT;
	rv:1.9.1.16) Gecko/20101123 SeaMonkey/2.0.11
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1294084926-3115-1-git-send-email-rep.dot.nop@gmail.com>	<1294084926-3115-9-git-send-email-rep.dot.nop@gmail.com>
	<201101032354.25037.roman@khimov.ru>
In-Reply-To: <201101032354.25037.roman@khimov.ru>
X-Enigmail-Version: 1.0.1
X-Y-GMX-Trusted: 0
Subject: Re: [PATCH 09/12] busybox: provide postrm for package mdev
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
X-List-Received-Date: Tue, 04 Jan 2011 12:05:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Keep it simple and stupid!
So I vote for the long, readable and less error prone version.

Regards
Wolfgang Hauser

Roman I Khimov schrieb:
> В сообщении от Понедельник 03 января 2011 23:02:03 автор Bernhard Reutner-
> Fischer написал:
>> -if test "x$D" != "x"; then
>> -	OPT="-r $D"
>> -else
>> -	OPT="-s"
>> -fi
>> +	[ -n "$D" ] && OPT="-r $D" || OPT="-s"
> 
> Looks good except for this part (see other mail).
> 
> 
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


