Received: from mail-pz0-f187.google.com ([209.85.222.187])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1OMMxj-0005wX-FA
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Jun 2010 17:13:05 +0200
Received: by pzk17 with SMTP id 17so3870612pzk.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Jun 2010 08:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:cc:content-type;
	bh=2lIuSINi8Bog/5Ptu+lyfmCm/qUN9ZYwG0mQ/Qzs1t0=;
	b=KDhxzmylj+XzxNkdngFZwoMP08b9bmZJ5HnEEGrnKyN5fa7I4jzksVfZQk/3zcOjYs
	NL85bGIog05BYCwy6QdTaccs+P/g9cbiUfIVwe87QYUqctufY++KHpgULD/Htd+91fNq
	aAmV4HeyeENqzHcTT5hin8vO6qJina140DLm4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	b=bnuTqopLpPRw4LP2qOk90GEJHn/lsbC10/+RBDDbulVTNRdqHSuDCR+aP4acFacdmX
	i9xYaoCT7mjpUEx2UvNE90ZKkvRqq3lprQlMNf9EfuzkqVubc9h6T9reG/A/IFe4eoAJ
	7Ia5EtSKuFbr5RvY0G8V+pPBVdoHTnkRIxWY8=
Received: by 10.229.186.212 with SMTP id ct20mr6996172qcb.39.1276096119651; 
	Wed, 09 Jun 2010 08:08:39 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.3.133 with HTTP; Wed, 9 Jun 2010 08:08:18 -0700 (PDT)
In-Reply-To: <AANLkTim3_p-OVwfb4ulBCm2vR19uCH1eYAZlHLQVM_BG@mail.gmail.com>
References: <AANLkTim3_p-OVwfb4ulBCm2vR19uCH1eYAZlHLQVM_BG@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 9 Jun 2010 08:08:18 -0700
X-Google-Sender-Auth: CwU4vhEZ7ye5i9jgUZZVyVZHFXo
Message-ID: <AANLkTimshL1qhg5y5iZViSz_jfBBpzOaGLw7S0wG_dtr@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.222.187
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: sean_hudson@dell.com
Subject: Re: [PATCH] Change wget fetcher to use the runfetchcmd
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
X-List-Received-Date: Wed, 09 Jun 2010 15:13:06 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Jun 8, 2010 at 12:40 PM, Ryan Phillips <ryan@trolocsis.com> wrote:

> We were having problems with wget fetching through our proxy. One of
> the problems stemmed from quoting around the environment variables,
> and the other appears to be from legacy code not calling into
> runfetchcmd within the wget fetcher.


Seems fine for the most part.  One quick question: Can you explain why
you're escaping the double quotes in your quoting of the env vars, when its
contained in a singled quoted string, not double?  Of course, we should
really switch that code over to using subprocess, passing the environment as
a mapping, rather than this sort of shell script emission.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

