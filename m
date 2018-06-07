Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-oi0-f47.google.com (mail-oi0-f47.google.com
	[209.85.218.47])
	by mail.openembedded.org (Postfix) with ESMTP id CCC18787C1
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Jun 2018 13:56:36 +0000 (UTC)
Received: by mail-oi0-f47.google.com with SMTP id d5-v6so8678712oib.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Jun 2018 06:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=EfjoByAJUwnE8slx4scua5mFk7UKMS0R1/XuszPf6F8=;
	b=woarswDJ07kWLkrY83vpbp1ZqJ1uyHdh6n67qo0BzXbOdhotn7pS9rZu8v7UcoN+FF
	OUTA41+eIXUsw/QXPM0egpR5WgLThGU662TV1TYYMm3hmV2VNlEyKzgmwb0wZQf4IxBi
	ALdOelNRTJAR4HCH+8uPS7r4hfDV7Qy/T13eMUWGRc1cMGKDuJ+CDaVkobN6AShZc9HU
	U+jU6u9ij78t13lSUjd8XlLnH3sHUMO/EkNfT9AY+WpINpz9wZnAoZYtI88V5cI+/+2P
	DyieEaHAvToUDRbANsqD4uWch0tk53R8ftcHeS0Vu/XwLEfj2/EYcntgINEj+lJG9gTo
	B/ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=EfjoByAJUwnE8slx4scua5mFk7UKMS0R1/XuszPf6F8=;
	b=cpBFFtoTYIucZs4S20VZkndMIZfFCOvGp8ZO/nX228wQPy27INXPgOV3b0te/4LOib
	zIptlp0T5+JEDaB9S04FGUBNIuMW6rb+tJmw89cPzLrFxvulqrXFY5m50klNvhBGaJzy
	+tqcm0gILFIg0Z63RUiVvYos8ytQC8vsbWM8H5zs0ynNMumxOAKKdpkg9vnmVELPiFRT
	8W9HZ8fd9UA6jOSCHGK1cFntoubL1ZHBQ2cxfGAmZlDM8X4J5BrZ8YxvG6dUobjz2aFr
	UmbnndA4xuYxKlmazXS79J+L7+CSQ8KfHCq2fZGccy7LYI69GnLPQ4i5Rqbno1lMAuJ1
	8uig==
X-Gm-Message-State: APt69E18M4HjaiY1YwVRIZTLAGuODWfVC8N7/Ofq1K+GtAravGv6IOr6
	RdIi1HiG1RY34AokId7afDP7C87t
X-Google-Smtp-Source: ADUXVKJpYoftZSkD0/TqTKZwnW+98otLsXBgw/S5MT6xmnufvw/1cqEKVxXgkE90hsDFkUM4c+1KtQ==
X-Received: by 2002:aca:30a:: with SMTP id 10-v6mr860571oid.280.1528379797283; 
	Thu, 07 Jun 2018 06:56:37 -0700 (PDT)
Received: from mail-ot0-f178.google.com (mail-ot0-f178.google.com.
	[74.125.82.178]) by smtp.gmail.com with ESMTPSA id
	v141-v6sm13352273oie.34.2018.06.07.06.56.35
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Jun 2018 06:56:36 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ot0-f178.google.com with SMTP id n3-v6so11617445ota.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Jun 2018 06:56:35 -0700 (PDT)
X-Received: by 2002:a9d:627:: with SMTP id 36-v6mr976745otn.168.1528379795402; 
	Thu, 07 Jun 2018 06:56:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:58c5:0:0:0:0:0 with HTTP;
	Thu, 7 Jun 2018 06:56:34 -0700 (PDT)
In-Reply-To: <91e19a88-1a03-b772-b6be-bf6bf27037c8@skidata.com>
References: <10630413.xVAl2E7OaH@yow-masselst-lx1>
	<20180606204244.GA16170@mail.itconsulting-heinold.de>
	<fcaab484-d381-92f7-04d7-2a7edca6f903@skidata.com>
	<20180607132234.GA19704@mail.itconsulting-heinold.de>
	<91e19a88-1a03-b772-b6be-bf6bf27037c8@skidata.com>
Date: Thu, 7 Jun 2018 10:56:34 -0300
X-Gmail-Original-Message-ID: <CAP9ODKrFomJ2Rvp5mku81Op-rYCNt-AXm4TVV2-aSg6QSfEoFQ@mail.gmail.com>
Message-ID: <CAP9ODKrFomJ2Rvp5mku81Op-rYCNt-AXm4TVV2-aSg6QSfEoFQ@mail.gmail.com>
To: Richard Leitner <richard.leitner@skidata.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	Mark Asselstine <mark.asselstine@windriver.com>,
	Mario Domenech Goulart <mario@ossystems.com.br>
Subject: Re: [meta-java] maintainer status
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
X-List-Received-Date: Thu, 07 Jun 2018 13:56:37 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Jun 7, 2018 at 10:53 AM, Richard Leitner
<richard.leitner@skidata.com> wrote:
....
> As I'm using this layer now for quite a few years I'll be glad to help you with
> the maintainership of meta-java. Nonetheless I have to admit that I have no
> experience in maintaining an openembedded layer ;-)
>
> Therefore if you're still interested I'd have some questions regarding the
> "strategic" targets, workflows and stuff like that...

Awesome, new energy!

Sure, go ahead and ask :-D

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

