Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Oc0hI-0002Ka-B9
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Jul 2010 20:40:57 +0200
Received: by gyd8 with SMTP id 8so993363gyd.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Jul 2010 11:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=+WrpSrcjQMEzOZ9JrqQKis4WvzaKYrQjG2XnsT0Bcik=;
	b=HOy6QDTfi4JsyaTI/E2Q3/00Lt7GTbUnN0nklLI7bJIZ3QCUOnJDW8HMdf/UJRtHXo
	qVVrhSqRvtFSaBGmTiy4ZX+cXpYtSiy/Xwo40ann/q9ky0bVy/mU3BDrrdB097Q8CTqk
	0UPzEsAKHTB9S0Gn5B0ZdMxWDfdg5uV8ViTEU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=swaboSdhX9kwUB6veh8bcYnJE3W86/6kzTBI9A6EYZ0hkkHnXY4KHmqWmJgdn5VGbO
	xgFZlGfUWp/8rWK2JgGFpilwX7ckOFkZPLH4jSeeJvfLmJmu1QIZkdeMKvhOiFNK0q5m
	u9vUq6BNWFc+zQ+Wu5yGcsr7BfXc/aOzjcuTo=
Received: by 10.100.136.3 with SMTP id j3mr2738199and.33.1279824027312; Thu, 
	22 Jul 2010 11:40:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.186.88 with HTTP; Thu, 22 Jul 2010 11:40:07 -0700 (PDT)
In-Reply-To: <AANLkTikP03HJoz0VI_tg6tV3Z4bGYsYaAA2mVwNO4nYq@mail.gmail.com>
References: <20100709204055.GA12163@excalibur.local>
	<20100720070108.GE1512@excalibur.local> 
	<i23lkm$ftn$1@dough.gmane.org> <20100720084026.GI1512@excalibur.local> 
	<i24kf7$3d3$1@dough.gmane.org> <20100720173425.GL1512@excalibur.local> 
	<AANLkTikYdD7jzsJBNEK0MedOmM_jHIEcdCfE0APMSOqt@mail.gmail.com> 
	<20100720192253.GN1512@excalibur.local>
	<AANLkTinsqL1X3cuCRDedYB3h8rhDP3VehMC6RmKZ_wLw@mail.gmail.com> 
	<AANLkTikP03HJoz0VI_tg6tV3Z4bGYsYaAA2mVwNO4nYq@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 22 Jul 2010 11:40:07 -0700
Message-ID: <AANLkTikhNFfujtgYxFPKhszxj6XTiiwCrPuI-DCWNcv1@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] New stable branch (and maybe a new process?)
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
X-List-Received-Date: Thu, 22 Jul 2010 18:40:57 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Jul 21, 2010 at 12:13 AM, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
> 2010/7/21 Esben Haabendal <esbenhaabendal@gmail.com>
>
>> On Tue, Jul 20, 2010 at 9:22 PM, Stefan Schmidt
>> <stefan@datenfreihafen.org> wrote:
>>
>> > What does not fit your needs with the current stable handling?
>>
>> It started out with a rather continous flow of changed from dev,
>> causing it to be almost as unstable as dev. Now stable/2009 looks
>> mostly dead.
>>

I think  a time based release will be really nice for OE for improving its
consumption in production deployment, I am willing to help in this
How often we want to release remains to be decided.
We don't have to do huge backports and wait for a lot of features
to go in for cutting out a stable release.

-Khem


