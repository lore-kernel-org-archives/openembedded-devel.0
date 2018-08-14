Return-Path: <andre.draszik@gmail.com>
Received: from mail-yw1-f65.google.com (mail-yw1-f65.google.com
	[209.85.161.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0B96C74573
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Aug 2018 08:27:16 +0000 (UTC)
Received: by mail-yw1-f65.google.com with SMTP id c135-v6so15636166ywa.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Aug 2018 01:27:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Epy8lHqDUBZTEEWoH5XIJ9Kim/Xb1Q3FF6Rh2MEpftw=;
	b=BbNzU3GWjbLrhaHaoOJgCXOa0yhH9UGQT/Ytz/YCx8bJyEsHZf9Q6nFAmcN1j0CwIY
	N/Oa+USVZe0X7W30rimiUalEq9zZ+xjYdCr1Hz/vaaFZcxrtBEcSl1WA9jCWuwnwdjaa
	ZT/IERiJzlzRNNkbWe7+Ca75DVhK1tpW/hyC4MQ8Wade+SW12LPoZdWafKUYigQSLEne
	umJFt4ATxm+iD2frALJ2eV+2UJMqbMUKgJPyUh0zDmkH/KqTOD7tolkgMOyfiKjd4SO8
	G8vgmc4RBa3GnwywtskXiUg3o2e+Wx0ydTh8cJi3WAt3/KzK0MXkqEmDCIktKdT++GR1
	HtOQ==
X-Gm-Message-State: AOUpUlG1GyzSFCOm/7m+7jvYCjfif1IgPYtjDEl3g/VTea12sbb3q1BE
	+FgBPOAwfX6hA6AjpgCfhc9+tqwT
X-Google-Smtp-Source: AA+uWPyrdDzvj/C1rMUEYRj90ArPX39ofu/MNzVRPvvYMn1vrC0Q8mB7j3lXrACoipGesXhqDVZ6gg==
X-Received: by 2002:a81:d52:: with SMTP id
	79-v6mr11765695ywn.123.1534235237821; 
	Tue, 14 Aug 2018 01:27:17 -0700 (PDT)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	139-v6sm13660198ywr.61.2018.08.14.01.27.16
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 14 Aug 2018 01:27:16 -0700 (PDT)
Message-ID: <e59fb02e35fd04a6b888ed84bc409531c579cf18.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 14 Aug 2018 09:27:14 +0100
In-Reply-To: <20180813154628.32257-1-richard.leitner@skidata.com>
References: <20180813154628.32257-1-richard.leitner@skidata.com>
X-Mailer: Evolution 3.28.2-1 
Mime-Version: 1.0
Subject: Re: [meta-java][PATCH v2] icedtea: disable error format-overflow for gcc 7
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
X-List-Received-Date: Tue, 14 Aug 2018 08:27:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2018-08-13 at 17:46 +0200, Richard Leitner wrote:
> From: Andreas Obergschwandtner <andreas.obergschwandtner@skidata.com>
> 
> As no patch has been found in debian and hotspot repo for this issue we
> just disable this warning which was introduced with GCC 7.
> 
> Also known as: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=881824

Two points:

TBH, I'd be a bit wary of this considering the recent fallout from silencing
compiler warnings. Can you try to address this instead please?

E.g. OpenJDK-8 has very similar code, so should be possible?

Also, I have gcc 7.3, yet I don't see that error. Is there something else
happening?


Cheers,
Andre'


