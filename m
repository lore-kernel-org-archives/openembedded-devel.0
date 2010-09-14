Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1OvV4P-0008Qx-5f
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 Sep 2010 14:57:12 +0200
Received: (qmail 15461 invoked by uid 1003); 14 Sep 2010 12:56:20 -0000
Received: from pool-96-240-180-126.ronkva.east.verizon.net (HELO
	?192.168.1.167?) (philip@opensdr.com@96.240.180.126)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	14 Sep 2010 12:56:20 -0000
Message-ID: <4C8F70F3.1080502@balister.org>
Date: Tue, 14 Sep 2010 08:56:19 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.9) Gecko/20100907 Fedora/3.1.3-1.fc13 Thunderbird/3.1.3
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1284049847-22660-1-git-send-email-fahad_usman@mentor.com>	<AANLkTinLc9Yns87CFTwX4Wk_Wj0k=g02F06e5Aj5HXup@mail.gmail.com>
	<1284468588.11942.25.camel@pkl-fusman-ubuntu>
In-Reply-To: <1284468588.11942.25.camel@pkl-fusman-ubuntu>
X-SA-Exim-Connect-IP: 216.168.135.169
X-SA-Exim-Mail-From: philip@balister.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] omniorb_4.1.4: merged native and non-native recipes
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
X-List-Received-Date: Tue, 14 Sep 2010 12:57:13 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/14/2010 08:49 AM, Fahad wrote:
> On Thu, 2010-09-09 at 19:20 +0200, Frans Meulenbroeks wrote:
>> 2010/9/9 Fahad Usman<fahad_usman@mentor.com>:
>>> +# The following comment is from the omniorb-native recipe which is now merged into this one...
>>> +# Ugly hack so libtool does not find native libs when building cross packages
>>> +# We really only build this package for omniidl anyway
>>> +do_install_virtclass-native_append() {
>>> +        rm -f  ${D}${libdir}/libomni*
>>
>> Can you verify if this is still needed ?
>> I suggest to do that by cleaning both recipes, then remove this hack,
>> then build omniidl-native followed by omniidl
>> If the last one builds fine, I'd say it is afe to leave tout this rm
>>
> Hi Frans,
> looks like omniidl recipes are not in git any more and i couldn't find
> any other package that depends on omniorb or omniorb-native. So, it is
> probably not needed and it should be safe to remove this hack. I will
> submit the updated patch for this.

Please do not push any changes to these recipes unless you have another 
recipe that uses omniorb to test with. I can't test this until I am done 
with my current project and that could be several weeks. There are 
people doing out of tree work that uses this.

Please, please do not chance breaking recipes you do not fully understand!

Philip


>
> Fahad.
>>>
>>>
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


