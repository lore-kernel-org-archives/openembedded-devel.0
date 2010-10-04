Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1P2phz-0005pu-UL
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Oct 2010 20:24:20 +0200
Received: by iwn2 with SMTP id 2so7184662iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Oct 2010 11:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=FFOMTbt4Ae4dRA5kpNKwxb34KBlBoQrkzu3t3y7kqIc=;
	b=MlcGVZZQCPoQBtkr0zRvo9We1L7ERhBrXUEUTJqY6o6A1wlEdAPXLJeSmS64HOY4+w
	6saz52qZGMlvVQoBx5TsMKoMHvTfTYeTuuKUW/v1poA0gtqutB624csJoP5nrfQzB2kZ
	rtUs3csvENYS9+plOHFAZQWhYkFaXHOoLtlfk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=hWykhOD7H3yncpJr7a92jQd12myYczEjjXKSju6URgpEtVUm9/D4OoXPol0qOM9IMA
	eoUANQbh2LpxJoE/miaU/vWVdyLCsPODBlB41zQ+bAeDbnzJBoRGBb2tG2mCsIjtXlDf
	ZqlWIRmn+YuEqOaQpG3J+9sdhaAIqQHLf3/wU=
Received: by 10.231.149.207 with SMTP id u15mr10660289ibv.13.1286216637346;
	Mon, 04 Oct 2010 11:23:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.199.1 with HTTP; Mon, 4 Oct 2010 11:23:36 -0700 (PDT)
In-Reply-To: <4CA99206.5060001@eukrea.com>
References: <4CA97897.4020001@nedap.com> <4CA97EBC.4040406@eukrea.com>
	<4CA98CEF.3090604@nedap.com>
	<AANLkTik2_YEL-dhKLr9LuJQ78W4WXS4WvUbxDfXeJk8U@mail.gmail.com>
	<4CA99206.5060001@eukrea.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 4 Oct 2010 11:23:36 -0700
Message-ID: <AANLkTikEpu0yxUXYZvfiRbgiFjnjc+GEAJ=-_x_Mszkp@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
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
X-List-Received-Date: Mon, 04 Oct 2010 18:24:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 4, 2010 at 1:36 AM, Eric B=C3=A9nard <eric@eukrea.com> wrote:
> Le 04/10/2010 10:24, J. L. a =C3=A9crit :
>>
>> On Mon, Oct 4, 2010 at 1:14 AM, Jaap de Jong<jaap.dejong@nedap.com>
>> =C2=A0wrote:
>>>
>>> Thanks!
>>> That seems to work!!
>>> Something to be added to udev recipe...
>>
>> Any chance you can post your recipe I am not sure if I am getting
>> where you added that in the recipe. Thanks
>>
> CFLAGS_append =3D " -Os"
>

Hi Eric

Now gcc 4.5 is default so people will hit it often. Can you commit
this workaround
for time being while gcc is being fixed to cure it with reference to
upstream bug
You have my ack for this :)

Thanks
-Khem

> Eric
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


