Return-Path: <otavio.salvador@gmail.com>
Received: from mail-pa0-f54.google.com (mail-pa0-f54.google.com
	[209.85.220.54])
	by mail.openembedded.org (Postfix) with ESMTP id EA74373FC8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 May 2015 23:03:22 +0000 (UTC)
Received: by pabtp1 with SMTP id tp1so29306132pab.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 May 2015 16:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=3NMCFYbPs7KQFPece92/6WARrKxcq64RybIpC0VCAPM=;
	b=VERuEaHqNUV5h7wyRBZSQg3kDSq3gNtjaVhja9V94HRvrKKHx6lCgkOKM+LunG2yY6
	FWaXGu2pKHfzuJmd6+k6xBEU/O0DoJljxjVPj9y/lJdU2qAPQY1dDRypKWyI/VggMlAp
	x8cDKgjR8uzVVhroYPAc3Dbg/LfLtUbOCRJOpq8gFERxkiI/0RtSgoSMl7feTlHFVQel
	5oFmYb6JtPJo1QpF7OgHDMYqLbE1QLjUySnMma1Y6dI51g9pHzAuH18CsPq6UndClAPl
	+3gxc2Ysc9F2DkQpngsfMXGly+pXUzMZHOMoxgpd1/XyzpKX9tn5u3UqUk9NB148X+xo
	crUQ==
MIME-Version: 1.0
X-Received: by 10.70.100.168 with SMTP id ez8mr31962043pdb.129.1431471804117; 
	Tue, 12 May 2015 16:03:24 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.70.34.109 with HTTP; Tue, 12 May 2015 16:03:24 -0700 (PDT)
In-Reply-To: <99E5B291-EE3A-42A8-8F69-C0A905CE0626@gmail.com>
References: <1431458743-25856-1-git-send-email-picmaster@mail.bg>
	<99E5B291-EE3A-42A8-8F69-C0A905CE0626@gmail.com>
Date: Tue, 12 May 2015 20:03:24 -0300
X-Google-Sender-Auth: jUew6iuwsB4WpLLRTXHN6RAVyr8
Message-ID: <CAP9ODKoVnHAytWbq1nk3_G3rm9U9HKO_p2qZtuVv8rD2hh6WTQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-browser][PATCH] chromium: Use bitbake variable instead of shell variable
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 12 May 2015 23:03:26 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, May 12, 2015 at 7:55 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> On May 12, 2015, at 12:25 PM, Nikolay Dimitrov <picmaster@mail.bg> wrote:
>>
>> Change CHROMIUM_BUILD_TYPE to Bitbake variable, otherwise Chromium files are
>> not installed in the holding area, and Chromium fails to start on the target.
>>
>> Signed-off-by: Nikolay Dimitrov <picmaster@mail.bg>
>
> this is ok.

Khem, please push it :)

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

