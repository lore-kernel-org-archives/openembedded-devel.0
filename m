Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <developer@alexandfliss.com>) id 1OjbVu-0000sT-Fu
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Aug 2010 19:24:24 +0200
Received: by wwb34 with SMTP id 34so1494535wwb.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Aug 2010 10:23:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.216.144.22 with SMTP id m22mr7166751wej.0.1281633834060; Thu,
	12 Aug 2010 10:23:54 -0700 (PDT)
Sender: developer@alexandfliss.com
Received: by 10.216.237.140 with HTTP; Thu, 12 Aug 2010 10:23:53 -0700 (PDT)
In-Reply-To: <4C64298E.3060509@mentor.com>
References: <1281627336-686-1-git-send-email-kernel-hacker@bennee.com>
	<1281627336-686-2-git-send-email-kernel-hacker@bennee.com>
	<4C64298E.3060509@mentor.com>
Date: Thu, 12 Aug 2010 18:23:53 +0100
X-Google-Sender-Auth: 5TNoZn-ZQY6EVyGkuvyMkTJwh2s
Message-ID: <AANLkTin-=7FuDRhnt77hy_tfvBM5xCKkQcx2EWBuc14u@mail.gmail.com>
From: Alex Bennee <kernel-hacker@bennee.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: developer@alexandfliss.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Alex Bennee <ajb@cbnl.com>
Subject: Re: [PATCH 1/2] freetype: include perl-native dependancy
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
X-List-Received-Date: Thu, 12 Aug 2010 17:24:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 12 August 2010 18:04, Tom Rini <tom_rini@mentor.com> wrote:
> kernel-hacker@bennee.com wrote:
>>
>> From: Alex Bennee <ajb@cbnl.com>
>>
>> Freetype requires a native perl to build during it's configure step.
>> I'm unsure how it built before unless other uses had brought in
>> perl-native through another dependancy (our GTK setup is fairly
>> minimal).
>>
>> Signed-off-by: Alex Bennee <ajb@cbnl.com>
>
> OE assumes that there is a host perl already. =C2=A0perl-native is mainly
> provided for some very special cases (such as building perl for the targe=
t).

How odd, I couldn't get configure to run without a perl-native. Maybe
because I was building for i686 on an x86_64. I guess it relegates
that patch to a "works for us" status.

--=20
Alex, homepage: http://www.bennee.com/~alex/
http://www.half-llama.co.uk


