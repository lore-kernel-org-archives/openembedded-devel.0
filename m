Received: from [63.80.53.70] (helo=smtp-relay1.palm.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <rich.pixley@palm.com>) id 1JMa20-0007lu-N7
	for openembedded-devel@openembedded.org; Wed, 06 Feb 2008 03:29:00 +0100
X-IronPort-AV: E=Sophos;i="4.25,309,1199692800"; 
   d="scan'208";a="4558443"
Received: from unknown (HELO mailhost01.palm.com) ([148.92.223.30])
	by smtp-relay1.palm.com with ESMTP; 05 Feb 2008 18:29:09 -0800
Received: from flamingo.palm1.palmone.com (flamingo.palm1.palmone.com
	[148.92.248.89])
	by mailhost01.palm.com (8.13.6+Sun/8.12.10) with ESMTP id
	m162T8Ju023682; Tue, 5 Feb 2008 18:29:08 -0800 (PST)
Message-ID: <47A91B74.9040605@palm.com>
Date: Tue, 05 Feb 2008 18:29:08 -0800
From: Rich Pixley <rich.pixley@palm.com>
User-Agent: Thunderbird 2.0.0.9 (Macintosh/20071031)
MIME-Version: 1.0
To: "openembedded-devel@openembedded.org" <openembedded-devel@openembedded.org>
References: <47A78C40.8000308@palm.com>	<1202166317.4788.105.camel@localhost.localdomain>	<47A7CBE6.70401@palm.com>
	<1202248991.4619.5.camel@localhost.localdomain>
In-Reply-To: <1202248991.4619.5.camel@localhost.localdomain>
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
X-List-Received-Date: Wed, 06 Feb 2008 02:29:00 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

When does d change?

I've got the following bb file which produces results which puzzle me.  
What I'm seeing is that the two values for d are different instances and 
that the second function doesn't see the variable which was set in the 
first because they're using different dictionaries.

--rich

def setting(d):

    import bb

    print "setting sets in ", d, "\n"

    bb.data.setVar('FOO', 'bar', d)

    return "setting"

X := ${@setting(d)}

def getting(d):

    import bb

    got = bb.data.getVar('FOO', d)

    print "getting gets %s from " % (got), d, "\n"

    return "getting"

Y := ${@getting(d)}



