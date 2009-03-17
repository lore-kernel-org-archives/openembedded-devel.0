Received: from [209.85.219.172] (helo=mail-ew0-f172.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Ljcy1-0005xC-TH
	for openembedded-devel@openembedded.org; Tue, 17 Mar 2009 18:21:32 +0100
Received: by ewy20 with SMTP id 20so233132ewy.12
	for <openembedded-devel@openembedded.org>;
	Tue, 17 Mar 2009 10:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=/dsB/hOBLzQXOWxGTrTJ0piSbVpPbCC4SMGnEclxdlw=;
	b=HK388qHqkl0VaGvSonJXMIRgF+wHqAG7hLlaEuMWLhjLRA3IyIKzdaAxBlqIcNz59n
	xJaAR3d7EaD/fcdV/oTIrDSaiUIsPNC3MOR/T2ZtzzAxMklua+GYXP5Wplkrgj3OjDRO
	gMSpOIrHMi5QlT06r5xe1eHC+nrvkzvzXNWaQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	b=TeurY5P8GYqe3yl7gJoyXCw7OZUQ/g/PQ50qocDDa0mgBZ3NEbpz2IjvBzP9l+mDAx
	rnGXEV9KknILH5yTStFfVvDqge1z1hC9ExBDM14lDQ+BaPUeOsQi1FfOGJsVuynyIwOz
	nA+rXBZw9g/humzjxmE2n+U2DetmepUdlLL14=
MIME-Version: 1.0
Received: by 10.210.141.17 with SMTP id o17mr179501ebd.20.1237310394779; Tue, 
	17 Mar 2009 10:19:54 -0700 (PDT)
In-Reply-To: <49BFB6D8.5060804@student.utwente.nl>
References: <1237246365-32076-1-git-send-email-denis@denix.org>
	<49BFB6D8.5060804@student.utwente.nl>
Date: Tue, 17 Mar 2009 18:19:54 +0100
Message-ID: <ac9c93b10903171019l3074c648r1ba2bfff23a31aac@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.219.172
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,RDNS_NONE
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@openembedded.org
Subject: Re: [PATCH 0/3] rename packages/ to recipes/ per earlier agreement
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
X-List-Received-Date: Tue, 17 Mar 2009 17:21:38 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2009/3/17 Koen Kooi <k.kooi@student.utwente.nl>:
> On 17-03-09 00:32, Denys Dmytriyenko wrote:
>>
>> Renaming packages/ directory to recipes/, as one of the several structur=
al
>> changes, was proposed by Koen[1] and agreed/approved by many. Since Koen
>> currently doesn't have time/ability to do the change, and some people ar=
e
>> too eager to wait any longer, he asked me to do it. Please ack/nack.
>>
>> [1] http://thread.gmane.org/gmane.comp.handhelds.openembedded/21326
>>
>> Denys Dmytriyenko (3):
>> =A0 rename packages/ to recipes/ per earlier agreement
>> =A0 recipes: fix hardcoded instances of packages/
>> =A0 base.bbclass: fix base_get_scmbasepath() to look for recipes/ and
>> =A0 =A0 fall back to packages/ while parsing BBFILES
>
> Acked-By: Koen Kooi <koen@openembedded.org>
>
> Now, if you use patchwork, these acks and SOBs get added to your patch
> automagically :)
>
> regards,
>
> Koen
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
Acked-By: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>

if someone is interested in my blessing :-) :-) :-)

Frans


