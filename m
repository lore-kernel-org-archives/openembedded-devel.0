Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f170.google.com (mail-yk0-f170.google.com
	[209.85.160.170])
	by mail.openembedded.org (Postfix) with ESMTP id F1064609AC
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Aug 2014 20:34:54 +0000 (UTC)
Received: by mail-yk0-f170.google.com with SMTP id 9so6428554ykp.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Aug 2014 13:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=jzqFIDoz0Y3r1D8RR4hpvKNWZGIXgJcFz3nRqICBoV0=;
	b=ND6jDgKEkLKar7Spjx4KG7yuFNAzTHM2ytSUdKVXdxHelbPMYSj+6Okn+H6NCZtpJs
	KdbZrciSB3bmfR23IK0LqKD0FhBP+a2h/MHByCt3YZSYMLFwNZ5tnVSheZKzPH1MlEZb
	+gqRXHY8guA5/h6FK/737la1oSk7fXUWr1mUCjMKNyAyndRXUQESpK92Vd6XqXqv1CLJ
	yGhdn46LiHJx2elA/f9LirSWsECR8KApFNOT6tvSjmnJRhmydGS9i0tZJ3SDpYgn/6dY
	2o5uWV4AC+8S5VbEtYIkplc7E5Su5lhsiBqBhYaBdgG/5jBmqTwnOr7O1SuIGmCkxD3T
	hk1g==
MIME-Version: 1.0
X-Received: by 10.236.31.135 with SMTP id m7mr47588610yha.104.1407789295656;
	Mon, 11 Aug 2014 13:34:55 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.56.201 with HTTP; Mon, 11 Aug 2014 13:34:55 -0700 (PDT)
In-Reply-To: <1467178.TQ7IpLXcoq@peggleto-mobl5.ger.corp.intel.com>
References: <1407177515-15086-1-git-send-email-otavio@ossystems.com.br>
	<CAOd_LFyOC8uR2gk=u2YpB1cq8P_hkqHoYKDxUmou=y1UcBDnVA@mail.gmail.com>
	<CAP9ODKpGbmi=dsvubh9O-ok9_Enc5cewtdC6TQ+H0OJo3Y3_-w@mail.gmail.com>
	<1467178.TQ7IpLXcoq@peggleto-mobl5.ger.corp.intel.com>
Date: Mon, 11 Aug 2014 17:34:55 -0300
X-Google-Sender-Auth: xKi2DT1Un3PwuaFcM4xI5r-0ymw
Message-ID: <CAP9ODKp_1bY0dgmkSbAFf_UJS-nuR9JrvkR5UuKvhYk54piRaQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 1/2] evtest: Stop using Cgit based archive
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
X-List-Received-Date: Mon, 11 Aug 2014 20:35:05 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Aug 11, 2014 at 5:25 PM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> On Monday 11 August 2014 17:06:30 Otavio Salvador wrote:
>> Hello Martin,
>>
>> On Mon, Aug 4, 2014 at 6:26 PM, Cliff Brake <cbrake@bec-systems.com> wrote:
>> > On Mon, Aug 4, 2014 at 2:46 PM, Otavio Salvador <otavio@ossystems.com.br> wrote:
>> >> Hello Martin,
>> >>
>> >> On Mon, Aug 4, 2014 at 3:38 PM, Otavio Salvador <otavio@ossystems.com.br> wrote:
>> >>> The Cgit based archive may change depending on the order of images,
>> >>> timestamp and like causing checksum to change.
>> >>>
>> >>> This patch uses the same 1.25 version but fetching it using Git, so no
>> >>> code changes are done.
>> >>>
>> >>> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>> >>
>> >> Please queue this update for Daisy as well, as this is failing to
>> >> fetch currently (cced other Daisy maintainers).
>> >>
>> >> Acked-by: Otavio Salvador <otavio@ossystems.com.br>
>> >
>> > Acked-by: Cliff Brake <cbrake@bec-systems.com>
>>
>> Please merged this.
>
> It's already merged:
>
> http://cgit.openembedded.org/meta-openembedded/commit/?id=9c762b824cbf7ecd9ce7f7859d22ff89c59fa28d

In Daisy ;-)


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

