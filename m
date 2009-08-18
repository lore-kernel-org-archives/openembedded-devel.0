Received: from [80.91.229.12] (helo=lo.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MdMIj-00038i-9J for openembedded-devel@lists.openembedded.org;
	Tue, 18 Aug 2009 12:52:25 +0200
Received: from list by lo.gmane.org with local (Exim 4.50) id 1MdM2B-00050z-Sr
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Aug 2009 12:35:19 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Aug 2009 12:35:19 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Aug 2009 12:35:19 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 18 Aug 2009 12:34:56 +0200
Message-ID: <h6e04g$h0m$1@ger.gmane.org>
References: <1250551346.5083.3@zaurus> <1250591188.3555.5.camel@utx.utx.cz>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1.3pre) Gecko/20090730 Shredder/3.0b4pre
In-Reply-To: <1250591188.3555.5.camel@utx.utx.cz>
Sender: news <news@ger.gmane.org>
Subject: Re: xtscal fails + other Xorg init problems.
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
X-List-Received-Date: Tue, 18 Aug 2009 10:52:25 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18-08-09 12:26, Stanislav Brabec wrote:
> Stanislav Brabec wrote:
>
>> There are two recipes for the calibrate library: libxcalibrate and
>> xcalibrate
>>
>> There are two recipes that provide prototypes: calibrateproto
>> and xcalibrabrateext
>>
>> Only some of these combinations result in a working environment.
>>
>> I'll test, whether latest library version works with xserver-
>> kdrive-1300.
>
> Yes, xtscal works with xserver-kdrive-1300 and latest libxcalibrate and
> calibrateproto.
>
> It didn't work for kdrive based builds, because kdrive recipe wants
> libxcalibrate, but xtscal wants xcalibrate. One dependency chain
> overwrites the another with undefined result depending on the build
> order.
>
> That is why I would like to propose:
> - remove all xcalibrate and xcalibrabrateext recipes
> - find recipes and images that need them and migrate them to
> libxcalibrate and calibrateproto.
> - fix git versioning of libxcalibrate and calibrateproto, maybe
> increment PE.

Go ahead :)



