Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1L9jkN-0007nT-9S
	for openembedded-devel@openembedded.org; Mon, 08 Dec 2008 18:18:15 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1L9jgb-00086Q-7Q
	for openembedded-devel@openembedded.org; Mon, 08 Dec 2008 17:14:21 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Mon, 08 Dec 2008 17:14:21 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Mon, 08 Dec 2008 17:14:21 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 08 Dec 2008 18:14:12 +0100
Message-ID: <ghjkl4$gc1$1@ger.gmane.org>
References: <C41AF57F04424526AD798F542197E674@aeglos><493D1A83.1070500@balister.org><48239d390812080508p7585f22bo529c8a5ebf2f438e@mail.gmail.com><8162086526F74198823FA0003D5FA08D@aeglos>	<48239d390812080709l2051390en9ec07e495eff560e@mail.gmail.com>
	<4B4AD5DB834948B0A7AC3D8B722645A6@aeglos>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20081130 Shredder/3.0b1pre
In-Reply-To: <4B4AD5DB834948B0A7AC3D8B722645A6@aeglos>
Sender: news <news@ger.gmane.org>
Subject: Re: Request for a personal git tree for AT91/AVR32
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
X-List-Received-Date: Mon, 08 Dec 2008 17:18:15 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08-12-08 17:26, Ulf Samuelsson wrote:
>> On Mon, Dec 8, 2008 at 4:44 PM, Ulf Samuelsson
>> <ulf.samuelsson@atmel.com> wrote:
>>> I ran into a problem that linux would not build because if you
>>> use linux and request UIMAGE, then you fail because
>>> u-boot-mkimage is not available.
>> Well, u-boot native tools are built perfectly now, and uImages
>> work. Try to build for afeb9260 machine, and see for yourself.
>> I tried that yesterday, it works perfectly.
>>
>
> If you can't download the source you can't build the tools.

Sourcemirrors and tarballstashes in OE provide tarballs, not 1:1 mirrors 
of the scms. Had you actually read the error message you would have 
noticed that it did something like:

1) try source mirror for tarball -> FAIL
2) try upstream repo -> FAIL
3) error out

if 1) fails it means the autobuilder hasn't build and mirror that rev 
yet. 2) means an error on your end, be it corporate firewall or the 
infamous --tags bug in bitbake 1.8.10.

Note that the angstrom sourcemirror has been real good at hiding the 
bitbake 1.8.10 bug.

regards,

Koen





