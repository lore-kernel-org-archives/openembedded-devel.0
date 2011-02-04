Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1PlNdB-000058-3D
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Feb 2011 16:31:29 +0100
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1PlNcF-0005Ct-0m from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Feb 2011 07:30:31 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Fri, 4 Feb 2011 07:30:26 -0800
Received: from [172.30.80.88] ([172.30.80.88]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Fri, 4 Feb 2011 08:30:25 -0700
Message-ID: <4D4C1B8C.9080709@mentor.com>
Date: Fri, 04 Feb 2011 08:30:20 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <E1PlNJv-0005sP-PU@melo.openembedded.org>
In-Reply-To: <E1PlNJv-0005sP-PU@melo.openembedded.org>
X-OriginalArrivalTime: 04 Feb 2011 15:30:25.0979 (UTC)
	FILETIME=[7220A0B0:01CBC480]
Subject: Re: [oe-commits] Martin Jansa : gnu-config: update also bindir change to replace /usr/bin/ env instead of /usr/bin/perl
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
X-List-Received-Date: Fri, 04 Feb 2011 15:31:29 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/04/2011 08:11 AM, git version control wrote:
> Module: openembedded.git
> Branch: master
> Commit: edcdefbf6e0675c1bcc1fc4f464f654223380e50
> URL:    http://gitweb.openembedded.net/?p=openembedded.git&a=commit;h=edcdefbf6e0675c1bcc1fc4f464f654223380e50
>
> Author: Martin Jansa<Martin.Jansa@gmail.com>
> Date:   Fri Feb  4 16:11:25 2011 +0100
>
> gnu-config: update also bindir change to replace /usr/bin/env instead of /usr/bin/perl
>
> Signed-off-by: Martin Jansa<Martin.Jansa@gmail.com>

This is wrong.  /usr/bin/env is one of those mandated things everyone 
has.  And ${bindir} can be too long :)  Based on the previous commit, 
this test/regex should be able to go away.

-- 
Tom Rini
Mentor Graphics Corporation


