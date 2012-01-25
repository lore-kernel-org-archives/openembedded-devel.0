Received: from sanddollar.geekisp.com ([216.168.135.167])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philip@balister.org>) id 1Rq5PY-00018Y-Rn
	for openembedded-devel@lists.openembedded.org;
	Wed, 25 Jan 2012 17:09:25 +0100
Received: (qmail 10322 invoked by uid 1003); 25 Jan 2012 16:00:54 -0000
Received: from unknown (HELO ?192.168.1.104?)
	(philip@opensdr.com@96.240.160.175)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	25 Jan 2012 16:00:54 -0000
Message-ID: <4F202735.8040405@balister.org>
Date: Wed, 25 Jan 2012 11:00:53 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.24) Gecko/20111108 Fedora/3.1.16-1.fc14 Thunderbird/3.1.16
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <1592899.mTy93uB97i@helios> <4F20130D.2010208@balister.org>
	<1908796.glHMrEiIxU@helios>
In-Reply-To: <1908796.glHMrEiIxU@helios>
X-Enigmail-Version: 1.1.2
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Splitting meta-oe
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
X-List-Received-Date: Wed, 25 Jan 2012 16:09:25 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 01/25/2012 09:47 AM, Paul Eggleton wrote:
> On Wednesday 25 January 2012 09:34:53 Philip Balister wrote:
>> On 01/25/2012 07:48 AM, Paul Eggleton wrote:
>>> I think what most people want when they enable meta-oe in their layer
>>> configuration is #1, and it's probably OK to get #2 along with it. They do
>>> not however expect versions of toolchains, eglibc or other fairly
>>> fundamental bits and pieces that might cause their build to fail when
>>> everything worked fine just building with OE-Core (#4). Equally I expect
>>> there will be some people who want just #3 and nothing else.
>>
>> My understanding is the OE-Core toolchains lack the Linaro patches which
>> a extremely useful for people using armv7. So dropping toolchains from
>> meta-oe would be a really bad thing for a large portion of the user base.
> 
> I was suggesting moving these toolchains to a separate layer where those who 
> don't need them aren't tripping over them. Adding such a layer to your 
> configuration is more or less trivial, and once done you would not notice any 
> difference.

We should try and have a face to face meeting with OE developers at ELC
in a few weeks to talk about some of these issues.

Philip


