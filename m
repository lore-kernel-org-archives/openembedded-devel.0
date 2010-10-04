Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vwyodapink@gmail.com>) id 1P2psD-0001GK-Dq
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Oct 2010 20:34:53 +0200
Received: by ewy7 with SMTP id 7so2065365ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Oct 2010 11:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=zAeFGdQpoPB2XLwtH9y5vTqzpQ3bD/vZQ0e9S5oG5vY=;
	b=hNPfLxPVXA0vp85O3e7dg2HzBo+mzqLaYNAhym1f6AmudWzmXI6diJSyjidvMSiBfY
	V3gA8LGRRSutOsGhR6exjAaskbGmkoDRe5zXwWwY28E2R+31+HBOnrUob7agDCaTEYgy
	HDj/9F39T3DZA1e1I6Yt++gNoF2BxlBPHTmi8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=syqa52o+7fO0a4O+su8gxyBkRs5K/+K1WZ98s1v39j49hElOaw9tZPZTx3sm7JWe/D
	U/k67H5X+OBb4oIA6mtbj3+YVfKmTv0ynq4TtUZiM6+EEG14rsVg9+cQr0iL6FW6WA1a
	92vRCkMC3vN7bm1kBy+Q45WmK4fHtnjYh45uc=
MIME-Version: 1.0
Received: by 10.103.176.14 with SMTP id d14mr3405259mup.93.1286217276827; Mon,
	04 Oct 2010 11:34:36 -0700 (PDT)
Received: by 10.220.195.72 with HTTP; Mon, 4 Oct 2010 11:34:36 -0700 (PDT)
In-Reply-To: <AANLkTikEpu0yxUXYZvfiRbgiFjnjc+GEAJ=-_x_Mszkp@mail.gmail.com>
References: <4CA97897.4020001@nedap.com> <4CA97EBC.4040406@eukrea.com>
	<4CA98CEF.3090604@nedap.com>
	<AANLkTik2_YEL-dhKLr9LuJQ78W4WXS4WvUbxDfXeJk8U@mail.gmail.com>
	<4CA99206.5060001@eukrea.com>
	<AANLkTikEpu0yxUXYZvfiRbgiFjnjc+GEAJ=-_x_Mszkp@mail.gmail.com>
Date: Mon, 4 Oct 2010 11:34:36 -0700
Message-ID: <AANLkTi=wjXOWSjoiY0FqUQKU3Y+1hxWFQcvtD7HimFiv@mail.gmail.com>
From: "J. L. " <vwyodapink@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.215.47
X-SA-Exim-Mail-From: vwyodapink@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: trouble compiling udev
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
X-List-Received-Date: Mon, 04 Oct 2010 18:34:54 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 4, 2010 at 11:23 AM, Khem Raj <raj.khem@gmail.com> wrote:
> On Mon, Oct 4, 2010 at 1:36 AM, Eric B=E9nard <eric@eukrea.com> wrote:
>> Le 04/10/2010 10:24, J. L. a =E9crit :
>>>
>>> On Mon, Oct 4, 2010 at 1:14 AM, Jaap de Jong<jaap.dejong@nedap.com>
>>> =A0wrote:
>>>>
>>>> Thanks!
>>>> That seems to work!!
>>>> Something to be added to udev recipe...
>>>
>>> Any chance you can post your recipe I am not sure if I am getting
>>> where you added that in the recipe. Thanks
>>>
>> CFLAGS_append =3D " -Os"
>>
>
> Hi Eric
>
> Now gcc 4.5 is default so people will hit it often. Can you commit
> this workaround
> for time being while gcc is being fixed to cure it with reference to
> upstream bug
> You have my ack for this :)
>
> Thanks
> -Khem
>
>> Eric
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

udev151 builds for me without this fix and I am building with gcc
4.5.. Just thought I would let you know


