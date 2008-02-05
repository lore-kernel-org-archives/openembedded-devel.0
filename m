Received: from [64.28.152.243] (helo=smtp-relay2.palm.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <rich.pixley@palm.com>) id 1JMDge-0000TN-T1
	for openembedded-devel@openembedded.org; Tue, 05 Feb 2008 03:37:29 +0100
X-IronPort-AV: E=Sophos;i="4.25,304,1199692800"; 
   d="scan'208";a="4597333"
Received: from unknown (HELO mailhost02.palm.com) ([148.92.223.90])
	by smtp-relay2.palm.com with ESMTP; 04 Feb 2008 18:37:37 -0800
Received: from flamingo.palm1.palmone.com (flamingo.palm1.palmone.com
	[148.92.248.89])
	by mailhost02.palm.com (8.13.6+Sun/8.12.10) with ESMTP id
	m152bQ3P024308; Mon, 4 Feb 2008 18:37:36 -0800 (PST)
Message-ID: <47A7CBE6.70401@palm.com>
Date: Mon, 04 Feb 2008 18:37:26 -0800
From: Rich Pixley <rich.pixley@palm.com>
User-Agent: Thunderbird 2.0.0.9 (Macintosh/20071031)
MIME-Version: 1.0
To: "openembedded-devel@openembedded.org" <openembedded-devel@openembedded.org>
References: <47A78C40.8000308@palm.com>
	<1202166317.4788.105.camel@localhost.localdomain>
In-Reply-To: <1202166317.4788.105.camel@localhost.localdomain>
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
X-List-Received-Date: Tue, 05 Feb 2008 02:37:29 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Let me try this again.

I have a class.  My class is listed in the INHERIT in my local.conf.

My class intends to set a variable, SUBMISSION_busybox, which will be 
used by a bb file as "PR = ${SUBMISSION_busybox}".

I'm setting the variable via setVar, and pretty printing "d" shows me 
that it's in p.dict.

However, attempting to bitbake yields:

NOTE: <type 'exceptions.SyntaxError'>:EOL while scanning single-quoted 
string (<string>, line 1) while evaluating:
${@base_set_filespath([ 
"/home/rich/projects/nova/oe-bom/nova/oe/packages/busybox/busybox-1.7.2-${SUBMISSION_busybox}", 
"/home/rich/projects/nova/oe-bom/nova/oe/packages/busybox/busybox-1.7.2", 
"/home/rich/projects/nova/oe-bom/nova/oe/packages/busybox/busybox", 
"/home/rich/projects/nova/oe-bom/nova/oe/packages/busybox/files", 
"/home/rich/projects/nova/oe-bom/nova/oe/packages/busybox" ], d)}
ERROR: Error in executing:
ERROR: Exception:<type 'exceptions.SyntaxError'> Message:EOL while 
scanning single-quoted string (<string>, line 1)
ERROR: Printing the environment of the function

...

  File "<string>", line 1
    base_set_filespath([ 
"/home/rich/projects/nova/oe-bom/nova/oe/packages/busybox/busybox-1.7.2-${SUBMISSION_busybox

(The caret is under the last "o").

And I'm totally confused.  It would appear to me as though 
SUBMISSION_busybox isn't being found and thus isn't being expanded.  I'm 
assuming that my understanding of the various "d"'s is my conceptual 
weakness here.

Could someone please point out my obvious flaw?  Or point me toward 
relevant doc or code which might help clarify this for me?

--rich


