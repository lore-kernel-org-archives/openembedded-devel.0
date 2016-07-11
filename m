Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f174.google.com (mail-qk0-f174.google.com
	[209.85.220.174])
	by mail.openembedded.org (Postfix) with ESMTP id C997760797
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Jul 2016 14:24:53 +0000 (UTC)
Received: by mail-qk0-f174.google.com with SMTP id 82so92890475qko.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Jul 2016 07:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=eiLu0kQEAoUKXiiZD6DnoxygOS5uYsOxEEkFgTaJOxI=;
	b=DeXnNsLShhzqOTNrbnNEr0dAKt/0fBx/LaijPMQ1fqXsm2+VJXy3PBECCulus6e7AW
	C17L0Ol0O5WTBDN7efsNbNF2qAl6oZhfuMn+ka24XgNPRklScyOMCwESuoZ5NrWSCqCf
	6MlHUGQdbbGEtyxILtHohZF/6WlDcDoPVM4CMsrfNRfxxzv/6UbOQdOqOuAq3j30CnG8
	NFwf7FyNdNDSqR/pcb8DGEIaO0wm+jJVOXHA58YIPzqs6Oor0cFWpPJD+4/MibFiyjN5
	8WM6rt8UCJrFGwPOXOPK4VXFQTmCGicDibEOBY9QhRZXwJ+fjXwyJfAhM5af4sasLFt3
	S9Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=eiLu0kQEAoUKXiiZD6DnoxygOS5uYsOxEEkFgTaJOxI=;
	b=FocZMZePwC031M2q7bNrrdM0usDImeW+FzqOEQAkt0+uwTsXaLdl8iv/bo7o+tR+ou
	nuf3gIf7PaUi1t7tFixneEJYQvfJmV+4l7Nrm5W5H1uw9iA4jBavchcP5cb4tWAM7KtR
	as/pPiQbJ8ZyOGz1E5H2nUGWhOwd6F5z8U9wulBF7LZnJu3J3xUYb+mE6e1qvIjbqF9o
	z/YSuOJgaJL3fi7KKMnXawUb4b1qPEx5dRS1adcVQ45I7ybdq2qwMQhtoHE5DGVuaKM3
	ZAj9lkCaIRy60nfw2XJEzz5RR8fp2M38chvPn7k49hRaxZogzj/4GJi0RrEwP4WL+YOX
	fXuw==
X-Gm-Message-State: ALyK8tIn9O2sWKuml9WhheRzGb3MY9JMK/Gkbg1oEzO/JaOza0hmHTHnuk5rnfI9o6OBI4osI45iP4SRKDg92w==
X-Received: by 10.55.74.138 with SMTP id x132mr26056686qka.26.1468247094125;
	Mon, 11 Jul 2016 07:24:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.214.83 with HTTP; Mon, 11 Jul 2016 07:24:24 -0700 (PDT)
In-Reply-To: <CAP9ODKp7eCBu70Aj0M1dT8qPrJK2gnjKD-iVqL58q7Fy7qPTnA@mail.gmail.com>
References: <fd5cee43db0bd882f662d5cd2f3d0c34@xmsnet.nl>
	<CAP9ODKp7eCBu70Aj0M1dT8qPrJK2gnjKD-iVqL58q7Fy7qPTnA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 11 Jul 2016 07:24:24 -0700
Message-ID: <CAMKF1srk_pR33o4OJWQCtRg8XY5V_57rj-2yA7dRzq_A72QSoA@mail.gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: daniel.mcgregor@vecima.com,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	Otavio Salvador <otavio@ossystems.com.br>
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
X-List-Received-Date: Mon, 11 Jul 2016 14:24:54 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jul 11, 2016 at 6:19 AM, Otavio Salvador
<otavio.salvador@ossystems.com.br> wrote:
> Hello Dobbe,
>
> (Added Khem and Fabio on Cc)
>
> On Mon, Jul 11, 2016 at 8:37 AM, Winfried <winfried_mb2@xmsnet.nl> wrote:
>> Commit  33ddb28a6428b02ddcc82d1954ecf27cd426fbb5 (openjdk-8: make GCC6
>> happy) adds gcc option -fno-lifetime-dse, which was added in gcc6. This
>> breaks the compilation of openjdk-native on hosts where gcc4 or gcc5 is the
>> default compiler.
>>
>> If this is intentional, I think the README file should mention that
>> meta-java requires gcc6. Better would be to add the '-fno-lifetime-dse'
>> option only if gcc >= 6 is used for native compilation (if that is
>> possible).
>
> This is a non-desired side effect of the patch. Daniel, could you take
> a look on this?

If you are not using default compiler then you have to take some action

add

CFLAGS_remove = " -fno-tree-dse"
CXXFLAGS_remove = " -fno-tree-dse"

via a .bbappend in your layer.

>
> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

