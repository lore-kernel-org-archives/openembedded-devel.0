Received: from tone.orchestra.cse.unsw.edu.au ([129.94.242.59])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jayen@cse.unsw.edu.au>) id 1PDaYt-0005U8-Iq
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Nov 2010 11:27:28 +0100
Received: From webmail.cse.unsw.edu.au ([129.94.242.51] ==
	albeniz.orchestra.cse.unsw.EDU.AU) (auth-user jayen)
	(cse-authentic-sender jayen)
	(for <openembedded-devel@lists.openembedded.org>) By tone With Smtp ;
	Wed, 3 Nov 2010 21:26:29 +1100 
Received: from 129.94.175.2 (SquirrelMail authenticated user jayen)
	by webmail.cse.unsw.edu.au with HTTP;
	Wed, 3 Nov 2010 21:26:29 +1100 (EST)
From: "Jayen Ashar" <jayen@cse.unsw.edu.au>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 3 Nov 2010 21:26:29 +1100 (EST)
Message-ID: <1724.129.94.175.2.1288779989.squirrel@webmail.cse.unsw.edu.au>
In-Reply-To: <mailman.2422.1288039798.3514.openembedded-devel@lists.openembedded.or
	g>
References: <mailman.2422.1288039798.3514.openembedded-devel@lists.openembedded.org>
User-Agent: SquirrelMail/1.5.1
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 129.94.242.59
X-SA-Exim-Mail-From: jayen@cse.unsw.edu.au
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
	SPF_HELO_PASS, SPF_NEUTRAL,
	UNPARSEABLE_RELAY autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Python.h LONG_BIT definition error on 64 bit build
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
X-List-Received-Date: Wed, 03 Nov 2010 10:27:29 -0000
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit

I'm trying to cross-compile boost and hitting the same error, so I'd also
like to see this fixed.  I'm not sure that I understand why compiling
boost is using headers from python-native, though.

Thanks,
Jayen

> Date: Mon, 25 Oct 2010 13:02:42 -0700
> From: Steve Sakoman <sakoman@gmail.com>
> Subject: Re: [oe] Python.h LONG_BIT definition error on 64 bit build
> machine To: openembedded-devel@lists.openembedded.org
> Message-ID:
> <AANLkTi=u8D0f9rWHz+YT3B+UaoaOO_iFjfizJUW6-3sC@mail.gmail.com>
> Content-Type: text/plain; charset=ISO-8859-1
>
>
> On Mon, Oct 25, 2010 at 12:48 PM, Khem Raj <raj.khem@gmail.com> wrote:
>
>> On Mon, Oct 25, 2010 at 8:57 AM, Steve Sakoman <sakoman@gmail.com>
>> wrote:
>>
>>> I'm working on a recipe for a new version of hplip (it depends on
>>> python). ?It builds just fine on my 32 bit Ubuntu development machine,
>>>  but when I attempt the build on my 64 bit Ubuntu machines the build
>>> fails with the following error:
>>>
>>> In file included from
>>> /home/steve/source/sakoman-oe/tmp/sysroots/x86_64-linux/usr/include/py
>>> thon2.6/Python.h:58,
>>> ? ? ? ? ? ? ? ? from io/mudext/hpmudext.c:27:
>>> /home/steve/source/sakoman-oe/tmp/sysroots/x86_64-linux/usr/include/py
>>> thon2.6/pyport.h:685:2:
>>> error: #error "LONG_BIT definition appears wrong for platform (bad
>>> gcc/glibc config?)."
>>>
>>> I seem to recall seeing this error in the distant past.
>>>
>>>
>>> Is this a known issue with python on 64 bit machines?
>>>
>>>
>>> Any advice?
>>>
>>>
>>
>> see this https://bugzilla.redhat.com/show_bug.cgi?id=139911
>
> Is this something that we should try to fix in the OE python build?
>
>
> Steve

-- 
jayen                                  http://jayen.web.cse.unsw.edu.au/
phd student                               unsw-k17-301-08 (02 9385 5514)
comp1927 tutor                  http://www.cse.unsw.edu.au/~cs1927/10s2/
rUNSWift 2010                        http://robocup.web.cse.unsw.edu.au/
j-club web admin                       http://jclub.web.cse.unsw.edu.au/
cricos provider code: 00098G



