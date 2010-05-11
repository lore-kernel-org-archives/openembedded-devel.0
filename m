Received: from exprod5og108.obsmtp.com ([64.18.0.186])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martyn.welch@ge.com>) id 1OBkqE-0006MA-3C
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 May 2010 10:29:27 +0200
Received: from source ([4.79.213.129]) (using TLSv1) by
	exprod5ob108.postini.com ([64.18.4.12]) with SMTP
	ID DSNKS+kUfcaL7/RILhtlORZxpVIXEmraOnSs@postini.com;
	Tue, 11 May 2010 01:25:35 PDT
Received: from unknown (HELO cinmlip01.e2k.ad.ge.com) ([3.159.213.48])
	by Alpmlip06.e2k.ad.ge.com with ESMTP; 11 May 2010 04:23:33 -0400
Received: from es-j7s4d2j.amer.consind.ge.com (HELO [3.138.54.92])
	([3.138.54.92])
	by cinmlip01.e2k.ad.ge.com with ESMTP; 11 May 2010 04:23:32 -0400
Message-ID: <4BE91403.9080001@ge.com>
Date: Tue, 11 May 2010 09:23:31 +0100
From: Martyn Welch <martyn.welch@ge.com>
User-Agent: Thunderbird 2.0.0.24 (X11/20100317)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1273507486.2994.189.camel@localhost.localdomain>
In-Reply-To: <1273507486.2994.189.camel@localhost.localdomain>
X-SA-Exim-Connect-IP: 64.18.0.186
X-SA-Exim-Mail-From: martyn.welch@ge.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_MED autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Supported Python version for OE?
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
X-List-Received-Date: Tue, 11 May 2010 08:29:27 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Joshua Lock wrote:
> Hi,
>
> A question, (perhaps for the TSC?):
>
> 	"What's the minimum Python version we want to support in OE?"
>
> According to the wiki we support Python 2.4 and above but I wonder if
> people have any thoughts with regards to bumping it?
>   

I'd suggest that the better question to ask is:

     "Which versions of which distros do we currently intend OE to work on?"

Given that the revisions of Python for the following distributions are
as follows:

Ubuntu 10.04 LTS - 2.6.5
Ubuntu 8.04 LTS - 2.5.2

Debian lenny (stable) - 2.5.2
Debian squeeze (testing) - 2.5.3
Debian sid (unstable) - 2.5.4
Debian etch (oldstable) - 2.4.4

Fedora 12 - 2.6.2
Fedora 11 - 2.6
Fedora 10 - 2.5.2
Fedora 9 - 2.5.1
Fedora 8 - 2.5.1
Fedora 7 - 2.5
Fedora 6 - 2.4.3

RHEL6 (beta) - 2.6.2
RHEL5 - 2.4.3

OpenSUSE 11.2 - 2.6.2
OpenSUSE 11.1 - 2.6.0
OpenSUSE 11.0 - 2.5.2

This would suggest that using 2.5 features should be ok for the majority
of people. My one area of concern would be those using RHEL. RHEL 6
isn't out yet and v.5 uses 2.4.3 - this wouldn't impact me, so I'm not
overly fussed.

> The reason I ask is because I had a user contact me about using Python
> 2.5 features (str.partition) in relocatable.bbclass, I hadn't even
> noticed this and seems like not many others have but it's clearly
> affecting at least one person.
>
> I have a pretty trivial (if ugly) patch to work around this, but it
> raised an interesting question so I thought I'd ask that before sending
> the patch.
>   

The only other question I can think of is "is there an advantage to
using the Python 2.5 features?".

Martyn
> Cheers,
> Joshua
>   


-- 
Martyn Welch (Principal Software Engineer)   |   Registered in England and
GE Intelligent Platforms                     |   Wales (3828642) at 100
T +44(0)127322748                            |   Barbirolli Square, Manchester,
E martyn.welch@ge.com                        |   M2 3AB  VAT:GB 927559189



