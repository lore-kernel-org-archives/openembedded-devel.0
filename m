Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f169.google.com (mail-qt0-f169.google.com
	[209.85.216.169])
	by mail.openembedded.org (Postfix) with ESMTP id DA6BC6FEF5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Jul 2016 14:37:39 +0000 (UTC)
Received: by mail-qt0-f169.google.com with SMTP id j35so18606803qtj.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Jul 2016 07:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=jaHdmLEjsztc4OaE7r1jHhObqoqTWri4E5WpJU6vRI4=;
	b=VNu66ZdL7uNRE4pqp00wvjqGwiHZGjhuaTwPLD2tJZBQ0XCPvVx049QMjhNN1YpMVw
	nZ89fW9Sk2MA0Hhk9KT6UmSNm1CDAwhBHlXCs9qXpKTwTPF5HJZeH5kxRZXEKP6apQhe
	JX1bap+0TZRtf2xgD97ZDFUytXaWKAnA4QFFS9iPPyXEu5p+VSi34EnEfaJ9gd0kSIeM
	kCCvVfd+EeXHFEGwQ85D5QnXMtfyNCzmFoMZ0aIqKcBmOW51bDmoOQ/3Trrilhm24UnL
	ZCBJ3pDVd5VqaqyuTSFiZSWogXuFrAhTOfa3+G1sAHL7O6bKGyt9/9MH81WaVUGOPxyD
	5RvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=jaHdmLEjsztc4OaE7r1jHhObqoqTWri4E5WpJU6vRI4=;
	b=U22V6znviOycJz9CiuRuQnpi2r0pCVpPd7h9PPgh3LP16ss8C6fo2yD/GfjbY+Cy0E
	wzxaQ8fQlK1P887arOmY4hOF41CgKEHyo9F3SUabdhMfuHVTl3Qyqi6au7LnmxEM4aEy
	FKbOXN8HLm5UPH18LAmHbM4RslY8lhCe8DI4lyC0jLc+UF6wCcOC2hl4XdB/i6fzlsJb
	pXz8ZLxdX5PQKR7GuIhozaf20i+8rIZlN9d773ooeGPbGyVndhejA9WNtq257nzmTHoH
	6hrkbOE7NIjUsmwQRicZ09kQra7fWxXsuKqZrU7CRatr849z0Zdfr166qqmWNEqKlaW5
	EwPA==
X-Gm-Message-State: ALyK8tK5jtSeYnspEIjav4oPmfqEn441NL66anOQPTrHA+mSGtRuUiZHvPipWsfGrztcXttDfevIxd+m5qoxPw==
X-Received: by 10.200.48.141 with SMTP id v13mr24613233qta.76.1468247859741;
	Mon, 11 Jul 2016 07:37:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.214.83 with HTTP; Mon, 11 Jul 2016 07:37:10 -0700 (PDT)
In-Reply-To: <CAP9ODKr+hbfefRKPvt9vciJhvbg5YboWjo1v6o1UP_t3q6qz=g@mail.gmail.com>
References: <fd5cee43db0bd882f662d5cd2f3d0c34@xmsnet.nl>
	<CAP9ODKp7eCBu70Aj0M1dT8qPrJK2gnjKD-iVqL58q7Fy7qPTnA@mail.gmail.com>
	<CAMKF1srk_pR33o4OJWQCtRg8XY5V_57rj-2yA7dRzq_A72QSoA@mail.gmail.com>
	<CAP9ODKr+hbfefRKPvt9vciJhvbg5YboWjo1v6o1UP_t3q6qz=g@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 11 Jul 2016 07:37:10 -0700
Message-ID: <CAMKF1spT4ADu2axBzz_1xvcp3EToLyfUjuXpxBO7rQb-83ZW1A@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Cc: daniel.mcgregor@vecima.com, Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [meta-java] gcc6 support breaks build for gcc < 6
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
X-List-Received-Date: Mon, 11 Jul 2016 14:37:42 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jul 11, 2016 at 7:28 AM, Otavio Salvador
<otavio.salvador@ossystems.com.br> wrote:
> On Mon, Jul 11, 2016 at 11:24 AM, Khem Raj <raj.khem@gmail.com> wrote:
>> On Mon, Jul 11, 2016 at 6:19 AM, Otavio Salvador
>> <otavio.salvador@ossystems.com.br> wrote:
>>> Hello Dobbe,
>>>
>>> (Added Khem and Fabio on Cc)
>>>
>>> On Mon, Jul 11, 2016 at 8:37 AM, Winfried <winfried_mb2@xmsnet.nl> wrote:
>>>> Commit  33ddb28a6428b02ddcc82d1954ecf27cd426fbb5 (openjdk-8: make GCC6
>>>> happy) adds gcc option -fno-lifetime-dse, which was added in gcc6. This
>>>> breaks the compilation of openjdk-native on hosts where gcc4 or gcc5 is the
>>>> default compiler.
>>>>
>>>> If this is intentional, I think the README file should mention that
>>>> meta-java requires gcc6. Better would be to add the '-fno-lifetime-dse'
>>>> option only if gcc >= 6 is used for native compilation (if that is
>>>> possible).
>>>
>>> This is a non-desired side effect of the patch. Daniel, could you take
>>> a look on this?
>>
>> If you are not using default compiler then you have to take some action
>>
>> add
>>
>> CFLAGS_remove = " -fno-tree-dse"
>> CXXFLAGS_remove = " -fno-tree-dse"
>>
>> via a .bbappend in your layer.
>
> Khem, this is for /native/ so it uses hosts GCC.

oh, in such a case, there are two options, one is to have this difference
detected during configuring and then not inject it via recipe

second is to have an utility in OE to detect the compiler version.
Which was posted in another thread

