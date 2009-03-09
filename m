Received: from [209.85.132.251] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1Lgiom-0000Z4-Jc
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 Mar 2009 17:59:09 +0100
Received: by an-out-0708.google.com with SMTP id d40so1482327and.42
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Mar 2009 09:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=7Wma0vRkUDa7+qO5YJnu0xrcFMAaK4YFMwHHb67Akco=;
	b=A0LCVwBOxWMji+zQisOIDD6CAtN6DoQZBORflhB08SadqymsOQCLVQoWBvxxPJk8N9
	JXtLZCMMUcDCimBx6qswxzEUNVBbojdxU0dR6hxDh3XqIHYmvHI+BaXzRm+85AxgMPEA
	OYKhj840QR8pMu+D1pcIjsbfr9ne1jRiZicW4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=ZafpbXnpydiwgEiDPstj9/nPnQGVwCP8nLgWd17OrOShAX6s+cVyEYVMgFOC3bLCRS
	lfkAMLIUkymkPZ5yHgSc0PSl1P/jG/FONPMtSUII30idnx0dfobAF8updtkjTWoqZN6s
	gjX5W1HZlh1+5wmegwR6uhjzbig+Ct+15R/No=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.100.108.20 with SMTP id g20mr1018762anc.72.1236617652170; Mon, 
	09 Mar 2009 09:54:12 -0700 (PDT)
In-Reply-To: <000401c99f26$ddb43c00$991cb400$@com>
References: <000801c99992$45c23440$d1469cc0$@com>
	<87myc57vz3.fsf@neumann.lab.ossystems.com.br>
	<000401c99f26$ddb43c00$991cb400$@com>
Date: Mon, 9 Mar 2009 13:54:12 -0300
X-Google-Sender-Auth: cfa7dc132ba23754
Message-ID: <be7a9f3d0903090954m72f9cafbw8f03af0906bf74ca@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] Added new recipe for a newer version of the Asterisk Soft-PBX
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
X-List-Received-Date: Mon, 09 Mar 2009 16:59:10 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 7, 2009 at 10:16 AM, Christian P=F6ssinger
<christian@poessinger.com> wrote:
> Otavio Salvador <otavio@ossystems.com.br> wrote:
>> Christian P=F6ssinger <christian@poessinger.com> writes:
>>
>> > ---
>> > =A0packages/asterisk/asterisk-1.4.23.1/Makefile.patch | =A0 21 +++
>> > =A0packages/asterisk/asterisk-1.4.23.1/init =A0 =A0 =A0 =A0 =A0 | =A0 =
79 ++++++++++
>> > =A0packages/asterisk/asterisk-1.4.23.1/logrotate =A0 =A0 =A0| =A0 12 +=
+
>> > =A0.../asterisk/asterisk-1.4.23.1/sounds.xml.patch =A0 =A0| =A0 19 +++
>> > =A0packages/asterisk/asterisk-1.4.23.1/volatiles =A0 =A0 =A0| =A0 =A07=
 +
>> > =A0packages/asterisk/asterisk_1.4.23.1.bb =A0 =A0 =A0 =A0 =A0 =A0 | =
=A0165
>> ++++++++++++++++++++
>>
>> Please add the checksums.ini required changes ;-)
>>
>
> [http://downloads.digium.com/pub/asterisk/releases/asterisk-1.4.23.1.tar.=
gz]
> md5=3D4788954a93f5fbf78e55e2aa6e03329f
> sha256=3D03e2cf43ffe9935d56fa0ea3663fc9bd23ce9720682c79d6269e78a9a1629d63

Could you amend your patch and resend it? It makes our life easier
since we're able to
get it and apply it to the tree without requiring to edit it later.

Thanks in advance,

--=20
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


