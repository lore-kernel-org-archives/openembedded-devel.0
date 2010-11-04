Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1PE0Wl-00068x-8X
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Nov 2010 15:11:00 +0100
Received: by gwaa11 with SMTP id a11so1447342gwa.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Nov 2010 07:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=09y7LrRtN4MrNmjkFbp688hEfFVgb2gCQVxGhj9MJyU=;
	b=HcSTuaOpxDuBLvK3X4rfh77N7ZdK9E7oNEayJ0FntnD/JWhAkMf5QWrIX7uWT9dMdj
	mef+pozoaBfVWB44LSOpQTHWvR5sYlcMj87d8N4M3eGUJpl22YyPA8oPKN9Uh6tnhL4o
	+b9uQwGK0yahDYQxphsfzy1z6Fw/W2YnKevmA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=mQRMhLs7xvbmUAv8Ypw66mGktMrpApuYDNBdipCSU5Bmw+uVQOEfpZy4/Vwrk/Qh7W
	6iEj3nRbmALXaoITG6AzMD2yJyqMYrz0FgCOEr50qIJXgOtWrZFJGzstWfuTaKRcODyW
	qqbm4TuvkzkPz23z/SwUYfM8PGZJp0XRBh5oQ=
Received: by 10.216.26.138 with SMTP id c10mr1996739wea.23.1288879792714; Thu,
	04 Nov 2010 07:09:52 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.0.139 with HTTP; Thu, 4 Nov 2010 07:09:32 -0700 (PDT)
In-Reply-To: <4CD2BBEE.9060706@mentor.com>
References: <09D9BE2AC4AA764DABAA8C91E48D819ED3A429F2@DEMCHP99E35MSX.ww902.siemens.net>
	<09D9BE2AC4AA764DABAA8C91E48D819ED3A42A56@DEMCHP99E35MSX.ww902.siemens.net>
	<4CD2B685.4040409@mentor.com>
	<09D9BE2AC4AA764DABAA8C91E48D819ED3A42AA6@DEMCHP99E35MSX.ww902.siemens.net>
	<4CD2BBEE.9060706@mentor.com>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 4 Nov 2010 07:09:32 -0700
X-Google-Sender-Auth: RTSy3RnlcmAO34n6bukuUiOW24c
Message-ID: <AANLkTinjCcgZyw2VUsHfFus2=BhY2v6m4TLfFwpr1kZr@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: packaged-staging
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
X-List-Received-Date: Thu, 04 Nov 2010 14:11:09 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Nov 4, 2010 at 6:58 AM, Tom Rini <tom_rini@mentor.com> wrote:

> Aeschbacher, Fabrice wrote:
>
>> Aeschbacher, Fabrice wrote:
>>>
>>>> I forgot to say we are using bitbake 1.8.12 and branch stable/2009
>>>>
>>> packaged-staging isn't complete there, sorry.
>>>
>>> Tom Rini
>>>
>>
>> Is it with bitbake-1.8.18 and stable/2009 ?
>>
>
> Sorry, bitbake 1.10.x and master (aka dev) are required for packaged
> staging to be functional.


I *think* bitbake 1.8 should be fine with packaged staging, its the more
recent OE that's critical :)  Fabrice, you may want to look at the Testing
page on the OE wiki and the testing branch as a starting point, as its a bit
more tested version of master.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

