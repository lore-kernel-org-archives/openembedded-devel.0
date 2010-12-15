Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <obi@opendreambox.org>) id 1PSuT8-0002CX-FU
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Dec 2010 17:44:46 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id 10724314BB94
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Dec 2010 17:43:11 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id e0V1U6mx2+Gp
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Dec 2010 17:43:06 +0100 (CET)
Received: from [172.22.22.60] (ip-109-90-189-193.unitymediagroup.de
	[109.90.189.193])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.multimedia-labs.de (Postfix) with ESMTPSA id 512DB314BACB
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Dec 2010 17:43:06 +0100 (CET)
Message-ID: <4D08F019.1010701@opendreambox.org>
Date: Wed, 15 Dec 2010 17:43:05 +0100
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4D065431.6080304@dell.com>	<AANLkTin2DnrgjhA4Qt63+pyfhPP=rLcs94CL_gbOeBGC@mail.gmail.com>	<4D079B88.9010503@dell.com>
	<4D07A19D.8090602@mentor.com>	<AANLkTinBqEGcOWys5+C3y8bGo0AMEiiOa8QTfgTxOgQ-@mail.gmail.com>
	<AANLkTin3EjUBP6Q84g-3B=rgO7Z_04oTUYqFN8hcR3a-@mail.gmail.com>
In-Reply-To: <AANLkTin3EjUBP6Q84g-3B=rgO7Z_04oTUYqFN8hcR3a-@mail.gmail.com>
X-SA-Exim-Connect-IP: 82.149.226.172
X-SA-Exim-Mail-From: obi@opendreambox.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] eglibc: use HTTP for svn checkout
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
X-List-Received-Date: Wed, 15 Dec 2010 16:44:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/15/2010 05:35 PM, Chris Larson wrote:
> On Tue, Dec 14, 2010 at 10:11 AM, Khem Raj <raj.khem@gmail.com> wrote:
>>> Note that if you use a mirror site with the SVN checkout archive in it, you
>>> won't try and do the fetch at all.  This may or may not be applicable to
>>> your case.  For your case I think what we really want is a way to globally
>>> toggle the svn protocol argument.
>>
>> yes that would be something more useful. I guess we could add it to
>> all SCM fetching recipes.
> 
> I wonder if the PREMIRRORS/MIRRORS handling is smart enough to let us
> use its regex for the components to replace protocol= in the url
> parameters.

This won't suffice, because svn may have different URLs for svn and
http, like in the discussed patch (branches vs. svn/branches):

-SRC_URI =
"svn://svn.eglibc.org/branches;module=${EGLIBC_BRANCH};proto=svn \
+SRC_URI =
"svn://svn.eglibc.org/svn/branches;module=${EGLIBC_BRANCH};proto=http \

Regards,
Andreas



