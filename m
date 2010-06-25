Received: from fg-out-1718.google.com ([72.14.220.159])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fat031c@gmail.com>) id 1ORwz8-00076m-GI
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Jun 2010 02:41:35 +0200
Received: by fg-out-1718.google.com with SMTP id 22so2030040fge.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Jun 2010 17:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:from:to:references
	:subject:date:mime-version:content-type:content-transfer-encoding
	:x-priority:x-msmail-priority:x-mailer:x-mimeole;
	bh=UeiDrDRRd9niZkUm7qqw7UoZVKJ66GR6IXswE2RCTwo=;
	b=tXqDV7c49/7coBmZ6y7ozPHiOWqTwQO8tpnW2bI9NgSjf12lPxjk/IhPYctBiCb8Zb
	loADFrOXutAkZRHuYajXr+07sltAF59m5O4qwqbGKIq7NKq/GGqw/cftu+JhYr2anwj4
	z7h14tIkE1tCyHAGseOOjgMPqqm8ADvkngAWY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:from:to:references:subject:date:mime-version
	:content-type:content-transfer-encoding:x-priority:x-msmail-priority
	:x-mailer:x-mimeole;
	b=gmdRVhosKq6XKTBaqnHhNsLR6it4BSfOSS/Fl3syGTAwBnWCq/XKbB9Uh3q2oJT6N+
	03AZoD5r03uF++JBbGQqJWYNZiAwTo2hRr7WvYcLZBba+GhhPDzMTNHJ7ffoTUumvPZY
	SKM6gc7uY6c7Gvb6uceC2KgHFTUT340yRvs28=
Received: by 10.102.226.11 with SMTP id y11mr3386724mug.54.1277426218535;
	Thu, 24 Jun 2010 17:36:58 -0700 (PDT)
Received: from atverdohlebov ([94.28.104.114])
	by mx.google.com with ESMTPS id e10sm12822658muf.38.2010.06.24.17.36.56
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 24 Jun 2010 17:36:57 -0700 (PDT)
Message-ID: <B4EAD150EF8844DDB3676A4A9B08C120@rhonda.vtc.ru>
From: "Andrew Tverdohlebov" <fat031c@gmail.com>
To: <openembedded-devel@lists.openembedded.org>,
	<raj.khem@gmail.com>
References: <3511CCD655164D0DACCECB9DE0506610@rhonda.vtc.ru>
	<20100624151848.GD28292@gmail.com>
Date: Fri, 25 Jun 2010 11:36:53 +1100
MIME-Version: 1.0
X-Priority: 3
X-MSMail-Priority: Normal
X-Mailer: Microsoft Outlook Express 6.00.2900.5931
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2900.5931
X-SA-Exim-Connect-IP: 72.14.220.159
X-SA-Exim-Mail-From: fat031c@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS,
	STOX_REPLY_TYPE autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: How to select specific version of dependant component
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
X-List-Received-Date: Fri, 25 Jun 2010 00:41:35 -0000
Content-Type: text/plain; format=flowed; charset="ISO-8859-1";
	reply-type=original
Content-Transfer-Encoding: 7bit

Great thanks !
It works.
one small question : what does the '_local' suffix mean ?

----- Original Message ----- 
From: "Khem Raj" <raj.khem@gmail.com>
To: <openembedded-devel@lists.openembedded.org>
Sent: Friday, June 25, 2010 2:18 AM
Subject: Re: [oe] How to select specific version of dependant component


> On (24/06/10 16:51), Andrew Tverdohlebov wrote:
>> Dear openembedded community,
>>
>> Could you give me a hint how to write a recipe that refers to specific 
>> version of a library.
>
> you can use PREFERRED_VERSION_libnet_local = "1.0.2" in your local.conf
>
>>
>> For example my package depends on libnet 1.0.2
>> If I write
>> DEPENDS += "libnet"
>> it will take libnet with maximum version number 1.1.2
>> How can I instruct bitbake to take libnet 1.0.2 ?
>>
>> In other recipes I saw something like
>> DEPENDS += "libnet (= 1.0.2)"
>>
>> But it doesn't work in my case for some reason.
>>
>> Huge thanks in advance,
>> Andrew
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> 



