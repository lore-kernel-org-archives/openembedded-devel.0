Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Q4aHK-0004Ad-F1
	for openembedded-devel@lists.openembedded.org;
	Tue, 29 Mar 2011 16:52:18 +0200
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1Q4aFI-0004xw-OS from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 29 Mar 2011 07:50:12 -0700
Received: from SVR-ORW-FEM-05.mgc.mentorg.com ([147.34.97.43]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Tue, 29 Mar 2011 07:50:12 -0700
Received: from [172.30.80.76] (147.34.91.1) by svr-orw-fem-05 (147.34.97.43)
	with Microsoft SMTP Server id 14.1.270.1;
	Tue, 29 Mar 2011 07:50:11 -0700
Message-ID: <4D91F19C.2090701@mentor.com>
Date: Tue, 29 Mar 2011 07:50:04 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.14) Gecko/20110223 Lightning/1.0b2 Thunderbird/3.1.8
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <AANLkTinndYKCjXukE90p0yGuh1KCtm1joySugGMQXrTU@mail.gmail.com>
In-Reply-To: <AANLkTinndYKCjXukE90p0yGuh1KCtm1joySugGMQXrTU@mail.gmail.com>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 29 Mar 2011 14:50:12.0603 (UTC)
	FILETIME=[9B896CB0:01CBEE20]
Subject: Re: Modifying download directories
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
X-List-Received-Date: Tue, 29 Mar 2011 14:52:18 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 03/28/2011 07:03 PM, Charles Manning wrote:
> Hi All
> 
> I am fetching various modules from svn and need to create a specific
> directory structure with them. I'm struggling to find the correct
> combination to make this work.
> 
> If I use
> SRC_URI = " \
>         svn://xxx/svn/a/trunk;module=Common;proto=http \
>         svn://xxx/svn/a/trunk;module=Core;proto=http \
>         svn://xxx/svn/b/trunk;module=HAL;proto=http \
> "
> that fetches the modules so that I end up with
> 
> ${WORKDIR}/Common
> ${WORKDIR}/Core
> ${WORKDIR}/HAL
> 
> but what I really want is;
> 
> ${WORKDIR}/foo/Common
> ${WORKDIR}/foo/Core
> ${WORKDIR}/bar/HAL

I think you can use ';subdir=Common' and so forth in the URIs.

-- 
Tom Rini
Mentor Graphics Corporation


