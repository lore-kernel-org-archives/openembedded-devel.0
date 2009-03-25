Received: from [209.85.218.171] (helo=mail-bw0-f171.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1LmbHj-0000JL-Hb
	for openembedded-devel@lists.openembedded.org;
	Wed, 25 Mar 2009 23:09:19 +0100
Received: by bwz19 with SMTP id 19so267369bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Mar 2009 15:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=TuE8HIz+khiiFg+qd7kK9H/RP0vt+YsFtRwlqZMsx3s=;
	b=BcvyMOYjfs6srYG1nCvqdoJj+yfIltM7u6vkCbVWZyjz4ER52yZJ+ulh0yRcNMtAye
	eNK7UT6zH05HQQ1bwEUkGk6z7Y1R2GDwOUMpBuYj3PQJHOub+zgMLqn5u0wPObq2U3RH
	xyVpfKByu5g7ezEskh9uQDbXqjYNNfZ0iLhaA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=NB+J0XfKKorjdiNkmvy1kMsQ8Y2Mr1/chVtxfLUZWiMCbfniN60PKWZQaJHWhCYJkI
	4MEwZE4RtpnX/GgavnWfQpiDeObgb0glSVJPDA9KiMsopER7FS6zcMJP7xM3NZcSqNbI
	+X/uNLAhEsCwBpM6cj3kRpK89y3hANHEjRIio=
MIME-Version: 1.0
Received: by 10.223.122.15 with SMTP id j15mr120504far.10.1238018860543; Wed, 
	25 Mar 2009 15:07:40 -0700 (PDT)
In-Reply-To: <gqdlka$cbd$1@ger.gmane.org>
References: <b6ebd0a50903171218i7f5716afifd99177982b6df5b@mail.gmail.com>
	<49C9347C.7010309@balister.org>
	<FA1C2D98-DEF3-4694-A757-7C137F667CE3@ngndg.com>
	<b6ebd0a50903241301r5b8972b4s59df7be41052ab7a@mail.gmail.com>
	<dc6682e90903241330m1191395j478ee4180a969cfb@mail.gmail.com>
	<49C94647.2040401@gmail.com>
	<ac9c93b10903250151v6ea0586bv461debbe36f42ac7@mail.gmail.com>
	<gqd31s$5vk$1@ger.gmane.org> <49CA5638.1050000@dls.net>
	<gqdlka$cbd$1@ger.gmane.org>
Date: Wed, 25 Mar 2009 23:07:40 +0100
Message-ID: <ac9c93b10903251507u4e1edf78u4dbb1b2c7a318789@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Package Maintenance
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
X-List-Received-Date: Wed, 25 Mar 2009 22:09:19 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

2009/3/25 Koen Kooi <k.kooi@student.utwente.nl>:

> Empty TMPDIR is only once case we should test for, I've seen many times that
> a 'populated' TMPDIR creates bugs, e.g. midori picking up libhildon to
> mention a recent one. So 'always build from empty TMPDIR' will leave serious
> and harder to trackdown bugs unnoticed.

Test with unpopulataed TMPDIR and test with maximal populated TMPDIR ?


