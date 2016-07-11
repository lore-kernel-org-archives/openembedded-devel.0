Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-vk0-f47.google.com (mail-vk0-f47.google.com
	[209.85.213.47])
	by mail.openembedded.org (Postfix) with ESMTP id 396C46FF7B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Jul 2016 14:28:33 +0000 (UTC)
Received: by mail-vk0-f47.google.com with SMTP id o63so57916957vkg.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Jul 2016 07:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=nrMFVhyrNRQyturw2JJ3lKzLtDdl846F9yRP6Cx5304=;
	b=nrRTFpwk9YYTPd7pjhStnDM34yBFEbmXVwhaWGBdMYphPLBCB8Pp98aJkimugFpIBs
	xyYYMxST2SiDQhIM5tsM9wxhUaarzrdrr5OJiYzWw6uvHgPLTNH76GW6lJVCOqptxPiV
	yvLrq//+E7x6+Xpaol5Fr9+lTAf0x8NThXosi/bv8BcHsdZGkLx3HhXjzyTHkHejwI8s
	xP6f7aIxVKQNggQieuLm/ofOs8007vvX2ugU0TkG4HEAHXmrEzVKr+3ziH7k1B8ZWhFv
	az99zrswroPAVugDJRYsTYM8gJS4cErXTniue3D5X6gboSoxHAulXJ2E5G8jqqTi9wWV
	XoqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=nrMFVhyrNRQyturw2JJ3lKzLtDdl846F9yRP6Cx5304=;
	b=FO/UIffj4ghAgI6M4mS5eXqlMWV6rgQBBCzY/BstbKNWLw0wzYIBxm0AOvVzPRI4un
	4+7nm3iVtPBrtqnMxGIvbyCYDi6HfWmtgLtyibHALaexRQoGaIWfTHuG7i6DmHZ1piFW
	XJBIeeRJSQcM9+j7w6eWMOmzv3CB/LZErWiTGUbeXezY/CIaF2QVKM89jQnYCLP8nX4F
	XxB/Y4xckIxSwoMlkn5MsW4ZC9slmFiPubkeepYt0L3A14qvTZ8grn+BNtmnRgnCimAq
	G/p4Damm/wHOmEMzQeRTXQGbzuLkQUyiPgHcfnGrxVrjQrqCSk4QSr5i41xbY5qn554I
	5gyw==
X-Gm-Message-State: ALyK8tJ0EyWRUdlsPsZ0t53QElqQbfcuDyiQRWhzqwsd2TMs2EcwBE1IYI/beyFSYAerWg==
X-Received: by 10.31.227.197 with SMTP id a188mr7791362vkh.136.1468247313618; 
	Mon, 11 Jul 2016 07:28:33 -0700 (PDT)
Received: from mail-vk0-f42.google.com (mail-vk0-f42.google.com.
	[209.85.213.42])
	by smtp.gmail.com with ESMTPSA id 41sm2538830uag.27.2016.07.11.07.28.32
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 11 Jul 2016 07:28:32 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-vk0-f42.google.com with SMTP id v6so140795276vkb.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Jul 2016 07:28:32 -0700 (PDT)
X-Received: by 10.159.35.143 with SMTP id 15mr3643391uao.39.1468247311993;
	Mon, 11 Jul 2016 07:28:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.192.195 with HTTP; Mon, 11 Jul 2016 07:28:31 -0700 (PDT)
In-Reply-To: <CAMKF1srk_pR33o4OJWQCtRg8XY5V_57rj-2yA7dRzq_A72QSoA@mail.gmail.com>
References: <fd5cee43db0bd882f662d5cd2f3d0c34@xmsnet.nl>
	<CAP9ODKp7eCBu70Aj0M1dT8qPrJK2gnjKD-iVqL58q7Fy7qPTnA@mail.gmail.com>
	<CAMKF1srk_pR33o4OJWQCtRg8XY5V_57rj-2yA7dRzq_A72QSoA@mail.gmail.com>
Date: Mon, 11 Jul 2016 11:28:31 -0300
X-Gmail-Original-Message-ID: <CAP9ODKr+hbfefRKPvt9vciJhvbg5YboWjo1v6o1UP_t3q6qz=g@mail.gmail.com>
Message-ID: <CAP9ODKr+hbfefRKPvt9vciJhvbg5YboWjo1v6o1UP_t3q6qz=g@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Mon, 11 Jul 2016 14:28:34 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jul 11, 2016 at 11:24 AM, Khem Raj <raj.khem@gmail.com> wrote:
> On Mon, Jul 11, 2016 at 6:19 AM, Otavio Salvador
> <otavio.salvador@ossystems.com.br> wrote:
>> Hello Dobbe,
>>
>> (Added Khem and Fabio on Cc)
>>
>> On Mon, Jul 11, 2016 at 8:37 AM, Winfried <winfried_mb2@xmsnet.nl> wrote:
>>> Commit  33ddb28a6428b02ddcc82d1954ecf27cd426fbb5 (openjdk-8: make GCC6
>>> happy) adds gcc option -fno-lifetime-dse, which was added in gcc6. This
>>> breaks the compilation of openjdk-native on hosts where gcc4 or gcc5 is the
>>> default compiler.
>>>
>>> If this is intentional, I think the README file should mention that
>>> meta-java requires gcc6. Better would be to add the '-fno-lifetime-dse'
>>> option only if gcc >= 6 is used for native compilation (if that is
>>> possible).
>>
>> This is a non-desired side effect of the patch. Daniel, could you take
>> a look on this?
>
> If you are not using default compiler then you have to take some action
>
> add
>
> CFLAGS_remove = " -fno-tree-dse"
> CXXFLAGS_remove = " -fno-tree-dse"
>
> via a .bbappend in your layer.

Khem, this is for /native/ so it uses hosts GCC.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

