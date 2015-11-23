Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com
	[209.85.220.45])
	by mail.openembedded.org (Postfix) with ESMTP id B7B066010D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Nov 2015 19:26:00 +0000 (UTC)
Received: by pacdm15 with SMTP id dm15so200176752pac.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Nov 2015 11:26:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:content-type; bh=QoS+0LUVWntWjejxtNnpYbotf161RRNWJ0QdvkdARcw=;
	b=ioaFwS8jVtc3CtDzmQozkWz1oYIou/P7ZKQlFousRbeMjRja1Xe9UCZZ7I+Vs2fIDW
	wflHYxb2oygeUvM96ji0YZ0gg4UmzKxE5QIGp9o4l86TtR+oS6BvSUjTDTQEPPdq4eau
	qaDNW1f0OujvTrll8hY30j5lu7kRaE61cSnac+ixmd0IzNPY8bSdJZFJYEsrKRKILdNI
	H6WEaAiijxtIYtK/HulMKB3VikyVUsMVHCoRmK5QxLCvM+Cao3rGJ4WWnumjlhYm1Alr
	TFa5FlKC5VG2zE+To/gbv+Yg4dEl7SVgO/PqntqGp/uWt3GUJB0mVB5kJH+Gx138bWxi
	lIww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:content-type;
	bh=QoS+0LUVWntWjejxtNnpYbotf161RRNWJ0QdvkdARcw=;
	b=a0rz2TtqJfNEWMLj5qF692yvUQm5PB5p+xnuCAAFHuzN1rdshoGnMjR6lIFt5H63qs
	a+UosxWjmzyO8M+SZSxoY2fxMol8iw/bbpgIiZlvhLhu3wniOpDTQeCenStiUykSEYxp
	5feQfu/esacVWAK3DLwlV69aW36tcQAkHqXp0xiFrq1tgKEL2qpa9xzBtWjrhJLylI7l
	vsA7cRG4bZYrco62d2YVroGLKzBSb4z4/a3zEuN+Qktk/mOqQkAhh3gMKCGUsMIxaNoN
	w3dC2wP02OATzL4yAdbiC3CNmr3gPjpRyUDzL6xER9WqMUP0akxydbuGrHeCItCetaZP
	pvYA==
X-Gm-Message-State: ALoCoQkVzfkhxoOpqiEy6jzqbN9Mdb19JOdhrFOMSBXYfP2JCwy4TzStdE6NCZv62CWGbhOqvmzO
X-Received: by 10.98.87.83 with SMTP id l80mr17880289pfb.126.1448306760501;
	Mon, 23 Nov 2015 11:26:00 -0800 (PST)
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com.
	[209.85.220.47]) by smtp.gmail.com with ESMTPSA id
	hz4sm11406876pbc.12.2015.11.23.11.25.59
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 23 Nov 2015 11:25:59 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by pabfh17 with SMTP id fh17so206125492pab.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Nov 2015 11:25:59 -0800 (PST)
MIME-Version: 1.0
X-Received: by 10.68.235.40 with SMTP id uj8mr37768900pbc.95.1448306759081;
	Mon, 23 Nov 2015 11:25:59 -0800 (PST)
Received: by 10.66.197.129 with HTTP; Mon, 23 Nov 2015 11:25:59 -0800 (PST)
In-Reply-To: <D00C1F8D-0789-4430-BFF0-392336C81D37@gmail.com>
References: <1448279098-24980-1-git-send-email-otavio@ossystems.com.br>
	<87h9kcoqw5.fsf@email.parenteses.org>
	<CAP9ODKqRoEzU_uHtuBNRzq=3tQi5Um0PV+io6bcCcfm8dfWsjQ@mail.gmail.com>
	<D00C1F8D-0789-4430-BFF0-392336C81D37@gmail.com>
Date: Mon, 23 Nov 2015 17:25:59 -0200
X-Gmail-Original-Message-ID: <CAP9ODKoxbai1=yE4+XBAXOrQ7-JObwGhdOc7zRcuvz6EcbwGtw@mail.gmail.com>
Message-ID: <CAP9ODKoxbai1=yE4+XBAXOrQ7-JObwGhdOc7zRcuvz6EcbwGtw@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-ruby][meta-xfce][PATCH] Move imsettings from meta-ruby to meta-xfce
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
X-List-Received-Date: Mon, 23 Nov 2015 19:26:07 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Nov 23, 2015 at 2:52 PM, Khem Raj <raj.khem@gmail.com> wrote:
>
>> On Nov 23, 2015, at 4:29 AM, Otavio Salvador <otavio.salvador@ossystems.com.br> wrote:
>>
>> On Mon, Nov 23, 2015 at 10:13 AM, Mario Domenech Goulart
>> <mario.goulart@gmail.com> wrote:
>>> On Mon, 23 Nov 2015 09:44:58 -0200 Otavio Salvador <otavio@ossystems.com.br> wrote:
>>>
>>>> The imsettings requires xfconf to run, making it dependent of XFCE. It
>>>> makes no sense to make meta-ruby dependent of XFCE so we move the
>>>> imsettings recipe to meta-xfce and add the meta-ruby dependency there.
>>>
>>> s/dependent of/dependent on/
>>
>> Agreed; Martin, can you fix it when applying or do you wish me to send a v2?
>
> I have sent a patch for same last week see.
>
> http://permalink.gmane.org/gmane.comp.handhelds.openembedded/72211

You missed the addition of meta-ruby dependency for meta-xfce now.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

