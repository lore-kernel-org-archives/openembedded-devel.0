Received: from [208.84.147.47] (helo=rhodos.klever.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <hacker@klever.net>) id 1KeZkP-0005Ty-0Z
	for openembedded-devel@lists.openembedded.org;
	Sat, 13 Sep 2008 20:21:29 +0200
Received: from pd9539abe.dip0.t-ipconnect.de ([217.83.154.190] ident=hacker)
	by rhodos.klever.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <hacker@klever.net>) id 1KeZhe-0007jQ-LI
	for openembedded-devel@lists.openembedded.org;
	Sat, 13 Sep 2008 20:18:38 +0200
Message-ID: <48CC03F9.6090505@klever.net>
Date: Sat, 13 Sep 2008 20:18:33 +0200
From: Michael Krelin <hacker@klever.net>
User-Agent: Thunderbird 2.0.0.16 (X11/20080724)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <94a0d4530809121559w5f644174j461ec61cb2327fd8@mail.gmail.com>	<48CBE436.9050500@laposte.net>	<94a0d4530809130942n3a6c2095t7018ecbfff9387f4@mail.gmail.com>	<48CBFBBC.7050102@klever.net>
	<94a0d4530809131053u7c2f2c1chb33e5da39c4450aa@mail.gmail.com>
In-Reply-To: <94a0d4530809131053u7c2f2c1chb33e5da39c4450aa@mail.gmail.com>
Subject: Re: [ANN] mtn2git v0.1
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
X-List-Received-Date: Sat, 13 Sep 2008 18:21:29 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

> On Sat, Sep 13, 2008 at 8:43 PM, Michael Krelin <hacker@klever.net> wrote:
>>> I did look at it, but there are some issues. For starters it seems to
>>> be using extensively the manifest, which would probably make it very
>>> slow. Also, it seems to be keeping the trees of all the revisions.
>> Back when mtn2git script was on the early stages of development and I've had
>> some time I've started doing my own mtn2git gateway in c++ (never finished
>> it, though). For what I remember using manifest was the only way, because
>> the changes information mtn automate returns was incomplete or simply wrong,
>> I don't remember the details... Do check your results carefully if you're
>> trying to go this way. Luckily, being slow due to use of manifest should
>> only matter on initial import.
> 
> It's complicated, but hopefully doable.
> 
> That's why there are two methods; one that does a full checkout of the
> revision and imports it into git, and the other one that uses mtn
> automate and fast-import.
> 
> I'm able to import about 60% of the Pidgin code correctly, but after
> that there are issues. That's the benefit of having two modes... I can
> compare the fast one with the exact one and improve the fast one.

I ended up using some hybrid mode myself, but the point is - there's no 
way to avoid pulling manifests all the time and that doesn't imply 
complete checkout.

Love,
H


