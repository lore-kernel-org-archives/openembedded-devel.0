Received: from [74.125.92.147] (helo=qw-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1Lc98M-0004zy-Nk
	for openembedded-devel@openembedded.org; Wed, 25 Feb 2009 03:04:26 +0100
Received: by qw-out-1920.google.com with SMTP id 9so1240675qwj.6
	for <openembedded-devel@openembedded.org>;
	Tue, 24 Feb 2009 18:01:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:received:from:to:cc
	:subject:organization:references:user-agent:x-url:x-attribution:date
	:in-reply-to:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=g7gGeuu6IT5l29i9Mo8IT4e8NGuEVFZv+sau/wZrOFo=;
	b=NMFv25krGdhDvFhe87rbH8Cn+zHHyVspIqjbLlK68eHuos8ZcC85M+UIYZiCOmuUhv
	l+RdrQ26HjTphQ92cqJrpioIF/3CEbUI7P5gW4PL+JmOip/uishrp/U/8Gn4P7t7lI27
	t1XOCepQdd1+4GILfOZd3jsnQQh35HvOvkJY0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:organization:references:user-agent:x-url
	:x-attribution:date:in-reply-to:message-id:mime-version:content-type
	:content-transfer-encoding;
	b=IfaFmSHb5nQJBEU2M6zhq8JkUISzk6k+vMJNU7NqPCbJQfNSuCG0XM9r/4mwDibrM2
	Sc2ow0E4h/Hjw38UnaR2dOsj0vCmGSxb/91QnMqE8xNKmnbrEKkjpzLJnqSaz1y/mtNK
	m52qqUkqGAoyaEEn0zKhl8ExCBJM1TnKtCYzA=
Received: by 10.224.36.208 with SMTP id u16mr801830qad.126.1235527280756;
	Tue, 24 Feb 2009 18:01:20 -0800 (PST)
Received: from ossystems.com.br (201-40-162-47.cable.viacabocom.com.br
	[201.40.162.47])
	by mx.google.com with ESMTPS id 7sm1591153qwf.40.2009.02.24.18.01.17
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 24 Feb 2009 18:01:20 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by ossystems.com.br (Postfix, from userid 1000)
	id CE1F061013F; Tue, 24 Feb 2009 23:01:05 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Organization: O.S. Systems Ltda.
References: <200902131728.08634.openembedded@haerwu.biz>
	<20090224064639.GE2172@smtp.west.cox.net>
	<1235492001.27962.60.camel@andromeda>
	<8763izyarp.fsf@neumann.lab.ossystems.com.br>
	<fce2a370902241036y359e2c7cv1126a62c8627d2bb@mail.gmail.com>
	<20090224185059.GL2172@smtp.west.cox.net>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.0.90 (gnu/linux)
	(x86_64-pc-linux-gnu)
X-URL: http://www.ossystems.com.br/
X-Attribution: O.S.
Date: Tue, 24 Feb 2009 23:01:05 -0300
In-Reply-To: <20090224185059.GL2172@smtp.west.cox.net> (Tom Rini's message of
	"Tue, 24 Feb 2009 11:50:59 -0700")
Message-ID: <87wsbfw9zy.fsf@neumann.lab.ossystems.com.br>
MIME-Version: 1.0
Cc: openembedded-devel@openembedded.org
Subject: Re: checksums situation
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
X-List-Received-Date: Wed, 25 Feb 2009 02:04:27 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Tom Rini <trini@kernel.crashing.org> writes:

> On Tue, Feb 24, 2009 at 08:36:35PM +0200, Ihar Hrachyshka wrote:
>> On Tue, Feb 24, 2009 at 8:01 PM, Otavio Salvador
>> <otavio@ossystems.com.br> wrote:
>> > Michael 'Mickey' Lauer <mlauer@vanille-media.de> writes:
>> >
>> >> Am Montag, den 23.02.2009, 23:46 -0700 schrieb Tom Rini:
>> >>> I'm going to make a different suggestion. =C2=A0Lets just drop it.
>> >>
>> >> I'm in favour of this. I don't think they give us the safety we want =
and
>> >> they introduce more inconvenience.
>> >
>> > After reading the thread I'm also in favour of this.
>>=20
>> If you guys don't need it then just disable this checksum feature. No pr=
oblem.
>
> This misses the point.  We're trying to get things to the point (and
> keep them there) where the default case is things working well.  I and
> others are arguing that the checksum feature is at best a lazy way to
> check only for files changing and not their correctness.  I'm not saying
> we don't need a feature to check for correctness, I'm saying what we
> have now doesn't.

I do belive that the best way to solve it is to have a md5 file together
with the .bb recipe. This solves the problems for forks, derivatives and
also makes harder to just use "cat tmp/checksums.ini >> conf/checksums.ini".

Doing that we'll have a clear way to add the required content, avoid the
mirror and URL issues and also make simple to forget about useless
entries in the metadata repository.

Obviously, it is a little more difficult to add the contents but I
believe that it will enforce more checking by our side before changing a
hash.

My 2c.=20

--=20
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


