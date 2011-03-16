Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1PzuER-0001O1-ET
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Mar 2011 18:09:59 +0100
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1PzuCn-0000N3-GG from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Mar 2011 10:08:17 -0700
Received: from SVR-ORW-FEM-05.mgc.mentorg.com ([147.34.97.43]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Wed, 16 Mar 2011 10:07:56 -0700
Received: from [172.30.80.14] (147.34.91.1) by svr-orw-fem-05 (147.34.97.43)
	with Microsoft SMTP Server id 14.1.270.1;
	Wed, 16 Mar 2011 10:08:16 -0700
Message-ID: <4D80EE70.8000309@mentor.com>
Date: Wed, 16 Mar 2011 10:08:00 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.14) Gecko/20110223 Lightning/1.0b2 Thunderbird/3.1.8
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <4D80653A.7010804@beam.ltd.uk> <4D80772A.8080207@atmel.com>
	<4D80C329.9020309@beam.ltd.uk>
In-Reply-To: <4D80C329.9020309@beam.ltd.uk>
X-OriginalArrivalTime: 16 Mar 2011 17:07:56.0396 (UTC)
	FILETIME=[B1C56AC0:01CBE3FC]
Subject: Re: [Openembedded-users] Problem with patch version 2.6.1-7 and	after
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
X-List-Received-Date: Wed, 16 Mar 2011 17:09:59 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 03/16/2011 07:03 AM, Terry Barnaby wrote:

[snip]
> Hi,
>
> ### Forwarded to openembedded-devel ###
>
> We are using Fedora14. That is using patch 2.6.1-8.
>
> The -8 release includes the following patches to patch.
> Patch1: patch-2.5.4-sigsegv.patch
> Patch2: patch-get-arg.patch
> Patch3: patch-CVE-2010-4651.patch
> Patch100: patch-selinux.patch
>
> I think one of those fixes a security issue in patch where ".." in
> path names were allowed. With this version of patch (which I assume
> will become standard ?) the OpenEmbedded fails.
> Any ideas on a way to get around this (ideally without using a
> different patch version :) )

So, there's a lot of recipes with patches with .. in the path:
openembedded$ git grep -lE "^---.*[^.]\.\.\/" recipes/ | wc -l
80

Some of these will be easy fixups (first one I peeked at we can just 
change the patch and not have to modify the recipe) but others like the 
tcl one will require a little thought.

-- 
Tom Rini
Mentor Graphics Corporation


