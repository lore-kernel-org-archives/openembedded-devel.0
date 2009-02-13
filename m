Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LXm4K-0003P1-J3
	for openembedded-devel@openembedded.org; Fri, 13 Feb 2009 01:38:12 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LXm31-0003f7-2D
	for openembedded-devel@openembedded.org; Fri, 13 Feb 2009 00:36:51 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Fri, 13 Feb 2009 00:36:51 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Fri, 13 Feb 2009 00:36:51 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 13 Feb 2009 01:36:42 +0100
Message-ID: <gn2faq$rh2$4@ger.gmane.org>
References: <1234456715-23618-1-git-send-email-otavio@ossystems.com.br>	<1234456715-23618-2-git-send-email-otavio@ossystems.com.br>	<1234456715-23618-3-git-send-email-otavio@ossystems.com.br>	<1234456715-23618-4-git-send-email-otavio@ossystems.com.br>	<1234456715-23618-5-git-send-email-otavio@ossystems.com.br>	<1234456715-23618-6-git-send-email-otavio@ossystems.com.br>	<gn1m9a$5tl$5@ger.gmane.org>
	<87y6wbmd2a.fsf@neumann.lab.ossystems.com.br>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20090209 Shredder/3.0b2pre
In-Reply-To: <87y6wbmd2a.fsf@neumann.lab.ossystems.com.br>
Sender: news <news@ger.gmane.org>
Subject: Re: [PATCH 5/6] sun-jre6: add 1.6.0.10
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
X-List-Received-Date: Fri, 13 Feb 2009 00:38:12 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13-02-09 00:48, Otavio Salvador wrote:
> Koen Kooi<k.kooi@student.utwente.nl>  writes:
>
>> On 12-02-09 17:38, Otavio Salvador wrote:
>>> Signed-off-by: Otavio Salvador<otavio@ossystems.com.br>
>>> ---
>> NACK:
>>
>>> +PACKAGES =+ "${PN}-plugin"
>>> +
>>> +FILES_${PN} = "/usr/"
>>> +FILES_${PN}-dbg += "/usr/*/.debug /usr/*/*/.debug /usr/*/*/*/.debug /usr/*/*/*/*/.debug /usr/*/*/*/*/*/.debug"
>>> +FILES_${PN}-plugin = "${libdir}/firefox-3.0.1/plugins/* ${libdir}/sun-java6-${PV}/plugin/i386/ns7/libjavaplugin_oji.so"
>> it would be better to install the plugin to /usr/lib/mozilla/plugins
>> and have a postinst that symlinks it to ${libdir}/firefox-*,
>> ${libdir}/fennec-*, ${libdir}/iceweasle when those are present. That
>> way other browser implement NPAPI (webkit...) can use the one in
>> mozilla/plugins.
>
> I've not added the symbolic links since it is quite easy to make firefox
> to use that dir. In fact, it has already been done at
> d09c754ec52a3f09f1cad6a34d12b9ef7283bc17 and can be done for others I
> think.

Please do :)

> I've fixed the style issues and the plugin installation as you've
> spot. Please check and ack if it is all OK.

ACK



