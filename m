Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sakoman@gmail.com>) id 1QuQHs-0004qt-Vm
	for openembedded-devel@lists.openembedded.org;
	Fri, 19 Aug 2011 16:43:09 +0200
Received: by vwe42 with SMTP id 42so2594370vwe.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Aug 2011 07:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=hbUwgKHtjcOFeiPiOicQvmnXMHa/+OV8im0wuSHJonY=;
	b=cO22i8B44bstYW456ZdyY3YiJ9J0hciOlW5qdI7iTgaPcD4ThKbxr+w6BszdFkosCD
	y09ZfAHehoF4M1erk6IhS8LCS8cvqNfz8WGWxyM9oNClY9KbSA/XOimXQf8DQOe6dlqw
	OnyL/rQEu2/QeOCp0K67oDuizo+9HJZp5980o=
MIME-Version: 1.0
Received: by 10.52.26.134 with SMTP id l6mr2144311vdg.487.1313764707423; Fri,
	19 Aug 2011 07:38:27 -0700 (PDT)
Received: by 10.52.112.161 with HTTP; Fri, 19 Aug 2011 07:38:27 -0700 (PDT)
In-Reply-To: <4E4E717C.2040506@gmail.com>
References: <4E3A3C4B.8040208@dresearch-fe.de>
	<4E40FCA9.7060204@dresearch-fe.de>
	<4E439289.3050005@dresearch-fe.de> <1615282.kebj4eQ1MV@perseus>
	<4E44C076.90407@dresearch-fe.de> <4E4E28AB.8010806@dresearch-fe.de>
	<4E4E717C.2040506@gmail.com>
Date: Fri, 19 Aug 2011 07:38:27 -0700
Message-ID: <CAGDS+nm0mLkVnv3EKRYYA8d-uMwoedPq+N2Q1iXP_eyf8OUOVw@mail.gmail.com>
From: Steve Sakoman <sakoman@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [2011.03-maintenance] unsatisfied dependencies to libgcc
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
X-List-Received-Date: Fri, 19 Aug 2011 14:43:09 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Aug 19, 2011 at 7:21 AM, Khem Raj <raj.khem@gmail.com> wrote:
> On 8/19/2011 2:11 AM, Steffen Sledz wrote:
>>
>> Regards,
>> Steffen
>>
>> PS: I'm i bit disappointed in the weak help from the maintainers in
>> solving the problem. :( But i do not bear grudges[1]. ;-)
>>
>> [1] Hope that's correct english.
>
> personally I would have liked to help more but was short on time and since I
> could not reproduce the problem at my end. It was not obvious to me what the
> problem was.

Khem,

Is there an easy way to tell OE to ignore a recommends for either
libgcc-dev or libgcc-s-dev?  The issue seems to be (at least on my
machine) that packages more or less randomly recommend one or the
other.  Then the image build fails because the two packages supply the
same file.

Steve


