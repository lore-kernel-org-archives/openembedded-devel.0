Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1Odl7C-0005F6-BQ
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Jul 2010 16:26:44 +0200
Received: by pzk2 with SMTP id 2so1509919pzk.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Jul 2010 07:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=TV9osyyKaF3yZVoHlVZhWR4DFJsvNHmXBRdSLweu5Wg=;
	b=MbMIZnBCzv1UYfM34L0VE49HljWsbaDYbvQlYHCrQZ1FJwi+rNepchtf/TGodtNACu
	GqRp95vPpK6fZjQoK0JiFtvKAQU9w+OJG3Um0DrOyHtKTUpKQJ8TRoZLLUF7gZ+v1vHI
	Fx9v9o3jsZ0gVPFQB0SjDAA3+3vC8nkCEU1kA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=vYCSRsG7nAzxeEDukUjUcuYqybJTcGqig1UVBzYgrXIMbxattPX1wr8FttCM4rFwyE
	m3/q8fRRFkjVuK2yVB1nUyn1SKHN8ML6BOgiZb8MWHvz3bXEuTlWEsqMkLFKZ+vHVoNo
	04XbhZwdt7hrOn4BX/jpiLnKkMn0z7GvMlc6w=
Received: by 10.142.73.1 with SMTP id v1mr10271935wfa.29.1280240783648; Tue, 
	27 Jul 2010 07:26:23 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.142.153.1 with HTTP; Tue, 27 Jul 2010 07:26:03 -0700 (PDT)
In-Reply-To: <AANLkTim1Cps1vdmbxSQGdKvn0WNL3nUB_+9bEu1SpN9R@mail.gmail.com>
References: <AANLkTim5aAnNi5VFs7=-gg1XaM=+KBeUs-G494SEbR+V@mail.gmail.com> 
	<AANLkTiks5W-tPf=D=Qo5UZf77ZA2R10=fkw2MmdeWfHc@mail.gmail.com> 
	<AANLkTinuoVzs556HmdOx-y1tMd6YB58NgPtoEhqma4HO@mail.gmail.com> 
	<AANLkTim1Cps1vdmbxSQGdKvn0WNL3nUB_+9bEu1SpN9R@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Tue, 27 Jul 2010 07:26:03 -0700
X-Google-Sender-Auth: CKNOt7WaFyf9GO-OHqGpxF9esAk
Message-ID: <AANLkTinPnht9xFXG9L3ZOe+bY2Meks29kCD2Zi-OcOVB@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.210.47
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [RFC] get rid of legacy staging
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
X-List-Received-Date: Tue, 27 Jul 2010 14:26:44 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Jul 27, 2010 at 3:19 AM, Frans Meulenbroeks <
fransmeulenbroeks@gmail.com> wrote:

> PS: I think part of the problem is that most recipes do not have a
> well-defined owner who is responsible for maintaining them. I know we use
> to
> have them  mentioned in the recipes. That had some issues, but at least it
> was more clear who felt responsible for what, and it was also more clear
> who
> to bother to fix a recipe (and it was more clear which recipes are orphaned
> or become orphaned when the maintainer leaves).


I very strongly agree with this, but there have been issues with it in the
past, due to people leaving the project, vacations, hiatus, they become a
bottleneck.  But conceptually, maintainership seems like a very good idea to
me.  If I considered myself the maintainer of a set of recipes, I'd do my
best to ensure that they're always buildable and the recipes are always up
with current conventions.  *shrug*
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

