Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Q4a2d-0007hO-TK
	for openembedded-devel@lists.openembedded.org;
	Tue, 29 Mar 2011 16:37:21 +0200
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1Q4a0k-0003UY-KH from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 29 Mar 2011 07:35:10 -0700
Received: from SVR-ORW-FEM-05.mgc.mentorg.com ([147.34.97.43]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Tue, 29 Mar 2011 07:35:10 -0700
Received: from [172.30.80.76] (147.34.91.1) by svr-orw-fem-05 (147.34.97.43)
	with Microsoft SMTP Server id 14.1.270.1;
	Tue, 29 Mar 2011 07:35:09 -0700
Message-ID: <4D91EE16.8060104@mentor.com>
Date: Tue, 29 Mar 2011 07:35:02 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.14) Gecko/20110223 Lightning/1.0b2 Thunderbird/3.1.8
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <4D91C2FE.4000905@oktetlabs.ru>
In-Reply-To: <4D91C2FE.4000905@oktetlabs.ru>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 29 Mar 2011 14:35:10.0468 (UTC)
	FILETIME=[81D28C40:01CBEE1E]
Subject: Re: patch 2.6 rejects relative paths
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
X-List-Received-Date: Tue, 29 Mar 2011 14:37:22 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 03/29/2011 04:31 AM, Elena Vengerova wrote:
> Hello,
> 
> I have patch 2.6.1 on my Fedora.
> I've found out that it rejects patches like
> recipes/tcltk/tcl-8.5.8/mips-tclstrtod.patch with relative paths:
> 
> --- ../generic/tclStrToD.c.orig
> +++ ../generic/tclStrToD.c
> 
> I failed to find the reason, but my colleague said me (she was unsure)
> that it was security hole fix.
> Thus looks like it's no way to force patch behave like old one.
> 
> I wonder if some work around is possible (except patch downgrade) or
> it's necessary to fix the recipes.

What metadata are you using (and branch name)?  This should be fixed in
current openembedded.org master.

-- 
Tom Rini
Mentor Graphics Corporation


