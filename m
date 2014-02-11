Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f173.google.com (mail-yk0-f173.google.com
	[209.85.160.173])
	by mail.openembedded.org (Postfix) with ESMTP id E04C36EC7D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Feb 2014 16:43:52 +0000 (UTC)
Received: by mail-yk0-f173.google.com with SMTP id 10so11757898ykt.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Feb 2014 08:43:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=UuN9KYBGcbTDaBRFYoS0fUUerJB+NyrQCPeLvJO6GlY=;
	b=E5NUiHr7ANQW9sCPfxL/Fi05lnfH2Kb6iGf0MVkBF/eJKKpSzO5WsedisUoSS14QRR
	SfCMJ3GrwMCS3xUZttkqZvQbU5wnmXcSreyKeQ39Cb/TKs6Z3IWQhGyAbPol+lMFWN++
	mrPXt+8jycV9coKd8vJmygze2BwHukFc+8Np3EznZD8fh7W5pZO1G7iYBSOKziCne1Te
	jcxF4ZUjQVQEhZyi7mnJiTFLl/tNCZSEX7bmoJmSMlFBV1pGaO/7NTm8E9sMDzUoWCMA
	VfWUaCe0L06N3meDkrnV7N9JYPsMfFAY/3Q4QQt1PXD7iIt1r9p8rRUaYgxR1SwrSm/X
	jt8A==
MIME-Version: 1.0
X-Received: by 10.236.30.234 with SMTP id k70mr1409630yha.148.1392137033164;
	Tue, 11 Feb 2014 08:43:53 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.161.3 with HTTP; Tue, 11 Feb 2014 08:43:53 -0800 (PST)
In-Reply-To: <20140211164119.GM3131@edge>
References: <1392067015-16328-1-git-send-email-denis@denix.org>
	<1392067015-16328-2-git-send-email-denis@denix.org>
	<CAP9ODKpyPBJMu+ieCKBZarnGaJTTpq+4w_3zHJxPEuTrSi=g7w@mail.gmail.com>
	<20140211164119.GM3131@edge>
Date: Tue, 11 Feb 2014 14:43:53 -0200
X-Google-Sender-Auth: lhtLLFqJDPh4wsT344nS73kbvV4
Message-ID: <CAP9ODKrf8oF=ey0Zy_eW1RwRc2id1v66sm4LOsq6AGVTxXMDzA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH 1/3] packagegroup-qt5-toolchain-target: add Qt5 SDK target packages
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
X-List-Received-Date: Tue, 11 Feb 2014 16:43:53 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Feb 11, 2014 at 2:41 PM, Denys Dmytriyenko <denys@ti.com> wrote:
> On Tue, Feb 11, 2014 at 12:20:09PM -0200, Otavio Salvador wrote:
>> On Mon, Feb 10, 2014 at 7:16 PM, Denys Dmytriyenko <denis@denix.org> wrote:
>> > From: Denys Dmytriyenko <denys@ti.com>
>> >
>> > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>>
>> This includes some new package we were not installing. Those are:
>>
>> +    libsqlite3-dev \
>> +    qtscript-mkspecs \
>> +    qtxmlpatterns-mkspecs \
>> +    qtsensors-mkspecs \
>> +    qt3d-mkspecs \
>> +    qtlocation-mkspecs \
>> +    qtsvg-mkspecs \
>> +    qtdeclarative-dev \
>> +    qtscript-dev \
>> +    qt3d-dev \
>> +    qtlocation-dev \
>> +    qtsensors-dev \
>>
>> Do you want to do a commit on top of mine or should I just squash it
>> into my previous commit and put a note in the commit log thanking you
>> for the contribution?
>
> Otavio,
>
> As I mentioned in the cover letter, I was already rebaing this on top of your
> WIP branch and should have the patch ready with the above differences - you
> can apply it on top.

I wanted to fully test it against qtcreator and like. If you have the
patch I can apply it for sure.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

