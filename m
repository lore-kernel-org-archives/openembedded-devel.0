Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ua0-f179.google.com (mail-ua0-f179.google.com
	[209.85.217.179])
	by mail.openembedded.org (Postfix) with ESMTP id 7045C60762
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Aug 2016 17:09:28 +0000 (UTC)
Received: by mail-ua0-f179.google.com with SMTP id i32so44052654uai.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Aug 2016 10:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to; 
	bh=6erjXnwrhFZSl/PYk5cocJeBMVETwVRA/OccolSqR/s=;
	b=pb0FKFjbnGI5yPAfdjiEyq/YIQcUD7Q0Wlk0oEdqvjvFtlaZuDctEItuWaBItCELJh
	Ou7OArH75kLX7XvGgLEiPj1sJBmi2hoVa+pKGytupvmOyzn4paGlv0B7c83bxNt8iFvo
	D3TqItYB/+F7aeWmhivotkcDHKbhQBWVoDyTO64msJYfTafqgSgJlG4Kt/tocMXANGe5
	Fv/oeSl6rLJ3DAjN2yy0aWGfPI5GZMuHMSq8RrCL8ahO7q3eCJC511rW+KQCcU2poDtE
	Giw83skQIYxZz6asHfCRFYYnVitFcymomCL7+ntgPfvIXRrRkMjGbjuwuE85Un/4POsz
	Ilug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to;
	bh=6erjXnwrhFZSl/PYk5cocJeBMVETwVRA/OccolSqR/s=;
	b=UFgLo5kiO4QWh7nqkYAO2yxVpQxP9vDiYI1N8um7tBf8O8LcXq1dxE6mc7Oh2apUNE
	Zl1BoiQASZxxlFhpSFOe/BwEmNoRElsH/ZgHkSGL6SZs1aLvKq48CeVwC3CjLWem1mIA
	Drjmy7y+NnPUyv3QVclOh7dTa3TDnRf70CQA+HOtShpjqDmxsfME3AwhEGRZenaRWlXn
	20/ACAKNk4b8JMb+o7w2XqFa/frwjTGDf9A5t8wXnehi00AXaFw/1J1mAI21ncQ72N2k
	NU2RLmesrTNPJdNyfZhwPlFccCtU4MYFPprWkxGGbUWXDSPmfOGEk1kkooV+DgHWaOvA
	k/6Q==
X-Gm-Message-State: AE9vXwMvcrLVSLKeEquzeKakAYlUze5IHV2gSi+os6LXSovMTOa60IiT3D92dslTED9wcg==
X-Received: by 10.31.87.194 with SMTP id l185mr2875442vkb.32.1472576968374;
	Tue, 30 Aug 2016 10:09:28 -0700 (PDT)
Received: from mail-ua0-f177.google.com (mail-ua0-f177.google.com.
	[209.85.217.177])
	by smtp.gmail.com with ESMTPSA id 2sm8457193uay.14.2016.08.30.10.09.27
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 30 Aug 2016 10:09:27 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ua0-f177.google.com with SMTP id k90so44189540uak.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Aug 2016 10:09:27 -0700 (PDT)
X-Received: by 10.31.138.74 with SMTP id m71mr2778936vkd.4.1472576966773; Tue,
	30 Aug 2016 10:09:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.154.68 with HTTP; Tue, 30 Aug 2016 10:09:26 -0700 (PDT)
In-Reply-To: <9cb3a54e-58ef-9433-06d9-514238fb9443@siemens.com>
References: <9cb3a54e-58ef-9433-06d9-514238fb9443@siemens.com>
Date: Tue, 30 Aug 2016 14:09:26 -0300
X-Gmail-Original-Message-ID: <CAP9ODKoN2+tduK2qzYG5Mvj1fyZohL2mh0tLbULJD247Gs4rBA@mail.gmail.com>
Message-ID: <CAP9ODKoN2+tduK2qzYG5Mvj1fyZohL2mh0tLbULJD247Gs4rBA@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-java] Unify virtual java providers
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
X-List-Received-Date: Tue, 30 Aug 2016 17:09:29 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Aug 30, 2016 at 11:37 AM, Pascal Bach <pascal.bach@siemens.com> wrote:
> Hello
>
>
> Because I'm experimenting with different java providers (OpenJDK, Oracle Java, Azul Zulu) and thus had a look at different java layers (meta-java, meta-oracle-java).
>
> I noticed that there are many different PROVIDES statements among these recipes, but nothing seems consistent.
>
> My proposal is thus to introduce a consistent naming for these provides so that recipes that depend on java can be written in a JRE/JDK independent way.
> The naming would be the following:
>
> - virtual/java => recipes providing a java runtime for the target (used in meta-oracle-java, replaces: java2-runtime, java2-vm)
> - virtual/java-native => provide a native java runtime (exists already)
> - virtual/javac => provide a jdk for the target (new, nothing like this exists, might never be used but should be defined)
> - virtual/javac-native => provide a jdk for native (exists already)
>
> It should be properly documented in the readme and the virtual packages should be the preferred way for users to depend on java/jre resp javac/jdk
>
> An alternative to the above would be:
>
> - virtual/jre
> - virtual/jre-native
> - virtual/jdk
> - virtual/jdk-native
>
> But this would deviate more from the current naming.
>
> Any feedback on this proposal?

I prefer jre and jdk alternative; let's wait for others to comment.


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

