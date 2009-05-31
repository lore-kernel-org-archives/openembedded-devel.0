Received: from [74.125.46.152] (helo=yw-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1MAq00-00034o-QF
	for openembedded-devel@openembedded.org; Sun, 31 May 2009 20:43:12 +0200
Received: by yw-out-1718.google.com with SMTP id 5so3345784ywm.30
	for <openembedded-devel@openembedded.org>;
	Sun, 31 May 2009 11:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to:cc
	:content-type:content-transfer-encoding;
	bh=zHJYfP5I7h7U8SxeTxxC6jJg8N303W+3xYfysgNMPjk=;
	b=wb5qIRRg7OFX5BOKsPN4MCqLnUEOQP8AWciv6eLq+SoFM8B+wP5g1zD/Ql763svoMQ
	DJMW+YM+ufPbigTp5OfmspzKkBp/P28RNN9qR46Jq2asM/AHyua4s4ieb3a2bmzpJ6dD
	gejURFVGInm85JZzO7/wIU5Dz0NplQDWpcfyU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=Mb2iOxABkzuMgaxO56HnC2br460GKDVCIcmgiLQ8v7p/28pYecbsMGBuY0Mt9pKCBJ
	BVFirMUaXPFKcYndgLMicN40sXkco90xTuFKwNmyoq+vwrOKpDBxH9EMZba9BfKjlSBj
	tY4LJQK+yDwtlIwxYSrbu9jFPhh8887JBs3uM=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.100.142.11 with SMTP id p11mr3587506and.186.1243794873226; 
	Sun, 31 May 2009 11:34:33 -0700 (PDT)
In-Reply-To: <gvuhfg$bf$1@ger.gmane.org>
References: <1243774077-19022-1-git-send-email-k.kooi@student.utwente.nl>
	<gvu149$nlk$1@ger.gmane.org>
	<be7a9f3d0905311100j91409d3n8011a9cffdba6fbc@mail.gmail.com>
	<gvuhfg$bf$1@ger.gmane.org>
Date: Sun, 31 May 2009 15:34:33 -0300
X-Google-Sender-Auth: 804069ca3b913761
Message-ID: <be7a9f3d0905311134u767facd2j44807b0756f9d78f@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Cc: openembedded-devel@openembedded.org
Subject: Re: [STABLE][PATCH] xserver-common: add 1.24 from .dev
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
X-List-Received-Date: Sun, 31 May 2009 18:43:13 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello,

On Sun, May 31, 2009 at 3:15 PM, Koen Kooi <k.kooi@student.utwente.nl> wrot=
e:
> On 31-05-09 20:00, Otavio Salvador wrote:
>>
>> Hello,
>>
>> On Sun, May 31, 2009 at 10:36 AM, Koen Kooi<k.kooi@student.utwente.nl>
>> =A0wrote:
>>>
>>> On 31-05-09 14:47, Koen Kooi wrote:
>>>>
>>>> From: Koen Kooi<koen@openembedded.org>
>>>
>>> Grrrrr. git send-email stripped the comment again:
>>> * This makes xdg autostart applications autostart
>>
>> I think it ought to be enabled; in case someone uses a session manager
>> (xfce-session, lxde-session or a own manager) it will reopen them.
>
> question: does anyone use that in stable/2009 together with xserver-commo=
n?

I use :-)

>> I suggest it to have a /etc/defaults/xserver-common that makes it
>> optional.
>
> That would be nice in .dev, but what's your thought on getting this chang=
e
> from .dev to stable/2009 first?

I think it needs to be fixed in dev and then this ought to be done in
stable all together to avoid issues for current users. I'm one that
will have problems with this change.

--=20
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


