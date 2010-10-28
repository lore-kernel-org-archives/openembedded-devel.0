Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PBb46-0005Zy-QD
	for openembedded-devel@lists.openembedded.org;
	Fri, 29 Oct 2010 00:35:23 +0200
Received: by yxe42 with SMTP id 42so1713488yxe.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Oct 2010 15:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=qGfsTV6IxZy4wpnvAN0mIEbOTwB6QGwgFq1H8q24TpQ=;
	b=HXLCP5NLlxDbUL6LyQSCZxy9+xVjVuNINiIC6xIhYtbI2hhbLZoxOhN+ywpUvpX/U5
	Wy/tECZbS8wYCcjBEsXBnyEZEI5h2V26JcGsIvBSwzj6Go+/chrqg5Q7pP4I2+TdfBhN
	wb3m0EAOeepnbrIr1kfpjejlXkarF17MPCjiQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=u6/N7G+M6/lbRDkq5YCUWxsP7dHALnavS7So+Q1LuoqO9gSwhZQ8cfvoqtVRKWpzeh
	a86ewB4YVd+0rgTNVp2MOWg1bF8nkP5nvg9zR4zkC72K+QNPyWYVRPzDeSbBdYmYkikL
	mJhMe5B2KNB6zge+SFhFtALQV44loq5h6MGf0=
Received: by 10.90.113.16 with SMTP id l16mr650957agc.18.1288305277220; Thu,
	28 Oct 2010 15:34:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.90.105.8 with HTTP; Thu, 28 Oct 2010 15:34:16 -0700 (PDT)
In-Reply-To: <4CC9E691.9000809@cbnco.com>
References: <1288286551-4700-1-git-send-email-msmith@cbnco.com>
	<AANLkTinWpXoGqD5iNN+h-YEN9suQd3zac5E3FTvM7m39@mail.gmail.com>
	<Pine.LNX.4.64.1010281443540.5082@juice.ott.cti.com>
	<AANLkTikbv9bF9fBvFU2_C6sK13A23wBXgRzwbX++VLhq@mail.gmail.com>
	<4CC9E691.9000809@cbnco.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 28 Oct 2010 15:34:16 -0700
Message-ID: <AANLkTimEEdaQub15asdbRzHPfatmtqXNqpTvfp2DM55o@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] curl: make CURL_FEATURES configurable again
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
X-List-Received-Date: Thu, 28 Oct 2010 22:35:23 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Oct 28, 2010 at 2:09 PM, Michael Smith <msmith@cbnco.com> wrote:
> Khem Raj wrote:
>>
>> On Thu, Oct 28, 2010 at 11:49 AM, Michael Smith <msmith@cbnco.com> wrote:
>>>
>>> It seems to do the right thing here - CURL_FEATURES_virtclass-native is
>>> not weak, so in my curl-native config.log, I see --disable-gnutls.
>>
>> certainly nor for me. here is what I get
>
> Maybe because I have a setting for CURL_FEATURES in my conf? If so, that
> sounds like odd bitbake behaviour. :(
>
> Do you have any thoughts on how to solve it? There is not much point to
> having CURL_FEATURES as a variable if it's not configurable. I can just hack
> over it in an amend.inc, but the recipe as it stands is broken.

yes if we had the recipe type overrides for native sdk and target
separate then this could
be done probably by appending to concerning override

>
>>> (btw: why do we not want gnutls in curl-native?)
>>
>> thats a different question does not solve the problem at hand.
>
> Yes, it's a different question. I didn't realize I was limited to one per
> e-mail. :)

you can ask as many I just wanted to keep focus on the topic at hand in a thread
it helps people who read it later.

>
> Mike
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


