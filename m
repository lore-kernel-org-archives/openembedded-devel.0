Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LrCss-0008Lx-AG
	for openembedded-devel@openembedded.org; Tue, 07 Apr 2009 17:06:46 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LrCq0-0003rX-89
	for openembedded-devel@openembedded.org; Tue, 07 Apr 2009 15:03:44 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 07 Apr 2009 15:03:44 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 07 Apr 2009 15:03:44 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 07 Apr 2009 17:03:31 +0200
Message-ID: <grfq03$3c8$1@ger.gmane.org>
References: <1239112078-29808-1-git-send-email-vhdirk@gmail.com>
	<grfm9u$l0b$1@ger.gmane.org>
	<eaa8e5210904070745u77fa5d94oc5486ddbda552ec2@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b4pre) Gecko/20090328 Shredder/3.0b3pre
In-Reply-To: <eaa8e5210904070745u77fa5d94oc5486ddbda552ec2@mail.gmail.com>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.2
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW, RDNS_NONE, SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] Added gsoap version 2.7.13
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
X-List-Received-Date: Tue, 07 Apr 2009 15:06:46 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07-04-09 16:45, Dirk Van Haerenborgh wrote:
> Thanks for looking at it.
>
> I've changed everything as advised.
>
> However, I am quite new to both gsoap and OE, hence I do not know how to
> define FILES_${PN} more narrowly.

Basically:

dpkg-deb -c gsoap-ipk-produced-from-old-recipe.ipk

Look at the output e.g.

/usr/bin/foo
/usr/bin/bar

Based on that do:

FILES_${PN} = "${bindir}/foo \
${bindir}/bar \
"

I suspect the PACKAGES and FILES_gsoap-dev trickery was used to keep 
some files *out* of ${PN}.

regards,

Koen

> this recipe is quite similar to gsoap_2.7.7 (which is in the oe.dev repo
> atm) in which FILES_${PN} as broad as here.
>
> -Dirk
>
> 2009/4/7 Koen Kooi<k.kooi@student.utwente.nl>
>
>> On 07-04-09 15:47, Dirk 'Virk' Van Haerenborgh wrote:
>>
>>> The patch is to make sure the just build binary soapcpp2 is used instead
>>> of looking for it in /usr/bin in the staging dir, just the same as
>>> v2.7.7 of gsoap.
>>>
>>
>>
>>   +++ b/recipes/gsoap/gsoap-native_2.7.13.bb
>>> @@ -0,0 +1,16 @@
>>>
>>
>>   +PR = "r1"
>>>
>>
>> remove that
>>
>>   +do_stage() {
>>> +       autotools_stage_all
>>> +}
>>>
>>
>> Remove that (see below)
>>
>>   +++ b/recipes/gsoap/gsoap_2.7.13.bb
>>>
>>
>>   +PR = "r1"
>>>
>>
>> remove that
>>
>>   +inherit autotools
>>>
>>
>> change that to autotools_stage
>>
>>   +do_stage() {
>>> +       autotools_stage_all
>>> +}
>>>
>>
>> That can be removed if you inherit autotools_stage
>>
>>   +PACKAGES = "${PN}-dbg ${PN}-dev ${PN} ${PN}-doc ${PN}-locale"
>>>
>>
>> That looks wrong, remove that
>>
>>   +FILES_gsoap-dev = "${bindir}/wsdl2h ${bindir}/src ${libdir}"
>>>
>>
>> Change that to something like:
>>
>> FILES_${PN}-dev += "${bindir}/wsdl2h ${bindir}/src ${libdir}"
>>
>> And define FILES_${PN} more narrowly.
>>
>> regards,
>>
>> Koen
>>
>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>




