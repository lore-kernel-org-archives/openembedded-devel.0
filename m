Received: from [216.145.245.197] (helo=mx01.dls.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mwester@dls.net>) id 1Kx2Kf-00055t-3C
	for openembedded-devel@openembedded.org; Mon, 03 Nov 2008 17:31:13 +0100
Received: from [209.242.7.188] (helo=[192.168.231.111])
	by mx01.dls.net with esmtpa (Exim 4.69)
	(envelope-from <mwester@dls.net>) id 1Kx0gh-0005ok-JQ
	for openembedded-devel@openembedded.org; Mon, 03 Nov 2008 08:45:52 -0600
Message-ID: <490F0E99.6030401@dls.net>
Date: Mon, 03 Nov 2008 08:45:45 -0600
From: "Mike (mwester)" <mwester@dls.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.8.1.17) Gecko/20080914 Thunderbird/2.0.0.17 Mnenhy/0.7.5.666
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <490BF303.1030701@dls.net>
	<490E5FAA.9070206@dls.net>	<200811031347.08952.zecke@selfish.org>
	<87ljw1ey5l.fsf@neumann.lab.ossystems.com.br>
In-Reply-To: <87ljw1ey5l.fsf@neumann.lab.ossystems.com.br>
Subject: Re: [RFC] Re: DISTRO_PR, ipkg dependencies, and meta toolchains...
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
X-List-Received-Date: Mon, 03 Nov 2008 16:31:13 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Otavio Salvador wrote:
> Holger Freyther <zecke@selfish.org> writes:
> 
>> On Monday 03 November 2008 03:19:22 Mike (mwester) wrote:
>>> Mike (mwester) wrote:
>>>
>>> (Replying to my own email, and what's worse -- I'm top-posting!)
>>> (And I changed the subject line to add [RFC] to get your attention.)
>>>
>>> I found the problem.  Here's a fix:
>> eek, otavios and richard went over it. could you please comment?
> 
> It is fixed in current GIT and works fine for me since then... 

I'm not sure what you are saying here -- I'm using the GIT tip, and the
patches I posted are required.  It's really quite easy to see -- just do
"ar x something-dev.ipk", extract the control file, and look at the
dependency -- without the patch I posted, the dependency on package
"something" is written with an explicit version number that does not
exist, because it does not have the DISTRO_PR on it.

Mike (mwester)



