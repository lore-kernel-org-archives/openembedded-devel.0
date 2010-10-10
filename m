Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1P51au-0005n9-97
	for openembedded-devel@lists.openembedded.org;
	Sun, 10 Oct 2010 21:30:05 +0200
Received: by gxk25 with SMTP id 25so828209gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Oct 2010 12:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=Wu/10KFo6kWQLG7gTMe3DfDP6bwCswB23VQXLE5RN7I=;
	b=RhA0E7nDmT4gHqSmrLc7V7qESEGFkb+7B8fkBdkCt8tL7AHppFlNuQAX7lRY7FBd4H
	uiWn5BgIIvGCQWU0ZchElqacNZrAWPKqk7QKRjkpossCIJuTq0KPzH2ewbirPy8n/5Gk
	3ZOF5tJNepB22Fs8T5tP2qahBNL1tToud5DmU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=WElwu5c1qGs8NkK5ZqsH3ZJ259GbS6VSf0SgrxXidfpeZV5ZYPnKUAj/pPTf2g6gq2
	3cpFLYU9uTsZ2CXM2bcHWRWtd6IJ11rkJemTelFhRjb6lL8Ae3Ov1YQIz6pW+cRqhh4W
	6+H4NrarrA6LOJqJznVuHx4E0D3UdmrS5AlQk=
Received: by 10.90.31.14 with SMTP id e14mr2629434age.21.1286738976237; Sun,
	10 Oct 2010 12:29:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.91.77.10 with HTTP; Sun, 10 Oct 2010 12:29:16 -0700 (PDT)
In-Reply-To: <1286703485.3808.10.camel@mattotaupa>
References: <AANLkTik90dJxAJ_+GLQy+3MqP3oRFV9bYO6+BjSwZNkN@mail.gmail.com>
	<AANLkTimS+bg0XpWvAav0JX4qaf0b=CydG6_HQ0XHMo-h@mail.gmail.com>
	<AANLkTinQ4uW=o43O5Bv6FijfoicU2CL5j3Zn8zWf5Snm@mail.gmail.com>
	<1286664909.15886.13.camel@saphir> <1286698831.3808.2.camel@mattotaupa>
	<AANLkTimXU=NzmwqCpnho5ukCVoXnF5qR_4D6XWN4RaWr@mail.gmail.com>
	<1286703485.3808.10.camel@mattotaupa>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 10 Oct 2010 12:29:16 -0700
Message-ID: <AANLkTimhsRw9ooC=zQqrfSgtRhCV0C=_O_gqsd=7N2kF@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: testing branch 2010-10-08
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
X-List-Received-Date: Sun, 10 Oct 2010 19:30:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 10, 2010 at 2:38 AM, Paul Menzel
<paulepanter@users.sourceforge.net> wrote:
> Am Sonntag, den 10.10.2010, 02:13 -0700 schrieb Khem Raj:
>> On Sun, Oct 10, 2010 at 1:20 AM, Paul Menzel wrote:
>> > Am Sonntag, den 10.10.2010, 00:55 +0200 schrieb Michael 'Mickey' Lauer=
:
>> >> Am Samstag, den 09.10.2010, 22:58 +0200 schrieb Frans Meulenbroeks:
>> >> > libgee-native configure is failing:
>> >> > http://tinderbox.openembedded.net/public/logs/task/8568667.txt
>> >>
>> >> Does it contain 72c2ac940065948cb688fde821e51efac6b71b4b, which was
>> >> supposed to fix that?
>> >
>> > That is the exact same issues I reported 12 hours earlier [1].
>>
>> I fixed it by not reautoconfing for now I think it should be
>> good enough.
>
> Thank you for doing that. This is commit 88cb82 [2].
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0libgee_0.5.2.bb/libgee_0.6.0.bb: Fix native re=
cipe build
>
> Could you please at least add a link to the list thread describing the
> problem to the commit message next time, so people know what is being
> fixed.

while the details are in the mail and I notified the mail thread soon after
the fix was pushed isnt that enough of a notice for a trivial problem.

 I know it takes more time and I should be glad that you are so
> responsive and that you fix things quickly. And I am thankful. But in
> the end it will save other people=E2=80=99s time if those things are docu=
mented
> properly.
>
> And still, the other thread [1] should find a conclusion, since for me
> it looks like the current behavior is wrong.

what behavior is wrong ?


