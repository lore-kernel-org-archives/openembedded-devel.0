Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1PqW9W-0000gB-Vj
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Feb 2011 20:38:07 +0100
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1PqW8K-00032m-Sy from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Feb 2011 11:36:52 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Fri, 18 Feb 2011 11:36:52 -0800
Received: from [172.30.80.150] ([172.30.80.150]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Fri, 18 Feb 2011 12:36:51 -0700
Message-ID: <4D5ECA4D.4090309@mentor.com>
Date: Fri, 18 Feb 2011 12:36:45 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1298057187-2466-1-git-send-email-tom_rini@mentor.com>
In-Reply-To: <1298057187-2466-1-git-send-email-tom_rini@mentor.com>
X-OriginalArrivalTime: 18 Feb 2011 19:36:51.0818 (UTC)
	FILETIME=[30F51CA0:01CBCFA3]
Subject: Re: [PATCH] insane.bbclass: Make RPATH a non-fatal error
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
X-List-Received-Date: Fri, 18 Feb 2011 19:38:07 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/18/2011 12:26 PM, Tom Rini wrote:
> In order to make the user experience better we now use bb.warn
> on non-fatal QA errors and bb.error on fatal errors.

Part of my motivation here is that after looking at poky, this error is 
_not_ fatal there yet (none are), and until we can kill libtool 2.2.x 
(which won't be until oe-core I believe) this is going to be a big 
problem to solve, generally involving a libtool hack.  I think we can 
best spend our time here on fixing RPATH issues that still show up once 
we're all using libtool 2.4 (as there will still be a few in 'odd' 
packages, but most will now be correct automatically).

I'm going to push this into my simplify-target-flags branch as well and 
see what falls out now (doing so already for smaller test cases).

-- 
Tom Rini
Mentor Graphics Corporation


