Received: from fg-out-1718.google.com ([72.14.220.158])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <matgnt@gmail.com>) id 1OLRn3-0003In-Op
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Jun 2010 04:10:14 +0200
Received: by fg-out-1718.google.com with SMTP id 16so478179fgg.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Jun 2010 19:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:references:in-reply-to
	:content-type:content-transfer-encoding;
	bh=9OM1C4Tu1A2Pq08Az26kobaTKoDtuELEydkAMSnsejY=;
	b=eVrEUwyUz+FCPcWF+/UtbD3U5pjFs9Nq56akFWgOzzcJXPGD+hN5qAe/SfqAIG1ME/
	I7YzPiTuSuPyqbKtiztAVLAaPdvGstvlEkeY7FhPuwKa/HaECmaQFAQCi4E0nj2gm5xS
	6l3Uv0QG0pUlasXSKK1efQR+UJ6hI7TQZwOUg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=aqXWcKtI2oS7lt6u/uPUzDhu/W3JbpzcD0p0x2bhIVjQ+SOC3xU2UNGGi3NMsegDWo
	AqtgjubA8t9dBG7bg46kxunLNJqrhpRqJL0TISdOfZCovqx8xcHvBfIGx9+7BK0NiKSZ
	+82ODI+QBPxEX0c/S6Z+U/7SvHY1X0/c+HPTQ=
Received: by 10.87.62.17 with SMTP id p17mr21810743fgk.30.1275876356162;
	Sun, 06 Jun 2010 19:05:56 -0700 (PDT)
Received: from [192.168.5.27] (z0701.wist.uni-linz.ac.at [193.171.42.194])
	by mx.google.com with ESMTPS id e20sm6799720fga.6.2010.06.06.19.05.55
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 06 Jun 2010 19:05:55 -0700 (PDT)
Message-ID: <4C0C5400.8050203@gmail.com>
Date: Mon, 07 Jun 2010 04:05:52 +0200
From: =?UTF-8?B?TWF0dGhpYXMgR8O8bnRoZXI=?= <matgnt@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.9) Gecko/20100423 Thunderbird/3.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4C0992ED.6000102@gmail.com>
	<hue0a5$8e9$1@dough.gmane.org>	<4C0ABE75.8000004@gmail.com>
	<hug34u$hnh$1@dough.gmane.org>
In-Reply-To: <hug34u$hnh$1@dough.gmane.org>
X-SA-Exim-Connect-IP: 72.14.220.158
X-SA-Exim-Mail-From: matgnt@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: qt4 upgrade to 4.7.0-beta1
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
X-List-Received-Date: Mon, 07 Jun 2010 02:10:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06.06.2010 14:09, Koen Kooi wrote:
> On 05-06-10 23:15, Matthias Günther wrote:
>> On 05.06.2010 19:08, Koen Kooi wrote:
>>> On 05-06-10 01:57, Matthias Günther wrote:
>>>> Hello.
>>>
>>>> I've been working with QML (Qt Quick) for some time now and therefore
>>>> I've created recipes for Qt 4.7.0-tp and beta1 versions. The patches
>>>> just disable the not cross compiling parts (e.g. some demos/examples).
>>>
>>> At work I need demos/browser to show off some html stuff, do you have an
>>> idea what the effort would be to get it to build again for qt 4.7?
> 
>> I'm not sure. To make it easy I just disabled the not important parts
>> where compiling errors occured. But I will have a look into it.
> 
> Thanks, I think it's safe to add the recipes as they are and work on
> these things after they are added.

Thanks for adding it Koen.
It seems the two patches for demos/browser and demos/affine are no
longer necessary. I will create a patch to remove it tomorrow. Sorry for
the inconvenient with that.

Regards,
Matthias


