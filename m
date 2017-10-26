Return-Path: <s.sonski@gmail.com>
Received: from mail-qt0-f178.google.com (mail-qt0-f178.google.com
	[209.85.216.178])
	by mail.openembedded.org (Postfix) with ESMTP id D706D606CB
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Oct 2017 13:29:53 +0000 (UTC)
Received: by mail-qt0-f178.google.com with SMTP id 31so4229606qtz.9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Oct 2017 06:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Hn1wGyuiIKK2E4S2mCxbLkpCn0hqCg4tHLKBwGVQcGc=;
	b=n5F0hL6uFDOR83HUchZ9L2GEjIlxH2ZuVdpLOKEM4fUCtL1gF9kNUKJ/TunGeTS1WW
	+VYdfJfeTEH3HR/wcZCymZ1YTJsPADI0HymdntKaVxt/Dt5M9ix/W/qdYK7rTFUWEx78
	wStZ5Po/zNi1bWCDkn0+Anah4f2xVRrEVCnLDzsJKbzuwlRUk9UR4558Zv4i82hBIIn7
	l8P4ocymDiZ3/GL4Ceby7v9IjeEKQOjxqCDpal5SVfEC4Z5rFss5k0WT6SRT0cp8nHwA
	+pQ8PWWXzfihjLa8qe/f86Pt8h/rpFLkrqfJze4TdoGii3w86/e2F4IgpIUG1nzJRaN3
	OKYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Hn1wGyuiIKK2E4S2mCxbLkpCn0hqCg4tHLKBwGVQcGc=;
	b=a68qJkWU9PdDl00Fq5YdJ8f3muAePrxRHQvbCAvSr3ge+kmJXqVnQUp37B4WF2qzv8
	UJbxM3EeRy3XPWeTi+LlxgWITIxTuvDKchzYUT5/m/GR7XPJyy6oJG7TSBmDAc+QRr4m
	lZ+IoA7WRbkmDYcn2YvVs3B2beo1BqJcRHZnqtHWC9w7V8r9bZS0UTeLQzpoSbb/tL7V
	Bh5AnCoa5jByc7CyEKMQVbo7Qp5CgLIOAnpEDUP3F2NYplo3WfjJCSnTzy8DU01xqwVf
	hv7FSzJESoK4N4Y1XZuZMuGrz8ZKvJfXlb2H9toe7JSu6kLtZi6Yp4oCnANOaNKN51Dh
	hkuA==
X-Gm-Message-State: AMCzsaV6X+/FmmCMlPetpV4K8e4WVv7nMrRWLkMSPWfRVVBy0PiDI1ew
	mUNdZud7bouZVhNDsT3ZdvXnHEoe5aV2AuI8NBY=
X-Google-Smtp-Source: ABhQp+Sq+F0A1wH3zEAiX7V0aubFvcogbx/6gUR8eI+YKIpD6+/Q/opSBihSU1Wz5Zhl7D7btd4PQW53hG/vbCDVjHc=
X-Received: by 10.200.34.71 with SMTP id p7mr9279545qtp.81.1509024594762; Thu,
	26 Oct 2017 06:29:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.29.75 with HTTP; Thu, 26 Oct 2017 06:29:54 -0700 (PDT)
In-Reply-To: <689fd8ec-97bf-2451-0c7a-1bc4606458e5@zonque.org>
References: <20171017195649.8657-1-s.sonski@gmail.com>
	<20171017195649.8657-2-s.sonski@gmail.com>
	<CA+chaQcK6+mS9SgBTaNdzgLdDS=nhoHNj1crFtPeirxnK1m87Q@mail.gmail.com>
	<8cfe1d21-f003-031b-ae42-024f3be91910@zonque.org>
	<20171026125505.GW9221@denix.org>
	<689fd8ec-97bf-2451-0c7a-1bc4606458e5@zonque.org>
From: Stefan Sonski <s.sonski@gmail.com>
Date: Thu, 26 Oct 2017 15:29:54 +0200
Message-ID: <CAGR_wht7JsOrTdV_e4gp9=hOcwMyn+pH1zWcCsw7xxx1t3hHZQ@mail.gmail.com>
To: Daniel Mack <daniel@zonque.org>
Cc: "Chris E. Rallis" <Chris.Rallis@ravenind.net>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH 2/2] qmake5_base: add OE_QMAKE_OBJCOPY from OBJCOPY
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 26 Oct 2017 13:29:54 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 26, 2017 at 3:07 PM, Daniel Mack <daniel@zonque.org> wrote:
> On Thursday, October 26, 2017 02:55 PM, Denys Dmytriyenko wrote:
>> On Tue, Oct 24, 2017 at 03:33:10PM +0200, Daniel Mack wrote:
>>> Hi,
>>>
>>> On Saturday, October 21, 2017 12:54 AM, Martin Jansa wrote:
>>>> Either this or the ptest change seems to cause:
>>>> http://errors.yoctoproject.org/Errors/Details/157417/
>>>
>>> FTR, I see the same error locally. Reverting both 8fd20e8b1
>>> ("nativesdk-qtbase Enable objcopy for qmake") and 5ec6b97a8
>>> ("qmake5_base: add OE_QMAKE_OBJCOPY from OBJCOPY") in the master-next
>>> branch of meta-qt5 fixes things for me.
>>
>> Have you tried bisecting by any chance?
>
> bisect what exactly? If I take your patch out of my stack, qtbase
> builds. If I don't it doesn't. Can I provide more information somehow?
>
>
> Thanks,
> Daniel

My patch has some weird dependency on  nativesdk-qtbase, where when
the patch is added, qtPrepareTool is not found in some prf files and
the build fails.
Removing my patch, the build succeeds. What I don't get, is how
OBJCOPY depends on some qt5 internal prf scripts, regarding undefined
'qtPrepareTool.
The problem does not occure just using the ptest changes.

