Received: from sanddollar.geekisp.com ([216.168.135.167])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philip@balister.org>) id 1RaUNV-0008A7-22
	for openembedded-devel@lists.openembedded.org;
	Tue, 13 Dec 2011 16:34:52 +0100
Received: (qmail 25640 invoked by uid 1003); 13 Dec 2011 15:21:12 -0000
Received: from unknown (HELO ?192.168.1.104?) (philip@opensdr.com@96.240.172.5)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	13 Dec 2011 15:21:12 -0000
Message-ID: <4EE76D67.5060404@balister.org>
Date: Tue, 13 Dec 2011 10:21:11 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.24) Gecko/20111108 Fedora/3.1.16-1.fc14 Thunderbird/3.1.16
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1323707082-9185-1-git-send-email-philip@balister.org>	<1323707082-9185-2-git-send-email-philip@balister.org>	<CAMKF1soquX6jz+ZFpUEgWPkAUFxhcHXBQSug7tFJck8y+1QKng@mail.gmail.com>	<4EE6492F.9030402@balister.org>
	<CAMKF1sq-WGFk4LV6L8Zj4mn-NGymtUDYrZaoK_LBbDMF4_1vCQ@mail.gmail.com>
In-Reply-To: <CAMKF1sq-WGFk4LV6L8Zj4mn-NGymtUDYrZaoK_LBbDMF4_1vCQ@mail.gmail.com>
X-Enigmail-Version: 1.1.2
Subject: Re: [PATCH 2/2] gvfs : Fix build failure due to introduction of host includes.
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
X-List-Received-Date: Tue, 13 Dec 2011 15:34:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/12/2011 04:45 PM, Khem Raj wrote:
> On Mon, Dec 12, 2011 at 10:34 AM, Philip Balister <philip@balister.org> wrote:
>>>>
>>>>  EXTRA_OECONF = "--disable-samba \
>>>> +                --disable-archive \
>>>
>>> You are disabling archive backend explicitly. It might be that someone is using
>>> it successfully. Why does it not work ?
>>
>> With it enabled, the build fails because it looks at host includes. Long
>> term someone will likely fix this, be in the short term, I need this to
>> work so I can move forward with oe-core based stuff.
> 
> OK. I see that we do not list libarchive in DEPENDS if we did then it
> would build I suppose. Can you try that please ?
> 
> so I think at present what you get is that if libarchive is built and
> staged before you build
> gvfs then you get the support compiled in if not then you don't. So
> your patch at least makes
> it consistent by disabling it.

Still fails if you DEPEND on libarchive.

Philip

> 
> Problem only happens if you have libarchive-dev installed on your
> build host which I think
> you do have and hence you see the problem.
> 
> I have no strong feeling on enabling or disabling it but I would
> prefer consistency
> 
> -Khem
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


