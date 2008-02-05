Received: from [63.80.53.70] (helo=smtp-relay1.palm.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <rich.pixley@palm.com>) id 1JMCj6-0003NA-1r
	for openembedded-devel@openembedded.org; Tue, 05 Feb 2008 02:35:56 +0100
X-IronPort-AV: E=Sophos;i="4.25,304,1199692800"; d="scan'208,217";a="4543658"
Received: from unknown (HELO mailhost01.palm.com) ([148.92.223.30])
	by smtp-relay1.palm.com with ESMTP; 04 Feb 2008 17:35:57 -0800
Received: from flamingo.palm1.palmone.com (flamingo.palm1.palmone.com
	[148.92.248.89])
	by mailhost01.palm.com (8.13.6+Sun/8.12.10) with ESMTP id
	m151ZuKW015114; Mon, 4 Feb 2008 17:35:56 -0800 (PST)
Message-ID: <47A7BD7C.8050909@palm.com>
Date: Mon, 04 Feb 2008 17:35:56 -0800
From: Rich Pixley <rich.pixley@palm.com>
User-Agent: Thunderbird 2.0.0.9 (Macintosh/20071031)
MIME-Version: 1.0
To: "openembedded-devel@openembedded.org" <openembedded-devel@openembedded.org>
References: <47A78C40.8000308@palm.com>
	<1202166317.4788.105.camel@localhost.localdomain>
In-Reply-To: <1202166317.4788.105.camel@localhost.localdomain>
X-Content-Filtered-By: Mailman/MimeDel 2.1.9
Subject: Re: getVar. setVar, "d", etc.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 05 Feb 2008 01:35:56 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Richard Purdie wrote:
> On Mon, 2008-02-04 at 14:05 -0800, Rich Pixley wrote:
>   
>> I'm trying to figure out how to set bitbake variables from within python
>> escapes but I'm not having much luck.
>>
>> Could someone please explain the use of the "d" variable in the getVar
>> and setVar calls?  Or point me towards enlightening pieces of code or
>> documentation?
>>     
>
> d is the data object you want to set the variables within or get the
> variable from.
Ok, so where does it come from?

Eg, in db3_3.2.9.bb, in do_package(), there's a getVar and a setVar but 
it's not at all clear there "d" is assigned.  Is it just a conventional 
global?  What other conventional globals might one want to pass to 
getVar or setVar?

--rich

