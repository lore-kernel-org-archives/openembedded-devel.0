Received: from hermes.mlbassoc.com ([76.76.67.137] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gary@mlbassoc.com>) id 1NUqX7-0004hD-Nq
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Jan 2010 00:52:24 +0100
Received: by mail.chez-thomas.org (Postfix, from userid 999)
	id C9A0C1660309; Tue, 12 Jan 2010 16:50:12 -0700 (MST)
Received: from hermes.chez-thomas.org (hermes_local [192.168.1.101])
	by mail.chez-thomas.org (Postfix) with ESMTP id 8D4861660309;
	Tue, 12 Jan 2010 16:50:12 -0700 (MST)
Message-ID: <4B4D0AB4.1020402@mlbassoc.com>
Date: Tue, 12 Jan 2010 16:50:12 -0700
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.3a1pre) Gecko/20091228 Shredder/3.1a1pre
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <BAY127-W199A6B7DA19A55E32E8648D86C0@phx.gbl>	<d1b08f941001120644q1a82954bhc3e867abadc9fa66@mail.gmail.com>
	<loom.20100112T154902-934@post.gmane.org>
In-Reply-To: <loom.20100112T154902-934@post.gmane.org>
X-SA-Exim-Connect-IP: 76.76.67.137
X-SA-Exim-Mail-From: gary@mlbassoc.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: Saleh Usman <salehusman@hotmail.com>
Subject: Re: bitbaking helloworld
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
X-List-Received-Date: Tue, 12 Jan 2010 23:52:25 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/12/2010 07:50 AM, Saleh Usman wrote:
> Andrea Adami<andrea.adami<at>  gmail.com>  writes:
>
>>
>> Saleh, the ipk can be opened with ar -x
>> Usually one *installs* the ipk...otherwise you can have hard time with
>> the dependencies.
>> (not for helloworld, happily :)
>>
>> Regards
>>
>> Andrea
>>
> and which ipk I should extract that contains executable to be run on my platform

I think there's a bit of confusion here.  Building 'helloword'
does not create a useful embedded environment, i.e. you can't
run it on target/embedded hardware directly.  IIRC you are
trying to deploy (keyword!) this on an OMAP platform.  This
means that you'll need to build something more substantial
that has all the base pieces required to get Linux running
on that hardware.

I'd suggest that you try building something like 'console-image'
This *will* create files in the tmp/deploy/... tree that you've
been told to use.  Once you figure out how to get those files
onto your target and run them, then you can experiment with
adding additional packages, etc.

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


