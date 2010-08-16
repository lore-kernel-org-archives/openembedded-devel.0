Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1Ol0DE-0007SA-1s
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Aug 2010 15:58:52 +0200
Received: by wyb38 with SMTP id 38so5886217wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Aug 2010 06:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=Ojsvm3iIP//pYWQCH3nUyh/ePHh4/nnrPBBxHTj8R5o=;
	b=EiGres2Gb68uSFttAXyjyb3pq16cUhe3ji1VD7/wPGz/8uarLnLhUcCHu6stvCKVU8
	EoIZi2lBPgJfMvfiFJH7QT8nQU/k8Hr4M1WsKj45spUq0GE7U0ScMuroIaKuvsOyVCdx
	GPuQ0FNRbe49kuQpL55dWGUO4O8KCkmijgMg0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=dgd5I7OYMXVODrBuWjtofe4fE25F2D92hwZ+ItIbw93ccEMHPdTqz2cTAYXvLEw+Y+
	MKKLwnRP37AgXj5KSig499p2YJ3IxrWVNP90YfLRiwR1pJb0Dzch38tAKKL9mWXBAqfK
	RJqNOQB5Po042N72YP1fu0aClcOqCHE60omcg=
Received: by 10.227.157.84 with SMTP id a20mr4489293wbx.32.1281967115022; Mon,
	16 Aug 2010 06:58:35 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.237.166 with HTTP; Mon, 16 Aug 2010 06:58:14 -0700 (PDT)
In-Reply-To: <lyr5hyhjpb.fsf@ensc-virt.intern.sigma-chemnitz.de>
References: <lyr5hyhjpb.fsf@ensc-virt.intern.sigma-chemnitz.de>
From: Chris Larson <clarson@kergoth.com>
Date: Mon, 16 Aug 2010 06:58:14 -0700
X-Google-Sender-Auth: 5wpi0MdtrcAU8ZSXGnHb955fTZI
Message-ID: <AANLkTinO51XMyYQ65HgdD1Vy8FxTixxCZfJ_+GUBhEK-@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Usage of NATIVE_INSTALL_WORKS
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
X-List-Received-Date: Mon, 16 Aug 2010 13:58:52 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Aug 16, 2010 at 4:37 AM, Enrico Scholz <
enrico.scholz@sigma-chemnitz.de> wrote:

> Hi,
>
> http://wiki.openembedded.org/index.php/Legacy_staging states that
> NATIVE_INSTALL_WORKS must be set when there is a non trivial
> do_install() function and BBCLASSEXTEND is used.
>
> But
>
> | git grep NATIVE_INSTALL_WORKS conf/ classes/ lib/
>
> shows only one place where this variable is evaluated:
>
> | classes/staging.bbclass:    elif bb.data.getVar('NATIVE_INSTALL_WORKS',
> d, 1) == "1":
> | classes/staging.bbclass-        legacy = False
>
> And there, it is used only in the is_legacy_staging() function, to
> override legacy/non-legacy detection results.
>
>
> Is there still any use for this variable in modern staging?  Or shall it
> be purged from non-legacy recipes?


If you purge it from particular non-legacy recipes, the legacy detection
code will misidentify those as legacy and fail to do the correct thing.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

