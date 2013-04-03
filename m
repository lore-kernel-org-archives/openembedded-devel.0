Received: from mail-oa0-f44.google.com ([209.85.219.44])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1UNVlY-0007kx-TG
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Apr 2013 00:02:49 +0200
Received: by mail-oa0-f44.google.com with SMTP id h1so2089767oag.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Apr 2013 14:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=Hd+1KtvJCkzSZgI5faa3Yd8CdMZKMjo7B4j02ZsH0B8=;
	b=ydJlk3i3Yfb7ZG2IUJc2hiyk1BHzGq6KPSSnONAA88xz/Cv2W+SQKQAyoTIS2zHh37
	Nnm+kp7wZP952fbljBlV+Qdek6Cz4OckDxgPQehRlW8/bQ60cdf1PtvdPdnb74/6O1Dz
	FrGZI2ObgJYb7PbQleKx4J7w8rmsSW4TuOm0Gi3aUdLNK8wg68UOVAHNX5iPlIvGVW4h
	ZVSurf65JJWkS9guknXvuNRTroBXJp+LbfBzAGCYiH46K1PLWT8v9GLb09cWTA5oO+rs
	6m8y5Zf15LgefpuiS2KP5kF1X7J8DVRkpYt7DYa+OU6irtQ5bkr5G/Ka+0YmR0By6VNd
	Z6JA==
MIME-Version: 1.0
X-Received: by 10.182.106.16 with SMTP id gq16mr2313398obb.27.1365025536646;
	Wed, 03 Apr 2013 14:45:36 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.80.198 with HTTP; Wed, 3 Apr 2013 14:45:36 -0700 (PDT)
In-Reply-To: <515C95F5.3080705@pseudoterminal.org>
References: <515C5DE6.6040702@pseudoterminal.org> <kjhsve$nqm$1@ger.gmane.org>
	<515C8459.3080005@balister.org>
	<FF0E3122-75E0-47DF-978E-CF9982B94B64@dominion.thruhere.net>
	<515C8C04.3040904@balister.org>
	<4A3AFD82-E315-40D4-B21E-4E3005CBE86D@dominion.thruhere.net>
	<515C95F5.3080705@pseudoterminal.org>
Date: Wed, 3 Apr 2013 18:45:36 -0300
X-Google-Sender-Auth: 8aObp1hPu_M62L_F6o4rmcuv0bQ
Message-ID: <CAP9ODKrKkqBQ8BduoazZ+xj8U09yWAnUoGBR=P_bN_dY-q0SbQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: New meta-cubox layer
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
X-List-Received-Date: Wed, 03 Apr 2013 22:02:49 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Apr 3, 2013 at 5:49 PM, Carlos Rafael Giani
<dv@pseudoterminal.org> wrote:
> Okay, I think I see the problem now. DEFAULTTUNES should not be set by the
> machine config. So, removing it
> and fixing the README accordingly takes care of that. People who for example
> want hardfp then
> set DEFAULTTUNE ?= "marvellpj4hf" in their local.conf . Is this correct?

You may provide a machine variant with has this set; so it will build
a machine with this enabled.

Koen, would you be happy with it?

--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


