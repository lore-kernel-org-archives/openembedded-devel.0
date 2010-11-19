Received: from smtp.tibbo.com ([81.171.42.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dvorkin@tibbo.com>) id 1PJPjC-0006X6-Ui
	for openembedded-devel@lists.openembedded.org;
	Fri, 19 Nov 2010 13:06:08 +0100
Received: (qmail 28362 invoked by uid 508); 19 Nov 2010 15:07:04 +0300
Received: from dvhome.kansstel.ru (HELO ?10.1.1.20?) (79.171.10.83)
	by smtp.tibbo.com with SMTP; 19 Nov 2010 15:07:04 +0300
Message-ID: <4CE667EB.5000803@tibbo.com>
Date: Fri, 19 Nov 2010 15:04:59 +0300
From: Dvorkin Dmitry <dvorkin@tibbo.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.15) Gecko/20101031 Mandriva/3.0.10-0.1mdv2010.0 (2010.0)
	Thunderbird/3.0.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4CE64779.3020802@sensortherm.de>
	<AANLkTinAj4fG48Ppz_jwT1nmp+tzntZ9YJPaqat4HbES@mail.gmail.com>
In-Reply-To: <AANLkTinAj4fG48Ppz_jwT1nmp+tzntZ9YJPaqat4HbES@mail.gmail.com>
X-SA-Exim-Connect-IP: 81.171.42.199
X-SA-Exim-Mail-From: dvorkin@tibbo.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: buildserver
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
X-List-Received-Date: Fri, 19 Nov 2010 12:06:08 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

simplest solution, I think, is to have a flag in OE local.conf: 
"send_build_report = true" :)


19.11.2010 13:42, Yury Bushmelev пишет:
> 2010/11/19 Klaus Schwarzkopf<schwarzkopf@sensortherm.de>:
>    
>> Hi,
>>
>> i have some problems with the ti recipes, see my emails on the list.
>>
>> The two problems are:
>> * the recipes are out of date and don't work.
>> * the recipes can't download the source files.
>>
>> My idea is, to have an buildserver. On every commit (every night or every
>> week), the buildserver download the sources and build the recipe.
>>      
> For which DISTRO/MACHINE and image should it build? :)
> What to do with commits while building is in process?
> What to do with non-recipes commits (classes, conf, contrib)
>
>    
>> If the server builds the recipe successful, it copy the source files to the
>> webserver.
>>
>> If the builds fails, the person how committed the recipe recieve a email
>> with the log files.
>>
>> What do you think about my idea?
>>      
> Just remember that OE have a lot of distros, machines and images.
> Ideal case is to test all combinations, but, let's try to imagine how
> long this will be.
>
> We have following number of distros, machines and images:
> $ ls conf/distro/*.conf | wc -l
> 32
> $ ls conf/machine/*.conf | wc -l
> 297
> $ ls recipes/images/*.bb | wc -l
> 99
>
> My testbuilder (phenom II x6) is building one image in about 2 hours.
> So, 32 * 297 * 99 * 2 = 1881792 hours. It is about 214 years if I
> calculate right. Well, cluster of 32 alike machines can reduce this
> time to 6 years :)
>
> It would be great to have buildserver that will rebuild some most
> frequently used combinations once per day. Probably, qemu machines +
> automated testing under qemu.
> Or even create some distributed build system (buildbot?) with server
> (should give tasks to clients) and clients (should build tasks given
> by server).
>
> Other good idea is to have sanity checker running once per day too. It
> may do next things:
> - check recipes syntax
> - check thath recipes SRC_URI can be fetched
> - check recipes for security flaws (we have tool already)
> - ...
> - PROFIT! :) (sorry, just can't not to write this :)
>
>    


