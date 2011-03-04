Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PvYOr-0002m4-2f
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Mar 2011 18:02:45 +0100
Received: by pvc30 with SMTP id 30so344180pvc.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Mar 2011 09:01:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=RN+evxItDjb5yc6coOOEmZcF9foV3bozg04qADNCjRc=;
	b=JRvnIK6/6IFX0i5Gqw0NIRI0Va7f88Zp4kd7X+Muyw/bIEl73akrxZ4mkh4iLC97UM
	fz8dTu/uoJRkiSzqbuJYm89PnSxS2W6iqFdAc/xq8y08i7USRptHqwQuz6Rxzn7sFrSk
	2n3vYaiFuvAE5eEsxOFGdxl7uMP/AWqVDibHQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=wlWj0p2Nn/mSlGfqfrQzZdm4cvUhefikljtw0POVTewFtZY9A12Gtdb3P8EavpV5eP
	aKTxlZWKx+XwPR+eX/1jEE3J04neIUTLQQILPrA3SLCLZUhmRsPyLRBfs4r+vRbIQ5No
	NzK5ub02v0QilXW/8GQPxq0UabuVFIg1cObsU=
Received: by 10.142.196.17 with SMTP id t17mr691931wff.15.1299257674044;
	Fri, 04 Mar 2011 08:54:34 -0800 (PST)
Received: from [192.168.1.70] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id 25sm3182644wfb.22.2011.03.04.08.54.32
	(version=SSLv3 cipher=OTHER); Fri, 04 Mar 2011 08:54:32 -0800 (PST)
Message-ID: <4D711947.4030104@gmail.com>
Date: Fri, 04 Mar 2011 08:54:31 -0800
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US;
	rv:1.9.2.14) Gecko/20110221 Thunderbird/3.1.8
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTinUjtis22ZnLaP7uc0fa9nzxvhWod2uv43ZcJH=@mail.gmail.com>	<1298669695.3818.5.camel@lenovo.internal.reciva.com>	<AANLkTi=afktV1HC4Jdq_ammNdA+h4iMAWdJT809s+LMv@mail.gmail.com>	<1298905700.23547.6.camel@phil-desktop>	<AANLkTimyU4bSm9tM2LO5bMoqiFQqZXxt5Js7fg0B_HhJ@mail.gmail.com>	<1298913422.23547.20.camel@phil-desktop>	<AANLkTimomznky1rBn5QTqzS16O6Lk3VxHUx1pG+ULe3v@mail.gmail.com>	<1298979308.23547.67.camel@phil-desktop>	<AANLkTimk6cXCRROwcD5cOkfarJuMkvg=A0cM_Um6oOSZ@mail.gmail.com>	<1299080486.23547.230.camel@phil-desktop>	<20110303041807.GA2692@sakrah.homelinux.org>
	<1299254943.23547.334.camel@phil-desktop>
In-Reply-To: <1299254943.23547.334.camel@phil-desktop>
Subject: Re: Missing GLIBC_<version> tags on binaries
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
X-List-Received-Date: Fri, 04 Mar 2011 17:02:45 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 3/4/2011 8:09 AM, Phil Blundell wrote:
> On Wed, 2011-03-02 at 20:18 -0800, Khem Raj wrote:
>> On (02/03/11 15:41), Phil Blundell wrote:
>>> Yeah, that might be true.  Or we could maybe just switch the default
>>> linker to be gold, at least on targets that it supports.
>>
>> Yes I have been doing this slowly for ARM. but probably it will be
>> better with gcc 4.6 where linker will be selectable with options
>
> I'm not quite sure I understand what you're saying there.  Can you
> clarify?
>

I am talking about --with-linker option

> p.
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



