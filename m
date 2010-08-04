Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OgX9a-0005m3-NZ
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Aug 2010 08:08:39 +0200
Received: by bwz10 with SMTP id 10so2647548bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Aug 2010 23:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=3JYRRpMowh5wsTzJKKRIguN3NZyZMiILMmlhCGTwdTI=;
	b=xy3RnCIkGrza91C/4AihNmNsxOHm6pUioZ2QK02LiUtw+M6kRmoe8ejEn3yxIZQKvQ
	pWfSbaBuHgUWH91WMfptebX4cKROWidtxk1l1Mp1VSbv35T/H/oPj9GFQxPlImzYoDBk
	KKHlulzqPnexxmYNHcgZOVjoLsI07fbvGBpZs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=AfbkoOrsdVgaPk9ugf8Rj8Fo/5ImyNKpSTUHGc1fLLmchM7AZthDL3jLD+Iv/6Wnln
	Fw1Lz6jLEQ8wz+CgX6es8hQ31NNkTgA+a6h4TxIZ3iTOMQmDWUQNlxGPB+9jpvAspZJF
	Doa/ccY0an7Bm/gj8dGTjMa68yMjEW/EXKcB8=
MIME-Version: 1.0
Received: by 10.204.14.71 with SMTP id f7mr5862782bka.200.1280902114058; Tue, 
	03 Aug 2010 23:08:34 -0700 (PDT)
Received: by 10.204.60.208 with HTTP; Tue, 3 Aug 2010 23:08:34 -0700 (PDT)
In-Reply-To: <1280901529-30358-1-git-send-email-raj.khem@gmail.com>
References: <1280901529-30358-1-git-send-email-raj.khem@gmail.com>
Date: Wed, 4 Aug 2010 08:08:34 +0200
Message-ID: <AANLkTikbhL-hfLFDGR8fscoN=-STtKh6UdBREOuXnuPD@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH,v3] recipes: Dont inherit autotools_stage.
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
X-List-Received-Date: Wed, 04 Aug 2010 06:08:39 -0000
Content-Type: text/plain; charset=ISO-8859-1

Khem, first visual inspection looks good.

I noticed most of the recipes just remove the autotools_stage but a few of
them also do things like changing do_stage_appen into do_install_append
(like the gupnp ones).
It might be better to do those patches first (with PR bump), then have a
patch that strictly only removes the inherit autotools_stage stuff.

Frans

