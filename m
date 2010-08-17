Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1OlQjU-0001MC-Cy
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Aug 2010 20:18:07 +0200
Received: by eyx24 with SMTP id 24so3331478eyx.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Aug 2010 11:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=t5BQYM50HoETYsjPNboqdtDah4bRe5n8EbK2+s84NHQ=;
	b=x+Cetlm1aG8Bfu7tkU1auJE+quq25ffF2i3hu0GaYLrCLWTqTPkA76uW/Qh2BtWxYa
	dXUPxCH7XP3BHNa9IXvMHNCUXERkVBvd0rFuxEOZbX/1NNhZOGACKynWe1xUQpqm3nyf
	0iptoCOtuX3He8YJVhBE1jgzmaUfNPhPY3qKc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=NzVJb7eQ4K6+ejQoCeNY3J0EGzAqEnHOQWBsz6lJBBsPZW4v/njuWb//+y6agSau2h
	R5KUvCPAoe9wOP+zHNcJuVCLxFAjpyWvdgCP3zNwMdtAXH+MkltlCnfWifVVax7AE6Cd
	C/HHTv1q7+8pYdn9Ucen+ASwj7YYD4PYeWGdY=
Received: by 10.216.188.20 with SMTP id z20mr1085607wem.51.1282069045187; Tue,
	17 Aug 2010 11:17:25 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.237.166 with HTTP; Tue, 17 Aug 2010 11:17:05 -0700 (PDT)
In-Reply-To: <4C6ACB57.6010900@mentor.com>
References: <lyr5hyhjpb.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<AANLkTinO51XMyYQ65HgdD1Vy8FxTixxCZfJ_+GUBhEK-@mail.gmail.com>
	<4C6ACB57.6010900@mentor.com>
From: Chris Larson <clarson@kergoth.com>
Date: Tue, 17 Aug 2010 11:17:05 -0700
X-Google-Sender-Auth: luMOtxYiZOzP9rPevRgnxCIzTCU
Message-ID: <AANLkTimM1KXgWUXHFz+njHmUAMYo75eVYy2J9ATEC0Bw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.215.175
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
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
X-List-Received-Date: Tue, 17 Aug 2010 18:18:08 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Aug 17, 2010 at 10:48 AM, Tom Rini <tom_rini@mentor.com> wrote:

> Chris Larson wrote:
>
>> On Mon, Aug 16, 2010 at 4:37 AM, Enrico Scholz <
>> enrico.scholz@sigma-chemnitz.de> wrote:
>>
>>  Hi,
>>>
>>> http://wiki.openembedded.org/index.php/Legacy_staging states that
>>> NATIVE_INSTALL_WORKS must be set when there is a non trivial
>>> do_install() function and BBCLASSEXTEND is used.
>>>
>>> But
>>>
>>> | git grep NATIVE_INSTALL_WORKS conf/ classes/ lib/
>>>
>>> shows only one place where this variable is evaluated:
>>>
>>> | classes/staging.bbclass:    elif bb.data.getVar('NATIVE_INSTALL_WORKS',
>>> d, 1) == "1":
>>> | classes/staging.bbclass-        legacy = False
>>>
>>> And there, it is used only in the is_legacy_staging() function, to
>>> override legacy/non-legacy detection results.
>>>
>>>
>>> Is there still any use for this variable in modern staging?  Or shall it
>>> be purged from non-legacy recipes?
>>>
>>
>>
>> If you purge it from particular non-legacy recipes, the legacy detection
>> code will misidentify those as legacy and fail to do the correct thing.
>>
>
> Can we update the wiki page to expand on when this is needed a little bit
> more then?  My quick read of is_legacy_staging() says that if do_stage is
> empty (and it should be if you convert from do_stage to do_install right)
> NATIVE_INSTALL_WORKS shouldn't be needed.


Removing the do_stage function from the recipe doesn't necessarily result in
an empty do_stage.  If you look at native.bbclass, you'll see that do_stage
is do_stage_native.  If your do_stage is do_stage_native and you haven't set
AUTOTOOLS_NATIVE_STAGE_INSTALL, it'll fall back to legacy staging, at least
if I'm reading is_legacy_staging correctly.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

